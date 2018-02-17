-- Назва товару повинна бути унікальна у рамках інших виробників. 
-- Тобто, наприклад поле product TV-10 не може бути у різних SUPPLIER.
with supp_counter as (
    select PRODUCT,
           count(SUPPLIER) as counter
    from STORE
    group by PRODUCT
)

select *
from STORE
where PRODUCT in (select PRODUCT
                  from supp_counter
                  where supp_counter.counter > 1)
order by STORE.PRODUCT

-- Максимальна кількість товарів на полиці STORE.SHELF – 30. 
-- З урахуванням того, що STORE.QUANTITY – кількість товарів на полиці STORE.SHELF.
select *
from STORE
where STORE.SHELF > 30

-- Діапазон дат: 01.01.2011 -  31.05.2014.
select *
from STORE
where TO_DATE(STORE.STORE_DATE, 'dd.mm.yyyy') not between TO_DATE('2011/01/01', 'yyyy/mm/dd') and TO_DATE('2014/05/31', 'yyyy/mm/dd')

-- Назва електронної адреси повинна використовувати лише символи a-z, 
-- цифри та символ «крапка», обов’язково повинен містити ‘@’.
select *
FROM INVOICE
WHERE not regexp_like(E_MAIL, '^[a-z0-9.%+-]+@[a-z0-9.-]+\.[a-z]+$')


-- Одному і тому ж значенню поля ID_STUFF повинні відповідати 
-- одні й ті ж значення полів STUFF_NAME, E_MAIL таблиці INVOICE
select 
    i1.ID_STUFF,
    i1.STAFF_NAME,
    i1.E_MAIL,
    i2.ID_STUFF,
    i2.STAFF_NAME,
    i2.E_MAIL
from INVOICE i1
join INVOICE i2 
     on i1.ID_STUFF = i2.ID_STUFF
where i1.STAFF_NAME != i2.STAFF_NAME or i1.E_MAIL != i2.E_MAIL


-- Типи операцій на складі – лише IN, OUT.
select *
from STORE
where STORE.oper_type not in ('In', 'Out')

-- Ціни на телевізори від 1000
select *
from INVOICE
where price < 1000

-- Код INVOICE формується як ‘INV-’_номер_операції
select *
from INVOICE
where not regexp_like(invoice, 'INV-[0-9]')


-- Назва моделі телевізора ‘TV-’номер_моделі.
select * 
from STORE
where not regexp_like(product, 'TV-[0-9]')
