
/*CREATE DATABASE DBAPP DATAFILE 'DBAPP_file' SIZE 10M
LOGFILE GROUP 1 ('test_log1a', 'test_log1b') SIZE 500K,
GROUP 2 ('test_log2a', 'test_log2b') SIZE 500K;
*/
/* REASON : https://stackoverflow.com/questions/11854403/how-to-create-a-small-and-simple-database-using-oracle-11-g-and-sql-developer */

CREATE TABLESPACE default_tbs datafile 'C:\tbs\default_tbs.dat' size 1024M autoextend on ;
CREATE TEMPORARY TABLESPACE temp_tbs tempfile 'C:\tbs\temp_tbs.dat' size 1024M autoextend on;
CREATE USER DB_ADMIN IDENTIFIED BY aZa2365_123 DEFAULT TABLESPACE default_tbs TEMPORARY TABLESPACE temp_tbs ;
GRANT ALL PRIVILEGES TO DB_ADMIN ;

CONNECT DB_ADMIN/aZa2365_123

/*-----------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE Users (
  User_ID int,
  User_Name varchar(30),
  User_Email varchar(30),
  User_Phone varchar(10),
  Avatar varchar(30), /*path*/
  User_Creating_Date date,
  User_Pass varchar(40),
  User_C_Pass varchar(40),
  User_Type varchar(10),
  constraint pk_membres PRIMARY KEY (User_ID),
  constraint Check_User_Type CHECK (User_Type in ('Admin','Simple')),
  constraint Check_User_Type_pic CHECK (Avatar in ('Male','Female'))
);

DESC Users
/*-----------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE Suppliers (
  Suppliers_ID int,
  Suppliers_Name varchar(30),
  Suppliers_Email varchar(30),
  Suppliers_Phone varchar(10),
  Suppliers_Date_impo date,
  Suppliers_Web varchar(40),
  Suppliers_Add varchar(40),
  constraint pk_suppliers PRIMARY KEY (Suppliers_ID)
);

DESC Suppliers
/*-----------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE Product (
  Product_ID int,
  Product_Name varchar(30),
  Product_Cat varchar(30),
  Product_Price varchar(10),
  Product_Date_Exp date,
  Product_Desc varchar(120),
  Suppliers_ID int,
  User_ID int,
  constraint pk_Product PRIMARY KEY (Product_ID),
  constraint fk_Product_1 foreign key(Suppliers_ID) references Suppliers(Suppliers_ID) on delete cascade,
  constraint fk_Product_2 foreign key(User_ID) references Users(User_ID) on delete cascade
);

DESC Product
/*-----------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE Sell (
  Sell_ID int,
  Sell_Quantite varchar(30),
  Total_Bill varchar(10),
  Product_ID int,
  constraint pk_Sell PRIMARY KEY (Sell_ID),
  constraint fk_Sell_1 foreign key(Product_ID) references Product(Product_ID) on delete cascade
);

DESC Sell
/*-----------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE Purchase (
  Ordre_ID int,
  Purchase_Quantite varchar(30),
  Purchase_Price varchar(30),
  Product_ID int,
  constraint pk_Purchase PRIMARY KEY (Ordre_ID),
  constraint fk_Purchase_1 foreign key(Product_ID) references Product(Product_ID) on delete cascade
);

DESC Purchase
/*-----------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE Customers (
  Cus_ID int,
  Cus_Name varchar(30),
  Cus_Email varchar(30),
  Cus_Phone varchar(10),
  Cus_Creating_Date date,
  Cus_Address varchar(40),
  Cus_Total_Debt VARCHAR(30),
  constraint pk_Customers PRIMARY KEY (Cus_ID)
);

DESC Customers
/*-----------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE Return (
  Return_ID int,
  Return_Date date,
  Reason_Desc varchar(120),
  Product_ID int,
  constraint pk_Return PRIMARY KEY (Return_ID),
  constraint fk_Return_1 foreign key(Product_ID) references Product(Product_ID) on delete cascade
);

DESC Return
/*-----------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE Annuelle (
  Annuelle_ID int,
  Total_Money_Init varchar(30),
  Date_annuelle date,
  Total_money_end varchar(30),
  constraint pk_Annuelle PRIMARY KEY (Annuelle_ID)
);

DESC Annuelle
/*-----------------------------------------------------------------------------------------------------------------------------------*/
