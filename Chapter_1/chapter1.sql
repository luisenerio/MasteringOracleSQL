-- Turn off extra formatting
SET PAGESIZE 90000
SET LINESIZE 200
SET FEEDBACK OFF
SET VERIFY OFF
SET HEADING ON

select cust_nbr, name, region_id from customer;


--Comentario

select cust_nbr, name, region_id from customer where region_id= 8;

-- Select with join and aliases
select customer.cust_nbr, customer.name, region.name 
from customer inner join region
on region.region_id = customer.region_id
where region.name = 'New England';

--
SELECT c.cust_nbr, c.name, r.name
FROM customer c INNER JOIN region r
ON r.region_id = c.region_id
WHERE r.name = 'New England';

--Example of different elements on select clause

SELECT
    ROWNUM,
    cust_nbr,
    1 multiplier,
    'cust # ' || cust_nbr cust_nbr_str,
    'hello' greeting,
    TO_CHAR(last_order_dt, 'DD-MON-YYYY') last_order
from CUSTOMER;


-- You dant have to reference columns from the table you reference on the 'FROM'clause

select 1 num, 'abc' str FROM CUSTOMER;


--order by
SELECT c.cust_nbr, c.name, r.name 
FROM CUSTOMER c inner join region r
ON c.region_id = r.region_id
WHERE r.name = 'New England'
ORDER BY c.name;



SELECT c.cust_nbr, c.name, r.name
from CUSTOMER c inner join region r
on c.region_id = r.region_id
where r.name = 'New England'
order by 1;


--distict
SELECT DISTINCT li.part_nbr
from cust_order co inner join line_item li
ON co.order_nbr = li.order_nbr;
--WHERE co.order_dt >= TO_DATE('01-07-2001', 'DD-MM-YYYY')
--AND co.order_dt < TO_DATE('01-08-2001','DD-MM-YYYY');



--Describe table
describe employee;


--INSERT
SELECT * FROM employee;

INSERT INTO employee(emp_id, dept_id)
VALUES(102,25);




INSERT INTO employee(emp_id,lname, dept_id)
VALUES(103,'Nerio',20);

INSERT INTO employee (emp_id, fname, lname, dept_id,hire_date)
SELECT 105,'Luis', 'Nerio', d.dept_id, SYSDATE
FROM department d
where d.name = 'ACCOUNTING';


SELECT * FROM employee;

INSERT ALL 
INTO cust_order( order_nbr, cust_nbr, sales_emp_id, order_dt, expected_ship_dt, status)
VALUES(order_nbr, cust_nbr, sales_emp_id, ord_dt, ord_dt+7, status)
INTO cust_order (order_nbr, cust_nbr, sales_emp_id, order_dt, expected_ship_dt, status)
VALUES (order_nbr + 1, cust_nbr, sales_emp_id, add_months(ord_dt, 1), add_months(ord_dt, 1) + 7, status)
INTO cust_order (order_nbr, cust_nbr, sales_emp_id, order_dt, expected_ship_dt, status)
VALUES (order_nbr + 2, cust_nbr, sales_emp_id, add_months(ord_dt, 2), add_months(ord_dt, 2) + 7, status)
INTO cust_order (order_nbr, cust_nbr, sales_emp_id, order_dt, expected_ship_dt, status)
VALUES (order_nbr + 3, cust_nbr, sales_emp_id, add_months(ord_dt, 3), add_months(ord_dt, 3) + 7, status)
INTO cust_order (order_nbr, cust_nbr, sales_emp_id, order_dt, expected_ship_dt, status)
VALUES (order_nbr + 4, cust_nbr, sales_emp_id, add_months(ord_dt, 4), add_months(ord_dt, 4) + 7, status)
INTO cust_order (order_nbr, cust_nbr, sales_emp_id, order_dt, expected_ship_dt, status)
VALUES (order_nbr + 5, cust_nbr, sales_emp_id, add_months(ord_dt, 5), add_months(ord_dt, 5) + 7, status)
SELECT 99990 order_nbr, c.cust_nbr cust_nbr, e.emp_id sales_emp_id, last_day(SYSDATE) ord_dt, 'PENDING' status
FROM customer c CROSS JOIN employee e WHERE e.FNAME = 'MARY' AND e.lname = 'TURNER' AND c.name = 'Gentech Industries';


select * from cust_order;

INSERT ALL 
INTO employee (emp_id, fname, lname, dept_id, hire_date)
VALUES (eid, fnm, lnm,did, TRUNC(SYSDATE))
INTO salesperson(salesperson_id,name, primary_region_id)
VALUES (eid, fnm||' ' || lnm, rid)
SELECT 1001 eid, 'Enrique' fnm,  'LOPEZ' lnm, d.dept_id did, r.region_id rid
FROM department d, region r WHERE d.name = 'SALES' and r.name = 'Southeast US';
select * from employee;
-- 


CREATE TABLE cust_order_2000(
    ORDER_NBR           NUMBER(7)           NOT NULL,
    CUST_NBR            NUMBER(5)           NOT NULL,
    SALES_EMP_ID        NUMBER(5)           NOT NULL,
    SALE_PRICE          NUMBER(9,2),
    ORDER_DT            DATE                NOT NULL,
    EXPECTED_SHIP_DT    DATE                NOT NULL,
    CANCELLED_DT        DATE,
    SHIP_DT             DATE,
    STATUS              VARCHAR2(20),
    CONSTRAINT cust_order_pk2 PRIMARY KEY (ORDER_NBR)
);


CREATE TABLE cust_order_2001(
    ORDER_NBR           NUMBER(7)           NOT NULL,
    CUST_NBR            NUMBER(5)           NOT NULL,
    SALES_EMP_ID        NUMBER(5)           NOT NULL,
    SALE_PRICE          NUMBER(9,2),
    ORDER_DT            DATE                NOT NULL,
    EXPECTED_SHIP_DT    DATE                NOT NULL,
    CANCELLED_DT        DATE,
    SHIP_DT             DATE,
    STATUS              VARCHAR2(20),
    CONSTRAINT cust_order_pk3 PRIMARY KEY (ORDER_NBR)
);


CREATE TABLE cust_order_2002(
    ORDER_NBR           NUMBER(7)           NOT NULL,
    CUST_NBR            NUMBER(5)           NOT NULL,
    SALES_EMP_ID        NUMBER(5)           NOT NULL,
    SALE_PRICE          NUMBER(9,2),
    ORDER_DT            DATE                NOT NULL,
    EXPECTED_SHIP_DT    DATE                NOT NULL,
    CANCELLED_DT        DATE,
    SHIP_DT             DATE,
    STATUS              VARCHAR2(20),
    CONSTRAINT cust_order_pk4 PRIMARY KEY (ORDER_NBR)
);

-----
INSERT FIRST
    WHEN order_dt < TO_DATE( '2001-01-01','YYYY-MM-DD') THEN
    INTO cust_order_2000(order_nbr, cust_nbr, sales_emp_id, sale_price,order_dt,expected_ship_dt)
    VALUES (order_nbr, cust_nbr, sales_emp_id,sale_price, order_dt,expected_ship_dt)
    WHEN order_dt < TO_DATE( '2002-01-01','YYYY-MM-DD') THEN
    INTO cust_order_2001(order_nbr, cust_nbr, sales_emp_id, sale_price,order_dt,expected_ship_dt)
    VALUES (order_nbr, cust_nbr, sales_emp_id,sale_price, order_dt,expected_ship_dt)
    WHEN order_dt < TO_DATE( '2003-01-01','YYYY-MM-DD') THEN
    INTO cust_order_2002(order_nbr, cust_nbr, sales_emp_id, sale_price,order_dt,expected_ship_dt)
    VALUES (order_nbr, cust_nbr, sales_emp_id,sale_price, order_dt,expected_ship_dt)
SELECT co.order_nbr, co.cust_nbr, co.sales_emp_id,co.sale_price, co.order_dt,co.expected_ship_dt
from cust_order co
WHERE co.cancelled_dt is NULL;
-----

