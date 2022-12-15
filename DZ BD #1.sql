--Homework №3

SELECT onum,amt, odate  FROM orders;
SELECT * FROM customers WHERE snum = '1001';
SELECT city, snum, cname, cnum, rating FROM customers;


--Homework №4

SELECT * FROM orders WHERE(amt > 1000);

SELECT sname, city FROM salespeople WHERE(comm > 0.10);

SELECT * FROM salespeople WHERE NOT city = 'London' AND comm > 0.11;


--№5

SELECT * FROM orders WHERE odate IN('2015-10-03', '2015-10-04');

SELECT * FROM orders WHERE snum IN (1001, 1003, 1007);

SELECT * FROM salespeople WHERE sname BETWEEN 'M%' AND 'S%';


--Homework №6

SELECT SUM(amt) FROM orders WHERE odate = '2015-10-03';

SELECT COUNT(DISTINCT city) FROM customers;

SELECT MAX(odate),snum FROM orders GROUP BY snum;

-- №7

--№2
SELECT onum, amt, amt*0.95 AS amtWithTaxDeduciton FROM orders;

--№6

SELECT sname,snum, comm FROM salespeople ORDER BY comm;

--№7
SELECT SUM(amt), odate FROM orders
GROUP BY odate
ORDER BY 2 DESC;


--Homework 8
--№1
SELECT onum, cname FROM orders, customers
WHERE orders.cnum = customers.cnum;

--№5
SELECT cname,sname,comm FROM customers, salespeople
WHERE salespeople.comm > 0.12 AND customers.snum = salespeople.snum;

--№7
SELECT onum, comm FROM salespeople, customers, orders
WHERE orders.cnum = customers.cnum AND orders.snum = salespeople.snum AND rating >100;




--Homework №9

--№1
SELECT first.sname, second.sname
FROM salespeople first, salespeople second
WHERE first.city = second.city AND first.sname < second.sname;

--№3
SELECT cname, first.onum, second.onum
FROM orders first, orders second, customers
WHERE first.cnum = second.cnum
AND first.cnum = customers.cnum
AND first.onum < second.onum;

--№5
SELECT first.cname, first.city
FROM customers first, customers second
WHERE first.rating = second.rating
AND second.cnum = 2001;



--Homework №10

--№ 1
SELECT * FROM orders
WHERE cnum = (SELECT cnum FROM customers WHERE cname = 'Cisneros');

--№ 3
SELECT DISTINCT cname, rating FROM customers, orders
WHERE amt >(SELECT avg(amt) FROM orders)
AND orders.cnum = customers.cnum;

--№ 5
SELECT snum, SUM(amt) FROM orders
GROUP BY snum
HAVING SUM(amt) > (SELECT MAX(amt) FROM orders);


--Homework № 11-12

--№ 1
SELECT cname,cnum FROM customers first
WHERE rating = (
	SELECT MAX(rating) FROM customers second
	 	WHERE first.city = second.city);

--№ 4
SELECT sname FROM salespeople first
WHERE exists (SELECT * FROM customers second
			  WHERE first.snum = second.snum AND rating = 300);

--№ 6
SELECT * FROM customers first
WHERE exists(
	SELECT * FROM orders second WHERE first.snum = second.snum AND first.cnum <> second.cnum);