-- question 1
create view pcInfo as 
select *
from laptop natural join product;

create view PrinterInfo as 
select *
from Printer natural join Product;

create view LaptopInfo as 
select *  
from laptop natural join product;
 


-- question 2
delimiter //
create procedure proc1 (inout productList varchar(4000))
begin

-- declare variables
declare finished int default 0;
declare make char(1);
declare tp varchar(20);
declare modelNo int default 0;
declare priceNo int default 0;

-- declare cursor
declare allProduct cursor for
    (select LaptopInfo.maker, LaptopInfo.`type`, LaptopInfo.model, LaptopInfo.price 
    from LaptopInfo
    union 
    select PrinterInfo.maker, PrinterInfo.`type`, PrinterInfo.model, PrinterInfo.price 
    from PrinterInfo
    union
    select PcInfo.maker, PcInfo.`type`, PcInfo.model, PcInfo.price 
    from PcInfo
    );
-- declare handler clause
declare continue handler 
for not found set finished = 1;
-- open cursor
open allProduct;
-- loop
getInfo: loop
    fetch allProduct into make,tp,modelNo,priceNo;
    if finished = 1 then
        leave getInfo;
    end if;
    set productList = concat(productList, make,'-', tp, ' ', modelNo, ' for ', priceNo, '; ');
end loop getInfo;

close allProduct;

end//
delimiter ;


-- called as:
-- set productList = '';
-- call proc1(productList);
-- select productList;










-- question 3

delimiter //
create procedure proc2 (inout saleList varchar(4000))
begin

-- declare variables
declare finished int default 0;
declare tp varchar(20);
declare modelNo int default 0;

-- declare cursor
declare sale cursor for
    (select LaptopInfo.`type`, LaptopInfo.model 
    from LaptopInfo
    where LaptopInfo.price > LaptopInfo.ram
    union 
    select PrinterInfo.`type`, PrinterInfo.model 
    from PrinterInfo
    where PrinterInfo.`type` = 'laser' 
    union
    select PcInfo.`type`, PcInfo.model 
    from PcInfo
    where PcInfo.hd < 200 or pcInfo.price > 1000
    );
-- declare handler clause
declare continue handler 
for not found set finished = 1;
-- open cursor
open sale;
-- loop
getInfo: loop
    fetch sale into tp,modelNo;
    if finished = 1 then
        leave getInfo;
    end if;
    set saleList = concat(saleList, tp, ' ', modelNo, ' is on sale ! ');
end loop getInfo;

close sale;

end//
delimiter ;