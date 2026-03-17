CREATE TABLE Member (
 loyalty_no INT NOT NULL,
 f_name VARCHAR(20),
 l_name VARCHAR(20),
 phone_no INT,
 email VARCHAR(20),
 loyalty_pts INT
);

ALTER TABLE Member ADD CONSTRAINT PK_Member PRIMARY KEY (loyalty_no);


CREATE TABLE Product Type (
 product_id CHAR(10) NOT NULL,
 name CHAR(10),
 description CHAR(10),
 base_price CHAR(10),
 sku CHAR(10)
);

ALTER TABLE Product Type ADD CONSTRAINT PK_Product Type PRIMARY KEY (product_id);


CREATE TABLE Receipt (
 receipt_id CHAR(10) NOT NULL,
 date_time CHAR(10),
 total_amount CHAR(10),
 store_id     (FK) CHAR(10),
 product_id CHAR(10)
);

ALTER TABLE Receipt ADD CONSTRAINT PK_Receipt PRIMARY KEY (receipt_id);


CREATE TABLE Store (
 store_id INT NOT NULL,
 street VARCHAR(15),
 city VARCHAR(15) NOT NULL,
 state VARCHAR(15),
 zip INT
);

ALTER TABLE Store ADD CONSTRAINT PK_Store PRIMARY KEY (store_id);


CREATE TABLE Transaction (
 receipt_no INT NOT NULL,
 type VARCHAR(10),
 date DATE,
 amount DECIMAL(10),
 register_no INT,
 items VARCHAR(10),
 store_id INT NOT NULL,
 loyalty_no INT
);

ALTER TABLE Transaction ADD CONSTRAINT PK_Transaction PRIMARY KEY (receipt_no);


CREATE TABLE Department (
 department_id INT NOT NULL,
 department_name VARCHAR(25),
 temperature_controlled BIT(3),
 store_id INT NOT NULL
);

ALTER TABLE Department ADD CONSTRAINT PK_Department PRIMARY KEY (department_id);


CREATE TABLE Employee (
 emp_id INT NOT NULL,
 f_name VARCHAR(15),
 l_name VARCHAR(15),
 salary CHAR(10),
 store_id INT NOT NULL,
 manager_id INT NOT NULL
);

ALTER TABLE Employee ADD CONSTRAINT PK_Employee PRIMARY KEY (emp_id);


CREATE TABLE Product (
 product_id INT NOT NULL,
 name VARCHAR(15),
 description VARCHAR(10),
 price DECIMAL(10),
 expiration_date DATE,
 department_id INT NOT NULL
);

ALTER TABLE Product ADD CONSTRAINT PK_Product PRIMARY KEY (product_id);


CREATE TABLE Role (
 role_id INT NOT NULL,
 title VARCHAR(15),
 description VARCHAR(50),
 department_id INT NOT NULL
);

ALTER TABLE Role ADD CONSTRAINT PK_Role PRIMARY KEY (role_id);


CREATE TABLE Staffing (
 staff_id INT NOT NULL,
 needed_employees INT,
 emp_id INT NOT NULL,
 role_id INT NOT NULL
);

ALTER TABLE Staffing ADD CONSTRAINT PK_Staffing PRIMARY KEY (staff_id);


CREATE TABLE Inventory (
 inventory_id INT NOT NULL,
 quantity_on_hand INT,
 reorder_level INT,
 last_stock_date DATE,
 store_id INT NOT NULL,
 product_id INT NOT NULL
);

ALTER TABLE Inventory ADD CONSTRAINT PK_Inventory PRIMARY KEY (inventory_id);


ALTER TABLE Receipt ADD CONSTRAINT FK_Receipt_0 FOREIGN KEY (product_id) REFERENCES Product Type (product_id);


ALTER TABLE Transaction ADD CONSTRAINT FK_Transaction_0 FOREIGN KEY (store_id) REFERENCES Store (store_id);
ALTER TABLE Transaction ADD CONSTRAINT FK_Transaction_1 FOREIGN KEY (loyalty_no) REFERENCES Member (loyalty_no);


ALTER TABLE Department ADD CONSTRAINT FK_Department_0 FOREIGN KEY (store_id) REFERENCES Store (store_id);


ALTER TABLE Employee ADD CONSTRAINT FK_Employee_0 FOREIGN KEY (store_id) REFERENCES Store (store_id);
ALTER TABLE Employee ADD CONSTRAINT FK_Employee_1 FOREIGN KEY (manager_id) REFERENCES Employee (emp_id);


ALTER TABLE Product ADD CONSTRAINT FK_Product_0 FOREIGN KEY (department_id) REFERENCES Department (department_id);


ALTER TABLE Role ADD CONSTRAINT FK_Role_0 FOREIGN KEY (department_id) REFERENCES Department (department_id);


ALTER TABLE Staffing ADD CONSTRAINT FK_Staffing_0 FOREIGN KEY (emp_id) REFERENCES Employee (emp_id);
ALTER TABLE Staffing ADD CONSTRAINT FK_Staffing_1 FOREIGN KEY (role_id) REFERENCES Role (role_id);


ALTER TABLE Inventory ADD CONSTRAINT FK_Inventory_0 FOREIGN KEY (store_id) REFERENCES Store (store_id);
ALTER TABLE Inventory ADD CONSTRAINT FK_Inventory_1 FOREIGN KEY (product_id) REFERENCES Product (product_id);


