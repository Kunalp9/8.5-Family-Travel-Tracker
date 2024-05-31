-- POSTGRES SETUP --

DROP TABLE IF EXISTS visited_countries, users;

CREATE TABLE users(
id SERIAL PRIMARY KEY,
name VARCHAR(15) UNIQUE NOT NULL,
color VARCHAR(15)
);

CREATE TABLE visited_countries(
id SERIAL PRIMARY KEY,
country_code CHAR(2) NOT NULL,
user_id INTEGER REFERENCES users(id)
);

INSERT INTO users (name, color)
VALUES ('Angela', 'teal'), ('Jack', 'powderblue');

INSERT INTO visited_countries (country_code, user_id)
VALUES ('FR', 1), ('GB', 1), ('CA', 2), ('FR', 2 );

SELECT *
FROM visited_countries
JOIN users
ON users.id = user_id;

--ALTER--
ALTER TABLE visited_countries
	ADD UNIQUE(user_id, country_code);

--UPDATE--
UPDATE users
SET name = 'Angelina'
WHERE id = 1;

SELECT *
FROM users;

--ORDER BY--
SELECT *
FROM users
JOIN visited_countries
ON users.id = user_id
ORDER BY user_id ASC;