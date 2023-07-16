-- 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
select count(*) from likes
 join media on likes.media_id = media.id
 join profiles on media.user_id = profiles.user_id
where TIMESTAMPDIFF(YEAR, birthday, curdate()) < 12;

-- 2. Определить кто больше поставил лайков (всего): мужчины или женщины.
select profiles.gender, count(*) from likes
 join users on likes.user_id = users.id
 join profiles on users.id = profiles.user_id
group by profiles.gender;

-- 3. Вывести всех пользователей, которые не отправляли сообщения.
select users.firstname, users.lastname from users
where users.id not in (
	select distinct users.id from messages
	join users on messages.from_user_id = users.id)
	
-- 4. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.
select count(*) AS count From (SELECT target_user_id FROM semimar_4.friend_requests
									where status = 'approved'
									and initiator_user_id = 1
								UNION
								SELECT initiator_user_id FROM semimar_4.friend_requests
									where status = 'approved'
									and (target_user_id = 1)) fr
join messages on fr.target_user_id = messages.from_user_id
group by target_user_id
having count = (select count(*) AS count From (SELECT target_user_id FROM semimar_4.friend_requests
													where status = 'approved'
													and initiator_user_id = 1
												UNION
												SELECT initiator_user_id FROM semimar_4.friend_requests
													where status = 'approved'
													and (target_user_id = 1)) f
				join messages on f.target_user_id = messages.from_user_id
				group by target_user_id
				order by count DESC
				limit 1);	