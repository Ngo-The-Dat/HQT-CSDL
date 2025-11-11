-- Younger Transaction
USE KHOHANG
GO

SET DEADLOCK_PRIORITY LOW

BEGIN TRAN
BEGIN TRY
    UPDATE SANPHAM SET TONKHO = 1 WHERE MASP = 'SP01'

    WAITFOR DELAY '00:00:10' 
    
    -- This update will trigger the deadlock detection
    UPDATE NHANVIEN SET CHUCVU = 'XYZ' WHERE HOTEN = N'Nguyễn Văn An' 
    
    COMMIT TRAN
END TRY
BEGIN CATCH
    IF (ERROR_NUMBER() = 1205) -- Error 1205 is deadlock
    BEGIN
        PRINT 'T2 (Younger/Low-Priority): Was "WOUNDED" (Deadlock victim). Rolling back.'
    END
    ROLLBACK TRAN
END CATCH

SET DEADLOCK_PRIORITY NORMAL -- Reset