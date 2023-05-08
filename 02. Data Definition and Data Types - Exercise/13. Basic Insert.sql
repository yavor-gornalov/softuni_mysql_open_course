USE soft_uni;

CREATE TABLE `towns` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `addresses` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `address_text` VARCHAR(255),
    `town_id` INT
);
    
CREATE TABLE `departments` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255)
);

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `middle_name` VARCHAR(50),
    `last_name` VARCHAR(50) NOT NULL,
    `job_title` VARCHAR(50),
    `department_id` INT,
    `hire_date` DATE,
    `salary` DOUBLE,
    `address_id` INT
);

alter table `employees`
add constraint fk_employees_departments
foreign key `employees`(`department_id`)
references `departments`(`id`);

alter table `employees`
add constraint fk_employees_addresses
foreign key `addresses`(`address_id`)
references `addresses`(`id`);

INSERT INTO `towns` (`name`)
VALUES 
	("Sofia"),
	("Plovdiv"),
	("Varna"),
	("Burgas");


INSERT INTO `departments` (`name`)
VALUES
	("Engineering"),
	("Sales"),
	("Marketing"),
	("Software Development"),
	("Quality Assurance");

insert into `employees`(`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
values
	("Ivan","Ivanov","Ivanov",".NET Developer", 4, date("2013-02-01"), 3500.00),
	("Petar", "Petrov", "Petrov", "Senior Engineer", 1, date("2004-03-02"), 4000.00),
	("Maria", "Petrova", "Ivanova", "Intern", 5, date("2016-08-28"), 525.25),
	("Georgi", "Terziev", "Ivanov", "CEO", 2, date("2007-12-09"), 3000.00),
	("Peter", "Pan", "Pan", "Intern", 3, date("2016-08-28"), 599.88);
