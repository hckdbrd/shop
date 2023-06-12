CREATE TABLE IF NOT EXISTS t_role
(
    id                  BIGSERIAL       PRIMARY KEY     NOT NULL,
    role_name           VARCHAR(24)                     NOT NULL        UNIQUE,
    description         VARCHAR(64)                     NOT NULL        UNIQUE
    );

CREATE TABLE IF NOT EXISTS t_user
(
    id              BIGSERIAL       PRIMARY KEY         NOT NULL,
    first_name      VARCHAR(64)                         NOT NULL,
    last_name       VARCHAR(64)                         NOT NULL,
    password        CHAR(72)                            NOT NULL,
    email           VARCHAR(320)    UNIQUE,
    phone_number    VARCHAR(24)     UNIQUE,
    role_id         BIGINT                              NOT NULL,
    avatar_url      TEXT,
    active          BOOLEAN         DEFAULT TRUE        NOT NULL,

    CONSTRAINT login_credentials_not_null_t_user
        CHECK (email IS NOT NULL OR phone_number IS NOT NULL),

    CONSTRAINT fk_t_user_t_role
        FOREIGN KEY(role_id)
            REFERENCES t_role(id)
);

CREATE TABLE IF NOT EXISTS t_device_case
(
    id                      BIGSERIAL       PRIMARY KEY         NOT NULL,
    category                VARCHAR(24)                         NOT NULL,
    case_name               VARCHAR(64)                         NOT NULL,
    color                   VARCHAR(16)                         NOT NULL,
    device_manufacturer     VARCHAR(24)                         NOT NULL,
    device_model            VARCHAR(24)                         NOT NULL,
    price                   DECIMAL(4,2)                        NOT NULL,
    discount                DECIMAL(2,0),
    quantity                BIGINT                              NOT NULL,
    description             TEXT                                NOT NULL,
    available               BOOLEAN         DEFAULT FALSE       NOT NULL,

    CONSTRAINT unique_set_t_case
        UNIQUE (category, case_name, color, device_manufacturer, device_model),

    CONSTRAINT discount_value_t_case
        CHECK (discount >= 5 AND discount <= 90)
);

CREATE TABLE IF NOT EXISTS t_country
(
    id              BIGSERIAL       PRIMARY KEY     NOT NULL,
    country_name    VARCHAR(64)                     NOT NULL        UNIQUE,
    iso_code_2      CHAR(2)                         NOT NULL        UNIQUE,
    iso_code_3      CHAR(3)                         NOT NULL        UNIQUE
);

CREATE TABLE IF NOT EXISTS t_address
(
    id                  BIGSERIAL       PRIMARY KEY     NOT NULL,
    user_id             BIGINT                          NOT NULL,
    country_id          BIGINT                          NOT NULL,
    state_name          VARCHAR(64),
    city_name           VARCHAR(64)                     NOT NULL,
    street_name         VARCHAR(128)                    NOT NULL,

    CONSTRAINT fk_t_address_t_user
        FOREIGN KEY(user_id)
            REFERENCES t_user(id),

    CONSTRAINT fk_t_address_t_country
        FOREIGN KEY(country_id)
            REFERENCES t_country(id)

);

CREATE TABLE IF NOT EXISTS t_order
(
    id                      BIGSERIAL       PRIMARY KEY         NOT NULL,
    user_id                 BIGINT                              NOT NULL,
    address_id              BIGINT                              NOT NULL,
    total                   DECIMAL(6,2)                        NOT NULL,
    created_at              TIMESTAMP       WITH TIME ZONE      NOT NULL        DEFAULT now(),

    CONSTRAINT fk_t_order_item_t_user
        FOREIGN KEY(user_id)
            REFERENCES t_user(id),

    CONSTRAINT fk_t_order_item_t_address
        FOREIGN KEY(address_id)
            REFERENCES t_address(id)
);

CREATE TABLE IF NOT EXISTS t_order_item
(
    id                      BIGSERIAL       PRIMARY KEY         NOT NULL,
    order_id                BIGINT                              NOT NULL,
    device_case_id          BIGINT                              NOT NULL,
    quantity                SMALLINT                            NOT NULL,

    CONSTRAINT fk_t_order_item_t_order
        FOREIGN KEY(order_id)
            REFERENCES t_order(id),

    CONSTRAINT fk_t_order_item_t_device_case
        FOREIGN KEY(device_case_id)
            REFERENCES t_device_case(id)
);

CREATE TABLE IF NOT EXISTS t_feedback
(
    id                  BIGSERIAL       PRIMARY KEY     NOT NULL,
    user_id             BIGINT                          NOT NULL,
    device_case_id      BIGINT                          NOT NULL,
    rating              SMALLINT                        NOT NULL,
    description         VARCHAR(255)                    NOT NULL    UNIQUE,

    CONSTRAINT rating_value_t_feedback
        CHECK (rating >= 1 AND rating <= 5),

    CONSTRAINT fk_t_feedback_t_user
        FOREIGN KEY (user_id)
            REFERENCES t_user(id),

    CONSTRAINT fk_t_feedback_t_device_case
        FOREIGN KEY (device_case_id)
            REFERENCES t_device_case(id)
);

CREATE TABLE IF NOT EXISTS t_feedback_photos
(
    id              BIGSERIAL   PRIMARY KEY     NOT NULL,
    feedback_id     BIGINT                      NOT NULL,
    photo_url       TEXT                        NOT NULL,

    CONSTRAINT fk_t_feedback_photos_t_feedback
        FOREIGN KEY(feedback_id)
            REFERENCES t_feedback(id)
);

CREATE TABLE IF NOT EXISTS t_shop_social_media
(
    id                       BIGSERIAL      PRIMARY KEY     NOT NULL,
    social_media_name        VARCHAR(32)                    NOT NULL    UNIQUE,
    media_url                TEXT                           NOT NULL    UNIQUE,
    icon_url                 TEXT                           NOT NULL
);

CREATE TABLE IF NOT EXISTS t_static_page
(
    id              BIGSERIAL        PRIMARY KEY     NOT NULL,
    page_type       VARCHAR(56)                      NOT NULL     UNIQUE,
    html            TEXT                             NOT NULL     UNIQUE
);

CREATE TABLE IF NOT EXISTS t_language
(
    id                   BIGSERIAL      PRIMARY KEY     NOT NULL,
    language_name        VARCHAR(64)                    NOT NULL    UNIQUE,
    language_code        CHAR(2)                        NOT NULL    UNIQUE
);
