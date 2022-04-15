create database bikeStore;
use bikeStore;

create table customer(
	costomerID int primary key not null,
    costomerFirstName varchar(50) not null,
    costomerLastName varchar(50) not null,
    costomerPhone varchar(15) not null,
    costomerEmail varchar(50),
    costomerAddress varchar(500) not null,
    costomerCity varchar(50)
);

drop table customer;drop table orders;drop table staff;drop table store;drop table bikeType;

create table store(
	storeID int primary key not null,
    storeName varchar(50) not null,
    storePhone varchar(15) not null,
    storeAddress varchar(500) not null,
    storeCity varchar(50) not null
);

create table staff(
	staffID int not null primary key,
    staffFirstName varchar(50) not null,
    staffLastName varchar(50) not null,
    staffEmail varchar(50) not null UNIQUE,
    staffPhone varchar(15) not null,
    staffStatus bit not null, -- 0=diactive , 1= active
    storeID int not null,
    managerID int,
    foreign key  (storeID) references store (storeID) on delete cascade on update cascade
);


create table orders(
	orderID	int primary key not null,
	orderStatus varchar(50) not null, -- Pending/Processing/Rejected/Completed
	orderDate date not null,
    orderRequiredDate date not null,
    orderShippedDate date not null,
    costomerID int not null,
    storeID int not null,
    staffID int not null,
	foreign key  (storeID) references store (storeID) on delete cascade on update cascade,
    foreign key  (staffID) references staff (staffID) on delete cascade on update cascade
);

create table bridge_customer_order(
	orderID	int not null,
    costomerID int not null,
    PRIMARY KEY (orderID, costomerID),
    foreign key  (orderID) references orders (orderID) on delete cascade on update cascade,
    foreign key  (costomerID) references customer (costomerID) on delete cascade on update cascade
);



create table bikeType(
	bikeTypeID int primary key not null,
    bikeTypeName varchar(50) not null
);






















