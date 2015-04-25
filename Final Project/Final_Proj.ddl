-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-04-25 12:45:43 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE NL_ARL_Employees CASCADE CONSTRAINTS ;

DROP TABLE NL_Division CASCADE CONSTRAINTS ;

DROP TABLE NL_Document CASCADE CONSTRAINTS ;

DROP TABLE NL_Lab CASCADE CONSTRAINTS ;

DROP TABLE NL_Member CASCADE CONSTRAINTS ;

DROP TABLE NL_e2m CASCADE CONSTRAINTS ;

DROP TABLE NL_m2m CASCADE CONSTRAINTS ;

CREATE TABLE NL_ARL_Employees
  (
    user_id               INTEGER NOT NULL ,
    name                  VARCHAR2 (255) ,
    lab                   VARCHAR2 (255) ,
    division              VARCHAR2 (255) ,
    status                VARCHAR2 (255) ,
    status_effective_date DATE ,
    type                  VARCHAR2 (255) ,
    NL_Member_member_id   INTEGER
  ) ;
CREATE UNIQUE INDEX NL_ARL_Employees__IDX ON NL_ARL_Employees
  (
    NL_Member_member_id ASC
  )
  ;
  ALTER TABLE NL_ARL_Employees ADD CONSTRAINT NL_ARL_Employees_PK PRIMARY KEY ( user_id ) ;

CREATE TABLE NL_Division
  (
    division_id   INTEGER NOT NULL ,
    name          VARCHAR2 (255) ,
    NL_Lab_lab_id INTEGER
  ) ;
ALTER TABLE NL_Division ADD CONSTRAINT NL_Division_PK PRIMARY KEY ( division_id ) ;

CREATE TABLE NL_Document
  (
    document_id   INTEGER NOT NULL ,
    filename      VARCHAR2 (4000) ,
    file_mimetype VARCHAR2 (512) ,
    file_charset  VARCHAR2 (512) ,
    file_data BLOB ,
    file_comments       VARCHAR2 (4000) ,
    tags                VARCHAR2 (4000) ,
    NL_Member_member_id INTEGER
  ) ;

CREATE TABLE NL_Lab
  ( lab_id INTEGER NOT NULL , name VARCHAR2 (255)
  ) ;
ALTER TABLE NL_Lab ADD CONSTRAINT NL_Lab_PK PRIMARY KEY ( lab_id ) ;

CREATE TABLE NL_Member
  (
    member_id                INTEGER NOT NULL ,
    status                   VARCHAR2 (255) ,
    name                     VARCHAR2 (255) ,
    description              VARCHAR2 (4000) ,
    ownership_division_code  VARCHAR2 (255) ,
    external_view_name       VARCHAR2 (255) ,
    status_effective_date    DATE ,
    type                     VARCHAR2 (255) ,
    NL_ARL_Employees_user_id INTEGER
  ) ;
CREATE UNIQUE INDEX NL_Member__IDX ON NL_Member
  (
    NL_ARL_Employees_user_id ASC
  )
  ;
  ALTER TABLE NL_Member ADD CONSTRAINT NL_Member_PK PRIMARY KEY ( member_id ) ;

CREATE TABLE NL_e2m
  (
    user_mem_id              INTEGER NOT NULL ,
    NL_ARL_Employees_user_id INTEGER ,
    NL_Member_member_id      INTEGER
  ) ;
ALTER TABLE NL_e2m ADD CONSTRAINT NL_e2m_PK PRIMARY KEY ( user_mem_id ) ;

CREATE TABLE NL_m2m
  (
    mem_mem_id           INTEGER NOT NULL ,
    NL_Member_member_id  INTEGER ,
    NL_Member_member_id1 INTEGER
  ) ;
ALTER TABLE NL_m2m ADD CONSTRAINT NL_m2m_PK PRIMARY KEY ( mem_mem_id ) ;

ALTER TABLE NL_ARL_Employees ADD CONSTRAINT NL_ARL_Employees_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE NL_Division ADD CONSTRAINT NL_Division_NL_Lab_FK FOREIGN KEY ( NL_Lab_lab_id ) REFERENCES NL_Lab ( lab_id ) ;

ALTER TABLE NL_Document ADD CONSTRAINT NL_Document_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE NL_Member ADD CONSTRAINT NL_Member_NL_ARL_Employees_FK FOREIGN KEY ( NL_ARL_Employees_user_id ) REFERENCES NL_ARL_Employees ( user_id ) ;

ALTER TABLE NL_e2m ADD CONSTRAINT NL_e2m_NL_ARL_Employees_FK FOREIGN KEY ( NL_ARL_Employees_user_id ) REFERENCES NL_ARL_Employees ( user_id ) ;

ALTER TABLE NL_e2m ADD CONSTRAINT NL_e2m_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE NL_m2m ADD CONSTRAINT NL_m2m_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE NL_m2m ADD CONSTRAINT NL_m2m_NL_Member_FKv1 FOREIGN KEY ( NL_Member_member_id1 ) REFERENCES NL_Member ( member_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             2
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
