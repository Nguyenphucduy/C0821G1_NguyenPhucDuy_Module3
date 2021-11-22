use furama_resort;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
 
SELECT ho_ten
FROM nhan_vien
WHERE (ho_ten LIKE 'T%' or ho_ten LIKE 'H%' or ho_ten LIKE 'K%') and length(ho_ten)<=15;
 -- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
 -- cách 1
select ho_ten, ngay_sinh
from khach_hang
where dia_chi = 'quang ninh' or 'da nang'
having CURDATE() - ngay_sinh  BETWEEN 180101 AND 500101;
-- cách 2
select round(datediff(curdate(),ngay_sinh)/365) as tuoi, ho_ten
from khach_hang
where dia_chi = 'quang ninh' or 'da nang'
having (tuoi>=18 and tuoi< 51);

select CURDATE() - ngay_sinh 
from khach_hang;
 
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
sum((hop_dong_chi_tiet.so_luong*kieu_thue.gia_thue) + dich_vu.chi_phi_thue) as tong_tien
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
left join hop_dong on dich_vu.id_dich_vu = hop_dong.id_dich_vu
where hop_dong.ngay_lam_hop_dong not in (
	select hop_dong.ngay_lam_hop_dong
    from hop_dong
    where (ngay_lam_hop_dong between '2019-01-01' and '2019-03-31')
)
order by dich_vu.id_dich_vu;


-- 7 ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
select dich_vu.id_dich_vu,ten_dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
join ten_dich_vu on dich_vu.id_ten_dich_vu = ten_dich_vu.id_ten_dich_vu
left join hop_dong on dich_vu.id_dich_vu = hop_dong.id_dich_vu
where dich_vu.id_dich_vu in (
	select hop_dong.id_dich_vu
    from hop_dong
    where year(ngay_lam_hop_dong) = 2018 and dich_vu.id_dich_vu = hop_dong.id_dich_vu
) and dich_vu.id_dich_vu not in (
	select hop_dong.id_dich_vu
	from hop_dong
	where year(ngay_lam_hop_dong) = 2019 and dich_vu.id_dich_vu = hop_dong.id_dich_vu
)
order by dich_vu.id_dich_vu;

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- cách 1 distinct
   select distinct ho_ten
 from khach_hang;
 -- cách 2 dùng group by
 select ho_ten
 from khach_hang
 group by ho_ten;
 -- cách 3 union
 select ho_ten
 from khach_hang
 union
  select ho_ten
 from khach_hang;

 -- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng
select hop_dong.id_hop_dong,hop_dong.ngay_lam_hop_dong,hop_dong.id_khach_hang,sum((hop_dong_chi_tiet.so_luong*kieu_thue.gia_thue) + dich_vu.chi_phi_thue) as tong_tien
 from hop_dong
 join dich_vu on hop_dong.id_dich_vu =  dich_vu.id_dich_vu
 join hop_dong_chi_tiet on hop_dong.id_hop_dong =  hop_dong_chi_tiet.id_hop_dong
 join kieu_thue on dich_vu.id_kieu_thue =  kieu_thue.id_kieu_thue

 where year(ngay_lam_hop_dong) = 2019 and (month(ngay_lam_hop_dong) = 1 or  month(ngay_lam_hop_dong) = 2 or month(ngay_lam_hop_dong) = 3 or 
 month(ngay_lam_hop_dong) = 4 or month(ngay_lam_hop_dong) = 5 or month(ngay_lam_hop_dong) = 6 or month(ngay_lam_hop_dong) = 7 or 
 month(ngay_lam_hop_dong) = 8 or month(ngay_lam_hop_dong) = 9 or month(ngay_lam_hop_dong) = 10 or month(ngay_lam_hop_dong) = 11 or 
 month(ngay_lam_hop_dong) = 12) 
 group by hop_dong.id_hop_dong;
 
  -- cách 2 use procedure
 delimiter //
create procedure thong_ke(thang int,nam int)
begin
select  sum((hop_dong_chi_tiet.so_luong*kieu_thue.gia_thue) + dich_vu.chi_phi_thue) as tong_tien
 from hop_dong
 join dich_vu on hop_dong.id_dich_vu =  dich_vu.id_dich_vu
 join hop_dong_chi_tiet on hop_dong.id_hop_dong =  hop_dong_chi_tiet.id_hop_dong
 join kieu_thue on dich_vu.id_kieu_thue =  kieu_thue.id_kieu_thue

 where month(ngay_lam_hop_dong) = thang and year(ngay_lam_hop_dong) = nam
 group by hop_dong.id_hop_dong;
end;
// delimiter ;
call thong_ke(1,2019);
call thong_ke(2,2019);
call thong_ke(3,2019);
call thong_ke(4,2019);
call thong_ke(5,2019);
 -- cách 3
 select month(hop_dong.ngay_lam_hop_dong) as thang_lam_hop_dong, sum((hop_dong_chi_tiet.so_luong*kieu_thue.gia_thue) + dich_vu.chi_phi_thue) as 'tổng tiền', count(*) as so_lan_booking
from hop_dong
join dich_vu on hop_dong.id_dich_vu =  dich_vu.id_dich_vu
 join hop_dong_chi_tiet on hop_dong.id_hop_dong =  hop_dong_chi_tiet.id_hop_dong
 join kieu_thue on dich_vu.id_kieu_thue =  kieu_thue.id_kieu_thue
where year(hop_dong.ngay_lam_hop_dong) = 2019
group by month(hop_dong.ngay_lam_hop_dong)
order by month(hop_dong.ngay_lam_hop_dong);

 
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

 -- 12 ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem , tien_dat_coc 
 -- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019
 -- cách 1
 select hop_dong.id_hop_dong,nhan_vien.ho_ten,khach_hang.ho_ten,khach_hang.sdt,ten_dich_vu.ten_dich_vu,hop_dong_chi_tiet.so_luong,
 hop_dong.tien_dat_coc,count(hop_dong_chi_tiet.so_luong) as số_lượng_dịch_vụ_đi_kèm
from khach_hang
left join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
join nhan_vien on  hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien
left join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
join ten_dich_vu on dich_vu.id_ten_dich_vu = ten_dich_vu.id_ten_dich_vu
join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
where hop_dong.ngay_lam_hop_dong BETWEEN CAST('2019-09-01' AS DATE) AND CAST('2019-12-30' AS DATE) and
hop_dong.ngay_lam_hop_dong not BETWEEN CAST('2019-01-01' AS DATE) AND CAST('2019-06-30' AS DATE)
group by hop_dong.id_hop_dong
order by số_lượng_dịch_vụ_đi_kèm; 

-- cách 2
select hop_dong.id_hop_dong, nhan_vien.ho_ten, khach_hang.ho_ten,
 khach_hang.sdt, ten_dich_vu.ten_dich_vu
, hop_dong.ngay_lam_hop_dong, hop_dong.tien_dat_coc,count(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from nhan_vien
	inner join hop_dong on hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien
    inner join khach_hang on khach_hang.id_khach_hang = hop_dong.id_khach_hang
    inner join dich_vu on dich_vu.id_dich_vu = hop_dong.id_hop_dong
    inner join ten_dich_vu on dich_vu.id_ten_dich_vu = ten_dich_vu.id_ten_dich_vu
    inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
where hop_dong.ngay_lam_hop_dong in (
	select hop_dong.ngay_lam_hop_dong
    from hop_dong
    where (ngay_lam_hop_dong between '2019-09-01' and '2019-12-30')) 
    and hop_dong.ngay_lam_hop_dong not in (
	select hop_dong.ngay_lam_hop_dong
    from hop_dong
    where (ngay_lam_hop_dong between '2019-01-01' and '2019-6-30'))
group by hop_dong.id_hop_dong
order by so_luong_dich_vu_di_kem;


 -- 13	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
  select dvdk.ten_dich_vu_di_kem,  max(hdct.so_luong)
  from hop_dong_chi_tiet hdct
  join hop_dong hd on hdct.id_hop_dong = hd.id_hop_dong
  join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
  group by hdct.id_dich_vu_di_kem;
  
 -- 14 	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
  --  ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
  select hop_dong.id_hop_dong,loai_dich_vu.ten_loai_dich_vu,dich_vu_di_kem.ten_dich_vu_di_kem,count(dich_vu_di_kem.id_dich_vu_di_kem) as so_lan_su_dung
  from dich_vu
  join hop_dong on  dich_vu.id_dich_vu = hop_dong.id_hop_dong
  join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
  join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
  join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
  group by dich_vu_di_kem.id_dich_vu_di_kem
  having so_lan_su_dung = 1;
 
 -- 15. ma_nhan_vien, ho_ten, trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
 select nhan_vien.id_nhan_vien,nhan_vien.ho_ten,trinh_do.name_trinh_do,bo_phan.ten_bo_phan,nhan_vien.dia_chi,count(hop_dong.id_hop_dong) as so_luong_hop_dong
 from nhan_vien
 join bo_phan on nhan_vien.id_bo_phan = bo_phan.id_bo_phan
 join trinh_do on nhan_vien.id_trinh_do = trinh_do.id_trinh_do
 join hop_dong on nhan_vien.id_nhan_vien = hop_dong.id_nhan_vien
 where hop_dong.ngay_lam_hop_dong BETWEEN CAST('2018-01-01' AS DATE) AND CAST('2019-12-30' AS DATE) 
 group by nhan_vien.id_nhan_vien
 having so_luong_hop_dong <= 3 ;
 
 -- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
 
delete from nhan_vien
where id_nhan_vien not in (
select id_nhan_vien
from hop_dong
where year(ngay_lam_hop_dong) between 2017 and 2019);
--  tắt chế độ ràng buộc khóa ngoại
SET FOREIGN_KEY_CHECKS=0; 
select *
from nhan_vien;


 -- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
 -- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.


drop view loai_khach_view;

create view loai_khach_view as 
select khach_hang.id_khach_hang,khach_hang.id_loai_khach
from khach_hang
join loai_khach on loai_khach.id_loai_khach= khach_hang.id_loai_khach
join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
join kieu_thue on dich_vu.id_kieu_thue = kieu_thue.id_kieu_thue
where year(hop_dong.ngay_lam_hop_dong) = 2019
group by hop_dong.id_hop_dong
having   sum((hop_dong_chi_tiet.so_luong*kieu_thue.gia_thue) + dich_vu.chi_phi_thue) >= 100 ;

SET SQL_SAFE_UPDATES = 0;
update khach_hang
-- phải  join với bản mình cần update mới update được từ view
inner join loai_khach_view on khach_hang.id_khach_hang = loai_khach_view.id_khach_hang
set khach_hang.id_loai_khach = 2 ;
SET SQL_SAFE_UPDATES = 1;



select *
from loai_khach_view;

 -- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).
 SET FOREIGN_KEY_CHECKS = 0;
 delete from khach_hang
where id_khach_hang  in (
select id_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) <= 2016);
SET FOREIGN_KEY_CHECKS = 1; 
select *
from khach_hang;
 
 -- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
SET SQL_SAFE_UPDATES = 0;
update dich_vu_di_kem
set gia = gia*2
where id_dich_vu_di_kem in (
	select id_dich_vu_di_kem
    from hop_dong_chi_tiet
	join hop_dong on hop_dong.id_hop_dong=hop_dong_chi_tiet.id_hop_dong
    where year(hop_dong.ngay_lam_hop_dong) = 2019
    group by id_dich_vu_di_kem
    having count(id_dich_vu_di_kem)>10
);
SET SQL_SAFE_UPDATES = 1;

 -- 20 	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
 -- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
 select id_nhan_vien as id,ho_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi 
 from nhan_vien 
 union all
 select id_khach_hang,ho_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi 
 from khach_hang;
 
--  21.Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và 
-- đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
drop view v_nhan_vien;
create view v_nhan_vien as
select nhan_vien.*
from nhan_vien
join hop_dong on nhan_vien.id_nhan_vien = hop_dong.id_nhan_vien
where nhan_vien.dia_chi = 'Quang ninh' and hop_dong.ngay_lam_hop_dong = '2019-12-12';

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
SET SQL_SAFE_UPDATES = 0;
update nhan_vien
inner join v_nhan_vien on nhan_vien.id_nhan_vien = v_nhan_vien.id_nhan_vien
set nhan_vien.dia_chi =  'Liên Chiểu';
SET SQL_SAFE_UPDATES = 1;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền 
 -- vào như là 1 tham số của sp_xoa_khach_hang.
  delimiter //
create procedure sp_xoa_khach_hang(id_delete int)
begin
DELETE FROM khach_hang
    WHERE id_khach_hang = id_delete;
end;
// delimiter ;
call sp_xoa_khach_hang(2);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới 
-- vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
  delimiter //
create procedure sp_them_moi_hop_dong(id_hop_dong int,ngay_lam_hop_dong date,ngay_ket_thuc date,tien_dat_coc double,id_nhan_vien int,id_khach_hang int,id_dich_vu int)
begin
insert into hop_dong
values(id_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,id_nhan_vien,id_khach_hang,id_dich_vu);
end;
// delimiter ;
call sp_xoa_khach_hang(200,'2015/05/13','2020/03/14',8000,1,33,2);
-- Error Code: 1318. Incorrect number of arguments for PROCEDURE

 



 
 