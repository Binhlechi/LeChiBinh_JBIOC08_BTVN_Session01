-- TRUY VẤN 1: Liệt kê tất cả sách cùng thể loại và tác giả
SELECT 
    b.Book_ID,
    b.Title,
    b.Publication_Year,
    c.Category_Name,
    STRING_AGG(a.Author_Name, ', ') AS Authors
FROM Book b
JOIN Category c ON b.Category_ID = c.Category_ID
LEFT JOIN Book_Author ba ON b.Book_ID = ba.Book_ID
LEFT JOIN Author a ON ba.Author_ID = a.Author_ID
GROUP BY b.Book_ID, b.Title, b.Publication_Year, c.Category_Name
ORDER BY b.Title;

-- TRUY VẤN 2: Tìm thành viên đang mượn sách quá hạn
SELECT 
    m.Member_ID,
    m.Full_Name,
    m.Phone,
    l.Loan_ID,
    l.Loan_Date,
    l.Due_Date,
    CURRENT_DATE - l.Due_Date AS Days_Overdue
FROM Member m
JOIN Loan l ON m.Member_ID = l.Member_ID
WHERE l.Actual_Return_Date IS NULL 
  AND l.Due_Date < CURRENT_DATE
ORDER BY Days_Overdue DESC;

-- TRUY VẤN 3: Thống kê số lượng sách theo thể loại
SELECT 
    c.Category_Name,
    COUNT(b.Book_ID) AS Total_Books,
    SUM(b.Stock_Quantity) AS Total_Stock
FROM Category c
LEFT JOIN Book b ON c.Category_ID = b.Category_ID
GROUP BY c.Category_ID, c.Category_Name
ORDER BY Total_Books DESC;

-- TRUY VẤN 4: Tìm top 5 sách được mượn nhiều nhất
SELECT 
    b.Book_ID,
    b.Title,
    COUNT(ld.LoanDetail_ID) AS Times_Borrowed,
    STRING_AGG(DISTINCT a.Author_Name, ', ') AS Authors
FROM Book b
JOIN Loan_Detail ld ON b.Book_ID = ld.Book_ID
LEFT JOIN Book_Author ba ON b.Book_ID = ba.Book_ID
LEFT JOIN Author a ON ba.Author_ID = a.Author_ID
GROUP BY b.Book_ID, b.Title
ORDER BY Times_Borrowed DESC
LIMIT 5;

-- TRUY VẤN 5: Tính tổng tiền phạt cho từng thành viên
SELECT 
    m.Member_ID,
    m.Full_Name,
    COUNT(DISTINCT l.Loan_ID) AS Total_Loans,
    COALESCE(SUM(ld.Late_Fee), 0) AS Total_Late_Fee
FROM Member m
LEFT JOIN Loan l ON m.Member_ID = l.Member_ID
LEFT JOIN Loan_Detail ld ON l.Loan_ID = ld.Loan_ID
GROUP BY m.Member_ID, m.Full_Name
HAVING COALESCE(SUM(ld.Late_Fee), 0) > 0
ORDER BY Total_Late_Fee DESC;