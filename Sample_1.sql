Drop Database If Exists sample_2;
Create Database sample_2;
use sample_2;
Create Table customers(
	id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50),
    phone varchar(10) not null,
    age tinyint unsigned check(age>18),
    country varchar(50) default 'India',
    email varchar(100) Unique,
    address tinyint,
    pincode varchar(6) default '201301',
    date_inserted_at date default (current_date),
    created_time time default (current_time),
    created_at_datetime timestamp default (current_timestamp)
    );


INSERT INTO customers -- we will not mention default columns
(id, first_name, last_name, phone, age, country, email, address, pincode, date_inserted_at, created_time)
VALUE
(1, 'Rahul', 'Sharma', '9876543210', 25, 'India', 'rahul.sharma@gmail.com', 12, '110001', '2026-05-01', '10:15:00'),
(2, 'Priya', 'Verma', '9123456780', 30, 'India', 'priya.verma@gmail.com', 15, '201301', '2026-05-01', '11:20:00'),
(3, 'Aman', 'Gupta', '9988776655', 22, 'India', 'aman.gupta@gmail.com', 20, '400001', '2026-05-02', '09:45:00'),
(4, 'Neha', 'Singh', '9871234567', 28, 'India', 'neha.singh@gmail.com', 18, '560001', '2026-05-02', '12:10:00'),
(5, 'Rohit', 'Kumar', '9012345678', 35, 'India', 'rohit.kumar@gmail.com', 25, '700001', '2026-05-03', '14:30:00'),
(6, 'Sneha', 'Patel', '9090909090', 27, 'India', 'sneha.patel@gmail.com', 10, '380001', '2026-05-03', '16:00:00'),
(7, 'Vikas', 'Yadav', '9898989898', 24, 'India', 'vikas.yadav@gmail.com', 14, '226001', '2026-05-04', '08:50:00'),
(8, 'Pooja', 'Mehta', '9765432109', 31, 'India', 'pooja.mehta@gmail.com', 30, '302001', '2026-05-04', '17:25:00'),
(9, 'Arjun', 'Reddy', '9345678901', 29, 'India', 'arjun.reddy@gmail.com', 22, '500001', '2026-05-05', '13:40:00'),
(10, 'Kavya', 'Nair', '9234567890', 26, 'India', 'kavya.nair@gmail.com', 16, '682001', '2026-05-05', '15:15:00'),
(11, 'Deepak', 'Joshi', '9456789012', 33, 'India', 'deepak.joshi@gmail.com', 28, '248001', '2026-05-06', '10:05:00'),
(12, 'Anjali', 'Chauhan', '9567890123', 21, 'India', 'anjali.chauhan@gmail.com', 19, '160017', '2026-05-06', '11:55:00'),
(13, 'Manish', 'Tiwari', '9678901234', 40, 'India', 'manish.tiwari@gmail.com', 35, '221001', '2026-05-07', '09:20:00'),
(14, 'Ritika', 'Malhotra', '9789012345', 23, 'India', 'ritika.malhotra@gmail.com', 11, '122001', '2026-05-07', '18:10:00'),
(15, 'Saurabh', 'Mishra', '9890123456', 32, 'India', 'saurabh.mishra@gmail.com', 27, '800001', '2026-05-08', '07:45:00');
    
    select * from customers;
    
    describe customers;
    
Create table customer_orders (
		order_id int primary key auto_increment,
        customer_id int,
        order_date date default (current_date),
        order_amount decimal(10,2) not null,
        order_status enum('Pending', 'Shipped', 'Delivered', 'Cancelled') Default 'Pending',
        foreign key (customer_id) References customers(id) on delete cascade
        );

INSERT INTO customer_orders
(order_id, customer_id, order_date, order_amount, order_status)
VALUES
(1, 1, '2026-05-01', 1250.50, 'Pending'),
(2, 2, '2026-05-02', 3499.99, 'Shipped'),
(3, 3, '2026-05-02', 899.00, 'Delivered'),
(4, 4, '2026-05-03', 15999.75, 'Cancelled'),
(5, 5, '2026-05-04', 2450.00, 'Delivered'),
(6, 6, '2026-05-05', 5200.40, 'Shipped'),
(7, 7, '2026-05-06', 799.99, 'Pending');