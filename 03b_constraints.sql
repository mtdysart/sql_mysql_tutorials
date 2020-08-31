USE sales;

DROP TABLE customers;

CREATE TABLE customers
(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ("John", "Mckinley", "M", "john.mckinley@365careers.com", 0);

-- Make # of complaints default 0
ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name, last_name, gender)
VALUES ("Peter", "Figaro", "M");

DROP TABLE companies;

CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number INT(12),
PRIMARY KEY (company_id),
UNIQUE KEY (headquarters_phone_number)
);

ALTER TABLE companies
MODIFY COLUMN company_name VARCHAR(255) NULL;	

ALTER TABLE companies
MODIFY COLUMN company_name VARCHAR(255) NOT NULL;