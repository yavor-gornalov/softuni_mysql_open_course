CREATE SCHEMA  fsd;

USE fsd;

CREATE TABLE players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT NOT NULL DEFAULT 0,
    position CHAR(1) NOT NULL,
    salary DECIMAL(10 , 2 ) NOT NULL DEFAULT 0,
    hire_date DATETIME,
    skills_data_id INT NOT NULL,
    team_id INT
);

CREATE TABLE players_coaches (
    player_id INT,
    coach_id INT
);

CREATE TABLE coaches (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary DECIMAL(10 , 2 ) DEFAULT 0,
    coach_level INT NOT NULL DEFAULT 0
);

CREATE TABLE skills_data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dribbling INT DEFAULT 0,
    pace INT DEFAULT 0,
    passing INT DEFAULT 0,
    shooting INT DEFAULT 0,
    speed INT DEFAULT 0,
    strength INT DEFAULT 0
);

CREATE TABLE teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    established DATE NOT NULL,
    fan_base BIGINT NOT NULL DEFAULT 0,
    stadium_id INT NOT NULL
);

CREATE TABLE stadiums (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    capacity INT NOT NULL,
    town_id INT NOT NULL
);

CREATE TABLE towns (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    country_id INT NOT NULL
);

CREATE TABLE countries (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL
);

ALTER TABLE players 
ADD CONSTRAINT fk_players_skills_data FOREIGN KEY (skills_data_id) REFERENCES skills_data(id),
ADD CONSTRAINT fk_players_teams FOREIGN KEY (team_id) REFERENCES teams(id);

ALTER TABLE players_coaches
ADD CONSTRAINT pk_players_coaches PRIMARY KEY (player_id, coach_id),
ADD CONSTRAINT fk_players_coaches_players FOREIGN KEY (player_id) REFERENCES players(id),
ADD CONSTRAINT fk_players_coaches_coaches FOREIGN KEY (coach_id) REFERENCES coaches(id);

ALTER TABLE teams
ADD CONSTRAINT fk_teams_stadiums FOREIGN KEY (stadium_id) REFERENCES stadiums(id);

ALTER TABLE stadiums
ADD CONSTRAINT fk_stadiums_towns FOREIGN KEY (town_id) REFERENCES towns(id);

ALTER TABLE towns
ADD CONSTRAINT fk_towns_countries FOREIGN KEY (country_id) REFERENCES countries(id);