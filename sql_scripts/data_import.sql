use sales_Analysis;

-- Creating table
CREATE TABLE superstore (
    `Row ID` INT,
    `Order ID` VARCHAR(255),
    `Order Date` DATE,
    `Ship Date` DATE,
    `Ship Mode` VARCHAR(255),
    `Customer ID` VARCHAR(255),
    `Customer Name` VARCHAR(255),
    `Segment` VARCHAR(255),
    `Country/Region` VARCHAR(255),
    `City` VARCHAR(255),
    `State` VARCHAR(255),
    `Postal Code` INT,
    `Region` VARCHAR(255),
    `Product ID` VARCHAR(255),
    `Category` VARCHAR(255),
    `Sub-Category` VARCHAR(255),
    `Product Name` TEXT,
    `Sales` DECIMAL(10, 2),
    `Quantity` INT,
    `Discount` DECIMAL(4, 2),
    `Profit` DECIMAL(10, 2)
);
-- Loading csv File 
LOAD DATA LOCAL INFILE '/Users/pookay/Desktop/Superstore-SalesAnalysis-SQL-/dataset/Sample - Superstore.txt'
INTO TABLE superstore
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS; 





