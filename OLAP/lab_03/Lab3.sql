/*
Показати ранг кожного товару у групі (відповідно до зменшення ціни в групі).
Запит реалізувати через функції rank() та dense_rank().
Порівняти результати виконання.
*/

SELECT 
    p.productId,
    p.name,
    p.price,
    t.name type,
    RANK() OVER
        (PARTITION BY p.typeId ORDER BY p.price DESC) rank,
    DENSE_RANK() OVER
        (PARTITION BY p.typeId ORDER BY p.price DESC) dense_rank
FROM products p, type t
WHERE t.typeId = p.typeId
ORDER BY p.typeId;

/*
Вивести список із двох найдешевших товарів у кожній групі.
*/

SELECT * FROM
    (SELECT 
        p.productId,
        p.name,
        p.price,
        t.name type,
        RANK() OVER(PARTITION BY p.typeId ORDER BY p.price) rank
    FROM products p, type t
    WHERE t.typeId = p.typeId)
WHERE rank < 3;

/*
Показати які товари по кожній групі мають найбільші продажі.
*/

SELECT * FROM
    (SELECT 
        productId,
        name,
        price,
        type,
        allQuantity,
        profit,
        RANK() OVER(PARTITION BY type ORDER BY profit DESC) rank
    FROM
        (SELECT DISTINCT
            p.productId,
            p.name,
            p.price,
            t.name type,
            SUM(sl.quantity) OVER
                (PARTITION BY p.productId) allQuantity,
            SUM(p.price * sl.quantity) OVER
                (PARTITION BY p.productId) profit
        FROM products p, type t, saleList sl
        WHERE t.typeId = p.typeId
        AND sl.productId = p.productId))
WHERE rank = 1;

/*
Вивести список товарів з найбільшою вартістю,
які найдовше зберігаються на полицях складу.
*/

SELECT 
    st.productId,
    p.price,
    st.quantity,
    st.shelf,
    su.supplyDate 
FROM store st, supplies su, products p
WHERE su.storeId = st.storeId
    AND st.productId = p.productId
ORDER BY p.price DESC, su.supplyDate ASC;

/*
Побудувати запит з використанням функцій LEAD.
Той же запит реалізувати через функцію LAG.
Порівняти результати їх виконання.
*/

SELECT 
    su1.supplierId,
    su2.name,
    su1.supplyDate,
    LEAD(su1.supplyDate, 1) OVER
        (PARTITION BY su1.supplierId ORDER BY su1.supplierId) lead,
    LAG(su1.supplyDate, 1) OVER
        (PARTITION BY su1.supplierId ORDER BY su1.supplierId) lag
FROM supplies su1, suppliers su2
WHERE su2.supplierId = su1.supplierId;

/*SELECT 
    su1.supplierId,
    su1.supplyDate,
    su2.name,
    su2.surname,
    LAG(su1.supplyDate, 1) OVER(PARTITION BY su1.supplierId ORDER BY su1.supplierId) lag
FROM supplies su1, suppliers su2
WHERE su2.supplierId = su1.supplierId;*/

/*
Побудувати аналітичні запити, які б використовували наступні функції
(один запит – одна функція):
*/

-- FIRST_VALUE (або LAST_VALUE)

SELECT 
    p.productId,
    p.name,
    p.price,
    t.name type,
    FIRST_VALUE(p.name) OVER
        (PARTITION BY t.typeId ORDER BY p.price) Cheapest
FROM products p, type t
WHERE t.typeId = p.typeId;

-- MAX ( або MIN)

SELECT 
    p.productId,
    p.name,
    p.price,
    t.name type,
    MAX(p.price) OVER(PARTITION BY t.typeId) MaxPrice
FROM products p, type t
WHERE t.typeId = p.typeId;

-- COUNT( або SUM).

SELECT DISTINCT
    t.typeId,
    t.name type,
    SUM(p.price * sl.quantity) OVER
        (PARTITION BY t.typeId) TypeProfit
FROM products p, type t, saleList sl
WHERE t.typeId = p.typeId
    AND sl.productId = p.productId;
    
/*
Вивести список товарів, які було придбано за певний період часу
вивести вартість товарів по різним вікнам використовуючи наступну структуру:
*/

-- … over( order by )

SELECT
    p.productId,
    p.name,
    p.price,
    sl.quantity,
    SUM(p.price * sl.quantity) OVER
        (PARTITION BY sl.saleListId) profit,
    sa.saleDate,
    SUM(p.price * sl.quantity) 
        OVER(ORDER BY sa.saleDate range 
            between 15 preceding and 15 following) monthlyProfit
FROM products p, saleList sl, sales sa
WHERE p.productId = sl.productId
    AND sl.saleId = sa.saleId;

-- … over (partition … order by… ) 

SELECT
    p.price,
    p.typeId,
    sl.quantity,
    SUM(p.price * sl.quantity) OVER
        (PARTITION BY sl.saleListId) profit,
    sa.saleDate,
    SUM(p.price * sl.quantity) 
        OVER(PARTITION BY p.typeId ORDER BY sa.saleDate 
            range between 45 preceding and 45 following) quarterlyProfitByType
FROM products p, saleList sl, sales sa
WHERE p.productId = sl.productId
    AND sl.saleId = sa.saleId
ORDER BY p.typeId;
    
-- … over (partition col1, col2)

SELECT
    p.productId,
    p.name,
    p.price,
    p.typeId,
    sl.quantity,
    SUM(p.price * sl.quantity) OVER
        (PARTITION BY sl.saleListId) profit,
    sa.saleDate,
    SUM(p.price * sl.quantity) 
        OVER(PARTITION BY p.typeId, p.productId) quarterlyProfitByType
FROM products p, saleList sl, sales sa
WHERE p.productId = sl.productId
    AND sl.saleId = sa.saleId
ORDER BY p.typeId;

-- … over (partition col1, col2… order by)

SELECT
    p.productId,
    p.name,
    p.price,
    p.typeId,
    sl.quantity,
    SUM(p.price * sl.quantity) OVER
        (PARTITION BY sl.saleListId) profit,
    sa.saleDate,
    SUM(p.price * sl.quantity) 
        OVER(PARTITION BY p.typeId, p.productId ORDER BY sa.saleDate 
            range between 45 preceding and 45 following) quarterlyProfitByType
FROM products p, saleList sl, sales sa
WHERE p.productId = sl.productId
    AND sl.saleId = sa.saleId
ORDER BY p.typeId;