-- Insert dữ liệu mẫu cho Category
INSERT INTO Category (Category_Name, Description) VALUES
('Văn học', 'Sách văn học trong và ngoài nước'),
('Khoa học', 'Sách khoa học tự nhiên và công nghệ'),
('Lịch sử', 'Sách lịch sử Việt Nam và thế giới'),
('Kinh tế', 'Sách về kinh tế và quản trị'),
('Thiếu nhi', 'Sách dành cho trẻ em');

-- Insert dữ liệu mẫu cho Author
INSERT INTO Author (Author_Name, Biography) VALUES
('Nguyễn Nhật Ánh', 'Nhà văn nổi tiếng Việt Nam'),
('Paulo Coelho', 'Nhà văn người Brazil'),
('Tô Hoài', 'Nhà văn Việt Nam'),
('Dale Carnegie', 'Tác giả sách self-help'),
('Haruki Murakami', 'Nhà văn Nhật Bản'),
('J.K. Rowling', 'Tác giả Harry Potter'),
('Agatha Christie', 'Nữ hoàng trinh thám'),
('Stephen Hawking', 'Nhà vật lý học'),
('Yuval Noah Harari', 'Sử học người Israel'),
('Malcolm Gladwell', 'Tác giả và nhà báo');

-- Insert dữ liệu mẫu cho Book
INSERT INTO Book (Category_ID, Title, Publication_Year, Stock_Quantity) VALUES
(1, 'Mắt biếc', 2007, 15),
(1, 'Nhà giả kim', 1988, 20),
(5, 'Dế Mèn phiêu lưu ký', 1941, 10),
(4, 'Đắc nhân tâm', 1936, 25),
(1, 'Norwegian Wood', 1987, 12),
(5, 'Harry Potter và Hòn đá Phù thủy', 1997, 18),
(1, 'Murder on the Orient Express', 1934, 8),
(2, 'A Brief History of Time', 1988, 10),
(3, 'Sapiens', 2011, 14),
(4, 'Outliers', 2008, 11);

-- Insert dữ liệu mẫu cho Book_Author (ít nhất 10 bản ghi)
INSERT INTO Book_Author (Book_ID, Author_ID) VALUES
(1, 1),  -- Mắt biếc - Nguyễn Nhật Ánh
(2, 2),  -- Nhà giả kim - Paulo Coelho
(3, 3),  -- Dế Mèn - Tô Hoài
(4, 4),  -- Đắc nhân tâm - Dale Carnegie
(5, 5),  -- Norwegian Wood - Haruki Murakami
(6, 6),  -- Harry Potter - J.K. Rowling
(7, 7),  -- Murder on the Orient Express - Agatha Christie
(8, 8),  -- A Brief History of Time - Stephen Hawking
(9, 9),  -- Sapiens - Yuval Noah Harari
(10, 10); -- Outliers - Malcolm Gladwell

-- Insert dữ liệu mẫu cho Member
INSERT INTO Member (Full_Name, Date_of_Birth, Address, Phone, Status) VALUES
('Nguyễn Văn A', '1995-03-15', '123 Lê Lợi, Q1, TP.HCM', '0901234567', 'Active'),
('Trần Thị B', '1998-07-22', '456 Nguyễn Huệ, Q1, TP.HCM', '0912345678', 'Active'),
('Lê Văn C', '1992-11-08', '789 Trần Hưng Đạo, Q5, TP.HCM', '0923456789', 'Active'),
('Phạm Thị D', '2000-01-30', '321 Điện Biên Phủ, Q3, TP.HCM', '0934567890', 'Active'),
('Hoàng Văn E', '1997-05-12', '654 Võ Văn Tần, Q3, TP.HCM', '0945678901', 'Inactive'),
('Đỗ Thị F', '1999-09-25', '987 Hai Bà Trưng, Q1, TP.HCM', '0956789012', 'Active'),
('Vũ Văn G', '1994-12-03', '147 Pasteur, Q3, TP.HCM', '0967890123', 'Active'),
('Mai Thị H', '2001-04-18', '258 Cách Mạng Tháng 8, Q10, TP.HCM', '0978901234', 'Active'),
('Bùi Văn I', '1996-08-07', '369 Lý Thường Kiệt, Q10, TP.HCM', '0989012345', 'Active'),
('Cao Thị K', '1993-02-14', '741 Nguyễn Trãi, Q5, TP.HCM', '0990123456', 'Active');

-- Insert dữ liệu mẫu cho Member_Email
INSERT INTO Member_Email (Member_ID, Email) VALUES
(1, 'nguyenvana@email.com'),
(1, 'vana.work@email.com'),
(2, 'tranthib@email.com'),
(3, 'levanc@email.com'),
(4, 'phamthid@email.com'),
(5, 'hoangvane@email.com'),
(6, 'dothif@email.com'),
(7, 'vuvang@email.com'),
(8, 'maithih@email.com'),
(9, 'buivani@email.com'),
(10, 'caothik@email.com');

-- Insert dữ liệu mẫu cho Member_Contact
INSERT INTO Member_Contact (Member_ID, Contact_Phone) VALUES
(1, '0123456789'),
(2, '0234567890'),
(3, '0345678901'),
(4, '0456789012'),
(5, '0567890123');

-- Insert dữ liệu mẫu cho Loan
INSERT INTO Loan (Member_ID, Loan_Date, Due_Date, Actual_Return_Date) VALUES
(1, '2025-01-15', '2025-01-29', '2025-01-28'),
(2, '2025-01-20', '2025-02-03', NULL),
(3, '2025-01-10', '2025-01-24', '2025-01-30'),
(4, '2025-01-25', '2025-02-08', NULL),
(5, '2025-01-05', '2025-01-19', '2025-01-18'),
(6, '2025-02-01', '2025-02-15', NULL),
(7, '2025-01-18', '2025-02-01', NULL),
(8, '2025-01-12', '2025-01-26', '2025-01-25'),
(9, '2025-02-05', '2025-02-19', NULL),
(10, '2025-01-08', '2025-01-22', '2025-01-29');

-- Insert dữ liệu mẫu cho Loan_Detail (ít nhất 10 bản ghi)
INSERT INTO Loan_Detail (Loan_ID, Book_ID, Late_Fee) VALUES
(1, 1, 0.00),
(1, 2, 0.00),
(2, 3, 0.00),
(3, 4, 15000.00),
(4, 5, 0.00),
(5, 6, 0.00),
(6, 7, 0.00),
(7, 8, 0.00),
(8, 9, 0.00),
(9, 10, 0.00),
(10, 1, 20000.00);