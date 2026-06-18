
-- PRIMARY KEY = UNIQUE + NOT NULL combined.
-- Every table should have one. It is the unique identity of a row.
-- SERIAL auto generates values. You never insert into it manually.

CREATE TABLE departments (
    id    SERIAL        PRIMARY KEY,   -- single column PK
    name  VARCHAR(100)  NOT NULL
);




INSERT INTO departments (id, name) VALUES (1, 'HR');
-- query runs successfully




INSERT INTO departments (id, name) VALUES (1, 'HR');
-- ERROR:  duplicate key value violates unique constraint "departments_pkey"
-- Key (id)=(1) already exists. 

-- SQL state: 23505
-- Detail: Key (id)=(1) already exists.





-- COMPOSITE PRIMARY KEY — two columns together form the unique identity:
CREATE TABLE course_enrollments (
    student_id  INTEGER  NOT NULL,
    course_id   INTEGER  NOT NULL,
    enrolled_at DATE     DEFAULT CURRENT_DATE,
    PRIMARY KEY (student_id, course_id)  -- combination must be unique
);

-- student_id=1 + course_id=1 is one record.
-- student_id=1 + course_id=2 is a different record.
-- Same student can enroll in different courses, not the same course twice.









CREATE TABLE employees (
    id         SERIAL        PRIMARY KEY,
    first_name VARCHAR(50)   NOT NULL,    -- must always have value
    last_name  VARCHAR(50)   NOT NULL,    -- must always have value
    email      VARCHAR(200)  NOT NULL,    -- must always have value
    salary     NUMERIC(10,2),             -- nullable, optional
    department VARCHAR(50)                -- nullable, optional
);




-- Try inserting without first_name:
INSERT INTO employees (last_name, email)
VALUES ('Sharma', 'sharma@company.com');

-- Output (ERROR):
-- ERROR:  null value in column "first_name" of relation "employees"
--         violates not-null constraint
-- DETAIL:  Failing row contains (1, null, Sharma, sharma@company.com, ...)






-- Add NOT NULL to existing column:
ALTER TABLE employees ALTER COLUMN department SET NOT NULL;

-- Output:
-- ERROR: column "department" of relation "employees" contains null values
-- (if existing rows have nulls, you must fill them first)

