INSERT INTO t_role (role_name, description)
VALUES
    ('developer', 'Developer role'),
    ('admin', 'Administrator role'),
    ('manager', 'Manager role'),
    ('staff', 'Staff role'),
    ('customer', 'Guest role');

INSERT INTO t_user (first_name, last_name, password, email, phone_number, role_id, avatar_url, active)
VALUES
    ('John', 'Doe', '{bcrypt}$2a$12$f4qS5fm6ImWr1SsY2aC71eesJQ.DumoyGxMIYYAAupM7LwoA5XzaS', 'john.doe@example.com', NULL, 1, 'https://example.com/avatar1.jpg', true),
    ('Jane', 'Smith', '{bcrypt}$2a$12$f4qS5fm6ImWr1SsY2aC71eesJQ.DumoyGxMIYYAAupM7LwoA5XzaS', NULL, '555-123-4567', 2, 'https://example.com/avatar2.jpg', true),
    ('Alice', 'Johnson', '{bcrypt}$2a$12$f4qS5fm6ImWr1SsY2aC71eesJQ.DumoyGxMIYYAAupM7LwoA5XzaS', 'alice.johnson@example.com', '555-987-6543', 3, NULL, true),
    ('Robert', 'Brown', '{bcrypt}$2a$12$f4qS5fm6ImWr1SsY2aC71eesJQ.DumoyGxMIYYAAupM7LwoA5XzaS', 'robert.brown@example.com', '555-555-5555', 4, 'https://example.com/avatar4.jpg', true),
    ('Emily', 'Davis', '{bcrypt}$2a$12$f4qS5fm6ImWr1SsY2aC71eesJQ.DumoyGxMIYYAAupM7LwoA5XzaS', 'emily.davis@example.com', NULL, 5, NULL, true);

INSERT INTO t_device_case (category, case_name, color, device_manufacturer, device_model, price, discount, quantity, description, available)
VALUES
    ('Phone Case', 'Slim Fit', 'Black', 'Apple', 'iPhone 12', 19.99, 10, 50, 'Slim fit phone case for iPhone 12', TRUE),
    ('Phone Case', 'Rugged Armor', 'Blue', 'Samsung', 'Galaxy S20', 24.99, 5, 30, 'Rugged armor phone case for Galaxy S20', TRUE),
    ('Tablet Case', 'Folio Cover', 'Red', 'Apple', 'iPad Air', 29.99, NULL, 20, 'Folio cover case for iPad Air', FALSE),
    ('Laptop Case', 'Neoprene Sleeve', 'Gray', 'Dell', 'XPS 13', 34.99, 20, 15, 'Neoprene sleeve case for Dell XPS 13', TRUE),
    ('Phone Case', 'Clear Transparent', 'Transparent', 'Google', 'Pixel 5', 14.99, 15, 40, 'Clear transparent phone case for Google Pixel 5', TRUE);

INSERT INTO t_country (country_name, iso_code_2, iso_code_3)
VALUES
    ('United States', 'US', 'USA'),
    ('Canada', 'CA', 'CAN'),
    ('United Kingdom', 'GB', 'GBR'),
    ('Australia', 'AU', 'AUS'),
    ('Germany', 'DE', 'DEU');

INSERT INTO t_address (user_id, country_id, state_name, city_name, street_name)
VALUES
    (1, 1, 'California', 'Los Angeles', '123 Main Street'),
    (1, 2, 'New York', 'New York City', '456 Broadway'),
    (2, 3, 'London', 'London', '789 Oxford Street'),
    (3, 4, 'Sydney', 'Sydney', '321 George Street'),
    (3, 1, 'California', 'San Francisco', '987 Market Street'),
    (4, 2, 'New York', 'Albany', '654 State Street'),
    (5, 3, 'London', 'Birmingham', '246 High Street'),
    (5, 4, 'Sydney', 'Melbourne', '135 Collins Street'),
    (5, 1, 'California', 'San Diego', '876 Broadway Avenue'),
    (5, 2, 'New York', 'Rochester', '543 Main Street');

INSERT INTO t_order (user_id, address_id, total)
VALUES
    (1, 1, 50.99),
    (1, 2, 75.50),
    (2, 3, 20.25),
    (3, 4, 100.00),
    (3, 5, 45.75),
    (4, 6, 60.50),
    (5, 7, 35.25),
    (5, 8, 90.99),
    (5, 9, 70.75),
    (5, 10, 55.25);

INSERT INTO t_order_item (order_id, device_case_id, quantity)
VALUES
    (1, 1, 2),
    (1, 1, 1),
    (2, 2, 3),
    (2, 2, 1),
    (3, 3, 1),
    (3, 3, 2),
    (4, 4, 4),
    (4, 4, 3),
    (5, 5, 2),
    (5, 5, 1);

INSERT INTO t_feedback (user_id, device_case_id, rating, description)
VALUES
    (1, 1, 5, 'Great case, excellent quality!'),
    (2, 2, 4, 'Good case, fits well on my phone.'),
    (3, 3, 3, 'Average case, nothing special.'),
    (4, 4, 2, 'Disappointed with the quality.'),
    (5, 5, 1, 'Terrible case, do not recommend.');

INSERT INTO t_feedback_photos (feedback_id, photo_url)
VALUES
    (1, 'https://example.com/photo1.jpg'),
    (1, 'https://example.com/photo2.jpg'),
    (2, 'https://example.com/photo3.jpg'),
    (3, 'https://example.com/photo4.jpg'),
    (4, 'https://example.com/photo5.jpg'),
    (5, 'https://example.com/photo6.jpg'),
    (5, 'https://example.com/photo7.jpg');

INSERT INTO t_shop_social_media (social_media_name, media_url, icon_url)
VALUES
    ('Facebook', 'https://facebook.com/shop', 'https://example.com/facebook-icon.png'),
    ('Twitter', 'https://twitter.com/shop', 'https://example.com/twitter-icon.png'),
    ('Instagram', 'https://instagram.com/shop', 'https://example.com/instagram-icon.png');

INSERT INTO t_static_page (page_type, html)
VALUES
    ('About Us', '<h1>About Us</h1><p>Welcome to our shop!</p>'),
    ('Contact Us', '<h1>Contact Us</h1><p>Get in touch with us.</p>'),
    ('Terms and Conditions', '<h1>Terms and Conditions</h1><p>Read our terms and conditions.</p>');

INSERT INTO t_language (language_name, language_code)
VALUES
    ('English', 'en'),
    ('Spanish', 'es'),
    ('French', 'fr');

