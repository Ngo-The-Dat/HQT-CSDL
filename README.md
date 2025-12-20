# Mô phỏng tranh chấp trong cơ sở dữ liệu và cách giải quyết
### Cách dùng

1. Chạy file `KHO HANG.sql` trong MySQL để tạo database, bảng và thêm dữ liệu mẫu.
2. Với mỗi folder tương ứng với 1 tranh chấp. Trong 1 folder sẽ có 2 folder:
    - `ERROR`: Chứa 2 file chạy demo tranh chấp.
    - `FIX`: 2 folder là `WITH ISOLATION LEVEL` (sử dụng mức cô lập) và `WITH LOCK` (sử dụng khóa) để giải quyết tranh chấp
3. Chạy file `T1.sql` rồi đến `T2.sql` để thấy tranh chấp xảy ra hoặc được giải quyết.

Đối với DEADLOCK thì sẽ có 3 hướng giải quyết tranh chấp: 

- Ordering, 
- Wait-Die, 
- Wound-Wait. 

Mỗi hướng sẽ được đặt tên file theo mẫu 'T1-Ordering.sql', 'T2-Ordering.sql', ... 

=> Chạy file `T1-Ordering.sql` rồi đến `T2-Ordering.sql` để thấy cách giải quyết tranh chấp.