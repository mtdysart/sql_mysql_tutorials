
DROP TABLE customer;

CREATE TABLE customers
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

CREATE TABLE items
(
	item_id VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10, 2),
    company_id VARCHAR(255),
PRIMARY KEY (item_id)
);

CREATE TABLE companies
(
	company_id INT,
    company_name VARCHAR(255),
    headquarters_phone_no INT(12),
PRIMARY KEY (company_id)
);
    
    

