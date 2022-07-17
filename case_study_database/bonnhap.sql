select n.ma_nhan_vien, n.ho_ten,n.ngay_sinh,n.so_cmnd,n.luong, n.so_dien_thoai, n.email, n.dia_chi, t.ten_trinh_do,b.ten_bo_phan, v.ten_vi_tri
from nhan_vien n
join vi_tri v
on n.ma_vi_tri = v.ma_vi_tri
join trinh_do t
on t.ma_trinh_do = n.ma_trinh_do
join bo_phan b 
on b.ma_bo_phan = n.ma_bo_phan
where n.ho_ten like 'h%' 
or n.ho_ten like 't%' 
or n.ho_ten like 'k%' 
and char_length(n.ho_ten) <= 15;