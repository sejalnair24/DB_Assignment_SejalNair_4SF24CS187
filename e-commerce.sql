CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    name VARCHAR(50)
);


CREATE TABLE Coupon (
    coupon_id INT PRIMARY KEY,
    discount INT
);



CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    coupon_id INT,
    order_date DATE,
    status VARCHAR(20),
    created_at TEXT,
    updated_at TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (coupon_id) REFERENCES Coupon (coupon_id)
);




CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    method VARCHAR(20),
    amount DECIMAL(10,2),
    created_at TEXT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);




CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    category_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);




CREATE TABLE Order_Item (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);


INSERT INTO Customer VALUES 
(1,'Aman','aman@gmail.com'),
(2,'Priya','priya@gmail.com'),
(3,'Kiran','kiran@gmail.com'),
(4,'Rohit','rohit@gmail.com'),
(5,'Meena','meena@gmail.com'),
(6,'Vikas','vikas@gmail.com'),
(7,'Sita','sita@gmail.com'),
(8,'Raj','raj@gmail.com'),
(9,'Anil','anil@gmail.com'),
(10,'Deepa','deepa@gmail.com');

INSERT INTO Category VALUES 
(1,'Electronics'),(2,'Clothing');

INSERT INTO Product VALUES 
(1,'Laptop',1,50000),
(2,'Phone',1,20000),
(3,'Shirt',2,1000),
(4,'TV',1,40000),
(5,'Jeans',2,2000);

INSERT INTO Coupon VALUES 
(1,10),(2,20);

INSERT INTO Orders VALUES 
(1,1,1,'2025-01-01','Delivered'),
(2,2,2,'2025-01-02','Pending'),
(3,3,NULL,'2025-01-03','Shipped'),
(4,4,1,'2025-01-04','Delivered');

INSERT INTO Order_Item VALUES 
(1,1,1,50000),
(1,2,2,20000),
(2,3,1,1000),
(3,2,1,20000),
(4,5,2,2000);

INSERT INTO Payment VALUES 
(1,1,'UPI',50000),
(2,2,'Card',1000),
(3,3,'Cash',20000),
(4,4,'UPI',4000);
SELECT * FROM Payment;


SELECT COUNT(*) FROM Orders;


SELECT * FROM Product WHERE category_id=1;


SELECT * FROM Orders WHERE coupon_id IS NOT NULL;

SELECT Product.name, Category.name
FROM Product
JOIN Category ON Product.category_id = Category.category_id;


SELECT Orders.order_id, Payment.amount
FROM Payment
JOIN Orders ON Payment.order_id = Orders.order_id;

SELECT Customer.name, Orders.order_id
FROM Orders
JOIN Customer ON Orders.customer_id = Customer.customer_id;


SELECT Orders.order_id, Product.name
FROM Order_Item
JOIN Orders ON Order_Item.order_id = Orders.order_id
JOIN Product ON Order_Item.product_id = Product.product_id;
