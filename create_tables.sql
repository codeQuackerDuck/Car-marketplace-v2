CREATE DATABASE IF NOT EXISTS car_marketplace;
USE car_marketplace;


DROP TABLE IF EXISTS listing_images;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS listings;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_verified TINYINT(1) DEFAULT 0,
  role ENUM('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB;


CREATE TABLE listings (
  listing_id INT AUTO_INCREMENT PRIMARY KEY,
  seller_id INT NOT NULL,
  make VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  year INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  mileage INT NOT NULL,
  body_type ENUM('Sedan','SUV','Truck','Coupe','Hatchback','Van','Other') NOT NULL,
  vin VARCHAR(17) UNIQUE,
  description TEXT,
  status ENUM('available','sold','pending') NOT NULL DEFAULT 'available',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_listings_seller
    FOREIGN KEY (seller_id) REFERENCES users(user_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;



CREATE TABLE ratings (
  rating_id INT AUTO_INCREMENT PRIMARY KEY,
  listing_id INT NOT NULL,
  buyer_id INT NOT NULL,
  rating_value INT NOT NULL,
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_ratings_listing
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_ratings_buyer
    FOREIGN KEY (buyer_id) REFERENCES users(user_id)
    ON DELETE CASCADE
) ENGINE=InnoDB;


CREATE TABLE messages (
  message_id INT AUTO_INCREMENT PRIMARY KEY,
  sender_id INT NOT NULL,
  receiver_id INT NOT NULL,
  listing_id INT,
  message_text TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_read TINYINT(1) DEFAULT 0,
  CONSTRAINT fk_messages_sender
    FOREIGN KEY (sender_id) REFERENCES users(user_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_messages_receiver
    FOREIGN KEY (receiver_id) REFERENCES users(user_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_messages_listing
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id)
    ON DELETE SET NULL
) ENGINE=InnoDB;


CREATE TABLE listing_images (
  image_id INT AUTO_INCREMENT PRIMARY KEY,
  listing_id INT NOT NULL,
  image_url VARCHAR(255) NOT NULL,
  alt_text VARCHAR(100),
  is_primary TINYINT(1) DEFAULT 0,
  CONSTRAINT fk_listing_images_listing
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id)
    ON DELETE CASCADE
) ENGINE=InnoDB;

