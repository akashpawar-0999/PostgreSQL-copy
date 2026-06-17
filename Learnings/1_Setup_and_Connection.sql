/*              STEPS TO LEARN HOW PostgreSQL Application Works

At very Left Side 
Click on DATABSE 
right click on DATABASE and Create new database


CREATE A DATABASE 
eg. college 

TO USE THAT DATABASE 
right click on it and open "Query Tool"
IN QUERY Write queries 

*/

-- Basic Queries :


SELECT version();
-- PostgreSQL 18.4 on x86_64-windows, compiled by msvc-19.44.35227, 64-bit


SELECT current_database();
-- +------------------+
-- | current_database |
-- +------------------+
-- | college          |
-- +------------------+


SELECT current_user;
-- +--------------+
-- | current_user |
-- +--------------+
-- | postgres     |
-- +--------------+


SHOW port;
-- +----------+
-- | port     |
-- +----------+
-- | 5432     |
-- +----------+


SELECT current_schema();
-- +----------------+
-- | current_schema |
-- +----------------+
-- | public         |
-- +----------------+


SELECT CURRENT_DATE;
-- +--------------+
-- | current_date |
-- +--------------+
-- | 2026-06-17   |
-- +--------------+


SELECT CURRENT_TIME;
-- +------------------------+
-- | current_time           |
-- +------------------------+
-- | 13:08:52.465078+05:30  |
-- +------------------------+


SELECT CURRENT_TIMESTAMP;
-- +----------------------------------+
-- | current_timestamp                |
-- +----------------------------------+
-- | 2026-06-17 13:09:30.131784+05:30 |
-- +----------------------------------+


SELECT inet_server_addr();
-- +------------------+
-- | inet_server_addr |
-- +------------------+
-- | ::1              |
-- +------------------+


SELECT inet_server_port();
-- +------------------+
-- | inet_server_port |
-- +------------------+
-- | 5432             |
-- +------------------+



/*--------------------------------------------------------------------------------------------------------------------------------

TO OPEN SQL Shell (psql)

right click on it and open "PSQL Tool"
IN Shell Write queries 

*/

\l                  -- List all databases

/*
                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 college   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(4 rows)

*/


\du                 -- List all users

/*
                             List of roles
 Role name |                         Attributes
-----------+------------------------------------------------------------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS

*/


\conninfo           -- Connection info

/*
      Connection Information
      Parameter       |   Value
----------------------+-----------
 Database             | college
 Client User          | postgres
 Host                 | localhost
 Host Address         | ::1
 Server Port          | 5432
 Options              |
 Protocol Version     | 3.0
 Password Used        | true
 GSSAPI Authenticated | false
 Backend PID          | 29316
 SSL Connection       | false
 Superuser            | on
 Hot Standby          | off
(13 rows)

*/


\q                  -- Exit psql

/*

E:\A Setup of extensions\PostgreSQL\pgAdmin 4\runtime>

*/


\! cls              -- To Clear Screen (Windows)



\h                  -- (shows all SQL command help)

/*

Available help:
  ABORT                            CREATE USER MAPPING
  ALTER AGGREGATE                  CREATE VIEW
  ALTER COLLATION                  DEALLOCATE
  ALTER CONVERSION                 DECLARE
  ALTER DATABASE                   DELETE
  ALTER DEFAULT PRIVILEGES         DISCARD
  ALTER DOMAIN                     DO
  ALTER EVENT TRIGGER              DROP ACCESS METHOD
  ALTER EXTENSION                  DROP AGGREGATE
  ALTER FOREIGN DATA WRAPPER       DROP CAST
  ALTER FOREIGN TABLE              DROP COLLATION
  ALTER FUNCTION                   DROP CONVERSION
  ALTER GROUP                      DROP DATABASE
  ALTER INDEX                      DROP DOMAIN
  ALTER LANGUAGE                   DROP EVENT TRIGGER
  ALTER LARGE OBJECT               DROP EXTENSION
  ALTER MATERIALIZED VIEW          DROP FOREIGN DATA WRAPPER
  ALTER OPERATOR                   DROP FOREIGN TABLE
  ALTER OPERATOR CLASS             DROP FUNCTION
  ALTER OPERATOR FAMILY            DROP GROUP
  ALTER POLICY                     DROP INDEX
  ALTER PROCEDURE                  DROP LANGUAGE
  ALTER PUBLICATION                DROP MATERIALIZED VIEW
  ALTER ROLE                       DROP OPERATOR
  ALTER ROUTINE                    DROP OPERATOR CLASS
  ALTER RULE                       DROP OPERATOR FAMILY
  ALTER SCHEMA                     DROP OWNED
  ALTER SEQUENCE                   DROP POLICY
  ALTER SERVER                     DROP PROCEDURE
  ALTER STATISTICS                 DROP PUBLICATION
  ALTER SUBSCRIPTION               DROP ROLE
  ALTER SYSTEM                     DROP ROUTINE
  ALTER TABLE                      DROP RULE
  ALTER TABLESPACE                 DROP SCHEMA
  ALTER TEXT SEARCH CONFIGURATION  DROP SEQUENCE
  ALTER TEXT SEARCH DICTIONARY     DROP SERVER
  ALTER TEXT SEARCH PARSER         DROP STATISTICS
  ALTER TEXT SEARCH TEMPLATE       DROP SUBSCRIPTION
  ALTER TRIGGER                    DROP TABLE
  ALTER TYPE                       DROP TABLESPACE
  ALTER USER                       DROP TEXT SEARCH CONFIGURATION
  ALTER USER MAPPING               DROP TEXT SEARCH DICTIONARY
  ALTER VIEW                       DROP TEXT SEARCH PARSER
  ANALYZE                          DROP TEXT SEARCH TEMPLATE
  BEGIN                            DROP TRANSFORM
  CALL                             DROP TRIGGER
  CHECKPOINT                       DROP TYPE
  CLOSE                            DROP USER
  CLUSTER                          DROP USER MAPPING
  COMMENT                          DROP VIEW
  COMMIT                           END
  COMMIT PREPARED                  EXECUTE
  COPY                             EXPLAIN
  CREATE ACCESS METHOD             FETCH
  CREATE AGGREGATE                 GRANT
  CREATE CAST                      IMPORT FOREIGN SCHEMA
  CREATE COLLATION                 INSERT
  CREATE CONVERSION                LISTEN
  CREATE DATABASE                  LOAD
  CREATE DOMAIN                    LOCK
  CREATE EVENT TRIGGER             MERGE
  CREATE EXTENSION                 MOVE
  CREATE FOREIGN DATA WRAPPER      NOTIFY
  CREATE FOREIGN TABLE             PREPARE
  CREATE FUNCTION                  PREPARE TRANSACTION
  CREATE GROUP                     REASSIGN OWNED
  CREATE INDEX                     REFRESH MATERIALIZED VIEW
  CREATE LANGUAGE                  REINDEX
  CREATE MATERIALIZED VIEW         RELEASE SAVEPOINT
  CREATE OPERATOR                  RESET
  CREATE OPERATOR CLASS            REVOKE
  CREATE OPERATOR FAMILY           ROLLBACK
  CREATE POLICY                    ROLLBACK PREPARED
  CREATE PROCEDURE                 ROLLBACK TO SAVEPOINT
  CREATE PUBLICATION               SAVEPOINT
  CREATE ROLE                      SECURITY LABEL
  CREATE RULE                      SELECT
  CREATE SCHEMA                    SELECT INTO
  CREATE SEQUENCE                  SET
  CREATE SERVER                    SET CONSTRAINTS
  CREATE STATISTICS                SET ROLE
  CREATE SUBSCRIPTION              SET SESSION AUTHORIZATION
  CREATE TABLE                     SET TRANSACTION
  CREATE TABLE AS                  SHOW
  CREATE TABLESPACE                START TRANSACTION
  CREATE TEXT SEARCH CONFIGURATION TABLE
  CREATE TEXT SEARCH DICTIONARY    TRUNCATE
  CREATE TEXT SEARCH PARSER        UNLISTEN
  CREATE TEXT SEARCH TEMPLATE      UPDATE
  CREATE TRANSFORM                 VACUUM
  CREATE TRIGGER                   VALUES
  CREATE TYPE                      WITH
  CREATE USER

*/


\h SELECT           -- (shows help for a specific SQL command)

/*

Command:     SELECT
Description: retrieve rows from a table or view
Syntax:
[ WITH [ RECURSIVE ] with_query [, ...] ]
SELECT [ ALL | DISTINCT [ ON ( expression [, ...] ) ] ]
    [ { * | expression [ [ AS ] output_name ] } [, ...] ]
    [ FROM from_item [, ...] ]
    [ WHERE condition ]
    [ GROUP BY [ ALL | DISTINCT ] grouping_element [, ...] ]
    [ HAVING condition ]
    [ WINDOW window_name AS ( window_definition ) [, ...] ]
    [ { UNION | INTERSECT | EXCEPT } [ ALL | DISTINCT ] select ]
    [ ORDER BY expression [ ASC | DESC | USING operator ] [ NULLS { FIRST | LAST } ] [, ...] ]
    [ LIMIT { count | ALL } ]
    [ OFFSET start [ ROW | ROWS ] ]
    [ FETCH { FIRST | NEXT } [ count ] { ROW | ROWS } { ONLY | WITH TIES } ]
    [ FOR { UPDATE | NO KEY UPDATE | SHARE | KEY SHARE } [ OF from_reference [, ...] ] [ NOWAIT | SKIP LOCKED ] [...] ]

where from_item can be one of:

    [ ONLY ] table_name [ * ] [ [ AS ] alias [ ( column_alias [, ...] ) ] ]
                [ TABLESAMPLE sampling_method ( argument [, ...] ) [ REPEATABLE ( seed ) ] ]
    [ LATERAL ] ( select ) [ [ AS ] alias [ ( column_alias [, ...] ) ] ]
    with_query_name [ [ AS ] alias [ ( column_alias [, ...] ) ] ]
    [ LATERAL ] function_name ( [ argument [, ...] ] )
                [ WITH ORDINALITY ] [ [ AS ] alias [ ( column_alias [, ...] ) ] ]
    [ LATERAL ] function_name ( [ argument [, ...] ] ) [ AS ] alias ( column_definition [, ...] )
    [ LATERAL ] function_name ( [ argument [, ...] ] ) AS ( column_definition [, ...] )
    [ LATERAL ] ROWS FROM( function_name ( [ argument [, ...] ] ) [ AS ( column_definition [, ...] ) ] [, ...] )
                [ WITH ORDINALITY ] [ [ AS ] alias [ ( column_alias [, ...] ) ] ]
    from_item join_type from_item { ON join_condition | USING ( join_column [, ...] ) [ AS join_using_alias ] }
    from_item NATURAL join_type from_item
    from_item CROSS JOIN from_item

and grouping_element can be one of:

    ( )
    expression
    ( expression [, ...] )
    ROLLUP ( { expression | ( expression [, ...] ) } [, ...] )
    CUBE ( { expression | ( expression [, ...] ) } [, ...] )
    GROUPING SETS ( grouping_element [, ...] )

and with_query is:

    with_query_name [ ( column_name [, ...] ) ] AS [ [ NOT ] MATERIALIZED ] ( select | values | insert | update | delete | merge )
        [ SEARCH { BREADTH | DEPTH } FIRST BY column_name [, ...] SET search_seq_col_name ]
        [ CYCLE column_name [, ...] SET cycle_mark_col_name [ TO cycle_mark_value DEFAULT cycle_mark_default ] USING cycle_path_col_name ]

TABLE [ ONLY ] table_name [ * ]

URL: https://www.postgresql.org/docs/18/sql-select.html

*/



\?

/*

General
  \copyright             show PostgreSQL usage and distribution terms
  \crosstabview [COLUMNS] execute query and display result in crosstab
  \errverbose            show most recent error message at maximum verbosity
  \g [(OPTIONS)] [FILE]  execute query (and send result to file or |pipe);
                         \g with no arguments is equivalent to a semicolon
  \gdesc                 describe result of query, without executing it
  \gexec                 execute query, then execute each value in its result
  \gset [PREFIX]         execute query and store result in psql variables
  \gx [(OPTIONS)] [FILE] as \g, but forces expanded output mode
  \q                     quit psql
  \restrict RESTRICT_KEY
                         enter restricted mode with provided key
  \unrestrict RESTRICT_KEY
                         exit restricted mode if key matches
  \watch [[i=]SEC] [c=N] [m=MIN]
                         execute query every SEC seconds, up to N times,
                         stop if less than MIN rows are returned

Help
  \? [commands]          show help on backslash commands
  \? options             show help on psql command-line options
  \? variables           show help on special variables
  \h [NAME]              help on syntax of SQL commands, * for all commands

Query Buffer
  \e [FILE] [LINE]       edit the query buffer (or file) with external editor
  \ef [FUNCNAME [LINE]]  edit function definition with external editor
  \ev [VIEWNAME [LINE]]  edit view definition with external editor
  \p                     show the contents of the query buffer
  \r                     reset (clear) the query buffer
  \w FILE                write query buffer to file

Input/Output
  \copy ...              perform SQL COPY with data stream to the client host
  \echo [-n] [STRING]    write string to standard output (-n for no newline)
  \i FILE                execute commands from file
  \ir FILE               as \i, but relative to location of current script
  \o [FILE]              send all query results to file or |pipe
  \qecho [-n] [STRING]   write string to \o output stream (-n for no newline)
  \warn [-n] [STRING]    write string to standard error (-n for no newline)

Conditional
  \if EXPR               begin conditional block
  \elif EXPR             alternative within current conditional block
  \else                  final alternative within current conditional block
  \endif                 end conditional block

Informational
  (options: S = show system objects, x = expanded mode, + = additional detail)
  \d[Sx+]                list tables, views, and sequences
  \d[S+]   NAME          describe table, view, sequence, or index
  \da[Sx]  [PATTERN]     list aggregates
  \dA[x+]  [PATTERN]     list access methods
  \dAc[x+] [AMPTRN [TYPEPTRN]]  list operator classes
  \dAf[x+] [AMPTRN [TYPEPTRN]]  list operator families
  \dAo[x+] [AMPTRN [OPFPTRN]]   list operators of operator families
  \dAp[x+] [AMPTRN [OPFPTRN]]   list support functions of operator families
  \db[x+]  [PATTERN]     list tablespaces
  \dc[Sx+] [PATTERN]     list conversions
  \dconfig[x+] [PATTERN] list configuration parameters
  \dC[x+]  [PATTERN]     list casts
  \dd[Sx]  [PATTERN]     show object descriptions not displayed elsewhere
  \dD[Sx+] [PATTERN]     list domains
  \ddp[x]  [PATTERN]     list default privileges
  \dE[Sx+] [PATTERN]     list foreign tables
  \des[x+] [PATTERN]     list foreign servers
  \det[x+] [PATTERN]     list foreign tables
  \deu[x+] [PATTERN]     list user mappings
  \dew[x+] [PATTERN]     list foreign-data wrappers
  \df[anptw][Sx+] [FUNCPTRN [TYPEPTRN ...]]
                         list [only agg/normal/procedure/trigger/window] functions
  \dF[x+]  [PATTERN]     list text search configurations
  \dFd[x+] [PATTERN]     list text search dictionaries
  \dFp[x+] [PATTERN]     list text search parsers
  \dFt[x+] [PATTERN]     list text search templates
  \dg[Sx+] [PATTERN]     list roles
  \di[Sx+] [PATTERN]     list indexes
  \dl[x+]                list large objects, same as \lo_list
  \dL[Sx+] [PATTERN]     list procedural languages
  \dm[Sx+] [PATTERN]     list materialized views
  \dn[Sx+] [PATTERN]     list schemas
  \do[Sx+] [OPPTRN [TYPEPTRN [TYPEPTRN]]]
                         list operators
  \dO[Sx+] [PATTERN]     list collations
  \dp[Sx]  [PATTERN]     list table, view, and sequence access privileges
  \dP[itnx+] [PATTERN]   list [only index/table] partitioned relations [n=nested]
  \drds[x] [ROLEPTRN [DBPTRN]]
                         list per-database role settings
  \drg[Sx] [PATTERN]     list role grants
  \dRp[x+] [PATTERN]     list replication publications
  \dRs[x+] [PATTERN]     list replication subscriptions
  \ds[Sx+] [PATTERN]     list sequences
  \dt[Sx+] [PATTERN]     list tables
  \dT[Sx+] [PATTERN]     list data types
  \du[Sx+] [PATTERN]     list roles
  \dv[Sx+] [PATTERN]     list views
  \dx[x+]  [PATTERN]     list extensions
  \dX[x]   [PATTERN]     list extended statistics
  \dy[x+]  [PATTERN]     list event triggers
  \l[x+]   [PATTERN]     list databases
  \sf[+]   FUNCNAME      show a function's definition
  \sv[+]   VIEWNAME      show a view's definition
  \z[Sx]   [PATTERN]     same as \dp

Large Objects
  \lo_export LOBOID FILE write large object to file
  \lo_import FILE [COMMENT]
                         read large object from file
  \lo_list[x+]           list large objects
  \lo_unlink LOBOID      delete a large object

Formatting
  \a                     toggle between unaligned and aligned output mode
  \C [STRING]            set table title, or unset if none
  \f [STRING]            show or set field separator for unaligned query output
  \H                     toggle HTML output mode (currently off)
  \pset [NAME [VALUE]]   set table output option
                         (border|columns|csv_fieldsep|expanded|fieldsep|
                         fieldsep_zero|footer|format|linestyle|null|
                         numericlocale|pager|pager_min_lines|recordsep|
                         recordsep_zero|tableattr|title|tuples_only|
                         unicode_border_linestyle|unicode_column_linestyle|
                         unicode_header_linestyle|xheader_width)
  \t [on|off]            show only rows (currently off)
  \T [STRING]            set HTML <table> tag attributes, or unset if none
  \x [on|off|auto]       toggle expanded output (currently off)

Connection
  \c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo}
                         connect to new database (currently "school")
  \conninfo              display information about current connection
  \encoding [ENCODING]   show or set client encoding
  \password [USERNAME]   securely change the password for a user

Operating System
  \cd [DIR]              change the current working directory
  \getenv PSQLVAR ENVVAR fetch environment variable
  \setenv NAME [VALUE]   set or unset environment variable
  \timing [on|off]       toggle timing of commands (currently off)
  \! [COMMAND]           execute command in shell or start interactive shell

Variables
  \prompt [TEXT] NAME    prompt user to set internal variable
  \set [NAME [VALUE]]    set internal variable, or list all if no parameters
  \unset NAME            unset (delete) internal variable

Extended Query Protocol
  \bind [PARAM]...       set query parameters
  \bind_named STMT_NAME [PARAM]...
                         set query parameters for an existing prepared statement
  \close_prepared STMT_NAME
                         close an existing prepared statement
  \endpipeline           exit pipeline mode
  \flush                 flush output data to the server
  \flushrequest          send request to the server to flush its output buffer
  \getresults [NUM_RES]  read NUM_RES pending results, or all if no argument
  \parse STMT_NAME       create a prepared statement
  \sendpipeline          send an extended query to an ongoing pipeline
  \startpipeline         enter pipeline mode
  \syncpipeline          add a synchronisation point to an ongoing pipeline

*/