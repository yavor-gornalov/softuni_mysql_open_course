USE mountains;

DROP TABLE peaks;
DROP TABLE mountains;

CREATE TABLE mountains(
id int PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) not null);

CREATE TABLE peaks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    mountain_id INT,
    CONSTRAINT fk_peaks_mountains FOREIGN KEY (mountain_id)
        REFERENCES mountains (id)
        ON DELETE CASCADE
)