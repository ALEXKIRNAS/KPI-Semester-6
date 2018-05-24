SELECT 
    P.NAME PRODUCT,
    T.NAME TYPE,
    S.QUANTITYFACT,
    S.DISCOUNTFACT,
    P.PRICE PRODUCTPRICE,
    P.PRICE * S.QUANTITYFACT * (100 - S.DISCOUNTFACT) / 100 ALLPRICE
FROM SALEFACTS S, PRODUCTS P, TYPES T
    WHERE S.PRODUCTID = P.PRODUCTID
    AND P.TYPEID = T.TYPEID
    AND P.PRICE > 400;
        
SELECT DISTINCT
    C.NAME,
    C.SURNAME,
    SUM(P.PRICE * S.QUANTITYFACT * (100 - S.DISCOUNTFACT) / 100) OVER(PARTITION BY C.CUSTOMERID) CUSTOMERPRICE 
FROM SALEFACTS S, PRODUCTS P, CUSTOMERS C
    WHERE S.PRODUCTID = P.PRODUCTID
        AND S.CUSTOMERID = C.CUSTOMERID;
        