CREATE TABLE Product(
    maker VARCHAR(20),
    model INT primary key,
    `type` VARCHAR(20),
    constraint chkModel check(model > 0),
    constraint chkType check (`type` in ('pc', 'laptop' , 'printer'))
);

CREATE TABLE PC(
    model INT primary key,
    speed FLOAT,
    ram INT ,
    hd INT(3) ,
    price INT ,
    constraint chkModel check (model > 0),
    constraint chkRam check (ram > 0),
    constraint chkHd check (hd > 0),
    constraint chkPrice check (price > 0),
    constraint chkSpd check (speed > 0.0)
);

CREATE TABLE Laptop(
    model INT primary key ,
    speed FLOAT,
    ram INT ,
    hd INT ,
    screen FLOAT,
    price INT ,
    constraint chkModel check (model > 0),
    constraint chkRam check (ram > 0),
    constraint chkHd check (hd > 0),
    constraint chkPrice check (price > 0),
    constraint chkSpd check (speed > 0.0),
    constraint chkScreen check (screen > 0.0)
);

CREATE TABLE Printer(
    model INT primary key ,
    color VARCHAR(5) ,
    printerType VARCHAR(10),
    price INT ,
    constraint chkModel check (model > 0),
    constraint chkColor check (color in ('true', 'false')),
    constraint chkType check (printerType in ('ink-jet', 'laser')),
    constraint chkPrice check (price > 0)
);


INSERT INTO Product values ('A', 1001, 'pc');
INSERT INTO Product values ('A', 1002, 'pc');
INSERT INTO Product values ('A', 1003, 'pc');
INSERT INTO Product values ('A', 2004, 'laptop');
INSERT INTO Product values ('A', 2005, 'laptop');
INSERT INTO Product values ('A', 2006, 'laptop');
INSERT INTO Product values ('B', 1004, 'pc');
INSERT INTO Product values ('B', 1005, 'pc');
INSERT INTO Product values ('B', 1006, 'pc');
INSERT INTO Product values ('B', 2007, 'laptop');
INSERT INTO Product values ('C', 1007, 'pc');
INSERT INTO Product values ('D', 1008, 'pc');
INSERT INTO Product values ('D', 1009, 'pc');
INSERT INTO Product values ('D', 1010, 'pc');
INSERT INTO Product values ('D', 3004, 'printer');
INSERT INTO Product values ('D', 3005, 'printer');
INSERT INTO Product values ('E', 1011, 'pc');
INSERT INTO Product values ('E', 1012, 'pc');
INSERT INTO Product values ('E', 1013, 'pc');
INSERT INTO Product values ('E', 2001, 'laptop');
INSERT INTO Product values ('E', 2002, 'laptop');
INSERT INTO Product values ('E', 2003, 'laptop');
INSERT INTO Product values ('E', 3001, 'printer');
INSERT INTO Product values ('E', 3002, 'printer');
INSERT INTO Product values ('E', 3003, 'printer');
INSERT INTO Product values ('F', 2008, 'laptop');
INSERT INTO Product values ('F', 2009, 'laptop');
INSERT INTO Product values ('G', 2010, 'laptop');
INSERT INTO Product values ('H', 3006, 'printer');
INSERT INTO Product values ('H', 3007, 'printer');

INSERT INTO PC values (1001, 2.66, 1024,250,2114);
INSERT INTO PC values (1002, 2.10, 512,250,995);
INSERT INTO PC values (1003, 1.42, 512,80,478);
INSERT INTO PC values (1004, 2.80, 1024,250,649);
INSERT INTO PC values (1005, 3.20, 512,250,630);
INSERT INTO PC values (1006, 3.20, 1024,320,1049);
INSERT INTO PC values (1007, 2.20, 1024,200, 510);
INSERT INTO PC values (1008, 2.20, 2048,250, 770);
INSERT INTO PC values (1009, 2.00, 1024,250,650); 
INSERT INTO PC values (1010, 2.80, 2048,300,770); 
INSERT INTO PC values (1011, 1.86, 2048, 160,959);
INSERT INTO PC values (1012, 2.80, 1024,160,649);  
INSERT INTO PC values (1013, 3.06, 512,80,529); 

INSERT INTO Laptop values (2001, 2.00, 2048, 240, 20.1, 3673);
INSERT INTO Laptop values (2002, 1.73, 1024, 80, 17.0, 949);
INSERT INTO Laptop values (2003, 1.80, 512, 60, 15.4, 549);
INSERT INTO Laptop values (2004, 2.00, 512, 60, 13.3, 1150);
INSERT INTO Laptop values (2005, 2.16, 1024, 120, 17.0, 2500);
INSERT INTO Laptop values (2006, 2.00, 2048, 80, 15.4, 1700);
INSERT INTO Laptop values (2007, 1.83, 1024, 120, 13.3, 1429);
INSERT INTO Laptop values (2008, 1.60, 1024, 100, 15.4, 900);
INSERT INTO Laptop values (2009, 1.60, 512, 80, 14.1, 680);
INSERT INTO Laptop values (2010, 2.00, 2048, 160, 15.4, 2300);

INSERT INTO Printer values (3001, 'true', 'ink-jet', 99);
INSERT INTO Printer values (3002, 'false', 'laser', 239);
INSERT INTO Printer values (3003, 'true', 'laser', 899);
INSERT INTO Printer values (3004, 'true', 'ink-jet', 120);
INSERT INTO Printer values (3005, 'false', 'laser', 120);
INSERT INTO Printer values (3006, 'true', 'ink-jet', 100);
INSERT INTO Printer values (3007, 'true', 'laser', 200);
