use furama1;

-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.
-- done 


-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu
--  là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT 
    *
FROM
    nhan_vien
WHERE
    (ho_ten LIKE 'H%' OR ho_ten LIKE 'K%'
        OR ho_ten LIKE 'T%')
        AND CHAR_LENGTH(ho_ten) <= 15;
    
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT 
    *
FROM
    khach_hang
WHERE
    TIMESTAMPDIFF(YEAR,
        ngay_sinh,
        DATE(NOW())) BETWEEN 18 AND 50
        AND (dia_chi LIKE '%Đà Nẵng'
        OR dia_chi LIKE '%Quảng Trị');
 

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
		SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    COUNT(hd.ma_khach_hang) AS so_lan_dat_phong
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
        JOIN
    hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
WHERE
    lk.ten_loai_khach = 'Diamond'
GROUP BY hd.ma_khach_hang
ORDER BY so_lan_dat_phong;
 
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
-- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
--  (Với tổng tiền được tính theo công thức như sau: 
--  Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    SUM(dv.chi_phi_thue + IFNULL(hdct.so_luong * dvdk.gia, 0)) AS tong_tien
FROM
    khach_hang kh
        LEFT JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
        LEFT JOIN
    hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong
ORDER BY kh.ma_khach_hang , hd.ma_hop_dong DESC;

    
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ 
-- quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    dv.ma_dich_vu NOT IN (SELECT 
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021
                AND QUARTER(hd.ngay_lam_hop_dong) = 1
        GROUP BY hd.ma_hop_dong);


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
    loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2020
        AND dv.ma_dich_vu NOT IN (SELECT 
            ma_dich_vu
        FROM
            hop_dong hd1
        WHERE
            YEAR(hd1.ngay_lam_hop_dong) = 2021)
GROUP BY dv.ten_dich_vu;


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- cach1
SELECT DISTINCT
    ho_ten
FROM
    khach_hang;

-- cach2
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
--      trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS thang,
    COUNT(hd.ma_hop_dong) AS so_khach_dat_phong
FROM
    hop_dong hd
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;


-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
--  so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    IFNULL(SUM(hdct.so_luong), 0) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;


-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT 
    dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    lk.ten_loai_khach = 'Diamond'
        AND (kh.dia_chi LIKE '%Vinh'
        OR kh.dia_chi LIKE '%Quảng Ngãi');


-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
--  so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa 
--  trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã
--  từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng
--  đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ma_dich_vu, dv.ten_dich_vu, ifnull(sum(hdct.so_luong),0)  as so_luong_dich_vu_di_kem,hd.tien_dat_coc
from hop_dong hd
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong= hd.ma_hop_dong
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) = 2020 and quarter(hd.ngay_lam_hop_dong) = 4
and hd.ma_dich_vu not in (select hd1.ma_dich_vu
from hop_dong hd1
where year(hd1.ngay_lam_hop_dong) = 2021 and quarter(hd1.ngay_lam_hop_dong) in (1,2))
group by hd.ma_hop_dong;


-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất 
-- bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ
--  có số lần sử dụng nhiều như nhau).
SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    SUM(hdct.so_luong) AS so_lan_su_dung
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING so_lan_su_dung = (SELECT 
        SUM(hdct1.so_luong) AS sum
    FROM
        hop_dong_chi_tiet hdct1
    GROUP BY hdct1.ma_dich_vu_di_kem
    ORDER BY sum DESC
    LIMIT 1);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được 
-- sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
--  ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính
--  dựa trên việc count các ma_dich_vu_di_kem).
SELECT 
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        JOIN
    loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
GROUP BY hdct.ma_dich_vu_di_kem
HAVING so_lan_su_dung = 1
ORDER BY hd.ma_hop_dong;

   
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien,
--  ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
    SELECT 
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    COUNT(hd.ma_hop_dong) AS so_luong_hop_dong_duoc_lap
FROM
    nhan_vien nv
        JOIN
    hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
        JOIN
    trinh_do td ON td.ma_trinh_do = nv.ma_trinh_do
        JOIN
    bo_phan bp ON bp.ma_bo_phan = nv.ma_bo_phan
GROUP BY hd.ma_nhan_vien
HAVING so_luong_hop_dong_duoc_lap <= 3
ORDER BY nv.ma_nhan_vien;
    
    
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set sql_safe_updates = 0;
delete from nhan_vien nv
where nv.ma_nhan_vien not in (select hd1.ma_nhan_vien 
from hop_dong hd1
where year(hd1.ngay_lam_hop_dong) between 2019 and 2021 );
set sql_safe_updates = 1;


-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
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



-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

set sql_safe_updates = 0;
SET FOREIGN_KEY_CHECKS = 0;
delete from khach_hang kh
where kh.ma_khach_hang in (select hd.ma_khach_hang
from hop_dong hd 
where year(hd.ngay_lam_hop_dong) < 2021
group by hd.ma_khach_hang);
    SET FOREIGN_KEY_CHECKS = 1;
set sql_safe_updates = 1;


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
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
