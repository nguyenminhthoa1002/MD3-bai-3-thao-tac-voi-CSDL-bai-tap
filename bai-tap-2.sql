create database md3_bai3_baitap2;
-- drop database md3_bai3_baitap2;
use md3_bai3_baitap2;

SELECT * FROM md3_bai2_baitap.orders;
SELECT * FROM md3_bai2_baitap.customer;
SELECT * FROM md3_bai2_baitap.orderdetail;
SELECT * FROM md3_bai2_baitap.product;

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT * FROM md3_bai2_baitap.orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select cus.cID, cus.cName, pro.pName
from md3_bai2_baitap.customer cus join md3_bai2_baitap.orders ord on cus.cID = ord.cID join md3_bai2_baitap.orderdetail orde on ord.oID = orde.oID join md3_bai2_baitap.product pro on orde.pID = pro.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào 
select cus1.cID, cus1.cName
from md3_bai2_baitap.customer cus1 
where cus1.cID not in
(
select cus.cID
from md3_bai2_baitap.customer cus join md3_bai2_baitap.orders ord on cus.cID = ord.cID join md3_bai2_baitap.orderdetail orde on ord.oID = orde.oID join md3_bai2_baitap.product pro on orde.pID = pro.pID
group by cus.cid
);


-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện 
-- trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice) 
select ord.oID, ord.oDate, orde.odQTY*pro.pPrice as 'Gia ban'
from md3_bai2_baitap.orders ord join md3_bai2_baitap.orderdetail orde on ord.oID = orde.oID join md3_bai2_baitap.product pro on pro.pID = orde.pID
group by ord.oID;

