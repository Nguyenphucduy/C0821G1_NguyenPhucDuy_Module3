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

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
-- của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

-- 7 

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
   select distinct ho_ten
 from khach_hang;
 
 -- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng
 
 -- 10
 -- 11
 -- 12
 -- 13
 -- 14
 -- 15
 -- 16
 -- 17
 -- 18
 -- 19
 -- 20
 select ho_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi 
 from nhan_vien 
 union all
 select ho_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi 
 from khach_hang;
 



 
 