/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      demo1.DM1
 *
 * Date Created : Tuesday, April 30, 2024 17:17:20
 * Target DBMS : Databricks
 */

/* 
 * TABLE: prema.Entity1 
 */

CREATE TABLE prema.Entity1
(
    test1    string,
    test2    timestamp,
    test3    tinyint,
    test4    bigint            GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1)  NOT NULL,
    test5    smallint,
    test6    decimal(10, 0),
    test7    boolean,
    test8    timestamp_ntz
)
;

