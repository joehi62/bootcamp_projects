/* Restaurant Owner
 5 Tables
1x Fact , 4 Dimension
search google, how to add foreign key
write SQL 3-5 queries analyze data
1x sub queries*/
.mode column 
.header on
  
create table orders(
  	id INT UNIQUE PRIMARY KEY,
  	name TEXT,
  	price REAL
  );
  
 INSERT INTO orders VALUES
	(1,'Tom Yum Kung',350),
    (2,'Pizza',200),
    (3,'Ramen',150),
    (4,'Thai Noodle',90),
    (5,'Wakyu Steak',400);

Create TABLE country(
  country_id INT UNIQUE PRIMARY KEY,
  country_name TEXT
  );
  
  INSERT INTO country VALUES
  	(1,'Thailand'),
    (2,'Japan'),
    (3,'Other Country');

CREATE table location(
  	location_id INT UNIQUE PRIMARY KEY,
  	location_name TEXT
  );
  
  INSERT INTO location VALUES
  	(1,'Fashion Island'),
    (2,'Siam Square'),
    (3,'The Mall Bang-Ka-Pi'),
    (4,'Central World'),
    (5,'Icon Siam');

create table list(
  list_id INT UNIQUE PRIMARY KEY,
  list_name TEXT
  );
  
  INSERT INto list VALUES
  	(1,'For Here'),
    (2,'Take Away'),
    (3,'Delivery');

create table orderslist(
	orderlist_id INT UNIQUE PRIMARY KEY,
  	menu_id INT,
  	country_id INT,
  	location_id INT,
  	list_id INT,
  	FOREIGN KEY (menu_id) REFERENCES orders(id),
  	FOREIGN KEY (country_id) REFERENCES country(country_id),
  	FOREIGN KEY (location_id) REFERENCES location(location_id),
  	FOREIGN KEY (list_id) REFERENCES list(list_id)
  );
  
  INSERT into orderslist VALUES
  	(1,1,1,3,3),
    (2,2,3,2,1),
    (3,5,2,4,2),
    (4,4,1,1,3),
    (5,3,2,5,2),
    (6,4,1,3,2),
    (7,1,1,2,1),
    (8,1,1,4,2),
    (9,2,1,3,4),
    (10,4,1,3,3);

--What type of food is best seller?
SELECT 
	ord.name,
	sum(price) AS amount
FROM orderslist AS orl
JOIN orders AS ord on orl.menu_id=ord.id
group by ord.name
ORDER by amount DESC;

--Customer Oder For here, Take away or Delivery country?  (นับจำนวณลูกค้าสั่งกลับบ้าน,ทานที่นี้,Delivery แบบไหนมากที่สุด)
SELECT list_name,
count(list_name) AS 'NO.' 
	FROM(
 SELECT 
	orl.orderlist_id,
	l.list_name
 from orderslist AS orl 
 	JOIN list AS l on orl.list_id=l.list_id
 )
GROUP by list_name
order by list_name DESC;

--  ลูกค้าสั่งซื้อร้านอาหารสาขาไหนมากที่สุด?
SELECT 
	location_name AS Location,
    count(location_name) AS 'NO.'
FROM orderslist AS orl
	JOIN location AS lo on orl.location_id=lo.location_id
    GROUP by location_name
    ORDER by location_name DESC;
