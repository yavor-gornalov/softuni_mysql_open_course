USE `exercise`;

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `username` VARCHAR(30) UNIQUE NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` DATE,
    `is_deleted` BOOLEAN,
    PRIMARY KEY (`id`)
);

INSERT INTO `users` (`username`, `password`)
VALUES 
	("test1", "123"),
    ("test2", "123"),
    ("test3", "123"),
    ("test4", "123"),
    ("test5", "123")