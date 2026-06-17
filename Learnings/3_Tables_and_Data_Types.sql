/*

table — A table is where actual data lives. Before inserting anything you must define the table structure — column names and their data types.

Schema — tables live inside a schema. Default schema is public. When you create a table without mentioning schema it goes into public automatically.

Data type — every column must have a type. PostgreSQL is very strict about types. You cannot insert a string into an integer column. MySQL was lenient, PostgreSQL is not.

*/
--                      PostgreSQL Data Types
-- +--------------+--------------------------------+-------------------------+
-- | Type         | Use for                        | Example                 |
-- +--------------+--------------------------------+-------------------------+
-- | SERIAL       | auto increment integer (PK)    | 1, 2, 3...              |
-- | INTEGER      | whole numbers                  | age, stock, qty         |
-- | BIGINT       | very large whole numbers       | population              |
-- | NUMERIC(p,s) | exact decimal numbers          | price, salary           |
-- | REAL         | approximate decimal            | scientific values       |
-- | VARCHAR(n)   | text with max length           | name, email             |
-- | TEXT         | unlimited length text          | description, bio        |
-- | CHAR(n)      | fixed length text              | country code            |
-- | BOOLEAN      | true / false                   | is_active               |
-- | DATE         | date only                      | 2024-01-15              |
-- | TIME         | time only                      | 14:30:00                |
-- | TIMESTAMP    | date + time                    | 2024-01-15 14:30:00     |
-- | UUID         | unique id                      | distributed systems     |
-- | JSONB        | JSON data (binary, fast)       | metadata, configs       |
-- | TEXT[]       | array of text                  | tags, categories        |
-- +--------------+--------------------------------+-------------------------+


-- If you have old database 
-- then by using it Create Database shop


-- Use this Query to see all available tables 

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
-- +------------------+
-- |    table_name    |
-- +------------------+



-- Create 1st table 

CREATE TABLE products (
    id          SERIAL          PRIMARY KEY,                -- auto increment, unique, not null
    name        VARCHAR(100)    NOT NULL,                   -- max 100 chars, cannot be empty
    price       NUMERIC(10, 2)  NOT NULL,                   -- 10 digits total, 2 after decimal
    stock       INTEGER         DEFAULT 0,                  -- whole number, defaults to 0
    is_active   BOOLEAN         DEFAULT TRUE,               -- true/false
    created_at  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP   -- auto set on insert
);



-- VERIFY TABLE WAS CREATED

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
-- +------------------+
-- |    table_name    |
-- +------------------+
-- |     products     |
-- +------------------+



-- SEE TABLE STRUCTURE (describe the table)
-- In MySQL you used DESCRIBE tablename
-- In PostgreSQL use this query



SELECT column_name,
       data_type,
       character_maximum_length,
       is_nullable,
       column_default
FROM information_schema.columns
WHERE table_name = 'products';

-- +------------+---------------------------+--------------------------+-------------+----------------------------------------+
-- | column_name| data_type                 | character_maximum_length | is_nullable | column_default                         |
-- +------------+---------------------------+--------------------------+-------------+----------------------------------------+
-- | id         | integer                   | NULL                     | NO          | nextval('products_id_seq'::regclass)   |
-- | name       | character varying         | 100                      | NO          | NULL                                   |
-- | price      | numeric                   | NULL                     | NO          | NULL                                   |
-- | stock      | integer                   | NULL                     | YES         | 0                                      |
-- | is_active  | boolean                   | NULL                     | YES         | true                                   |
-- | created_at | timestamp without time zone | NULL                   | YES         | CURRENT_TIMESTAMP                      |
-- +------------+---------------------------+--------------------------+-------------+----------------------------------------+




\d products         -- Alternative method (IN psql)

-- Output:
--                             Table "public.products"
--    Column   |            Type             | Nullable |         Default
-- ------------+-----------------------------+----------+-------------------------
--  id         | integer                     | not null | nextval(products_id_seq)
--  name       | character varying(100)      | not null |
--  price      | numeric(10,2)               | not null |
--  stock      | integer                     |          | 0
--  is_active  | boolean                     |          | true
--  created_at | timestamp without time zone |          | CURRENT_TIMESTAMP




-- SHOW column_name and data_type in products table 
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'products';

-- +-------------+-----------------------------+
-- | column_name | data_type                   |
-- +-------------+-----------------------------+
-- | id          | integer                     |
-- | name        | character varying           |
-- | price       | numeric                     |
-- | stock       | integer                     |
-- | is_active   | boolean                     |
-- | created_at  | timestamp without time zone |
-- +-------------+-----------------------------+



-- ADD A COLUMN TO EXISTING TABLE
ALTER TABLE products ADD COLUMN description TEXT;

-- SHOW column_name and data_type in products table 
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'products';

-- +-------------+-----------------------------+
-- | column_name | data_type                   |
-- +-------------+-----------------------------+
-- | id          | integer                     |
-- | name        | character varying           |
-- | price       | numeric                     |
-- | stock       | integer                     |
-- | is_active   | boolean                     |
-- | created_at  | timestamp without time zone |
-- | description | text                        |
-- +-------------+-----------------------------+


-- RENAME A COLUMN
ALTER TABLE products RENAME COLUMN description TO details;

-- SHOW column_name and data_type in products table 
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'products';

-- +-------------+-----------------------------+
-- | column_name | data_type                   |
-- +-------------+-----------------------------+
-- | id          | integer                     |
-- | name        | character varying           |
-- | price       | numeric                     |
-- | stock       | integer                     |
-- | is_active   | boolean                     |
-- | created_at  | timestamp without time zone |
-- | details     | text                        |
-- +-------------+-----------------------------+


-- CHANGE DATA TYPE OF A COLUMN
-- Change phone in customers from CHAR(10) to VARCHAR(15)

ALTER TABLE customers ALTER COLUMN phone TYPE VARCHAR(15);

-- SHOW column_name and data_type in products table 
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'products';

-- +-------------+-----------------------------+
-- | column_name | data_type                   |
-- +-------------+-----------------------------+
-- | id          | integer                     |
-- | name        | character varying           |
-- | price       | numeric                     |
-- | stock       | integer                     |
-- | is_active   | boolean                     |
-- | created_at  | timestamp without time zone |
-- | details     | text                        |
-- +-------------+-----------------------------+


-- DROP A COLUMN

ALTER TABLE products DROP COLUMN details;

-- SHOW column_name and data_type in products table 
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'products';

-- +-------------+-----------------------------+
-- | column_name | data_type                   |
-- +-------------+-----------------------------+
-- | id          | integer                     |
-- | name        | character varying           |
-- | price       | numeric                     |
-- | stock       | integer                     |
-- | is_active   | boolean                     |
-- | created_at  | timestamp without time zone |
-- +-------------+-----------------------------+



-- CREATE A SECOND TABLE (customers) 

CREATE TABLE customers (
    id         SERIAL        PRIMARY KEY,
    first_name VARCHAR(50)   NOT NULL,
    last_name  VARCHAR(50)   NOT NULL,
    email      VARCHAR(200)  NOT NULL UNIQUE,           -- UNIQUE means no duplicates
    phone      CHAR(10),                                -- fixed 10 char phone number
    age        INTEGER       CHECK (age >= 18),         -- CHECK constraint, min age 18
    city       VARCHAR(100)  DEFAULT 'Unknown',
    joined_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);




-- CREATE A THIRD TABLE (orders) WITH FOREIGN KEY

CREATE TABLE orders (
    id          SERIAL      PRIMARY KEY,
    customer_id INTEGER     NOT NULL REFERENCES customers(id),      -- FK to customers
    product_id  INTEGER     NOT NULL REFERENCES products(id),       -- FK to products
    quantity    INTEGER     NOT NULL CHECK (quantity > 0),          -- must be positive
    order_date  DATE        DEFAULT CURRENT_DATE,
    status      VARCHAR(20) DEFAULT 'pending'
);

-- Note : FK = Foreign Key


-- SEE ALL THREE TABLES NOW

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
-- +------------+
-- | table_name |
-- +------------+
-- | customers  |
-- | orders     |
-- | products   |
-- +------------+


-- SERIAL vs IDENTITY (modern PostgreSQL way)

-- SERIAL is the old but still widely used way.
-- GENERATED ALWAYS AS IDENTITY is the modern standard (PG 10+).
-- Both do the same thing: auto increment. Both work perfectly.

-- Modern syntax example:
CREATE TABLE categories (
    id    INTEGER     GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name  VARCHAR(50) NOT NULL UNIQUE
);





-- NUMERIC vs REAL vs INTEGER — when to use what

CREATE TABLE data_type_demo (
    a  INTEGER,       -- whole number:           100, 200, -50
    b  BIGINT,        -- very large whole:       9999999999
    c  NUMERIC(8,2),  -- exact decimal:          99999.99  (use for money)
    d  REAL,          -- approximate decimal:    3.14159   (use for science)
    e  TEXT,          -- unlimited string:       any length
    f  VARCHAR(10),   -- limited string:         max 10 chars
    g  CHAR(3),       -- fixed string:           always 3 chars, padded with spaces
    h  BOOLEAN,       -- true or false:          TRUE / FALSE
    i  DATE,          -- date only:              '2024-01-15'
    j  TIME,          -- time only:              '14:30:00'
    k  TIMESTAMP      -- date + time:            '2024-01-15 14:30:00'
);



-- Drop table 

-- IF EXISTS prevents error if table doesn't exist
DROP TABLE IF EXISTS type_examples;

DROP TABLE IF EXISTS orders;       -- child first (has FKs) [ FK = Foreign Key ]
DROP TABLE IF EXISTS customers;    -- then parent
DROP TABLE IF EXISTS products;     -- then parent
DROP TABLE IF EXISTS categories;








