use furama1;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện 
-- đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

	SELECT 
    d.ma_dich_vu,
    d.ten_dich_vu,
    d.dien_tich,
    d.chi_phi_thue,
    l.ten_loai_dich_vu
FROM
    dich_vu d
        JOIN
    loai_dich_vu l ON d.ma_loai_dich_vu = l.ma_loai_dich_vu
        AND d.ma_dich_vu NOT IN (SELECT 
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            QUARTER(hd.ngay_lam_hop_dong) = 1);
            
            
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da,
--  chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách
--  hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2020
        AND hd.ma_dich_vu NOT IN (SELECT 
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021)
GROUP BY hd.ma_dich_vu;


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
	SELECT DISTINCT
		ho_ten
	FROM
		khach_hang;
		
	SELECT 
    ho_ten
FROM
    khach_hang
GROUP BY ho_ten;

-- cach3
SELECT 
    ho_ten
FROM
    khach_hang 
UNION SELECT 
    ho_ten
FROM
    khach_hang;


-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng
--  trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT 
    MONTH(ngay_lam_hop_dong) AS `month`,
    COUNT(ma_hop_dong) AS count
FROM
    hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong)
ORDER BY `month`;


-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    ifnull(SUM(hdct.so_luong),0) AS 'so_luong_dich_vu_di_kem'
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;

