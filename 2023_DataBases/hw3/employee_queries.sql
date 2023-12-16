-- Вызов процедуры get_employees_by_salary с параметром 60000 (пороговая зарплата для отображения сотрудника)
CALL get_employees_by_salary(60000);

-- Вызов функции get_department_salary с параметром 3 (третий департамент)
SELECT get_department_salary(3) AS total_salary_in_department_1;

-- Вызов процедуры, подсчитывающей и возвращающей сумму по департаменту
CALL get_department_salary_procedure(3, @result);
SELECT @result AS total_salary_in_department_1;
