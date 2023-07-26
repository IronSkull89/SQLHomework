-- 1. Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old.
-- (использование транзакции с выбором commit или rollback – обязательно).
create table users_old (
	id int primary key,
    firstname varchar(50),
    lastname varchar(50),
    email varchar(120)
);

delimiter //
CREATE PROCEDURE insert_users_old (IN id_users INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK; 
	END;
  
    START TRANSACTION;
        INSERT INTO users_old 
			SELECT * FROM users
			WHERE id = id_users;
    COMMIT;  
END//
delimiter ;
       
CALL insert_users_old(1);       

-- 2. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
--  С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
DELIMITER //
 
CREATE FUNCTION Hello()
RETURNS varchar(20)
DETERMINISTIC
BEGIN
  DECLARE time_enter time;
  DECLARE message varchar(20);
  SET time_enter = CURRENT_TIME();
  IF time_enter BETWEEN '6:00:00' AND '11:59:59' THEN SET message = 'Доброе утро';
  ELSEIF time_enter BETWEEN '12:00:00' AND '17:59:59' THEN SET message = 'Добрый день';
  ELSEIF time_enter BETWEEN '18:00:00' AND '23:59:59' THEN SET message = 'Добрый вечер';
  ELSE SET message = 'Доброй ночи';
  END IF;
  RETURN message;
END//
 
DELIMITER ;

SELECT Hello() AS message;

-- 3. Создайте таблицу logs типа Archive.
-- Пусть при каждом создании записи в таблицах users, communities и messages в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа.
 CREATE TABLE insert_logs (
	id int primary key AUTO_INCREMENT,
    date_time DATETIME,
    name_table varchar(30)    
);

DELIMITER //
CREATE TRIGGER write_insertlogs_users
BEFORE INSERT ON `users`
FOR EACH ROW
BEGIN
INSERT INTO insert_logs(date_time, name_table) VALUES (current_timestamp(), 'users');
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER write_insertlogs_comcommunities
BEFORE INSERT ON `communities`
FOR EACH ROW
BEGIN
INSERT INTO insert_logs(date_time, name_table) VALUES (current_timestamp(), 'communities');
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER write_insertlogs_messages
BEFORE INSERT ON `messages`
FOR EACH ROW
BEGIN
INSERT INTO insert_logs(date_time, name_table) VALUES (current_timestamp(), 'messages');
END//
DELIMITER ;
