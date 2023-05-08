use `Movies`;

CREATE TABLE `directors` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);
CREATE TABLE `genres` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);
CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);
CREATE TABLE `movies` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `director_id` INT,
    `copyright_year` DATE,
    `length` INT,
    `genre_id` INT,
    `category_id` INT,
    `rating` DOUBLE,
    `notes` TEXT
);

insert into `directors`(`director_name`) values ("John Smith"), ("Alexaner Johnson"), ("Carolina Hererra"), ("Director 4"), ("Director 5");
insert into `categories`(`category_name`) values ("Serials"), ("Movies"), ("Category 3"), ("Category 4"), ("Category 5");
insert into `genres`(`genre_name`) values ("Comedy"),("Drama"), ("Action"), ("Genre 4"), ("Genre 5");

insert into `movies`(`title`, `director_id`,`copyright_year`,`genre_id`,`category_id`) 
values 
	("Movie 1",1,date(now()) ,1,2),
	("Movie 2",2,date(now()) ,2,2),
	("Movie 3",3,date(now()) ,1,2),
	("Serial 1",1,date(now()) ,2,1),
	("Serial 2",2,date(now()) ,3,1);

