/*==============================================================*/
/* DBMS NAME:      ORACLE VERSION 11G                           */
/* CREATED ON:     17.05.2018 21:22:01                          */
/*==============================================================*/


ALTER TABLE FACTS
   DROP CONSTRAINT FK_FACTS_REFERENCE_STAFF;

ALTER TABLE FACTS
   DROP CONSTRAINT FK_FACTS_REFERENCE_CUSTOMER;

ALTER TABLE FACTS
   DROP CONSTRAINT FK_FACTS_REFERENCE_PRODUCTS;

DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;

DROP TABLE FACTS CASCADE CONSTRAINTS;

DROP TABLE PRODUCTS CASCADE CONSTRAINTS;

DROP TABLE STAFF CASCADE CONSTRAINTS;

/*==============================================================*/
/* TABLE: CUSTOMERS                                           */
/*==============================================================*/
CREATE TABLE CUSTOMERS 
(
   CUSTOMERID         INTEGER              NOT NULL,
   NAME               VARCHAR2(256)        NOT NULL,
   SURNAME            VARCHAR2(256)        NOT NULL,
   ADDRESS            VARCHAR2(256)        NOT NULL,
   CONSTRAINT PK_CUSTOMERS PRIMARY KEY (CUSTOMERID)
);

COMMENT ON TABLE CUSTOMERS IS
'≤Õ‘Œ–Ã¿÷≤ﬂ œ–Œ œŒ ”œ÷≤¬';

/*==============================================================*/
/* TABLE: FACTS                                               */
/*==============================================================*/
CREATE TABLE FACTS 
(
   FACTID             INTEGER              NOT NULL,
   PRODUCTID          INTEGER              NOT NULL,
   CUSTOMERID         INTEGER              NOT NULL,
   STAFFID            INTEGER              NOT NULL,
   QUANTITYFACT       INTEGER              NOT NULL,
   DISCOUNTFACT       INTEGER              NOT NULL,
   CONSTRAINT PK_FACTS PRIMARY KEY (FACTID)
);

COMMENT ON TABLE FACTS IS
'≤Õ‘Œ–Ã¿÷≤ﬂ œ–Œ «¿ÃŒ¬À≈ÕÕﬂ';

/*==============================================================*/
/* TABLE: PRODUCTS                                            */
/*==============================================================*/
CREATE TABLE PRODUCTS 
(
   PRODUCTID          INTEGER              NOT NULL,
   NAME               VARCHAR2(256)        NOT NULL,
   PRICE              NUMBER(6,2)          NOT NULL,
   TYPENAME           VARCHAR2(256)        NOT NULL,
   CONSTRAINT PK_PRODUCTS PRIMARY KEY (PRODUCTID)
);

/*==============================================================*/
/* TABLE: STAFF                                               */
/*==============================================================*/
CREATE TABLE STAFF 
(
   STAFFID            INTEGER              NOT NULL,
   NAME               VARCHAR2(256)        NOT NULL,
   SURNAME            VARCHAR2(256)        NOT NULL,
   PHONE              VARCHAR2(256)        NOT NULL,
   POSITIONNAME       VARCHAR2(256)        NOT NULL,
   SALARY             INTEGER              NOT NULL,
   CONSTRAINT PK_STAFF PRIMARY KEY (STAFFID)
);

COMMENT ON TABLE STAFF IS
'≤Õ‘Œ–Ã¿÷≤ﬂ œ–Œ œ≈–—ŒÕ¿À';


ALTER TABLE FACTS
   ADD CONSTRAINT FK_FACTS_REFERENCE_STAFF FOREIGN KEY (STAFFID)
      REFERENCES STAFF (STAFFID);

ALTER TABLE FACTS
   ADD CONSTRAINT FK_FACTS_REFERENCE_CUSTOMER FOREIGN KEY (CUSTOMERID)
      REFERENCES CUSTOMERS (CUSTOMERID);

ALTER TABLE FACTS
   ADD CONSTRAINT FK_FACTS_REFERENCE_PRODUCTS FOREIGN KEY (PRODUCTID)
      REFERENCES PRODUCTS (PRODUCTID);

