drop table if exists order_items;


drop table if exists orders;


drop table if exists customers;


drop table if exists products;


drop table if exists categories;


drop table if exists payment_details;


CREATE TABLE customers ( id SERIAL PRIMARY KEY,
                                           name VARCHAR(50) NOT NULL,
                                                            user_name VARCHAR(50),
                                                                      password VARCHAR(50),
                                                                               address VARCHAR(120),
                                                                                       city VARCHAR(30),
                                                                                            country VARCHAR(20));


CREATE TABLE products ( id SERIAL PRIMARY KEY,
                                          product_name VARCHAR(100) NOT NULL,
                                                                    description VARCHAR(800),
                                                                                unit_price INT NOT NULL,
                                                                                               product_pic VARCHAR(200),
                                                                                                           category_id INT references categories(id));


CREATE TABLE categories ( id SERIAL PRIMARY KEY,
                                            name VARCHAR(50) NOT NULL);


CREATE TABLE orders ( id SERIAL PRIMARY KEY,
                                        order_date DATE NOT NULL,
                                                        order_reference VARCHAR(10) NOT NULL,
                                                                                    customer_id INT REFERENCES customers(id));


CREATE TABLE order_items ( id SERIAL PRIMARY KEY,
                                             order_id INT REFERENCES orders(id),
                                                                     product_id INT REFERENCES products(id),
                                                                                               quantity INT NOT NULL);


CREATE TABLE payment_details ( id SERIAL PRIMARY KEY,
                                                 customers_id INT REFERENCES customers(id),
                                                                             card_number VARCHAR(50) NOT NULL,
                                                                                                     card_holder_name VARCHAR(50) NOT NULL,
                                                                                                                                  card_expiry_date DATE NOT NULL,
                                                                                                                                                        cvv_code INT NOT NULL);