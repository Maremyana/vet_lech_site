-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 20 2020 г., 01:06
-- Версия сервера: 10.4.6-MariaDB
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lecht`
--

-- --------------------------------------------------------

--
-- Структура таблицы `appointment_with_a_vet`
--

CREATE TABLE `appointment_with_a_vet` (
  `r_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `owner_name` varchar(65) NOT NULL,
  `animal` enum('cat','dog','iguan','raccon','parrot','mouse','rat','snake','rabbit') NOT NULL,
  `animal_name` varchar(65) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `reasons` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `appointment_with_a_vet`
--

INSERT INTO `appointment_with_a_vet` (`r_id`, `id`, `owner_name`, `animal`, `animal_name`, `date`, `time`, `reasons`) VALUES
(15, 2, 'ÐŸÐµÑ‚Ñ€ ÐŸÐµÑ‚Ñ€Ð¾Ð² ÐŸÐµÑ‚Ñ€Ð¾Ð²Ð¸Ñ‡', 'cat', 'ÐŸÐµÑ‚Ñ', '2020-02-20', '09:00:00', 'ÐžÑ‚Ð·Ñ‹Ð²Ð°ÐµÑ‚ÑÑ Ð½Ð° Ð¸Ð¼Ñ Ñ…Ð¾Ð·ÑÐ¸Ð½Ð°'),
(16, 1, 'Ð“Ñ€Ð¸Ð³Ð¾Ñ€Ð¸Ð¹ Ð Ð°ÑÐ¿ÑƒÑ‚Ð¸Ð½ Ð“Ñ€Ð¸Ð³Ð¾Ñ€ÑŒÐµÐ²Ð¸Ñ‡', 'raccon', 'Ð“Ñ€ÐµÑˆÐ°', '2020-02-20', '13:13:00', 'ÐŸÑ€Ð¾Ð±Ð»ÐµÐ¼Ñ‹ Ñ Ð ÐŸÐ¦'),
(17, 2, 'ÐŸÐµÑ‚Ñ€ ÐŸÐµÑ‚Ñ€Ð¾Ð² ÐŸÐµÑ‚Ñ€Ð¾Ð²Ð¸Ñ‡', 'cat', 'ÐŸÐµ', '2020-02-20', '12:12:00', '            <a class=\"btn btn-success\" type=\"button\" href=\"index.php\">Ð“Ð»Ð°Ð²Ð½Ð°Ñ</a>\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `login` text NOT NULL,
  `pswdhash` text NOT NULL,
  `secretinfo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`u_id`, `login`, `pswdhash`, `secretinfo`) VALUES
(1, 'truelogin', 'qwerty1234', 'super secret'),
(2, 'mylogin', 'qwerty1234', 'my private info');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `appointment_with_a_vet`
--
ALTER TABLE `appointment_with_a_vet`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `fk_users_u_id` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `appointment_with_a_vet`
--
ALTER TABLE `appointment_with_a_vet`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `appointment_with_a_vet`
--
ALTER TABLE `appointment_with_a_vet`
  ADD CONSTRAINT `appointment_with_a_vet_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`u_id`),
  ADD CONSTRAINT `fk_users_u_id` FOREIGN KEY (`id`) REFERENCES `users` (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
