-- Схема для задания 1
CREATE TABLE book (
    id INT,
    name VARCHAR(50) CHARACTER SET utf8mb4,
    author VARCHAR(50) CHARACTER SET utf8mb4,
    publisher VARCHAR(100) CHARACTER SET utf8mb4,
    year_of_publication INT
);

INSERT INTO book (id, name, author, publisher, year_of_publication) VALUES
(1, 'Le Tour du Monde en 80 Jours', 'Jules Verne', 'T8', 2016),
(2, 'ABC Delf', 'Marie-Louise Parizet', 'CLE INTERNATIONAL', 2021),
(3, 'Курс общей физики', 'И.В.Савельев', 'ИЗДАТЕЛЬСТВО "НАУКА"', 1977),
(4, 'Белеет парус одинокий', 'Валентин Катаев', 'Издательство "Радянська школа"', 1984),
(5, 'Джейн Эйр', 'Шарлотта Бронте', 'Издательская группа "Лениздат"', 2012),
(6, 'Ярмарка тщеславия', 'В.Теккерей', 'Государственное издательство художественной литературы', 1961),
(7, 'Маленький принц', 'Антуан де Сент-Экзюпери', '#эксмодетство', 2017);


-- Схема для задания 2
CREATE TABLE actor (
    id INT,
    name VARCHAR(50),
    birth_date DATE,
    country VARCHAR(50),
    has_oscar BOOLEAN
);

INSERT INTO actor (id, name, birth_date, country, has_oscar) VALUES
(1, 'Leonardo DiCaprio', '1974-11-11', 'USA', TRUE),
(2, 'Meryl Streep', '1949-06-22', 'USA', TRUE),
(3, 'Tom Hanks', '1956-07-09', 'USA', TRUE),
(4, 'Cate Blanchett', '1969-05-14', 'Australia', TRUE),
(5, 'Shah Rukh Khan', '1965-11-02', 'India', FALSE),
(6, 'Jim Carrey', '1962-01-17', 'Canada', TRUE),
(7, 'Cameron Diaz', '1972-08-30', 'USA', FALSE),
(8, 'Peter Riegert', '1947-04-11', 'USA', FALSE);


CREATE TABLE film (
    id INT,
    name VARCHAR(50),
    year INT,
    country VARCHAR(50)
);

INSERT INTO film (id, name, year, country) VALUES
(1, 'Titanic', 1997, 'USA'),
(2, 'The Devil Wears Prada', 2006, 'USA'),
(3, 'Forrest Gump', 1994, 'USA'),
(4, 'Elizabeth', 1998, 'UK'),
(5, 'Dilwale Dulhania Le Jayenge', 1995, 'India'),
(6, 'The Mask', 1994, 'USA');


CREATE TABLE acting (
    actor_id INT,
    film_id INT
);

INSERT INTO acting (actor_id, film_id) VALUES
(1, 1), -- Leonardo DiCaprio в Titanic
(2, 2), -- Meryl Streep в The Devil Wears Prada
(3, 3), -- Tom Hanks в Forrest Gump
(4, 4), -- Cate Blanchett в Elizabeth
(5, 5), -- Shah Rukh Khan в Dilwale Dulhania Le Jayenge
(6, 6), -- Jim Carrey в The Mask
(7, 6), -- Cameron Diaz в The Mask
(8, 6); -- Peter Riegert в The Mask


-- Схема для задания 3
CREATE TABLE car (
    number INT,
    make VARCHAR(20),
    model VARCHAR(20),
    status INT
);

INSERT INTO car (number, make, model, status) VALUES
(1, 'Toyota', 'Camry', 1),
(2, 'Honda', 'Accord', 2),
(3, 'Ford', 'Focus', 1),
(4, 'Chevrolet', 'Malibu', 3),
(5, 'Nissan', 'Altima', 1),
(6, 'Volkswagen', 'Jetta', 4);


CREATE TABLE status (
    id INT,
    name VARCHAR(20),
    description VARCHAR(255)
);

INSERT INTO status (id, name, description) VALUES
(1, 'Available', 'Car is available for use'),
(2, 'In Service', 'Car is currently in service'),
(3, 'Maintenance', 'Car is under maintenance'),
(4, 'Unavailable', 'Car is not available for use');


-- Схема для задания 4
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    telephone INT,
    birth_date DATE,
    department SMALLINT,
    salary BIGINT
);

INSERT INTO employee (id, name, telephone, birth_date, department, salary) VALUES
(1, 'John Doe', 123456789, '1990-05-15', 1, 50000),
(2, 'Jane Smith', 987654321, '1985-10-22', 2, 60000),
(3, 'Bob Johnson', 555555555, '1988-03-07', 1, 48000),
(4, 'Alice Williams', 111223344, '1992-12-18', 3, 70000),
(5, 'Charlie Brown', 666777888, '1982-08-25', 2, 55000),
(6, 'Eva Davis', 444333222, '1995-06-30', 3, 62000),
(7, 'Michael Miller', 999000111, '1987-04-12', 1, 52000),
(8, 'Olivia White', 888777666, '1993-11-09', 2, 58000),
(9, 'David Wilson', 777888999, '1986-01-31', 3, 67000),
(10, 'Sophia Martin', 333222111, '1998-09-14', 1, 51000),
(11, 'Matthew Taylor', 222111333, '1984-07-28', 2, 59000),
(12, 'Emma Anderson', 666111888, '1991-04-05', 3, 64000),
(13, 'Andrew Garcia', 111666888, '1996-02-22', 1, 53000),
(14, 'Ava Martinez', 555444666, '1989-08-09', 2, 56000),
(15, 'Daniel Davis', 777444111, '1997-05-18', 3, 69000),
(16, 'Mia Brown', 888333555, '1983-03-26', 1, 50000),
(17, 'Christopher Rodriguez', 999888777, '1994-10-17', 2, 61000),
(18, 'Sophia Hernandez', 333777222, '1985-06-12', 3, 67000),
(19, 'David Walker', 444666333, '1992-12-01', 1, 54000),
(20, 'Emily Baker', 111999333, '1988-07-24', 2, 60000);


-- Схема для задания 5
CREATE TABLE SimsCharacter (
    id INT,
    name VARCHAR(50),
    birth_date DATE,
    address VARCHAR(50),
    post VARCHAR(50),
    pet INT
);

INSERT INTO SimsCharacter (id, name, birth_date, address, post, pet) VALUES 
(1, 'Alice', '1990-05-15', '123 Main St', 'Engineer', 1),
(2, 'Bob', '1985-08-22', '456 Oak St', 'Artist', 5),
(3, 'Charlie', '1998-02-10', '789 Pine St', 'Doctor', 3),
(4, 'David', '1980-11-30', '101 Maple St', 'Teacher', 2),
(5, 'Eve', '1995-07-18', '202 Elm St', 'Programmer', 4);


CREATE TABLE SimsPet (
    id INT,
    category VARCHAR(50),
    breed VARCHAR(50)
);

INSERT INTO SimsPet (id, category, breed) VALUES
    (1, 'dog', 'Golden Retriever'),
    (2, 'cat', 'Siamese'),
    (3, 'bird', 'Parakeet'),
    (4, 'cat', 'Persian'),
    (5, 'dog', 'German Shepherd');
