-- Product Image Table
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);
SELECT * FROM product_image;

-- Color Table
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
SELECT * FROM color;

-- Product Category Table
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
SELECT * FROM product_category;

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
SELECT * FROM product;

-- Product Item Table
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_variation_id INT NOT NULL,
    stock_quantity INT NOT NULL,
    price DECIMAL(10,2),
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(id)
);
SELECT * FROM product_item;

-- Brand Table
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
SELECT * FROM brand;

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
SELECT * FROM product_variation;

-- Size Category Table
CREATE TABLE size_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
SELECT * FROM size_category;

-- Size Option Table
CREATE TABLE size_option (
    id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    size_value VARCHAR(20) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);
SELECT * FROM size_option;

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
SELECT * FROM product_attribute;

-- Attribute Category Table
CREATE TABLE attribute_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
SELECT * FROM attribute_category;

-- Attribute Type Table
CREATE TABLE attribute_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);
SELECT * FROM attribute_type;