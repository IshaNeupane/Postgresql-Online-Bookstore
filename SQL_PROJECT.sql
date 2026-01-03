
--1)Retrieve all books in the Fiction Genre
SELECT * 
FROM Books
WHERE genre = 'Fiction';

SELECT * FROM Books;

-- 2)Find Books published after the year 1950.

SELECT * 
FROM Books
WHERE published_year > 1950;

--3) List all the customers from canada
SELECT * FROM Customers
WHERE Country = 'Canada';

--4)Show orders placed in NOvember 2023
SELECT * 
FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'
ORDER BY order_date ASC ;

--5)Retrieve the total stock of books available
SELECT SUM(stock) AS Total_Stock
FROM Books;

--6)FIND THE DETALS OF MOST EXPENSIVE BOOK
SELECT * 
FROM Books
ORDER BY price DESC LIMIT 1;

-- SHow all the customers who ordered more than 1 quanity of books.
SELECT * FROM Orders
WHERE quantity > 1;

--7) Retrieve all orders where the total amount exceeds $20.
SELECT * 
FROM Orders 
WHERE total_amount > 20.00
ORDER BY total_amount ASC;

-- 8)List all the genres available in the Book table.
SELECT  DISTINCT genre FROM Books;

--9)FIND THE BOOK WITH THE LOWEST STOCK
SELECT *
FROM Books
ORDER BY stock 
LIMIT 1;

--10)calculate the total revenue generated from all orders.

SELECT SUM(total_amount) AS Revenue
FROM Orders;

-- Advanced Queries
--11) Retrive the total number of books sold for each genre

SELECT b.genre, SUM(o.quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b 
ON o.book_id = b.book_id
GROUP BY b.genre;

--12) Find the average price of books in the Fantasy Genre

SELECT AVG(price) AS Avg_Price
FROM Books
WHERE genre = 'Fantasy';

--13) List the customer who have placed at least 2 orders.
SELECT c.name, o.customer_id,  COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
GROUP BY 
    o.customer_id,
    c.name
HAVING COUNT(o.order_id) >= 2;

--14) Find the most frequently ordered book.

SELECT o.Book_id, b.title, COUNT(order_id) AS Order_Count
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY o.Book_id, b.title 
ORDER BY Order_Count DESC LIMIT 1;

--15) Find the top 3 most expensive book of Fantasy Genre
SELECT * FROM Books
WHERE genre = 'Fantasy'
ORDER BY price DESC LIMIT 3;

--16) Retrieve the total quantity of books sold by each author.

SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.author;


--17) List the cities where customers who spent over $30 are located. 

SELECT DISTINCT c.city, o.total_amount 
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > 30 
ORDER BY c.city ASC; 

--18) Find the Customer who spent the most on orders

SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_Count  
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_Count DESC LIMIT 1;

--19)Calculate the stock remaining after fulfilling all orders.

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity), 0) AS Order_quantity,
b.stock- COALESCE(SUM(o.quantity), 0) AS Remaining_Quantity
FROM Books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id;


SELECT * FROM Customers;
SELECT * FROM Books;
SELECT * FROM Orders;

