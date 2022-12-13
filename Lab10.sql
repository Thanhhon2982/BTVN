
---------------Câu 36.	Tính t?ng s? l??ng c?a t?ng s?n ph?m bán ra trong tháng 10/2006.
SELECT MASP, COUNT(DISTINCT MASP) AS TONGSO
FROM SANPHAM
WHERE MASP IN(SELECT MASP
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006)
GROUP BY MASP
--------------Câu 37.	Tính doanh thu bán hàng c?a t?ng tháng trong n?m 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
---------------Câu 38.	Tìm hóa ??n có mua ít nh?t 4 s?n ph?m khác nhau.
SELECT *
FROM HOADON
WHERE SOHD IN(SELECT SOHD
FROM CTHD
WHERE SL >= 4)
-------------Câu 39.	Tìm hóa ??n có mua 3 s?n ph?m do “Viet Nam” s?n xu?t (3 s?n ph?m khác nhau).
SELECT *
FROM HOADON
WHERE SOHD IN(SELECT SOHD
FROM CTHD C INNER JOIN SANPHAM S
ON C.MASP = S.MASP
WHERE NUOCSX = 'Viet Nam' AND SL >= 3)
-------------Câu 40.	Tìm khách hàng (MAKH, HOTEN) có s? l?n mua hàng nhi?u nh?t.
SELECT MAKH, HOTEN
FROM KHACHHANG
WHERE MAKH = (SELECT TOP 1 MAKH
FROM HOADON
GROUP BY MAKH
ORDER BY COUNT(DISTINCT SOHD) DESC)
-------------Câu 41.	Tháng m?y trong n?m 2006, doanh s? bán hàng cao nh?t ?
SELECT TOP 1 MONTH(NGHD) AS THANG_DOANHSO_MAX
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC
--------------Câu 42.	Tìm s?n ph?m (MASP, TENSP) có t?ng s? l??ng bán ra th?p nh?t trong n?m 2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP = (SELECT TOP 1 MASP
FROM CTHD
GROUP BY MASP
ORDER BY SUM(SL) DESC)
-------------Câu 43.	M?i n??c s?n xu?t, tìm s?n ph?m (MASP,TENSP) có giá bán cao nh?t.

SELECT B.NUOCSX, MASP, TENSP
FROM (SELECT NUOCSX, MAX(GIA) AS MAX
FROM SANPHAM
GROUP BY NUOCSX) AS B LEFT JOIN SANPHAM S 
ON S.GIA = B.MAX 
WHERE B.NUOCSX = S.NUOCSX

----------Câu 44.	Tìm n??c s?n xu?t s?n xu?t ít nh?t 3 s?n ph?m có giá bán khác nhau.
SELECT sp.NUOCSX
FROM SANPHAM sp
GROUP BY sp.NUOCSX
HAVING count(distinct sp.GIA)>=3
----------Câu 45.	*Trong 10 khách hàng có doanh s? cao nh?t, tìm khách hàng có s? l?n mua hàng nhi?u nh?t.
SELECT MAKH, COUNT(SOHD)
FROM HOADON
GROUP BY MAKH
