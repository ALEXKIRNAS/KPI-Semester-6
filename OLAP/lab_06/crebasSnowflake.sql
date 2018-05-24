/*==============================================================*/
/* DBMS NAME:      ORACLE VERSION 11G                           */
/* CREATED ON:     17.05.2018 21:21:20                          */
/*==============================================================*/


ALTER TABLE PRODUCTS
   DROP CONSTRAINT FK_PRODUCT_REFERENCE_TYPES;

ALTER TABLE SALEFACTS
   DROP CONSTRAINT FK_SALEFACT_REFERENCE_STAFF;

ALTER TABLE SALEFACTS
   DROP CONSTRAINT FK_SALEFACT_REFERENCE_CUSTOMER;

ALTER TABLE SALEFACTS
   DROP CONSTRAINT FK_SALEFACT_REFERENCE_PRODUCT;

ALTER TABLE STAFF
   DROP CONSTRAINT FK_STAFF_REFERENCE_POSITION;
   
DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;

DROP TABLE POSITIONS CASCADE CONSTRAINTS;

DROP TABLE PRODUCTS CASCADE CONSTRAINTS;

DROP TABLE SALEFACTS CASCADE CONSTRAINTS;

DROP TABLE STAFF CASCADE CONSTRAINTS;

DROP TABLE TYPES CASCADE CONSTRAINTS;

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
/* TABLE: POSITIONS                                           */
/*==============================================================*/
CREATE TABLE POSITIONS 
(
   POSITIONID         INTEGER              NOT NULL,
   NAME               VARCHAR2(256)        NOT NULL,
   SALARY             INTEGER              NOT NULL,
   CONSTRAINT PK_POSITIONS PRIMARY KEY (POSITIONID)
);

COMMENT ON TABLE POSITIONS IS
'≤Õ‘Œ–Ã¿÷≤ﬂ œ–Œ œŒ—¿ƒ»';

/*==============================================================*/
/* TABLE: PRODUCTS                                             */
/*==============================================================*/
CREATE TABLE PRODUCTS 
(
   PRODUCTID          INTEGER              NOT NULL,
   TYPEID             INTEGER              NOT NULL,
   NAME               VARCHAR2(256)        NOT NULL,
   PRICE              NUMBER(6,2)          NOT NULL,
   CONSTRAINT PK_PRODUCTS PRIMARY KEY (PRODUCTID)
);

/*==============================================================*/
/* TABLE: SALEFACTS                                           */
/*==============================================================*/
CREATE TABLE SALEFACTS 
(
   FACTID             INTEGER              NOT NULL,
   CUSTOMERID         INTEGER              NOT NULL,
   STAFFID            INTEGER              NOT NULL,
   PRODUCTID          INTEGER              NOT NULL,
   QUANTITYFACT       INTEGER              NOT NULL,
   DISCOUNTFACT       INTEGER              NOT NULL,
   CONSTRAINT PK_SALEFACTS PRIMARY KEY (FACTID)
);

COMMENT ON TABLE SALEFACTS IS
'≤Õ‘Œ–Ã¿÷≤ﬂ œ–Œ «¿ÃŒ¬À≈ÕÕﬂ';

/*==============================================================*/
/* TABLE: STAFF                                               */
/*==============================================================*/
CREATE TABLE STAFF 
(
   STAFFID            INTEGER              NOT NULL,
   NAME               VARCHAR2(256)        NOT NULL,
   SURNAME            VARCHAR2(256)        NOT NULL,
   PHONE              VARCHAR2(256)        NOT NULL,
   POSITIONID         INTEGER              NOT NULL,
   CONSTRAINT PK_STAFF PRIMARY KEY (STAFFID)
);

COMMENT ON TABLE STAFF IS
'≤Õ‘Œ–Ã¿÷≤ﬂ œ–Œ œ≈–—ŒÕ¿À';


/*==============================================================*/
/* TABLE: TYPES                                               */
/*==============================================================*/
CREATE TABLE TYPES 
(
   TYPEID             INTEGER              NOT NULL,
   NAME               VARCHAR2(256)        NOT NULL,
   CONSTRAINT PK_TYPES PRIMARY KEY (TYPEID)
);

COMMENT ON TABLE TYPES IS
'≤Õ‘Œ–Ã¿÷≤ﬂ œ–Œ œ≤ƒ“»œ';


ALTER TABLE PRODUCTS
   ADD CONSTRAINT FK_PRODUCT_REFERENCE_TYPES FOREIGN KEY (TYPEID)
      REFERENCES TYPES (TYPEID);

ALTER TABLE SALEFACTS
   ADD CONSTRAINT FK_SALEFACT_REFERENCE_STAFF FOREIGN KEY (STAFFID)
      REFERENCES STAFF (STAFFID);

ALTER TABLE SALEFACTS
   ADD CONSTRAINT FK_SALEFACT_REFERENCE_CUSTOMER FOREIGN KEY (CUSTOMERID)
      REFERENCES CUSTOMERS (CUSTOMERID);

ALTER TABLE SALEFACTS
   ADD CONSTRAINT FK_SALEFACT_REFERENCE_PRODUCT FOREIGN KEY (PRODUCTID)
      REFERENCES PRODUCTS (PRODUCTID);

ALTER TABLE STAFF
   ADD CONSTRAINT FK_STAFF_REFERENCE_POSITION FOREIGN KEY (POSITIONID)
      REFERENCES POSITIONS (POSITIONID);

