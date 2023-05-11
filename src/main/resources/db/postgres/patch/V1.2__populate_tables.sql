INSERT INTO t_user (first_name,
                    last_name,
                    password_hash,
                    password_salt,
                    email, phone_number,
                    avatar_url,
                    is_locked)
VALUES ('John', 'Doe',
        '$2a$10$ZTkbzulPw37L0s4tzdfwoOyD43X.KmbE0z8V7oHJr0DP84cJdd1Z2','$2a$10$ZNkzx7gD/k9J8P7A5v59wO',
        'john.doe@example.com', NULL, 'https://example.com/avatar.jpg', false),
       ('Jane', 'Doe',
        '$2a$10$nPaQuP/NJmCKTb4sL4Yp4.NnEZXyLXJQcG1zAhSedT/kT0zJUbZ4G','$2a$10$gPiEaX23yOn/xjxx3qIXD.',
        'jane.doe@example.com', NULL, 'https://example.com/avatar.jpg', false),
       ('Bob', 'Smith',
        '$2a$10$dfp04wvtLZdml1Pygs7VJ.Gvms.RoqxM/NjDNt0W8RvF.2zlJjw5C','$2a$10$3DEpxKjglzy9i5M7Ed8r0e',
        NULL, '555 - 555 - 1234 ', 'https://example.com/avatar.jpg', false),
       ('Alice', 'Johnson',
        '$2a$10$q5H5Kj2Zi5.xgGR5lOcO1.qFJjKwM1c3qM3oAmMTj8QRZ89sxoyeq','$2a$10$xslz/lr1UQ2jKwRd7ByZ4O',
        NULL, '555 - 555 - 5678 ', 'https://example.com/avatar.jpg', false),
       ('Mike', 'Brown',
        '$2a$10$tD5EX5jHfEz9n69gC8BnW.a1AVGlTpFq3w1EYjKZG6P/IL6Qih9bu','$2a$10$GGNvCJl3q1BCYpKZohAX0e',
        'mike.brown@example.com', NULL, 'https://example.com/avatar.jpg', false);

INSERT INTO t_role (title,
                    description)
VALUES
    ('admin', 'Administrator'),
    ('user', 'Regular user'),
    ('manager', 'Manager'),
    ('guest', 'Guest user'),
    ('developer', 'Developer');

INSERT INTO t_case (category,
                    title,
                    color,
                    device_manufacturer,
                    device_model,
                    price,
                    stock_quantity,
                    description,
                    is_on_sale)
VALUES
    ('phone case', 'Clear Case', 'Clear', 'Apple', 'iPhone 12 Pro', 15.99, 100,
     'A simple clear case for the iPhone 12 Pro', FALSE),
    ('phone case', 'Leather Case', 'Brown', 'Samsung', 'Galaxy S21', 29.99, 50,
     'A premium leather case for the Galaxy S21', TRUE),
    ('tablet case', 'Folio Case', 'Black', 'Apple', 'iPad Pro', 39.99, 25,
     'A folio-style case for the iPad Pro', TRUE),
    ('laptop case', 'Sleeve Case', 'Gray', 'Dell', 'XPS 13', 49.99, 10,
     'A slim, protective sleeve for the Dell XPS 13', FALSE),
    ('smartwatch case', 'Bumper Case', 'Red', 'Fitbit', 'Versa 3', 9.99, 200,
     'A colorful bumper case for the Fitbit Versa 3', TRUE);

INSERT INTO t_country (country_name,
                       iso_code_2,
                       iso_code_3)
VALUES
    ('United States', 'US', 'USA'),
    ('Canada', 'CA', 'CAN'),
    ('Mexico', 'MX', 'MEX'),
    ('United Kingdom', 'GB', 'GBR'),
    ('Australia', 'AU', 'AUS');

INSERT INTO t_shipping_service (service_name,
                                country_id,
                                is_available)
VALUES
    ('FedEx Express', 1, TRUE),
    ('UPS Worldwide Expedited', 2, TRUE),
    ('DHL Express Worldwide', 3, FALSE),
    ('USPS Priority Mail International', 4, TRUE),
    ('Australia Post International Express', 5, TRUE);

INSERT INTO t_order (case_id,
                     quantity,
                     discount,
                     sum_checkout,
                     shipping_service_id)
VALUES
    (1, 2, 0, 59.98, 1),
    (2, 1, 10, 44.99, 1),
    (3, 3, 0, 134.97, 2),
    (4, 1, 5, 47.49, 3),
    (5, 2, 0, 79.98, 4);

INSERT INTO t_feedback (user_id,
                        case_id,
                        rating,
                        description)
VALUES
    (1, 2, 4, 'I really liked this phone case. It looks great and fits well.'),
    (3, 4, 3, 'The case is okay, but it doesn''t offer much protection.'),
    (2, 1, 5, 'This is the best phone case I''ve ever owned. It looks awesome and feels very durable.'),
    (4, 3, 2, 'I didn''t like the design of this case.'),
    (1, 5, 4, 'This case is fantastic! It fits my phone perfectly and looks great.');

INSERT INTO t_feedback_photos(feedback_id,
                              photo_url)
VALUES
    (1, 'https://example.com/feedback1/photo1.jpg'),
    (2, 'https://example.com/feedback2/photo1.jpg'),
    (3, 'https://example.com/feedback3/photo1.jpg'),
    (4, 'https://example.com/feedback4/photo1.jpg'),
    (5, 'https://example.com/feedback5/photo1.jpg');

INSERT INTO t_address (country_id,
                       city_name,
                       street_name)
VALUES
    (1, 'New York', '123 Main St'),
    (2, 'London', '456 Oxford St'),
    (3, 'Paris', '789 Champs-Élysées'),
    (4, 'Tokyo', '1-1-1 Shibuya'),
    (5, 'Sydney', '10 George St');

INSERT INTO t_shop_social_media (social_media_name,
                                 media_url,
                                 icon_url)
VALUES
    ('Facebook', 'https://www.facebook.com/mystore/', 'https://cdn.example.com/icons/facebook.png'),
    ('Twitter', 'https://twitter.com/mystore/', 'https://cdn.example.com/icons/twitter.png'),
    ('Instagram', 'https://www.instagram.com/mystore/', 'https://cdn.example.com/icons/instagram.png'),
    ('Pinterest', 'https://www.pinterest.com/mystore/', 'https://cdn.example.com/icons/pinterest.png'),
    ('YouTube', 'https://www.youtube.com/mystore/', 'https://cdn.example.com/icons/youtube.png');

INSERT INTO t_static_page (type,
                           html)
VALUES
    ('about_us', '<html><body><h1>About Us</h1><p>We are a company that specializes in selling phone cases.</p></body></html>'),
    ('shipping_info', '<html><body><h1>Shipping Information</h1><p>We offer free shipping for all orders over $50.</p></body></html>'),
    ('return_policy', '<html><body><h1>Return Policy</h1><p>We offer a 30-day return policy for all products.</p></body></html>'),
    ('privacy_policy', '<html><body><h1>Privacy Policy</h1><p>We are committed to protecting your privacy and personal information.</p></body></html>'),
    ('terms_of_service', '<html><body><h1>Terms of Service</h1><p>By using our website, you agree to our terms of service.</p></body></html>');

INSERT INTO t_language (language_name,
                        language_code)
VALUES
    ('English', 'en'),
    ('French', 'fr'),
    ('Spanish', 'es'),
    ('German', 'de'),
    ('Japanese', 'ja');

INSERT INTO t_user_to_role (user_id,
                            role_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 3),
    (4, 2);

INSERT INTO t_user_to_address(user_id,
                              address_id)
VALUES
    (1, 2),
    (2, 4),
    (3, 3),
    (4, 1),
    (5, 5);

INSERT INTO t_user_order (user_id,
                          order_id)
VALUES
    (1, 2),
    (2, 4),
    (3, 1),
    (1, 3),
    (4, 5);
