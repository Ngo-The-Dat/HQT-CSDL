-- Older Transaction
USE KHOHANG
GO

SET DEADLOCK_PRIORITY HIGH

BEGIN TRAN
    UPDATE NHANVIEN SET CHUCVU = 'ABC' WHERE HOTEN = N'Nguyễn Văn An'

    WAITFOR DELAY '00:00:05' 

    -- This will cause a deadlock, but SQL Server will kill T2.
    -- T1 will simply wait until T2 is rolled back, then continue.
    UPDATE SANPHAM SET TONKHO = 1 WHERE MASP = 'SP01'

COMMIT TRAN

SET DEADLOCK_PRIORITY NORMAL -- Reset