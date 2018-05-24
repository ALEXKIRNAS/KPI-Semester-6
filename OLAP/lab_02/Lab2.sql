/*
������� ������� ������� �������� �� ������� ��������.
*/

SELECT 
    s.productId,
    p.name,
    p.price,
    SUM(s.quantity) QUANTITY,
    SUM(s.quantity * p.price) ALL_PRICE
FROM store s, products p
WHERE s.productId = p.productId
GROUP BY s.productId, p.price, p.name
ORDER BY s.productId;

/*
���������, ������ ����� ������������ ������� ���� �� ����������.
*/

SELECT * FROM suppliers 
WHERE supplierId NOT IN
    (SELECT DISTINCT
        supplierId
    FROM store st, saleList sl, supplies sup
    WHERE st.productId = sl.productId
        AND sup.storeId = st.storeId);

/*
���������, �� ������ ����� �� ���������� � ������� ������ ����. 
*/

SELECT * FROM products
WHERE productId NOT IN
    (SELECT DISTINCT
        sl.productId
    FROM saleList sl
    JOIN sales sa
    ON sl.saleId = sa.saleId
    WHERE EXTRACT(month FROM sa.saleDate) > 6);

/*
��������� 5 ��������, �� ��������� �������� �������.
*/

SELECT * FROM 
    (SELECT 
        c.customerId, 
        c.name, 
        c.surname, 
        count(saleId) AS "Count"
    FROM sales s 
    JOIN customers c 
    ON c.customerId = s.customerId
    GROUP BY c.customerId, c.name, c.surname
    ORDER BY "Count" DESC)
WHERE ROWNUM <= 5;

/*
��������� ����������, �� ����� �������� ������.
*/

SELECT * FROM
    (SELECT 
        st.staffId,
        st.name,
        st.surname,
        p.name position,
        SUM(sl.quantity) Quantity
    FROM staff st
    JOIN sales sa
    ON st.staffId = sa.staffId
    JOIN saleList sl
    ON sa.saleId = sl.saleId
    JOIN positions p
    ON st.positionId = p.positionId
    GROUP BY st.staffId, st.name, p.name, st.surname
    ORDER BY Quantity DESC)
WHERE ROWNUM = 1;

/*
��������� 3 ����������, �� �������� �������� ����.
*/

SELECT * FROM
    (SELECT 
        st.staffId,
        st.name,
        st.surname,
        p.name position,
        COUNT(sa.saleId) SaleCount
    FROM staff st
    JOIN sales sa
    ON st.staffId = sa.staffId
    JOIN positions p
    ON st.positionId = p.positionId
    GROUP BY st.staffId, st.name, p.name, st.surname
    ORDER BY SaleCount DESC)
WHERE ROWNUM <= 3;

/*
��� ���� � ���������� ������ �������� �� ���� ���������� ��������.
*/

SELECT AVG(AllPrice)
FROM
    (SELECT 
        sa.saleId,
        SUM(p.price * sl.quantity) AllPrice
    FROM sales sa
    JOIN saleList sl
    ON sa.saleId = sl.saleId
    JOIN products p
    ON sl.productId = p.productId
    GROUP BY sa.saleId);

/*
������ ������� �������� ����� ��������� �� ����.
*/

SELECT 
    t.staffId,
    st.name,
    st.surname,
    p.name position,
    AVG(t.CountSales)
FROM
    (SELECT 
        s.staffId,
        s.saleDate,
        COUNT(s.saleId) CountSales
    FROM sales s
    GROUP BY s.staffId, s.saleDate) t
JOIN staff st
ON st.staffId = t.staffId
JOIN positions p
ON st.positionId = p.positionId
GROUP BY t.staffId, st.name, p.name, st.surname;

/*
��������� �� ������ ��������� ������ ���� ������ ����.
*/

SELECT * FROM
    (SELECT 
        st.shelf,
        COUNT(DISTINCT p.typeId) CountType
    FROM store st
    JOIN products p
    ON st.productId = p.productId
    GROUP BY st.shelf)
WHERE CountType = 1;

/*
��������� ������, �� ����� �������� ���� �� ��������� ����������.
*/

-- 1 variant
SELECT * FROM
    (SELECT 
        sl.productId,
        SUM(sl.quantity) ProductQuantity
    FROM saleList sl
    GROUP BY sl.productId
    ORDER BY ProductQuantity DESC) tq
JOIN
    (SELECT
        p.productId,
        p.price
    FROM products p
    ORDER BY p.price DESC) tp
ON tq.productId = tp.productId;

-- 2 variant

SELECT 
    sl.productId,
    SUM(sl.quantity * p.price) AllPrice
FROM saleList sl
JOIN products p
    ON sl.productId = p.productId
GROUP BY sl.productId
ORDER BY AllPrice DESC;