use furama_resort;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
 
SELECT ho_ten
FROM nhan_vien
WHERE (ho_ten LIKE 'T%' or ho_ten LIKE 'H%' or ho_ten LIKE 'K%') and length(ho_ten)<=15;
 -- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where ngay_sinh BETWEEN CAST('1971-01-01' AS DATE) AND CAST('2003-01-01' AS DATE) and dia_chi in ('quang ninh','da nang');
 
 -- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
 -- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
 -- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select k.id_khach_hang, k.ho_ten, l.ten_loai_khach, COUNT(id_dich_vu)
from khach_hang k
	inner join loai_khach l on k.id_loai_khach = l.id_loai_khach
	left join hop_dong h on k.id_khach_hang = h.id_khach_hang
where
    l.ten_loai_khach = 'Diamond'
group by  id_dich_vu
order by id_dich_vu;

-- 5 .IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
select khach_hang.id_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.id_hop_dong,ten_dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,
dich_vu.chi_phi_thue + sum(hop_dong_chi_tiet.so_luong*kieu_thue.gia_thue) as tong_tien
from khach_hang
join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
left join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
join ten_dich_vu on ten_dich_vu.id_ten_dich_vu = dich_vu.id_ten_dich_vu
join kieu_thue on dich_vu.id_kieu_thue = kieu_thue.id_kieu_thue
join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
group by hop_dong.id_hop_dong;

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
-- của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select dich_vu.id_dich_vu,ten_dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu,hop_dong.ngay_lam_hop_dong
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
join ten_dich_vu on dich_vu.id_ten_dich_vu = ten_dich_vu.id_ten_dich_vu
join hop_dong on dich_vu.id_dich_vu = hop_dong.id_dich_vu
where hop_dong.ngay_lam_hop_dong not BETWEEN CAST('2019-01-01' AS DATE) AND CAST('2019-04-01' AS DATE);

-- 7 ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
select dich_vu.id_dich_vu,ten_dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
join ten_dich_vu on dich_vu.id_ten_dich_vu = ten_dich_vu.id_ten_dich_vu
join hop_dong on dich_vu.id_dich_vu = hop_dong.id_dich_vu
where hop_dong.ngay_lam_hop_dong BETWEEN CAST('2018-01-01' AS DATE) AND CAST('2018-12-30' AS DATE) and hop_dong.ngay_lam_hop_dong not BETWEEN CAST('2019-01-01' AS DATE) AND CAST('2019-12-30' AS DATE) ;



-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
   select distinct ho_ten
 from khach_hang;
 -- chưa tìm đc 2 cách còn lại
 
 
 -- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng
 select dich_vu.chi_phi_thue + sum(hop_dong_chi_tiet.so_luong*kieu_thue.gia_thue) as tong_tien
 from hop_dong
 join dich_vu on hop_dong.id_dich_vu =  dich_vu.id_dich_vu
 join hop_dong_chi_tiet on hop_dong.id_hop_dong =  hop_dong_chi_tiet.id_hop_dong
 join kieu_thue on dich_vu.id_kieu_thue =  kieu_thue.id_kieu_thue

 where ngay_lam_hop_dong BETWEEN CAST('2019-01-01' AS DATE) AND CAST('2019-01-30' AS DATE)
 group by hop_dong.id_hop_dong;
 delimiter //
 -- tạo procedure
create procedure thong_ke(thang int,nam int)
begin
select dich_vu.chi_phi_thue + sum(hop_dong_chi_tiet.so_luong*kieu_thue.gia_thue) as tong_tien
 from hop_dong
 join dich_vu on hop_dong.id_dich_vu =  dich_vu.id_dich_vu
 join hop_dong_chi_tiet on hop_dong.id_hop_dong =  hop_dong_chi_tiet.id_hop_dong
 join kieu_thue on dich_vu.id_kieu_thue =  kieu_thue.id_kieu_thue

 where month(ngay_lam_hop_dong) = thang and year(ngay_lam_hop_dong) = nam
 group by hop_dong.id_hop_dong;
end;
// delimiter ;
 call thong_ke(1,2019);
 --  chưa làm được 11 tháng còn lại

 
 -- 10 ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
 select h.id_hop_dong,h.ngay_lam_hop_dong,h.ngay_ket_thuc,h.tien_dat_coc,sum(hd.so_luong) as tong_so_luong
 from hop_dong h 
 join hop_dong_chi_tiet hd on h.id_hop_dong = hd.id_hop_dong
 group by h.id_hop_dong;
-- join dich_vu_di_kem dv on hd.id_dich_vu_di_kem = dv.id_dich_vu_di_kem;
 -- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond”
 -- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
  select dv.id_dich_vu_di_kem,dv.ten_dich_vu_di_kem, dv.gia, dv.don_vi,dv.trang_thai_kha_dung,kh.ho_ten,lk.ten_loai_khach
 from khach_hang kh 
 join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
 join hop_dong h on kh.id_khach_hang = h.id_khach_hang
join hop_dong_chi_tiet hd on h.id_hop_dong = hd.id_hop_dong
join dich_vu_di_kem dv on hd.id_dich_vu_di_kem = dv.id_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond' and kh.dia_chi in ('da nang','quang ninh');
 -- 12
 -- 13
 -- 14
 -- 15
 -- 16
 -- 17
 -- 18
 -- 19
 -- 20 	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
 -- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
 select id_nhan_vien,ho_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi 
 from nhan_vien 
 union 
 select id_khach_hang,ho_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi 
 from khach_hang;
 



 
 