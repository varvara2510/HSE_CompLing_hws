CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    telephone INT NOT NULL UNIQUE,
    birth_date DATE NOT NULL,
    department SMALLINT NOT NULL,
    salary BIGINT NOT NULL
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


-- Процедура, отображающая данные о сотрудниках,имеющих зарплату больше входного параметра
DELIMITER //
CREATE PROCEDURE get_employees_by_salary(IN salary_value BIGINT)
BEGIN
    SELECT *
    FROM employee
    WHERE salary > salary_value;
END;
//
DELIMITER ;


-- Функция, возвращающая суммарную зарплату по департаменту, номер которого пользователь указывает во входном параметре
DELIMITER //

CREATE FUNCTION get_department_salary(department_value SMALLINT)
RETURNS BIGINT
BEGIN
   DECLARE total_salary BIGINT;
   SELECT SUM(salary) INTO total_salary
   FROM employee
   WHERE department = department_value;

   IF total_salary IS NULL THEN  -- если отдел не существует или в нем нет сотрудников
      RETURN 0; 
   ELSE
      RETURN total_salary;
   END IF;
END //

DELIMITER ;


-- Процедура, возвращающая суммарную зарплату по департаменту с использованием параметра OUT
DELIMITER //

CREATE PROCEDURE get_department_salary_procedure(IN department_value SMALLINT, OUT total_salary BIGINT)
BEGIN
   SELECT SUM(salary) INTO total_salary
   FROM employee
   WHERE department = department_value;

   IF total_salary IS NULL THEN
      SET total_salary = 0; -- Если отдел не существует или в нем нет сотрудников
   END IF;
END //

DELIMITER ;
