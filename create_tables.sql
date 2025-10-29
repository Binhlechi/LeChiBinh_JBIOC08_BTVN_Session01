-- File: create_tables.sql

-- 1. Bảng CATEGORY (Thể loại)
CREATE TABLE Category (
    Category_ID SERIAL PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT
);

-- 2. Bảng AUTHOR (Tác giả)
CREATE TABLE Author (
    Author_ID SERIAL PRIMARY KEY,
    Author_Name VARCHAR(150) NOT NULL,
    Biography TEXT
);

-- 3. Bảng BOOK (Sách)
CREATE TABLE Book (
    Book_ID SERIAL PRIMARY KEY,
    Category_ID INT NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Publication_Year INT,
    Stock_Quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 4. Bảng BOOK_AUTHOR (Bảng trung gian - Sách và Tác giả)
CREATE TABLE Book_Author (
    Book_ID INT NOT NULL,
    Author_ID INT NOT NULL,
    PRIMARY KEY (Book_ID, Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 5. Bảng MEMBER (Thành viên)
CREATE TABLE Member (
    Member_ID SERIAL PRIMARY KEY,
    Full_Name VARCHAR(150) NOT NULL,
    Date_of_Birth DATE,
    Address TEXT,
    Phone VARCHAR(15),
    Registration_Date DATE NOT NULL DEFAULT CURRENT_DATE,
    Status VARCHAR(20) NOT NULL DEFAULT 'Active'
);

-- 6. Bảng MEMBER_EMAIL (Thuộc tính đa trị - Email)
CREATE TABLE Member_Email (
    Member_ID INT NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PRIMARY KEY (Member_ID, Email),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 7. Bảng MEMBER_CONTACT (Thuộc tính đa trị - Số điện thoại liên lạc)
CREATE TABLE Member_Contact (
    Member_ID INT NOT NULL,
    Contact_Phone VARCHAR(15) NOT NULL,
    PRIMARY KEY (Member_ID, Contact_Phone),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. Bảng LOAN (Phiếu mượn)
CREATE TABLE Loan (
    Loan_ID SERIAL PRIMARY KEY,
    Member_ID INT NOT NULL,
    Loan_Date DATE NOT NULL DEFAULT CURRENT_DATE,
    Due_Date DATE NOT NULL,
    Actual_Return_Date DATE,
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 9. Bảng LOAN_DETAIL (Chi tiết mượn)
CREATE TABLE Loan_Detail (
    LoanDetail_ID SERIAL PRIMARY KEY,
    Loan_ID INT NOT NULL,
    Book_ID INT NOT NULL,
    Late_Fee DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    UNIQUE (Loan_ID, Book_ID)
);