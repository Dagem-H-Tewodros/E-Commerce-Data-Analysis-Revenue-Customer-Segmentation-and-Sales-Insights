# DATA CLEANING
    
    ## Setting Negative qunatity Values To Positive
UPDATE e_commerce
SET quantity = ABS(quantity)
WHERE quantity <0;
	
    ## Turning invoice_date from a datatype "text" with MM/DD/YYYY format to a "Date" Datatype with a YYYY-MM-DD format
UPDATE e_commerce2
SET CustomerID= SUBSTRING(CustomerID,1,5);

UPDATE e_commerce2
SET InvoiceDate = DATE_FORMAT(STR_TO_DATE(InvoiceDate, '%m-%d-%Y'), '%Y-%m-%d');

    ## Deleting items with a unit_price of 0
DELETE  
FROM 
	e_commerce2
WHERE 
	unit_price = 0;

	## Categorizing products based on keywords in their descriptions for easier visualization and analysis 
ALTER TABLE `e-commerce`.`e_commerce2` 
ADD COLUMN `category` VARCHAR(45) NULL AFTER `category`;

UPDATE e_commerce2
SET category = CASE
    WHEN LOWER(description) LIKE '%hanger%' OR LOWER(description) LIKE '%hook%' OR LOWER(description) LIKE '%rack%' THEN 'Storage & Organization'
    WHEN LOWER(description) LIKE '%lantern%' OR LOWER(description) LIKE '%light%' OR LOWER(description) LIKE '%lamp%' OR LOWER(description) LIKE '%candle%' THEN 'Lighting'
    WHEN LOWER(description) LIKE '%heart%' OR LOWER(description) LIKE '%decoration%' OR LOWER(description) LIKE '%decor%' OR LOWER(description) LIKE '%art%' THEN 'Home Decor'
    WHEN LOWER(description) LIKE '%bottle%' OR LOWER(description) LIKE '%mug%' OR LOWER(description) LIKE '%cup%' OR LOWER(description) LIKE '%jug%' OR LOWER(description) LIKE '%glass%' THEN 'Drinkware'
    WHEN LOWER(description) LIKE '%plate%' OR LOWER(description) LIKE '%tray%' OR LOWER(description) LIKE '%dish%' THEN 'Tableware'
    WHEN LOWER(description) LIKE '%bag%' OR LOWER(description) LIKE '%basket%' OR LOWER(description) LIKE '%box%' OR LOWER(description) LIKE '%container%' THEN 'Storage'
    WHEN LOWER(description) LIKE '%paper%' OR LOWER(description) LIKE '%pen%' OR LOWER(description) LIKE '%craft%' OR LOWER(description) LIKE '%stationery%' OR LOWER(description) LIKE '%scissors%' THEN 'Crafts & Stationery'
    WHEN LOWER(description) LIKE '%cushion%' OR LOWER(description) LIKE '%blanket%' OR LOWER(description) LIKE '%fabric%' OR LOWER(description) LIKE '%textile%' OR LOWER(description) LIKE '%pillow%' THEN 'Textiles & Soft Furnishings'
    WHEN LOWER(description) LIKE '%utensil%' OR LOWER(description) LIKE '%kitchen%' OR LOWER(description) LIKE '%spatula%' OR LOWER(description) LIKE '%cooking%' THEN 'Kitchenware'
    WHEN LOWER(description) LIKE '%toy%' OR LOWER(description) LIKE '%game%' OR LOWER(description) LIKE '%play%' OR LOWER(description) LIKE '%puzzle%' THEN 'Toys & Games'
    WHEN LOWER(description) LIKE '%jewelry%' OR LOWER(description) LIKE '%keychain%' OR LOWER(description) LIKE '%accessory%' THEN 'Personal Accessories'
    ELSE 'Other'
END;

	


