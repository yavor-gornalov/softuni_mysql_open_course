USE car_rental;

create table `categories` (
	`id` int primary key auto_increment,
    `category` varchar(50) not null,
    `daily_rate` double, 
    `weekly_rate` double, 
    `monthly_rate` double, 
    `weekend_rate` double
);

insert into `categories`(`category`)
values 
	("category 1"),
	("category 2"),
	("category 3");
    
create table `cars` (
	`id` int primary key auto_increment,
    `plate_number` varchar(20) not null,
    `make` varchar(20) not null, 
    `model`varchar(20) not null, 
    `car_year` date, 
    `category_id` int,
    `doors` int, 
    `picture` blob, 
    `car_condition` varchar(20),
	`available` boolean
);

insert into `cars`(`plate_number`,`make`,`model`)
values 
	("CT0010KK", "BMW", "E46"),
	("CT0011KK", "BMW", "E46"),
	("CT0012KK", "BMW", "E46");
    
create table `employees` (
	`id` int primary key auto_increment, 
    `first_name` varchar(25) not null,
    `last_name` varchar(25) not null,
    `title` varchar(25),
    `notes` text
);
    
insert into `employees`(`first_name`, `last_name`) 
values 
	("John", "Johnson"),
	("Test", "Test1"),
	("Test", "Test2");
    
create table `customers` (
	`id` int primary key auto_increment, 
    `driver_licence_number` varchar(20) not null, 
    `full_name` varchar(50) not null, 
    `address` varchar(255), 
    `city` varchar(25), 
    `zip_code` int,
    `notes` text);
    
insert into `customers` (`driver_licence_number`, `full_name`)
values
	("CT0010KK", "test testov 1"),
	("CT0011KK", "test testov 2"),
	("CT0012KK", "test testov 3");
    
create table `rental_orders` (
	`id` int primary key auto_increment, 
    `employee_id` int,
    `customer_id` int, 
    `car_id` int, 
    `car_condition` varchar(50), 
    `tank_level` int,
    `kilometrage_start` double(10,1), 
    `kilometrage_end`double(10,1), 
    `total_kilometrage` double, 
    `start_date` date, 
    `end_date` date,
	`total_days` int, 
    `rate_applied`double, 
    `tax_rate`double, 
    `order_status` varchar(25), 
    `notes` text
);

insert into `rental_orders` (`start_date`, `end_date`, `order_status`)
values 
	(date(now()-1), date(now()), "accepted"),
	(date(now()-1), date(now()), "delayed"),
	(date(now()-1), date(now()), "not finished");
    