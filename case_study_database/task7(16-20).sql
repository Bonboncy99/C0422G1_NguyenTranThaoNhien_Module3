use FURAMA1;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
DELETE FROM nhan_vien 
WHERE
    ma_nhan_vien NOT IN (SELECT 
        hd1.ma_nhan_vien
    FROM
        hop_dong hd1
    
    WHERE
        YEAR(hd1.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);
set sql_safe_updates = 1;


-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021
--  là lớn hơn 10.000.000 VNĐ.

SET sql_safe_updates = 0;
SET foreign_key_checks=0;
UPDATE khach_hang kh 
SET 
    kh.ma_loai_khach = 1
WHERE
    kh.ma_loai_khach = 2
        AND kh.ma_khach_hang IN (SELECT 
            ma_khach_hang
        FROM
            (SELECT 
                hd.ma_khach_hang,
                    IFNULL(dv.chi_phi_thue + IFNULL(SUM(hdct.so_luong * dvdk.gia), 0), 0) AS sum
            FROM
                hop_dong hd
            JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
            JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
            WHERE
                YEAR(hd.ngay_lam_hop_dong) = 2021
            GROUP BY hd.ma_khach_hang
            HAVING sum > 1000000) AS temp);
SET foreign_key_checks=1;
SET sql_safe_updates = 1;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
SET sql_safe_updates = 0;
SET foreign_key_checks=0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        ma_khach_hang
    FROM
        hop_dong
    
    WHERE
        (YEAR(ngay_lam_hop_dong) < 2021));
SET foreign_key_checks=1;
SET sql_safe_updates = 1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
SET sql_safe_updates = 0;
SET foreign_key_checks=0;
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
            GROUP BY hdct.ma_dich_vu_di_kem
            HAVING so_lan_su_dung > 10) AS temp);
SET foreign_key_checks=1;
SET sql_safe_updates = 1;

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, 
--  so_dien_thoai, ngay_sinh, dia_chi.

SELECT 
    nv.ma_nhan_vien AS id,
    nv.ho_ten,
    nv.email,
    nv.so_dien_thoai,
    nv.ngay_sinh,
    nv.dia_chi
FROM
    nhan_vien nv 
UNION SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    kh.email,
    kh.so_dien_thoai,
    kh.ngay_sinh,
    kh.dia_chi
FROM
    khach_hang kh;