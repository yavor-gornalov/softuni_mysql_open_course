use `gamebar`;

ALTER TABLE `employees` 
ADD COLUMN `middle_name` VARCHAR(50) NULL AFTER `first_name`;