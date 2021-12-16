-- Q1
select distinct maker
from Product natural join PC
where speed >= 3.00;

-- Q2
select maker 
from Product p1
where P1.maker not in (select P2.maker from Product p2 where p2.`type` = 'PC');

-- Q3
select distinct pc1.hd
from PC pc1, PC pc2
where pc1.model<>pc2.model and pc1.hd = pc2.hd; 

-- Q4
select product.model, price 
from Product natural join PC 
where maker = 'B' 

union 

select product.model, price 
from Product natural join Laptop 
where maker = 'B' 

union 

select product.model,price 
from Product natural join Printer 
where maker = 'B';

-- Q5
select pc1.model, pc2.model
from PC pc1, PC pc2
where pc1.model < pc2.model and pc1.speed = pc2.speed and pc1.ram = pc2.ram;



-- Q6
select model
from Printer p1
where p1.price >= all (select p2.price from Printer p2);

-- Q7
select maker 
from Product, Printer 
where Product.model = Printer.model and Printer.color = 'true' and Printer.price <= all (select p2.price from Printer p2);

    -- should have worked but didnt???? is it mariadb? natural join returned empty set
    -- select maker
    -- from Product natural join Printer p1
    -- where p1.price <= all (select p2.price from Printer p2) and p1.color = 'true';


-- Q8
select avg(speed)
from Laptop
where price > 1000;

-- Q9
select avg(r1.price)
from (select maker, price, model from PC natural join Product where maker = 'D' 
    union select maker, price, model from Laptop natural join Product where maker = 'D') r1;


-- Q10
select speed, avg(price)
from PC
where speed > 2.0
group by speed;
