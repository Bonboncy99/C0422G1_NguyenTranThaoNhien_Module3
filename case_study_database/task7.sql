use furama1;


-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
delete from nhan_vien 
where ma_nhan_vien not in (select ma_nhan_vien from hop_dong where year(ngay_lam_hop_dong) between 2020 and 2021);
set sql_safe_updates = 1;


-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán
--  trong năm 2021 là lớn hơn 1.000.000 VNĐ
update khach_hang 
set ma_loai_khach  = 1 
where ma_loai_khach = 2 and ma_khach_hang in (select 
ma_khach_hang
from(select kh.ma_khach_hang
from khach_hang kh
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
 join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
 join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
 join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
 join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 where year(hd.ngay_lam_hop_dong) = 2021 
 group by hd.ma_hop_dong
having sum(dv.chi_phi_thue + hdct.so_luong * dvdk.gia) > 100000) as tmp);


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set sql_safe_updates = 0;
set foreign_key_checks = 0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        ma_khach_hang
    FROM
        (SELECT 
            hd.ma_khach_hang
        FROM
           hop_dong hd
        WHERE
            YEAR(hd.ngay_lam_hop_dong) < 2021
        GROUP BY (ma_khach_hang)) AS temp);
        set foreign_key_checks = 1;
set sql_safe_updates = 1;



		