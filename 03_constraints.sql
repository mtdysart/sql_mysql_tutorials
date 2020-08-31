USE sales;
DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;

CREATE TABLE customers
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id),
UNIQUE KEY (email_address)
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

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
primary key (purchase_number)
);

ALTER TABLE sales
ADD FOREIGN KEY (customer_id) references customers(customer_id) ON DELETE CASCADE;

-- Remove foreign key constraint just created
ALTER TABLE sales
DROP foreign key sales_ibfk_1;









