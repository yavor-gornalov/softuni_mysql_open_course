create database db_projects;

use db_projects;

CREATE TABLE clients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    project_id INT
);

CREATE TABLE projects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    project_lead_id INT
);

ALTER TABLE projects 
ADD constraint FOREIGN KEY (client_id) 
	REFERENCES clients(id), 
ADD CONSTRAINT FOREIGN KEY(project_lead_id) 
	REFERENCES employees(id);

ALTER TABLE employees
ADD CONSTRAINT FOREIGN KEY (project_id)
	REFERENCES projects(id);

