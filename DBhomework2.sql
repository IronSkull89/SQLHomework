-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE TABLE `phone_shop`.`sales` (
`id` INT NOT NULL,
`order_date` DATE NOT NULL,
`count_product` INT UNSIGNED NOT NULL,
PRIMARY KEY (`id`));

INSERT INTO `phone_shop`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-02', '156');
INSERT INTO `phone_shop`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-02', '180');
INSERT INTO `phone_shop`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-03', '21');
INSERT INTO `phone_shop`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-04', '124');
INSERT INTO `phone_shop`.`sales` (`order_date`, `count_product`) VALUES ('2022-01-05', '341');

-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT *, 
CASE
	WHEN count_product < 100 THEN 'Маленький заказ'
    WHEN count_product >= 100  AND count_product <=300  THEN 'Средний заказ'
    ELSE 'Большой заказ'
END    
    AS 'Тип заказа'
 FROM phone_shop.sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE TABLE `phone_shop`.`orders` (
`id` INT NOT NULL AUTO_INCREMENT,
`employee_id` VARCHAR(3) NOT NULL,
`amount` DECIMAL(5,2) UNSIGNED NOT NULL,
`order_status` VARCHAR(16) NOT NULL,
PRIMARY KEY (`id`));

 INSERT INTO `phone_shop`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e03', '15', 'OPEN'); 
 INSERT INTO `phone_shop`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e01', '25.5', 'OPEN');
 INSERT INTO `phone_shop`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e05', '100.7', 'CLOSED');
 INSERT INTO `phone_shop`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e02', '22.18', 'OPEN');
 INSERT INTO `phone_shop`.`orders` (`employee_id`, `amount`, `order_status`) VALUES ('e04', '9.5', 'CANCELLED');

SELECT *, 
	CASE
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
		WHEN order_status = 'CLOSED' THEN 'Order is closed'
		ELSE 'Order is cancelled'
	END    
		AS full_oder_status
FROM phone_shop.orders;

-- 4. Чем NULL отличается от 0?
/*Значение поля 0 означает что в ячейке хранится число, то есть ссылка на участок в памяти в катаром хранится набор нулей. Количество зависит от используемого целочисленного типа.
  NULL это пустое значение. Т.е. ссылки на память нет.*/ 
