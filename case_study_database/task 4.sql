use furama1;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu 
-- là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT 
    n.ma_nhan_vien,
    n.ho_ten,
    n.ngay_sinh,
    n.so_cmnd,
    n.luong,
    n.so_dien_thoai,
    n.email,
    n.dia_chi,
    t.ten_trinh_do,
    b.ten_bo_phan,
    v.ten_vi_tri
FROM
    nhan_vien n
        JOIN
    vi_tri v ON n.ma_vi_tri = v.ma_vi_tri
        JOIN
    trinh_do t ON t.ma_trinh_do = n.ma_trinh_do
        JOIN
    bo_phan b ON b.ma_bo_phan = n.ma_bo_phan
WHERE
    n.ho_ten LIKE 'h%' OR n.ho_ten LIKE 't%'
        OR n.ho_ten LIKE 'k%'
        AND CHAR_LENGTH(n.ho_ten) <= 15;


-- 3. 	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- 		và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select k.ma_khach_hang,k.ho_ten,k.ngay_sinh,k.gioi_tinh,k.so_cmnd,k.so_dien_thoai, k.email, k.dia_chi, l.ten_loai_khach
from khach_hang k 
join loai_khach l
on k.ma_loai_khach = l.ma_loai_khach
where  TIMESTAMPDIFF(YEAR,
        k.ngay_sinh,
        DATE(NOW())) > 18
        AND TIMESTAMPDIFF(YEAR,
        k.ngay_sinh,
        DATE(NOW())) < 50
        AND k.dia_chi LIKE '%đà nẵng'
        OR k.dia_chi LIKE '%quảng trị';
--  k.dia_chi like '%Đà Nẵng' or k.dia_chi like '%Quảng Trị' 
--  and (year(current_date()) - year(k.ngay_sinh)) between 18 and 50;


-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select k.ma_khach_hang, k.ho_ten, count(h.ma_khach_hang) as 'so_lan_dat_phong'
from hop_dong h
join  khach_hang k
on k.ma_khach_hang=h.ma_khach_hang
join loai_khach l
on k.ma_loai_khach = l.ma_loai_khach
where l.ten_loai_khach = 'Diamond'
group by  h.ma_khach_hang
order by so_lan_dat_phong;


-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
 -- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select k.ma_khach_hang, k.ho_ten, l.ten_loai_khach,h.ma_hop_dong,d.ten_dich_vu, h.ngay_lam_hop_dong,h.ngay_ket_thuc,sum(d.chi_phi_thue +hc.so_luong*dvdk.gia) as tong_tien
from hop_dong_chi_tiet hc
join hop_dong h
on hc.ma_hop_dong = h.ma_hop_dong
right join khach_hang k
on h.ma_khach_hang = k.ma_khach_hang
join loai_khach l
on l.ma_loai_khach = k.ma_loai_khach
join dich_vu d
on d.ma_dich_vu = h.ma_dich_vu
join dich_vu_di_kem dvdk
on hc.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem;

