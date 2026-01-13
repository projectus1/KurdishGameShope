-- Create the database
CREATE DATABASE IF NOT EXISTS gamestore_db;

-- Use the database
USE gamestore_db;

-- Create games table for homepage featured games
CREATE TABLE games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    image_path VARCHAR(255),
    price DECIMAL(10,2) DEFAULT 0.00
);

-- Create about_us table
CREATE TABLE about_us (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL
);

-- Create platforms table for consoles
CREATE TABLE platforms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255),
    image_path VARCHAR(255),
    price DECIMAL(10,2) DEFAULT 0.00,
    discount VARCHAR(10),
    points INT DEFAULT 0
);

-- Create services table for accessories
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    image_path VARCHAR(255),
    price DECIMAL(10,2) DEFAULT 0.00,
    discount VARCHAR(10),
    points INT DEFAULT 0
);

-- Create feedback table
CREATE TABLE feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    text TEXT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create purchases table
CREATE TABLE purchases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR(255) NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    item_type ENUM('game', 'platform', 'service') NOT NULL,
    price DECIMAL(10,2) DEFAULT 0.00,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_email) REFERENCES users(email) ON DELETE CASCADE
);

-- Insert sample data for games (from homepage)
INSERT INTO games (title, description, image_path) VALUES
('Red Dead Redemption 2', 'The famous Cowboy american Game Red Dead Redemption 2 is now available For All consoles.', 'pictures/rdr2.png'),
('Battlefield 6', 'Battlefield 6 is a first-person shooter video game published by Electronic Arts.', 'pictures/battle.png'),
('Cyberpunk 2077', 'Cyberpunk 2077 is an open-world action-adventure video game developed by CD Projekt RED.', 'pictures/cyber.png'),
('Ghost of Tsushima', 'Ghost of Tsushima is a 2020 action-adventure game developed by Sucker Punch Productions.', 'pictures/ghost.png'),
('Call Of Duty: Black OPS Cold War', 'Call of Duty: Black Ops Cold War is a 2020 first-person game developed by Treyarch.', 'pictures/cod.png');

-- Insert sample data for about_us
INSERT INTO about_us (content) VALUES
('We are a gaming store created by gamers for gamers. Here you can find your favorite games, accessories, and more — all at fair prices. Our goal is to make shopping easy, fast, and safe. When you order, we prepare your item carefully and deliver it to you as soon as possible, so you can start playing without waiting.');

-- Insert sample data for platforms (consoles)
INSERT INTO platforms (name, category, image_path, price, discount, points) VALUES
('PlayStation Pro 5', 'Consoles', 'pictures/ps5.jpg', 649.99, '-20%', 60),
('Xbox Series X', 'Console', 'pictures/xboxx.jpg', 29.00, '-33%', 5),
('Xbox Series S', 'Console', 'pictures/xbox1.jpg', 49.00, '-25%', 10),
('Ps4 Pro', 'Console', 'pictures/Ps4p.jpg', 59.00, '-10%', 10),
('PC', 'Pc', 'pictures/pc1.jpg', 49.00, '-25%', 10),
('Console', 'Play Station', 'pictures/ps2.jpg', 49.00, '-10%', 10),
('Xbox Series X', 'Console', 'pictures/xboxr1.jpg', 49.00, '-25%', 10),
('Console', 'PlayStation', 'pictures/playr1.jpg', 49.00, '-25%', 10);

-- Insert sample data for services (accessories)
INSERT INTO services (name, description, image_path, price, discount, points) VALUES
('Keyboard', '50% Off Now!', 'pictures/key1.jpg', 649.99, '50%', 70),
('Headseat', '50% off Now', 'pictures/hed.jpg', 349.99, '50%', 60),
('Control Elite', '44% off Now', 'pictures/cr1.jpg', 200.99, '44%', 60),
('Desktop', 'Sale off 50% only this week', 'pictures/desk.jpg', 400.00, '50%', 60),
('Moues', '69% off Now', 'pictures/moues.jpg', 240.99, '69%', 60),
('Monitor', '30% off Now', 'pictures/monitor.jpg', 550.66, '30%', 60);

-- Insert sample feedback
INSERT INTO feedback (name, email, text) VALUES
('Peshawa barjnze', 'peshawa@example.com', 'A great gaming website should feel fast, smooth, and exciting from the first second.'),
('Hama Kurdish', 'hama@example.com', 'Content is also super important. Clear descriptions and honest reviews help players know what they’re getting.');
