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
cost money
CONSTRAINT PK_Drinks PRIMARY KEY(Id)
)
GO

-- add drinks
INSERT INTO Drinks (drinkName, cost) VALUES ('Pumpkin Spice Latte', 6.5)
INSERT INTO Drinks (drinkName, cost) VALUES ('Coffee', 2)
INSERT INTO Drinks (drinkName, cost) VALUES ('Ice Coffee', 3.5)
INSERT INTO Drinks (drinkName, cost) VALUES ('Hot Choclate', 3.5)
INSERT INTO Drinks (drinkName, cost) VALUES ('English Breakfast Tea', 2)
INSERT INTO Drinks (drinkName, cost) VALUES ('Apple Cider', 2.5)
INSERT INTO Drinks (drinkName, cost) VALUES ('Latte', 4)
INSERT INTO Drinks (drinkName, cost) VALUES ('Cold Brew', 4)
INSERT INTO Drinks (drinkName, cost) VALUES ('Cappuccino', 4.5)
GO

--memberships to distinguish customers who buy more and give exclusive offers
CREATE TABLE membership 
( Id INT IDENTITY NOT NULL,
  membershipName VARCHAR(50) NOT NULL,
  CONSTRAINT PK_membership PRIMARY KEY(Id)  
)
GO
--Add membership ranks 
--non member purchase 
INSERT INTO membership (membershipName) VALUES ('No membership'); 
--first rank, exclusive offers every now and then (implement in later update)
INSERT INTO membership (membershipName) VALUES ('Bronze');
-- 5% off, more exlusive offers (implement later)
INSERT INTO membership (membershipName) VALUES ('Silver');
-- 10% off, more exlusive offers, ?possible priotity in wait queue? (implement later)
INSERT INTO membership (membershipName) VALUES ('Gold');
-- special rank for employees, will give 20% discount (implementation later)
INSERT INTO membership (membershipName) VALUES ('Employee');
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

