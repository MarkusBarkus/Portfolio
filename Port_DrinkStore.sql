USE MASTER
GO
ALTER DATABASE DrinkStore set single_user with rollback immediate
GO
Drop DATABASE DrinkStore
GO
CREATE DATABASE DrinkStore

GO
USE DrinkStore
GO
--Size of drinks and affect on cost to be implemented later
CREATE TABLE Drinks
(
Id INT IDENTITY NOT NULL,
drinkName varchar(50),
cost money NOT NULL,
Picture VARBINARY(MAX) NULL,
Calories INT,
CONSTRAINT PK_Drinks PRIMARY KEY(Id)
)
GO

-- add drinks
INSERT INTO Drinks (drinkName, cost, Calories) VALUES ('Pumpkin Spice Latte', 6.5, 180)
INSERT INTO Drinks (drinkName, cost, Calories) VALUES ('Coffee', 2, 6)
INSERT INTO Drinks (drinkName, cost, Calories) VALUES ('Ice Coffee', 3.5, 55)
INSERT INTO Drinks (drinkName, cost, Calories) VALUES ('Hot Choclate', 3.5, 120)
INSERT INTO Drinks (drinkName, cost, Calories) VALUES ('English Breakfast Tea', 2, 4)
INSERT INTO Drinks (drinkName, cost, Calories) VALUES ('Apple Cider', 2.5, 140)
INSERT INTO Drinks (drinkName, cost, Calories) VALUES ('Latte', 4, 135)
INSERT INTO Drinks (drinkName, cost, Calories) VALUES ('Cold Brew', 4, 7)
INSERT INTO Drinks (drinkName, cost, Calories) VALUES ('Cappuccino', 4.5, 70)
GO

--memberships to distinguish customers who buy more and give exclusive offers
CREATE TABLE membership 
( Id INT IDENTITY NOT NULL,
  membershipName VARCHAR(50) NOT NULL,
  CONSTRAINT PK_membership PRIMARY KEY(Id)  
)
GO
--Add membership ranks 
--first rank, exclusive offers every now and then (implement in later update)
INSERT INTO membership (membershipName) VALUES ('Bronze');
-- 5% off, more exlusive offers (implement later)
INSERT INTO membership (membershipName) VALUES ('Silver');
-- 7% off, more exlusive offers, ?possible priotity in wait queue? (implement later)
INSERT INTO membership (membershipName) VALUES ('Gold');
-- 10% off, more exlusive offers, ?possible priotity in wait queue? (implement later)
INSERT INTO membership (membershipName) VALUES ('platinum ');
-- special rank for employees, will give 20% discount (implementation later)
INSERT INTO membership (membershipName) VALUES ('Employee');



--non member purchase to be added later
--INSERT INTO membership (membershipName) VALUES ('No membership'); 
GO

--Table to hold customer info
CREATE TABLE Customers
( Id INT IDENTITY NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50),
  PhoneNum VARCHAR(25),
  Email VARCHAR(50),
  Picture VARBINARY(MAX) NULL,
  membership INT NOT NULL default 4,
  Timer ROWVERSION,
  CONSTRAINT PK_Customers PRIMARY KEY(Id)
)
GO


-- add customer info
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Mohmd','Alsaidi','519-719-3230','mohmdalsaidi@gmail.com',5)
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Chad','Disposition','519-756-7777','chad@gmail.com',1)
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Sam','Brook','519-756-7777','sbrook@gmail.com',2)
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Aster','Fendly','519-756-7777','a_f@gmail.com',2)
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Harry','Torner','519-719-3230','htor@gmail.com',3)
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Jane','Birolo','519-719-3230','jb@gmail.com',3)
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Guane','Poluchi','519-719-3230','guapol@gmail.com',3)
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Luke','Park','519-719-3230','lp@gmail.com',4) 
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Jamal','Jackson','519-719-3230','jamja@gmail.com',3) 
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Connor','Stilton','519-719-3230','cos@gmail.com',4) 
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Sarah','Weaver','519-719-3230','sw@gmail.com',1) 
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Jen','Platts','519-719-3230','jen.platts@gmail.com',2) 
INSERT INTO Customers (FirstName,LastName,PhoneNum,Email,membership) VALUES ('Arnov','Clumpenvander','519-719-3230','arnovcl@gmail.com',4) 
GO

CREATE TABLE Orders
( Id INT IDENTITY NOT NULL,
  CustomerId INT NOT NULL,


  CONSTRAINT PK_Orders PRIMARY KEY(Id)
)
GO


--Employees (future update)
/*
CREATE TABLE Employees
( Id INT IDENTITY NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50),
  PhoneNum VARCHAR(25),
  Email VARCHAR(50),
  Picture VARBINARY(MAX) NULL,
  membership INT NOT NULL default 5,
  Wage money,
  streetNum INT NOT NULL,
  unitNum INT,
  Province VARCHAR(50),
  Country VARCHAR(50),
  streetName VARCHAR(50),
  StoreId INT

  Timer ROWVERSION,
  CONSTRAINT PK_Customers PRIMARY KEY(Id)
)*/

--Store (future update)
/*
CREATE TABLE Employees
( Id INT IDENTITY NOT NULL,
  PhoneNum VARCHAR(25),
  streetNum INT NOT NULL,
  Province VARCHAR(50),
  Country VARCHAR(50),
  streetName VARCHAR(50),
  Timer ROWVERSION,
  CONSTRAINT PK_Customers PRIMARY KEY(Id)
)
*/

GO


--