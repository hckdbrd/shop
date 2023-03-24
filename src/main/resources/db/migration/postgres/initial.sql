CREATE OR REPLACE FUNCTION now_utc() RETURNS timestamp without time zone as
$$
select now() at time zone 'utc';
$$ language sql;

-----------------------------------
-- CASE ---------------------------
-----------------------------------
CREATE TABLE IF NOT EXISTS t_case
(
    id              BIGSERIAL PRIMARY KEY NOT NULL,
    category        VARCHAR(255)          NOT NULL UNIQUE,
    name            VARCHAR(255)          NOT NULL UNIQUE,
    model_id        BIGINT                NOT NULL,
    price           BIGINT                NOT NULL,
    stock_quantity  BIGINT                NOT NULL,
    description     TEXT                  NOT NULL,

    CONSTRAINT fk_model_id
        FOREIGN KEY (model_id)
            REFERENCES t_case_model(id)
);

CREATE TABLE IF NOT EXISTS t_case_model
(
    id                      BIGSERIAL PRIMARY KEY NOT NULL,
    color                   VARCHAR(255)          NOT NULL UNIQUE,
    device_manufacturer     VARCHAR(255)          NOT NULL UNIQUE,
    device_model            VARCHAR(255)          NOT NULL UNIQUE,
    is_on_sale              BOOLEAN DEFAULT FALSE NOT NULL,

    CONSTRAINT unique_set
        UNIQUE (color, device_manufacturer, device_model)
);

CREATE TABLE IF NOT EXISTS t_feedback
(
    id              BIGSERIAL PRIMARY KEY NOT NULL,
    user_id         BIGINT                NOT NULL,
    case_id         BIGINT                NOT NULL,
    rating          INTEGER               NOT NULL,
    description     TEXT                  NOT NULL,
    photo_set_id    BIGINT                NULL,

    CONSTRAINT rating_value
        CHECK (rating >= 1 AND rating <= 5),

    CONSTRAINT fk_user_id
        FOREIGN KEY (user_id)
            REFERENCES t_user(id),

    CONSTRAINT fk_case_id
        FOREIGN KEY (case_id)
            REFERENCES t_case(id),

    CONSTRAINT fk_photo_set_id
        FOREIGN KEY (photo_set_id)
            REFERENCES t_feedback_photos(set_id)
);

CREATE TABLE IF NOT EXISTS t_feedback_photos
(
    id          BIGSERIAL PRIMARY KEY NOT NULL,
    set_id      VARCHAR(5)            NOT NULL,
    photo_url   VARCHAR(255)          NOT NULL
);

-----------------------------------
-- USER ---------------------------
-----------------------------------
CREATE TABLE IF NOT EXISTS t_user
(
    id           BIGSERIAL PRIMARY KEY NOT NULL,
    first_name   VARCHAR(255)          NOT NULL,
    last_name    VARCHAR(255)          NOT NULL,
    password     VARCHAR(255)          NOT NULL,
    salt         VARCHAR(255)          NOT NULL,
    email        VARCHAR(255)          NULL UNIQUE,
    phone_number VARCHAR(255)          NULL UNIQUE,
    avatar_url   VARCHAR(255)          NOT NULL,
    is_locked    BOOLEAN DEFAULT FALSE NOT NULL,

    CONSTRAINT login_credentials_not_null
        CHECK (t_user.email IS NOT NULL OR t_user.phone_number IS NOT NULL)
);

CREATE TABLE IF NOT EXISTS t_role
(
    id           BIGSERIAL PRIMARY KEY NOT NULL,
    type         VARCHAR(64)           NOT NULL UNIQUE,
    description  TEXT                  NULL
);

CREATE TABLE IF NOT EXISTS t_order
(
    id                      BIGSERIAL PRIMARY KEY NOT NULL,
    case_id                 BIGINT                NOT NULL,
    quantity                BIGINT                NOT NULL,
    discount                BIGINT                NOT NULL,
    checkout                BIGINT                NOT NULL,
    shipping_service_id     BIGINT                NOT NULL,

    CONSTRAINT fk_case_id
        FOREIGN KEY(case_id)
            REFERENCES t_case(id),

    CONSTRAINT fk_shipping_service_id
        FOREIGN KEY(shipping_service_id)
            REFERENCES t_shipping_service(id)
);

-----------------------------------
-- ADDRESS ------------------------
-----------------------------------
CREATE TABLE IF NOT EXISTS t_address
(
    id                  BIGSERIAL PRIMARY KEY NOT NULL,
    country_id          BIGINT                NOT NULL,
    city_id             BIGINT                NOT NULL,
    street_id           BIGINT                NOT NULL,

    CONSTRAINT fk_country_id
        FOREIGN KEY(country_id)
            REFERENCES t_country(id),

    CONSTRAINT fk_city_id
        FOREIGN KEY(city_id)
            REFERENCES t_city(id),

    CONSTRAINT fk_street_id
        FOREIGN KEY(street_id)
            REFERENCES t_street(id)
);

CREATE TABLE IF NOT EXISTS t_country
(
    id      BIGSERIAL PRIMARY KEY   NOT NULL,
    name    VARCHAR(255)            NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS t_city
(
    id      BIGSERIAL PRIMARY KEY   NOT NULL,
    name    VARCHAR(255)            NOT NULL
);

CREATE TABLE IF NOT EXISTS t_street
(
    id      BIGSERIAL PRIMARY KEY   NOT NULL,
    name    VARCHAR(255)            NOT NULL
);

CREATE TABLE IF NOT EXISTS t_shipping_service
(
    id              BIGSERIAL PRIMARY KEY NOT NULL,
    service_name    VARCHAR(255)          NOT NULL,
    country_id      BIGINT                NOT NULL,
    is_available    BOOLEAN DEFAULT FALSE NOT NULL,

    CONSTRAINT fk_country_id
        FOREIGN KEY(country_id)
            REFERENCES t_country(id)
);

-----------------------------------
-- UTIL ---------------------------
-----------------------------------
CREATE TABLE IF NOT EXISTS t_social_media
(
    id          BIGSERIAL PRIMARY KEY NOT NULL,
    name        VARCHAR(50)           NOT NULL UNIQUE,
    media_url   VARCHAR(255)          NOT NULL,
    icon_url    VARCHAR(255)          NOT NULL
);

CREATE TABLE IF NOT EXISTS t_documents
(
    id         BIGSERIAL PRIMARY KEY NOT NULL,
    type       VARCHAR(255)          NOT NULL UNIQUE,
    html       TEXT                  NOT NULL
);

-----------------------------------
-- MANY_TO_MANY -------------------
-----------------------------------
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
    address_id     BIGINT                        NOT NULL,

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
    order_id     BIGINT                        NOT NULL,

    CONSTRAINT fk_user_id
        FOREIGN KEY(user_id)
            REFERENCES t_user(id),

    CONSTRAINT fk_order_id
        FOREIGN KEY(order_id)
            REFERENCES t_order(id)
);
