/*==============================================================*/
/* Database name:  SALE                                         */
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     13.02.2014 19:12:34                          */
/*==============================================================*/


drop table INVOICE cascade constraints;

drop table SALES cascade constraints;

drop table STORE cascade constraints;

/*==============================================================*/
/* Database: SALE                                               */
/*==============================================================*/

/*==============================================================*/
/* Table: INVOICE                                               */
/*==============================================================*/
create table INVOICE  (
   ID_STUFF             varchar2(128)                   not null,
   STAFF_NAME           varchar2(128),
   E_MAIL               varchar2(128),
   INVOICE              varchar2(128),
   SUPPLIER             varchar2(128),
   PRODUCT              varchar2(128),
   QUANTITY             varchar2(128),
   PRICE                varchar2(128),
   INVOICE_DATE         varchar2(128)
);

comment on table INVOICE is
'Інформація про розрахунок.';

comment on column INVOICE.ID_STUFF is
'Унікальний ідентифікатор оплати.';

comment on column INVOICE.E_MAIL is
'Час виконання оплати.';

/*==============================================================*/
/* Table: SALES                                                 */
/*==============================================================*/
create table SALES  (
   ID_STUFF             VARCHAR2(128)                   not null,
   STAFF_NAME           varchar2(128),
   PRODUCT              VARCHAR2(128),
   SOLD_IN_JANUARY_2013 varchar2(128),
   SOLD_IN_FEBRUARY_2013 VARCHAR2(128),
   SOLD_IN_MARCH_2013   varchar2(128),
   SOLD_IN_APRIL_2013   varchar2(128),
   SOLD_IN_MAY_2013     VARCHAR2(128),
   SOLD_IN_JUNE_2013    VARCHAR2(128),
   SOLD_IN_JULY_2013    VARCHAR2(128),
   SOLD_IN_AUGUST_2013  VARCHAR2(128),
   SOLD_IN_SEPTEMBER_2013 VARCHAR2(128),
   SOLD_IN_OCTOBER_2013 VARCHAR2(128),
   SOLD_IN_NOVEMBER_2013 VARCHAR2(128),
   SOLD_IN_DECEMBER_2013 VARCHAR2(128)
);

comment on table SALES is
'Інофрмація про продажі.';

comment on column SALES.ID_STUFF is
'Унікальний ідентифікатор товару.';

comment on column SALES.STAFF_NAME is
'Назва товару.';

comment on column SALES.PRODUCT is
'Одиниця виміру.';

comment on column SALES.SOLD_IN_JANUARY_2013 is
'Опис товару.';

comment on column SALES.SOLD_IN_FEBRUARY_2013 is
'Ціна товару.';

comment on column SALES.SOLD_IN_MARCH_2013 is
'Постачальник.';

comment on column SALES.SOLD_IN_APRIL_2013 is
'Тип товару.';

/*==============================================================*/
/* Table: STORE                                                 */
/*==============================================================*/
create table STORE  (
   STUFF_NAME           varchar2(124)                   not null,
   SUPPLIER             varchar2(124),
   SHELF                varchar2(124),
   PRODUCT              varchar2(124),
   QUANTITY             varchar2(124),
   OPER_TYPE            varchar2(124),
   STORE_DATE           varchar2(124)
);

comment on table STORE is
'Інформація про склад';

comment on column STORE.STUFF_NAME is
'Унікальний ідентифікатор сховища.';

comment on column STORE.SUPPLIER is
'Номер полиці складу.';

comment on column STORE.SHELF is
'Кількітсь товару.';

prompt PL/SQL Developer import file
prompt Created on 12 Березень 2014 р. by Oli
set feedback off
set define off
prompt Disabling triggers for INVOICE...
alter table INVOICE disable all triggers;
prompt Disabling triggers for SALES...
alter table SALES disable all triggers;
prompt Disabling triggers for STORE...
alter table STORE disable all triggers;
prompt Deleting STORE...
delete from STORE;
commit;
prompt Deleting SALES...
delete from SALES;
commit;
prompt Deleting INVOICE...
delete from INVOICE;
commit;
prompt Loading INVOICE...
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-15', 'LG', 'TV-10', '1', '3192', '08.05.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-75', 'Toshiba', 'TV-20', '1', '8908', '29.06.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-73', 'Sony', 'TV-3', '1', '8887', '02.07.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-9', 'Toshiba', 'TV-18', '2', '3365', '21.07.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-37', 'Philips', 'TV-12', '1', '6917', '01.08.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'почтв', 'INV-85', 'Rolsen', 'TV-11', '1', '5799', '07.08.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-87', 'Philips', 'TV-12', '1', '7567', '07.08.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-62', 'Rolsen', 'TV-18', '1', '6890', '23.08.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-69', 'Sony', 'TV-19', '1', '8349', '09.09.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-51', 'LG', 'TV-9', '1', '9334', '11.09.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-94', 'Toshiba', 'TV-12', '1', '8761', '19.09.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-95', 'поставщик - 01', 'TV-18', '1', '8874', '01.10.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-39', 'Panasonic', 'TV-14', '2', '3158', '05.10.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-70', 'LG', 'TV-13', '1', '5350', '11.10.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-28', 'JVC', 'TV-12', '31.10.2011', '8115', '19.10.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-55', 'Philips', 'TV-14', '1', '5636', '01.11.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-60', 'Sony', 'TV-3', '1', '8726', '03.11.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-72', 'Toshiba', 'TV-10', '1', '8386', '18.11.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-80', 'Sony', 'TV-19', '1', '7379', '20.11.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-29', 'Sharp', 'TV-6', '1', '2505', '23.11.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-58', 'JVC', 'TV-8', '1', '1050', '02.12.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes -.Simon@shop.com', '88', 'LG', 'TV-3', '1', '9872', '30.12.2011');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-1', 'LG', 'TV-2', '1', '3696', '05.01.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'почтовый ящик', 'INV-66', 'JVC', 'TV-8', '1', '1337', '12.01.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-33', 'Sharp', 'TV-14', '1', '3344', '15.01.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-78', 'JVC', 'TV-12', '1', '8276', '27.01.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-77', 'Philips', 'TV-6', '1', '9338', '29.01.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-43', 'Rolsen', 'TV-11', '1', '2658', '31.01.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-32', 'Panasonic', 'TV-9', 'tttt', '7814', '07.03.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('1', 'Aaron Smih', 'Smih.Aaron@shop.com', 'INV-21', 'Philips', 'TV-11', '1', '2574', '19.03.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-71', 'Philips', 'TV-6', '1', '6826', '19.03.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INVOICE-50', 'Toshiba', 'TV-3', '1', '1874', '26.03.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-64', 'LG', 'TV-21', '1', '5708', '04.04.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-47', 'Philips', 'TV-4', '1', '150', '22.04.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop', 'INV-45', 'Toshiba', 'TV-2', '1', '7627', '12.05.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-41', 'Toshiba', 'TV-16', '1', '8032', '13.05.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-79', 'Sharp', 'TV-3', '1', '1404', '31.05.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-44', 'Toshiba', 'TV-2', '2', '9260', '13.06.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-11', 'Sony', 'TV-13', '1', '6291', '20.06.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-18', 'Sharp', 'TV-19', '1', '2756', '23.06.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-13', 'Panasonic', 'TV-10', '1', '3446', '24.06.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-14', 'LG', 'TV-5', '1', '6512', '27.06.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-31', 'Rolsen', 'TV-16', '1', '4930', '27.06.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-65', 'LG', 'TV-5', '1', '9087', '21.07.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam_shop.com', 'INV-61', 'Sony', 'TV-10', '1', '1355', '31.07.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-26', 'Sharp', 'TV-4', '1', '2507', '27.08.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-34', 'Panasonic', 'TV-14', '1', '5913', '01.09.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-2', 'Rolsen', 'TV-19', '1', '6021', '12.09.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-16', 'JVC', 'TV-3', '1', '3660', '22.09.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-68', 'Sharp', 'TV-5', '1', '9364', '24.09.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-25', 'Toshiba', 'TV-12', '1', '7058', '20.10.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-53', 'Panasonic', 'TV-1', '1', '1289', '21.10.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-54', 'Rolsen', 'TV-10', '1', '4859', '23.10.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-3', 'Panasonic', 'TV-11', '1', '3731', 'WSW2RV');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-19', 'Sony', 'TV-18', '1', '8887', '28.10.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-92', 'Sharp', 'TV-3', '1', '7272', '31.10.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-30', 'Sony', 'TV-10', '-555,00', '1940', '09.11.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('1', 'Aaron Smih', 'Smih.Aaron@shop.com', 'INV-48', 'Rolsen', 'TV-8', '1', '2856', '11.12.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-86', 'JVC', 'TV-8', '1', '9566', '28.12.2012');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-4', 'Rolsen', 'TV-20', '1', '5866', '06.01.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-90', 'JVC', 'TV-1', '1', '8027', '18.01.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-22', 'Toshiba', 'TV-18', '1', '8526', '21.01.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-42', 'Sharp', 'TV-19', '2', '500', '01.02.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-46', 'LG', 'TV-18', '3', '1812', '01.02.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-20', 'LG', 'TV-12', '4', '9648', ' ');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-49', 'Sharp', 'TV-14', '6', '1322', '24.02.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-27', 'Philips', 'TV-13', '754', '7118', '28.02.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-8', 'JVC', 'TV-16', '3', '8790', '05.03.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-7', 'Toshiba', 'TV-14', '2', '2960', '23.01.1900');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-76', 'Sharp', 'TV-4', '4', '9201', '31.03.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-67', 'LG', 'TV-13', '1', '8678', '01.04.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-89', 'Panasonic', 'TV-12', '1', '5762', '04.04.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('1', 'Aaron Smih', 'Smih.Aaron@shop.com', 'INV-38', 'LG', 'TV-14', '1', '2837', '08.04.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-84', 'Panasonic', 'TV-13', '1', '2794', '16.05.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-36', 'JVC', 'TV-10', '1', '8489', '13.06.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-56', 'Philips', 'TV-17', '1', '9753', '26.06.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-59', 'поставщик Toshiba', 'TV-6', '1', '3980', '27.06.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-82', 'Panasonic', '16', '1', '6452', '10.07.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-24', 'Sharp', 'TV-6', '1', '8547', '14.07.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-52', 'Rolsen', 'TV-16', '1', '9373', '16.07.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-40', 'JVC', 'TV-16', '1', '4166', '23.07.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-81', 'Rolsen', 'TV-17', '1', '3382', '23.07.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-74', 'Sharp', 'TV-11', '1', '1545', '30.07.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-93', 'Rolsen', 'TV-18', '1', '8727', '31.07.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-17', 'LG', 'TV-1', '1', '1355', '01.08.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-96', 'LG', 'TV-3', '1', '7118', '03.08.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-35', 'Rolsen', 'TV-4', '1', '5046', '19.08.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('2', 'Adam Thomas', 'Thomas.Adam@shop.com', 'INV-97', 'Philips', 'TV-10', '1', '7468', '15.10.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', null, 'Philips', 'TV-11', '1', '9414', '17.10.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-60000', 'Sony', null, '1', '6079', '31.10.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-99', 'Sharp', 'TV-15', '1', '8623', '07.11.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-100', 'Toshiba', 'TV-3', '1', '8623', '08.11.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-12', 'Rolsen', 'TV-19', '1', '1188', '13.11.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-10', 'Sony', 'TV-11', '1', '4173', '15.12.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-91', 'Toshiba', 'TV-17', '1', '7215', '16.12.2013');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('6', 'Carlton Edwards', 'Edwards.Carlton@shop.com', 'INV-98', 'Rolsen', 'TV-1', '1', '1335', '01.01.2014');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('5', 'Simon Hughes ', 'Hughes .Simon@shop.com', 'INV-83', 'Sharp', 'TV-17', '1', '7487', '04.01.2014');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('1', 'Aaron Smih', 'Smih.Aaron@shop.com', 'INV-5', 'Philips', 'TV-8', '1', '7222', '05.01.2014');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('3', 'Barry Davies', 'Davies.Barry@shop.com', 'INV-57', 'Toshiba', 'TV-19', '1', '7529', '09.01.2014');
insert into INVOICE (id_stuff, staff_name, e_mail, invoice, supplier, product, quantity, price, invoice_date)
values ('4', 'Basil White', 'White.Basil@shop.com', 'INV-63', 'Panasonic', 'TV-3', '1', '6603', '10.01.2014');
commit;
prompt 100 records loaded
prompt Loading SALES...
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('4', 'Basil White', 'TV-01', '1', '0', '0', '0', '2', '3', '0', '4', '1', '1', '5', '3');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('2', 'Adam Thomas', 'TV-02', '3', '0', '0', '1', '1', '3', '3', '5', '0', '5', '2', '2');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('2', 'Adam Thomas', 'TV-03', '1', '0', '0', '3', '1', '3', '5', '1', '3', '1', '1', '2');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('4', 'Basil White', 'TV-04', '3', '0', '4', '4', '4', '3', '3', '1', '1', '3', '3', '4');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('2', 'Adam Thomas', 'TV-05', '1', '0', '0', '3', '0', '2', '1', '1', '1', '2', '1', '3');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('3', 'Barry Davies', 'TV-06', '3', '0', '0', '4', '0', '1', '4', '1', '1', '3', '3', '2');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('6', 'Carlton Edwards', 'TV-07', '0', '0', '0', '1', '0', '5', '1', '4', '0', '2', '0', '3');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('6', 'Carlton Edwards', 'TV-08', '2', '0', '0', '2', '2', '3', '3', '1', '1', '0', '3', '5');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('3', 'Basil White', 'TV-09', '5', '0', '0', '3', '5', '1', '0', '5', '2', '3', '3', '5');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('6', 'Adam Thomas', 'TV-10', '4', '0', '0', '3', '2', '4', '0', '1', '3', '5', '1', '3');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('6', 'фывсаываы', 'TV-11', '4', '0', '0', '0', '1', null, '5', '2', '1', 'ДВА', '4', '1');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('4', 'Basil White', 'TV-12', '0', '4', '0', '4', '0', '5', '4', '1', '2', '4', '1', '1');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('2', 'Adam Thomas', 'TV-13', '2', '2', '0', '2', '4', '5', '3', '5', '1', '4', '5', '2');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('2', 'Adam Thomas', 'TV-14', '3', '6', '2', '4', '2', '1', '1', '1', '3', '1', '2', '4');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('1', 'Basil White', 'TV-15', '2', '0', '0', '4', '5', '1', '3', '3', '3', '1', '2', '3');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('3', 'Adam Thomas', 'TV-1645121', '3', '0', '3', '3', '1', '2', '0', '4', '4', '0', '2', '3');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('3', 'Barry Davies', 'TV-17', '3', '0', '0', '3', '4', '2', '5', '3', '4', '2', '1', '4');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('6', 'Carlton Edwards', 'TV-18', '5', '0', '0', '4', '3', '1', '5', '2', '1', '1', '0', '4');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('6', 'Carlton Edwards', 'TV-19', '2', '0', '0', '2', '2', '3', '3', '0', '3', '4', '2', '0');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('4', 'Basil White', 'TV-20', '3', '0', '0', '4', '2', '1', '2', '3', '1', '1', '0', '4');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('2', 'Adam Thomas', 'TV-21', '1', '0', '0', '2', '4', '1', '2', '2', '1', '1', '4', '2');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('2', 'TV-16', 'TV-22', '2', '0', '0', '1', '3', '2', '1', '3', '0', '2', '1', '1');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('1', 'Aaron Smih', 'TV-23', '1', '0', '0', '10000', '3', '2', '3', '2', '3', '3', '4', '4');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('3', 'Barry Davies', 'TV-24', '2', '0', '0', '0', '2', '0', '0', '3', '1', '0', '2', '2');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('5', 'Simon Hughes ', '25', '4', '0', '0', '5', '4', '0', '0', '4', '1', '1', '4', '1');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('3', 'Barry Davies', 'TV-26', '2', '0', '0', '4', '0', '0', null, '0', '3', '2', '3', '4');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('33', 'Adam Thomas', 'TV-27', '2', '0', '0', '3', '0', '2', '3', '1', '0', '3', '2', '5');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('2', 'Adam Thomas', 'TV-28', '1', '0', '0', '4', '1', '1', '5', '3', '2', '3', '3', '3');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('2', 'Adam Thomas', 'TV-29', '1', '0', '0', '2', '3', '0', '4', '2', '3', '3', '1', '1');
insert into SALES (id_stuff, staff_name, product, sold_in_january_2013, sold_in_february_2013, sold_in_march_2013, sold_in_april_2013, sold_in_may_2013, sold_in_june_2013, sold_in_july_2013, sold_in_august_2013, sold_in_september_2013, sold_in_october_2013, sold_in_november_2013, sold_in_december_2013)
values ('3', 'Barry Davies', '300', '0', '0', '0', '4', '5', '3', '2', '0', 'ONE', '5', '5', '2');
commit;
prompt 30 records loaded
prompt Loading STORE...
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Sony', '2', 'TV-23', '8', 'in', '17.05.2011');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon', 'Sn', '5', 'TV-58', '13', 'Out', '31.05.2011');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Carlton Edwards', 'Toshiba', '1', 'TV-29', '8', 'Out', '02.06.2011');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'JVC', '8540844654', 'TV-32', '13', 'In', '10.06.2011');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Toshiba', '5', 'TV-42', '20', 'Out', '19.09.2011');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Carlton Edwards', 'LG', '1', 'TV-22', '19', 'Out', '19.09.2011');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Toshiba', '1', 'TV-53', '6', 'in', '12.11.2011');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'LG', '7', 'TV-43', '8', 'Out', '12.01.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'Toshiba', '14', 'TV-34', '19', 'Out', '28.01.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil+ White', 'Rolsen', '2', 'TV-40', '16', 'In', '07.02.2030');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Toshiba', '16', 'TV-57', '16', 'Out', '16.02.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Rolsen', '2', 'TV-45', '16', 'Out', '17.02.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Toshiba', '5', 'TV-26', '5', 'in', '23.02.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Philips', '2', 'TV-54', '5', 'Out', '28.02.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'LG', '6', 'TV-43', '16', 'Out', '08.03.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Sharp', '5', 'TV-36', '12', 'In', '09.03.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Sharp', '4', 'TV-28', '2', 'Out', '14.03.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'Toshiba', '1', 'TV-37', '10', 'Out', '09.04.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Sharp', '1', 'TV-30', '16', 'in', '20.04.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'Sharp', '28', 'TV-25', '15', 'Out', '21.04.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'LG', '15', 'TV-53', '20', 'Out', '27.04.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Sharp', '13', 'TV-23', '8', 'In', '29.04.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Sharp', '12', 'TV-50', '14', 'Out', '30.04.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'LG', '25', 'TV-33', '1', 'Out', '25.05.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('1354', 'JVC', '6', 'TV-42', '11', 'Out', '12.06.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Philips', '7', 'TV-44', '17', 'In', '29.06.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'LG', '15', '524', '7', 'In', '03.07.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'Panasonic', '5', 'TV-41', 'hf', 'in', '08.07.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Carlton Edwards', 'Sharp', '5', 'TV-39', '12', 'Out', '''');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'JVC', '1', 'TV-56', '5', 'Out', '01.08.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Panasonic', '1', 'TV-56', '24', 'In', '07.08.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'Rolsen', '2', 'TV-29', '3', 'Out', '18.09.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'LG', '1', 'TV-38', '5', 'Out', 'Junuary 2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'Panasonic', '18', 'TV-55', '16', 'In', '23.09.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Sharp', '6', 'TV-59', '1', 'In', '14.11.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Sony', '16', 'TV-35', '19', 'Out', '07.12.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'LG', '4', 'TV-27', '11', 'Out', '18.12.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Rolsen', '12', 'TV-55', '6', 'Instead', '26.12.2012');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Carlton Edwards', 'Sony', '5', 'TV-48', '16', 'in', '17.01.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'Sony', '10', 'TV-53', '6', 'Out', '16.02.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'Toshiba', '7', 'TV-60', '2', 'Out', '24.02.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'Philips', '5', 'TV-21', '4', 'In', '17.03.1990');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'JVC', '1', 'TV-22', '5', 'Out', '21.03.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Sony', '3', 'TV-22', '16', 'Out', '05.04.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'LG', '33', 'TV-61', '8', 'In', '16.04.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'Rolsen', '1', 'TV-55', '4', 'In', '21.05.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'Sony', '5', 'TV-54', '2', 'in', '28.05.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'Sharp', '1', 'TV-41', '14', 'Out', '25.06.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Panasonic', '3', 'TV-31', '7', 'Out', '18.07.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'JVC', '1', 'TV-47', '7', 'In', '23.07.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('LG', 'Philips', '4', 'TV-54', '11', 'Out', '13.10.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Toshiba', '11', 'TV-44', '5', 'sales', '22.10.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Sharp', '2', 'TV-56', '12', 'In', '10.11.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Adam Thomas', 'Panasonic', '18', 'TV-46', '14', 'In', '26.11.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Basil White', 'Philips', '17', 'TV-28', '123', 'In', '27.11.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('k68768', 'JVC', '5', 'TV-52', '19', 'In', '25.12.2013');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Simon Hughes ', 'Sony', '5', 'TV-55', '6', 'Out', '08.01.2014');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Rolsen', '12', 'TV-24', '5', 'In', '22.01.2014');
insert into STORE (stuff_name, supplier, shelf, product, quantity, oper_type, store_date)
values ('Barry Davies', 'Panasonic', '13', 'TV-51', '2', 'Out', '17.06.2070');
commit;
prompt 59 records loaded
prompt Enabling triggers for INVOICE...
alter table INVOICE enable all triggers;
prompt Enabling triggers for SALES...
alter table SALES enable all triggers;
prompt Enabling triggers for STORE...
alter table STORE enable all triggers;
set feedback on
set define on
prompt Done.


