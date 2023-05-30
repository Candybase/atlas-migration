--Add new schema named "shop"
CREATE DATABASE ` shop ` CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

--Create "customers" table
CREATE TABLE ` shop `.` customers ` (
  ` id ` int NOT NULL,
  ` name ` varchar(50) NULL,
  ` email ` varchar(50) NULL,
  ` phone ` varchar(20) NULL,
  PRIMARY KEY(` id `)
) COMMENT "This table contains information about customers." ;

--Create "orders" table
CREATE TABLE ` shop `.` orders ` (
  ` id ` int NOT NULL,
  ` customer_id ` int NULL,
  ` order_date ` date NULL,
  ` total ` decimal(10, 2) NULL,
  PRIMARY KEY(` id `),
  INDEX ` customer_id ` (` customer_id `),
  CONSTRAINT ` orders_ibfk_1 ` FOREIGN KEY(` customer_id `) REFERENCES ` shop `.` customers ` (` id `) ON UPDATE NO ACTION ON DELETE NO ACTION
) COMMENT "This table contains information about orders." ;

--Create "products" table
CREATE TABLE ` shop `.` products ` (
  ` id ` int NOT NULL,
  ` name ` varchar(50) NULL,
  ` description ` text NULL,
  ` price ` decimal(10, 2) NULL,
  ` stock ` int NULL,
  ` created_at ` datetime NULL,
  PRIMARY KEY(` id `)
) COMMENT "This table contains information about products." ;

--Create "order_items" table
CREATE TABLE ` shop `.` order_items ` (
  ` id ` int NOT NULL,
  ` order_id ` int NULL,
  ` product_id ` int NULL,
  ` quantity ` int NULL,
  ` price ` decimal(10, 2) NULL,
  PRIMARY KEY(` id `),
  INDEX ` order_id ` (` order_id `),
  INDEX ` product_id ` (` product_id `),
  CONSTRAINT ` order_items_ibfk_1 ` FOREIGN KEY(` order_id `) REFERENCES ` shop `.` orders ` (` id `) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ` order_items_ibfk_2 ` FOREIGN KEY(` product_id `) REFERENCES ` shop `.` products ` (` id `) ON UPDATE NO ACTION ON DELETE NO ACTION
) COMMENT "This table contains information about order items." ;
