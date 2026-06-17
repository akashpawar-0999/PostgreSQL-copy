
-- If you have old database 
-- then by using it Create Database shop
CREATE DATABASE shop;

-- OR Just click on DATABASE On right side and Create new 


-- CREATE DATABASE WITH EXTRA OPTIONS
-- You can set encoding, owner, and comment while creating.

CREATE DATABASE school
    OWNER     = postgres       		-- who owns this database
    ENCODING  = 'UTF8'         		-- character encoding (always use UTF8)
    LC_COLLATE = 'en_US.UTF-8' 		-- how strings are sorted
    LC_CTYPE   = 'en_US.UTF-8' 		-- character classification
    TEMPLATE  = template0;     		-- use clean template (safe choice)



\l          -- List all databases  (IN psql)

/*
                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 school    | postgres | UTF8     | libc            | en_US.UTF-8        | en_US.UTF-8        |        |           |
 shop      | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(5 rows)
*/



\c shop             -- Connect to shop Database (IN psql)  

-- You are now connected to database "shop" as user "postgres".



SELECT current_database();
-- +------------------+
-- | current_database |
-- +------------------+
-- | college          |
-- +------------------+



\c postgres         -- Connecting Postgres Database  (IN psql)  

-- You are now connected to database "postgres" as user "postgres".



-- to rename the database dissconnect it from database (option when selected) , Otherwise there is Error as :
-- ERROR:  database "shop" is being accessed by other users
-- DETAIL:  There are 2 other sessions using the database.

ALTER DATABASE shop RENAME TO myshop;       --  renamed "shop" to "myshop":
-- Output:
-- ALTER DATABASE


-- verify :
\l

/*
                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 myshop    | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 school    | postgres | UTF8     | libc            | en_US.UTF-8        | en_US.UTF-8        |        |           |
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(5 rows)
*/



DROP DATABASE IF EXISTS myshop;


