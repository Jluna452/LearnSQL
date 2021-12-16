-- assignment 6
-- ddrop all constraints
alter table Product drop constraint chkModel;
alter table Product drop constraint chkType;

alter table PC drop constraint chkModel;
alter table PC drop constraint chkRam;
alter table PC drop constraint chkHd;
alter table PC drop constraint chkPrice;

alter table Laptop drop constraint chkModel;
alter table Laptop drop constraint chkRam;
alter table Laptop drop constraint chkHd;
alter table Laptop drop constraint chkPrice;

alter table Printer drop constraint chkModel;
alter table Printer drop constraint chkColor;
alter table Printer drop constraint chkType;
alter table Printer drop constraint chkPrice;
-- insert new (right and wrong data)
insert into Product values ('Z',1014,'pc');
insert into Product values ('Z',2015,'laptop');
insert into Product values ('Z',3016,'printer');
insert into Product values ('ZZ',9000,'pc');
insert into Product values ('ZZ',9001,'laptop');
insert into Product values ('ZZ',9002,'printer');

insert into PC values (1014,1.0,256,1024,800);
insert into PC values (9000,-1.0,256,1024,800);

insert into Laptop values (2015,4.0,512,512,13.3,5000);
insert into Laptop values (9001,1.0,256,256,20.3,2000);

insert into Printer values (3016, 'false', 'bubble-jet', 500);
insert into Printer values (9002, 'true', 'bobble-jet', 1000);
-- delete wrong data
delete from Laptop
where (speed<2.0);
-- add constraint to table
alter table Laptop 
add constraint chkSpd 
    check(speed >= 2.0);
-- delete wrong data
delete from Printer 
where (`type` not in ('ink-jet', 'laser', 'bubble-jet'));
-- add constraint to table
alter table Printer 
add constraint chkType 
    check(`type` in ('ink-jet', 'laser', 'bubble-jet'));
-- add constraint to table
alter table Product 
add constraint chkType 
check(`type` in ('pc','laptop', 'printer'));

--create trigger 
-- as close to psuedo code as possible / when not allowed in mariadb / where is not allowed in set clause
create trigger chkSpeed
before insert on PC
for each row
set new.speed = abs(new.speed);