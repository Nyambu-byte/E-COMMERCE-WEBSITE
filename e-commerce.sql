-- Attribute Type Table
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

INSERT INTO attribute_type (type_name) VALUES 
('Text'),
('Number'),
('Boolean');

-- Attribute Category Table
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO attribute_category (name) VALUES 
('Physical'),
('Technical');

-- Brand Table
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO brand (name) VALUES 
('Nike'),
('Samsung'),
('Apple');

-- Product Category Table
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO product_category (name) VALUES 
('Clothing'),
('Electronics');

-- Product Table
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    brand_id INT NOT NULL,
    product_category_id INT NOT NULL,
    base_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (product_category_id) REFERENCES product_category(id)
);

INSERT INTO product (name, brand_id, product_category_id, base_price) VALUES 
('Running Shoes', 1, 1, 79.99),
('Galaxy S21', 2, 2, 699.99),
('iPhone 14', 3, 2, 999.99);

-- Color Table
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO color (name) VALUES 
('Red'),
('Blue'),
('Black');

-- Size Category Table
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO size_category (name) VALUES 
('Clothing Sizes'),
('Shoe Sizes');

-- Size Option Table
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    size_value VARCHAR(20) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

INSERT INTO size_option (size_category_id, size_value) VALUES 
(1, 'S'),
(1, 'M'),
(2, '42'),
(2, '44');

-- Product Variation Table
CREATE TABLE product_variation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES 
(1, 1, 3),
(1, 2, 4);

-- Product Item Table
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_variation_id INT NOT NULL,
    stock_quantity INT NOT NULL,
    price DECIMAL(10,2),
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(id)
);

INSERT INTO product_item (product_variation_id, stock_quantity, price) VALUES 
(1, 50, 89.99),
(2, 30, 89.99);

-- Product Image Table
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO product_image (product_id, image_url) VALUES 
(1, 'images/shoes1.png'),
(2, 'images/galaxy_s21.png'),
(3, 'images/iphone14.png');

-- Product Attribute Table
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_item_id INT NOT NULL,
    attribute_category_id INT NOT NULL,
    attribute_type_id INT NOT NULL,
    value TEXT,
    FOREIGN KEY (product_item_id) REFERENCES product_item(id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);

INSERT INTO product_attribute (product_item_id, attribute_category_id, attribute_type_id, value) VALUES 
(1, 1, 1, 'Rubber Sole'),
(2, 2, 2, '250');