CREATE TABLE staff (
id INT PRIMARY KEY auto_increment,
firstname varchar(50) NOT NULL,
lastname varchar(50) NOT NULL,
post varchar(50),
seniority INT,
salary DECIMAL,
age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Вася', 'Петров', 'Начальник', 40, 100000, 60);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Петр', 'Власов', 'Начальник', 8, 70000, 30);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Катя', 'Катина', 'Инженер', 2, 70000, 25);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Саша', 'Сасин', 'Инженер', 12, 50000, 35);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Петр', 'Петров', 'Рабочий', 20, 25000, 40);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24);
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) values ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT * FROM new_schema.staff
order by salary DESC;

-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT salary FROM new_schema.staff
order by salary DESC
limit 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT sum(salary) FROM new_schema.staff
group by post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT count(*) FROM new_schema.staff
where post = 'Рабочий' and age between 25 and 49;

-- 5. Найдите количество специальностей
SELECT count(t.post) FROM 
	(SELECT post FROM new_schema.staff
	group by post) t


-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post FROM new_schema.staff
group by post
having avg(age) < 30;