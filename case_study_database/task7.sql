use furama1;


-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
delete from nhan_vien nv
where nv.ma_nhan_vien not in (select hd1.ma_nhan_vien 
from hop_dong hd1
where year(hd1.ngay_lam_hop_dong) between 2019 and 2021 );
set sql_safe_updates = 1;


-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán
--  trong năm 2021 là lớn hơn 1.000.000 VNĐ

UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_khach_hang IN (SELECT 
            ma_khach_hang
        FROM
            (SELECT 
                kh.ma_khach_hang,
                    kh.ho_ten,
                    SUM(dv.chi_phi_thue + IFNULL(hdct.so_luong * dvdk.gia, 0)) AS tong_tien
            FROM
                khach_hang kh
            LEFT JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
            LEFT JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
            LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
            LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            WHERE
                kh.ma_loai_khach = 2
            GROUP BY hd.ma_hop_dong
            HAVING tong_tien > 1000000) AS temp);


--  18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
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
 set foreign_key_checks = 1;



-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

set sql_safe_updates = 0;
 set foreign_key_checks = 0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            ma_dich_vu_di_kem
        FROM
            (SELECT 
                hdct.ma_dich_vu_di_kem, SUM(hdct.so_luong) AS so_lan_su_dung
            FROM
                hop_dong_chi_tiet hdct
            JOIN hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
            WHERE
                YEAR(hd.ngay_lam_hop_dong) = 2020
            GROUP BY ma_dich_vu_di_kem
            HAVING so_lan_su_dung > 10) AS temp);
set sql_safe_updates = 1;
 set foreign_key_checks = 1;


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT 
    ma_nhan_vien AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien 
UNION SELECT 
    ma_khach_hang AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    khach_hang; 

		