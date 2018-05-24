/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     25.03.2018 17:45:56                          */
/*==============================================================*/


alter table Products
   drop constraint FK_PRODUCTS_REFERENCE_TYPE;

alter table SaleList
   drop constraint FK_SALELIST_REFERENCE_PRODUCTS;

alter table SaleList
   drop constraint FK_SALELIST_REFERENCE_SALES;

alter table Sales
   drop constraint FK_SALES_REFERENCE_CUSTOMER;

alter table Sales
   drop constraint FK_SALES_REFERENCE_STAFF;

alter table Staff
   drop constraint FK_STAFF_REFERENCE_POSITION;

alter table Store
   drop constraint FK_STORE_REFERENCE_PRODUCTS;

alter table Supplies
   drop constraint FK_SUPPLIES_REFERENCE_STORE;

alter table Supplies
   drop constraint FK_SUPPLIES_REFERENCE_SUPPLIER;

drop table Customers cascade constraints;

drop table Positions cascade constraints;

drop table Products cascade constraints;

drop table SaleList cascade constraints;

drop table Sales cascade constraints;

drop table Staff cascade constraints;

drop table Store cascade constraints;

drop table Suppliers cascade constraints;

drop table Supplies cascade constraints;

drop table Type cascade constraints;

/*==============================================================*/
/* Table: Customers                                           */
/*==============================================================*/
create table Customers 
(
   CustomerId         INTEGER              not null,
   Name               VARCHAR2(256)        not null,
   Surname            VARCHAR2(256)        not null,
   Address            VARCHAR2(256),
   constraint PK_CUSTOMERS primary key (CustomerId)
);

comment on table Customers is
'Інформація про покупців';

/*==============================================================*/
/* Table: Positions                                           */
/*==============================================================*/
create table Positions 
(
   PositionId         INTEGER              not null,
   Name               VARCHAR2(256)        not null,
   Salary             INTEGER              not null,
   constraint PK_POSITIONS primary key (PositionId)
);

comment on table Positions is
'Інформація про посади';

/*==============================================================*/
/* Table: Products                                            */
/*==============================================================*/
create table Products 
(
   ProductId          INTEGER              not null,
   Name               VARCHAR2(256)        not null,
   Price              INTEGER              not null,
   TypeId             INTEGER              not null,
   constraint PK_PRODUCTS primary key (ProductId)
);

comment on table Products is
'Інформація про меблі';

/*==============================================================*/
/* Table: SaleList                                            */
/*==============================================================*/
create table SaleList 
(
   SaleListId         INTEGER              not null,
   SaleId             INTEGER              not null,
   ProductId          INTEGER              not null,
   Quantity           INTEGER              not null,
   constraint PK_SALELIST primary key (SaleListId)
);

comment on table SaleList is
'Інформація про список продуктів в замовленні';

/*==============================================================*/
/* Table: Sales                                               */
/*==============================================================*/
create table Sales 
(
   SaleId             INTEGER              not null,
   StaffId            INTEGER              not null,
   CustomerId         INTEGER              not null,
   SaleDate           DATE                 not null,
   constraint PK_SALES primary key (SaleId)
);

comment on table Sales is
'Інформація про замовлення покупців';

/*==============================================================*/
/* Table: Staff                                               */
/*==============================================================*/
create table Staff 
(
   StaffId            INTEGER              not null,
   PositionId         INTEGER,
   Name               VARCHAR2(256)        not null,
   Surname            VARCHAR2(256)        not null,
   Phone              VARCHAR2(256),
   constraint PK_STAFF primary key (StaffId)
);

comment on table Staff is
'Інформація про персонал';

/*==============================================================*/
/* Table: Store                                               */
/*==============================================================*/
create table Store 
(
   StoreId            INTEGER              not null,
   ProductId          INTEGER              not null,
   Quantity           INTEGER              not null,
   Shelf              INTEGER              not null,
   constraint PK_STORE primary key (StoreId)
);

comment on table Store is
'Інформація про кількість парфумів на складі';

/*==============================================================*/
/* Table: Suppliers                                           */
/*==============================================================*/
create table Suppliers 
(
   SupplierId         INTEGER              not null,
   Name               VARCHAR2(256)        not null,
   Address            VARCHAR2(256),
   Phone              VARCHAR2(256),
   constraint PK_SUPPLIERS primary key (SupplierId)
);

comment on table Suppliers is
'Інформація про постачальників';

/*==============================================================*/
/* Table: Supplies                                            */
/*==============================================================*/
create table Supplies 
(
   SupplyId           INTEGER              not null,
   SupplierId         INTEGER              not null,
   SupplyDate         DATE                 not null,
   StoreId            INTEGER              not null,
   constraint PK_SUPPLIES primary key (SupplyId)
);

comment on table Supplies is
'Інформація про поставки';

/*==============================================================*/
/* Table: Type                                                */
/*==============================================================*/
create table Type 
(
   TypeId             INTEGER              not null,
   Name               VARCHAR2(256)        not null,
   constraint PK_TYPE primary key (TypeId)
);

comment on table Type is
'Інформація про тип';

alter table Products
   add constraint FK_PRODUCTS_REFERENCE_TYPE foreign key (TypeId)
      references Type (TypeId);

alter table SaleList
   add constraint FK_SALELIST_REFERENCE_PRODUCTS foreign key (ProductId)
      references Products (ProductId);

alter table SaleList
   add constraint FK_SALELIST_REFERENCE_SALES foreign key (SaleId)
      references Sales (SaleId);

alter table Sales
   add constraint FK_SALES_REFERENCE_CUSTOMER foreign key (CustomerId)
      references Customers (CustomerId);

alter table Sales
   add constraint FK_SALES_REFERENCE_STAFF foreign key (StaffId)
      references Staff (StaffId);

alter table Staff
   add constraint FK_STAFF_REFERENCE_POSITION foreign key (PositionId)
      references Positions (PositionId);

alter table Store
   add constraint FK_STORE_REFERENCE_PRODUCTS foreign key (ProductId)
      references Products (ProductId);

alter table Supplies
   add constraint FK_SUPPLIES_REFERENCE_STORE foreign key (StoreId)
      references Store (StoreId);

alter table Supplies
   add constraint FK_SUPPLIES_REFERENCE_SUPPLIER foreign key (SupplierId)
      references Suppliers (SupplierId);

