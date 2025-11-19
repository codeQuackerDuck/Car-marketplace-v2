
INSERT INTO users (username, email, password_hash, first_name, last_name, phone_number, is_verified, role) VALUES
('ava',  'ava@example.com',  'hash1', 'Ava',  'Wong',    '4161234567', 1, 'user'),
('bob',  'bob@example.com',  'hash2', 'Bob',  'Smith',   '6472223344', 1, 'user'),
('carl', 'carl@example.com', 'hash3', 'Carl', 'Johnson', '9053334455', 0, 'user'),
('dina', 'dina@example.com', 'hash4', 'Dina', 'Brown',   '2891112233', 1, 'user'),
('emma', 'emma@example.com', 'hash5', 'Emma', 'Jones',   '4379998877', 1, 'admin'),
('fadi', 'fadi@example.com', 'hash6', 'Fadi', 'Ali',     '9058882233', 0, 'user');


INSERT INTO listings (seller_id, make, model, year, price, mileage, body_type, vin, description, status) VALUES
((SELECT user_id FROM users WHERE username='ava'),  'Toyota',  'Camry',   2019, 17500,  62000,  'Sedan',  'JT123456789012345', 'Clean condition',       'available'),
((SELECT user_id FROM users WHERE username='bob'),  'Honda',   'Civic',   2020, 18500,  41000,  'Sedan',  'HN123456789012345', 'One owner',             'available'),
((SELECT user_id FROM users WHERE username='carl'), 'Ford',    'F-150',   2018, 24000,  80000,  'Truck',  'FD123456789012345', 'Workhorse pickup',      'available'),
((SELECT user_id FROM users WHERE username='dina'), 'BMW',     'X3',      2017, 21000,  95000,  'SUV',    'BM123456789012345', 'Luxury SUV',            'sold'),
((SELECT user_id FROM users WHERE username='ava'),  'Tesla',   'Model 3', 2021, 32900,  30000,  'Sedan',  'TS123456789012345', 'Long Range battery',    'pending'),
((SELECT user_id FROM users WHERE username='bob'),  'Hyundai', 'Elantra', 2016,  9500, 115000,  'Sedan',  'HY123456789012345', 'Reliable daily driver', 'available');


INSERT INTO ratings (listing_id, buyer_id, rating_value, comment) VALUES
((SELECT listing_id FROM listings WHERE vin='JT123456789012345'),
 (SELECT user_id FROM users WHERE username='bob'),   5, 'Smooth transaction'),
((SELECT listing_id FROM listings WHERE vin='HN123456789012345'),
 (SELECT user_id FROM users WHERE username='ava'),   4, 'Good car, fair deal'),
((SELECT listing_id FROM listings WHERE vin='FD123456789012345'),
 (SELECT user_id FROM users WHERE username='dina'),  5, 'Friendly seller'),
((SELECT listing_id FROM listings WHERE vin='BM123456789012345'),
 (SELECT user_id FROM users WHERE username='carl'),  3, 'Minor issues noted'),
((SELECT listing_id FROM listings WHERE vin='TS123456789012345'),
 (SELECT user_id FROM users WHERE username='fadi'),  5, 'Love the EV'),
((SELECT listing_id FROM listings WHERE vin='HY123456789012345'),
 (SELECT user_id FROM users WHERE username='dina'),  4, 'Reliable overall');


INSERT INTO messages (sender_id, receiver_id, listing_id, message_text, is_read) VALUES
((SELECT user_id FROM users WHERE username='bob'),
 (SELECT user_id FROM users WHERE username='ava'),  1,
 'Is this still available?', 0),

((SELECT user_id FROM users WHERE username='carl'),
 (SELECT user_id FROM users WHERE username='ava'),  1,
 'Can you share service history?', 1),

((SELECT user_id FROM users WHERE username='dina'),
 (SELECT user_id FROM users WHERE username='carl'), 3,
 'Any rust issues?', 0),

((SELECT user_id FROM users WHERE username='emma'),
 (SELECT user_id FROM users WHERE username='bob'),  2,
 'Can I test drive tomorrow?', 1),

((SELECT user_id FROM users WHERE username='ava'),
 (SELECT user_id FROM users WHERE username='dina'), 5,
 'Price negotiable?', 0),

((SELECT user_id FROM users WHERE username='fadi'),
 (SELECT user_id FROM users WHERE username='emma'), 6,
 'When was last maintenance?', 1);


INSERT INTO listing_images (listing_id, image_url, alt_text, is_primary) VALUES
(1,'https://example.com/img/1a.jpg','front',1),
(1,'https://example.com/img/1b.jpg','rear',0),
(2,'https://example.com/img/2a.jpg','front',1),
(3,'https://example.com/img/3a.jpg','front',1),
(4,'https://example.com/img/4a.jpg','front',1),
(5,'https://example.com/img/5a.jpg','front',1);
                                                                                
