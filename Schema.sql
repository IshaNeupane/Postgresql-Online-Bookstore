--CREATE TABLES
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	Book_id INT PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(50),
	Genre VARCHAR(50),
	Published_Year INT,
	Price Numeric(10,2),
	Stock INT
	
);

CREATE TABLE Customers(
	Customer_id INT PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(15),
	City VARCHAR(50),
	Country VARCHAR(150)
);

CREATE TABLE Orders (
	Order_id INT PRIMARY KEY,
	Customer_id INT REFERENCES Customers(Customer_id),
	Book_id INT REFERENCES Books(Book_id),
	Order_Date DATE,
	Quantity INT,
	Total_Amount Numeric(10,2)
);



