-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
CREATE TABLE `phone_shop`.`phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(64) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `product_count` INT NOT NULL,
  `price` DECIMAL UNSIGNED NULL,
  PRIMARY KEY (`id`));

INSERT INTO `phone_shop`.`phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('BQ-Mobile BQ-2430 Tank Power', 'BQ-Mobile', '4', '92.00');
INSERT INTO `phone_shop`.`phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Realme C11 2021 RMX3231 4GB/64GB', 'Realme', '3', '418.00');
INSERT INTO `phone_shop`.`phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Motorola Moto G31 4GB/128GB', 'Motorola', '2', '761.08');
INSERT INTO `phone_shop`.`phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Xiaomi Redmi Note 12 Pro+ 5G 8GB/256GB', 'Xiaomi', '15', '1350.00');
INSERT INTO `phone_shop`.`phones` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Samsung Galaxy Z Flip4 8GB/512GB', 'Samsung', '4', '2824.13');


-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT product_name, manufacturer, price FROM phone_shop.phones
where product_count > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM phone_shop.phones
WHERE product_name LIKE '%Samsung%';

-- 4.
	-- 4.1
SELECT * FROM phone_shop.phones
WHERE product_name LIKE '%Iphone%';

	-- 4.2
SELECT * FROM phone_shop.phones
WHERE product_name LIKE '%Samsung%';

	-- 4.3
SELECT * FROM phone_shop.phones
WHERE product_name REGEXP "[0-9]";

	-- 4.4
SELECT * FROM phone_shop.phones
WHERE product_name LIKE '%8%';
