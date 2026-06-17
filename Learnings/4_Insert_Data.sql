
CREATE TABLE products (
    id          SERIAL         PRIMARY KEY,
    name        VARCHAR(100)   NOT NULL,
    price       NUMERIC(10,2)  NOT NULL,
    stock       INTEGER        DEFAULT 0,
    is_active   BOOLEAN        DEFAULT TRUE,
    created_at  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers (
    id         SERIAL        PRIMARY KEY,
    first_name VARCHAR(50)   NOT NULL,
    last_name  VARCHAR(50)   NOT NULL,
    email      VARCHAR(200)  NOT NULL UNIQUE,
    phone      VARCHAR(15),
    age        INTEGER       CHECK (age >= 18),
    city       VARCHAR(100)  DEFAULT 'Unknown',
    joined_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id          SERIAL      PRIMARY KEY,
    customer_id INTEGER     NOT NULL REFERENCES customers(id),
    product_id  INTEGER     NOT NULL REFERENCES products(id),
    quantity    INTEGER     NOT NULL CHECK (quantity > 0),
    order_date  DATE        DEFAULT CURRENT_DATE,
    status      VARCHAR(20) DEFAULT 'pending'
);


SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';










































