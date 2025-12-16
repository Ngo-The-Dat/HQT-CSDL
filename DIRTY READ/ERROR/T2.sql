-- Vì isolation level mặc định của ssms là read committed nên phải set isolation level là read uncommited hoặc đọc với nolock để mô phỏng
USE KHOHANG
GO
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRAN
SELECT * FROM SANPHAM WHERE MASP = 'SP01'
COMMIT TRAN
