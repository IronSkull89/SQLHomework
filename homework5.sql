-- 1. Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет.
create view usersOlds20 AS
SELECT firstname, lastname, hometown, gender FROM users
join profiles on profiles.user_id = users.id
where TIMESTAMPDIFF(YEAR, birthday, curdate()) < 20;

-- 2. Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей, указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге (первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)
select dense_rank() OVER (order by count(messages.id) DESC), users.firstname, users.lastname, count(messages.id) from users
join messages on users.id = messages.from_user_id
group by users.id;

-- 3. Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at) и найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)
select *, created_at - lag(created_at) over (order by created_at) as time_until_previous, lead(created_at) over (order by created_at) - created_at as time_until_next 
from messages
order by created_at;