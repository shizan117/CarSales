
create database CarSalesData

use CarSalesData

create table Admin_info
(
	sno int IDENTITY(1, 1) PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Pass varchar(50) NOT NULL,
	Product_id int NOT NULL FOREIGN KEY REFERENCES  Car_info(Product_id),
	Seller_id int NOT NULL FOREIGN KEY REFERENCES  Seller_info(Seller_id),

)

INSERT INTO Admin_info VALUES ('Afridi',128,1000,1)
INSERT INTO Admin_info VALUES ('Shizan',117,1001,2)
--INSERT INTO Admin_info VALUES ('Nuru',130)

select * from Admin_info
--drop table Admin_info


create table Seller_info
(
	Seller_id int IDENTITY(1, 1) PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Pass varchar(50) NOT NULL,
	Number int not null unique,
	email varchar(50) NOT NULL unique,
	NID int not null unique,
	Product_id int NOT NULL FOREIGN KEY REFERENCES  Car_info(Product_id),

)

INSERT INTO Seller_info VALUES ('Afridi',128,01521585858,'180204128@aust.edu',1122334455,1001)
INSERT INTO Seller_info VALUES ('Shizan',117,01521669423,'180204117@aust.edu',1122334456,1001)
INSERT INTO Seller_info VALUES ('Afridi',128,01521585848,'180204127@aust.edu',1122334457,1003)
INSERT INTO Seller_info VALUES ('Shizan',117,01521669483,'180204125@aust.edu',1122334458,1004)

--INSERT INTO Seller_info VALUES ('Nuru',130)

select * from Seller_info
--delete from Seller_info where sno = 3
--drop table Seller_info


create table Car_info
(
	--sno int IDENTITY(1, 1) PRIMARY KEY,
	Product_id int IDENTITY(1000, 1) PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Color varchar(50) NOT NULL,
	--Engine_number varchar(50) NOT NULL unique,
	--VIN varchar(50) NOT NULL unique,
	Brand varchar(50) NOT NULL,
	--Seat int,
	Model varchar(50) NOT NULL,
	Registation varchar(50) NOT NULL,
	--Stock int,
	Price int NOT NULL,
	expence int not null,
	sell_status varchar(50) not null,
)

INSERT INTO Car_info VALUES ('Range Rover','Black','Range Rover','Noah','1234',10900000,9200000,'notsold')
INSERT INTO Car_info VALUES ('Range Rover','Black','Range Rover','Allion','1235',5900000,4800000,'sold')
INSERT INTO Car_info VALUES ('Range Rover A1','White','Range Rover','Noah','1256',20500000,9200000,'notsold')
INSERT INTO Car_info VALUES ('Range Rover A2','Red','Range Rover','Allion','1278',9875000,4800000,'sold')
INSERT INTO Car_info VALUES ('Audi A2','Black','Audi','sedan','786',9999900,85255000,'sold')


select * from Car_info
--drop table Car_info
--select count(sno) as 'total' from Car_info
--select sum(Price), sum(expence) from Car_info where sell_status='sold'
select * from Car_info WHERE Price BETWEEN 1000000 AND 6000000

create table Customer_info
(
	--sno int IDENTITY(1, 1) PRIMARY KEY,
	Name varchar(50) NOT NULL,
	National_id int NOT NULL PRIMARY KEY ,
	
	
	Present_address varchar(50) NOT NULL,
	Parmanent_address varchar(50) NOT NULL,
	Phone int NOT NULL unique ,
	Email varchar(50) NOT NULL unique,
	--DateOfSale date,

)

INSERT INTO Customer_info VALUES ('ARB',1212121214,'Dhaka','Jessore',01754546571,'arb@gamil.com')--'07/15/2020'
INSERT INTO Customer_info VALUES ('ARB',1212121215,'Dhaka','Jessore',01754546771,'arb1@gamil.com')--'06/19/2021'

select * from Customer_info

create table Sales_info
(
	Sales_id int IDENTITY(1, 1) PRIMARY KEY,
	
	National_id int NOT NULL FOREIGN KEY REFERENCES  Customer_info(National_id),
	
	Product_id int NOT NULL FOREIGN KEY REFERENCES  Car_info(Product_id),

	DateOfSale varchar(50) NOT NULL ,

)

INSERT INTO Sales_info VALUES (1212121214,1001,'Oct 7, 2021');

select * from Sales_info
--drop table Sales_info
--LEFT OUTER

SELECT s.name, s.email,  s.number
FROM Seller_info s left outer JOIN Car_info c
ON s.Product_id = c.Product_id

SELECT s.Name, s.Number, s.email, c.Name, c.Product_id,  c.Brand
FROM Car_info c right outer JOIN Seller_info s
ON c.Product_id = s.Product_id where c.product_id = '1002'

SELECT s.Name, s.Number, s.email, c.Name, c.Product_id,  c.Brand
FROM Car_info c left outer JOIN Seller_info s
ON c.Product_id = s.Product_id 