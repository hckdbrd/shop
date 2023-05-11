CREATE TABLE IF NOT EXISTS t_user
(
    id              BIGSERIAL PRIMARY KEY  NOT NULL,
    first_name      VARCHAR(64)            NOT NULL,
    last_name       VARCHAR(64)            NOT NULL,
    password_hash   CHAR(60)               NOT NULL,
    password_salt   CHAR(29)               NOT NULL,
    email           VARCHAR(320),
    phone_number    VARCHAR(24),
    avatar_url      TEXT,
    is_locked       BOOLEAN DEFAULT FALSE  NOT NULL,

    CONSTRAINT login_credentials_not_null
        CHECK (t_user.email IS NOT NULL OR t_user.phone_number IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS t_role
(
    id           BIGSERIAL PRIMARY KEY NOT NULL,
    title        VARCHAR(24)           NOT NULL,
    description  VARCHAR(64)
);

CREATE TABLE IF NOT EXISTS t_case
(
    id                      BIGSERIAL PRIMARY KEY   NOT NULL,
    category                VARCHAR(24)             NOT NULL,
    title                   VARCHAR(64)             NOT NULL,
    color                   VARCHAR(16)             NOT NULL,
    device_manufacturer     VARCHAR(24)             NOT NULL,
    device_model            VARCHAR(24)             NOT NULL,
    price                   DECIMAL(4,2)            NOT NULL,
    stock_quantity          BIGINT                  NOT NULL,
    description             TEXT                    NOT NULL,
    is_on_sale              BOOLEAN DEFAULT FALSE   NOT NULL,

    CONSTRAINT unique_set_t_case
        UNIQUE (category, title, color, device_manufacturer, device_model)
);

CREATE TABLE IF NOT EXISTS t_country
(
    id              BIGSERIAL PRIMARY KEY   NOT NULL,
    country_name    VARCHAR(64)             NOT NULL UNIQUE,
    iso_code_2      CHAR(2)                 NOT NULL UNIQUE,
    iso_code_3      CHAR(3)                 NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS t_shipping_service
(
    id              BIGSERIAL PRIMARY KEY NOT NULL,
    service_name    VARCHAR(64)           NOT NULL,
    country_id      BIGINT                NOT NULL,
    is_available    BOOLEAN DEFAULT FALSE NOT NULL,

    CONSTRAINT fk_t_shipping_service_t_country
        FOREIGN KEY(country_id)
            REFERENCES t_country(id)
);

CREATE TABLE IF NOT EXISTS t_order
(
    id                      BIGSERIAL PRIMARY KEY       NOT NULL,
    case_id                 BIGINT                      NOT NULL,
    quantity                BIGINT                      NOT NULL,
    discount                SMALLINT                    NOT NULL,
    sum_checkout            DECIMAL(6,2)                NOT NULL,
    created_at              TIMESTAMP WITH TIME ZONE    NOT NULL DEFAULT now(),
    shipping_service_id     BIGINT                      NOT NULL,

    CONSTRAINT fk_case_id
        FOREIGN KEY(case_id)
            REFERENCES t_case(id),

    CONSTRAINT fk_shipping_service_id
        FOREIGN KEY(shipping_service_id)
            REFERENCES t_shipping_service(id)
);

CREATE TABLE IF NOT EXISTS t_feedback
(
    id              BIGSERIAL PRIMARY KEY NOT NULL,
    user_id         BIGINT                NOT NULL,
    case_id         BIGINT                NOT NULL,
    rating          SMALLINT              NOT NULL,
    description     TEXT                  NOT NULL,

    CONSTRAINT rating_value
        CHECK (rating >= 1 AND rating <= 5),

    CONSTRAINT fk_user_id
        FOREIGN KEY (user_id)
            REFERENCES t_user(id),

    CONSTRAINT fk_case_id
        FOREIGN KEY (case_id)
            REFERENCES t_case(id)
);

CREATE TABLE IF NOT EXISTS t_feedback_photos
(
    id              BIGSERIAL PRIMARY KEY NOT NULL,
    feedback_id     BIGINT                NOT NULL,
    photo_url       TEXT                  NOT NULL,

    CONSTRAINT fk_feedback_id
        FOREIGN KEY(feedback_id)
            REFERENCES t_feedback(id)
);

CREATE TABLE IF NOT EXISTS t_address
(
    id                  BIGSERIAL PRIMARY KEY NOT NULL,
    country_id          BIGINT                NOT NULL,
    city_name           VARCHAR(64)           NOT NULL,
    street_name         VARCHAR(64)           NOT NULL,

    CONSTRAINT fk_country_id
        FOREIGN KEY(country_id)
            REFERENCES t_country(id)
);

CREATE TABLE IF NOT EXISTS t_shop_social_media
(
    id                       BIGSERIAL PRIMARY KEY NOT NULL,
    social_media_name        VARCHAR(32)           NOT NULL UNIQUE,
    media_url                TEXT                  NOT NULL UNIQUE,
    icon_url                 TEXT                  NOT NULL
);

CREATE TABLE IF NOT EXISTS t_static_page
(
    id         BIGSERIAL PRIMARY KEY NOT NULL,
    type       VARCHAR(16)           NOT NULL UNIQUE,
    html       TEXT                  NOT NULL
);

CREATE TABLE IF NOT EXISTS t_language
(
    id                   BIGSERIAL PRIMARY KEY NOT NULL,
    language_name        VARCHAR(64)           NOT NULL UNIQUE,
    language_code        CHAR(2)               NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS t_user_to_role
(
    id          BIGSERIAL PRIMARY KEY         NOT NULL,
    user_id     BIGINT                        NOT NULL,
    role_id     BIGINT                        NOT NULL,

    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id)
            REFERENCES t_user(id),

    CONSTRAINT fk_role_id
        FOREIGN KEY(role_id)
            REFERENCES t_role(id)
);

CREATE TABLE IF NOT EXISTS t_user_to_address
(
    id          BIGSERIAL PRIMARY KEY         NOT NULL,
    user_id     BIGINT                        NOT NULL,
    address_id  BIGINT                        NOT NULL,

    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id)
            REFERENCES t_user(id),

    CONSTRAINT fk_address_id
        FOREIGN KEY(address_id)
            REFERENCES t_address(id)
);

CREATE TABLE IF NOT EXISTS t_user_order
(
    id          BIGSERIAL PRIMARY KEY         NOT NULL,
    user_id     BIGINT                        NOT NULL,
    order_id    BIGINT                        NOT NULL,

    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id)
            REFERENCES t_user(id),

    CONSTRAINT fk_order_id
        FOREIGN KEY(order_id)
            REFERENCES t_order(id)
);
