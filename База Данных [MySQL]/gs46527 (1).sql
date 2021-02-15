-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Сен 13 2020 г., 14:03
-- Версия сервера: 10.1.44-MariaDB-0+deb9u1
-- Версия PHP: 5.6.36-1+0~20180505045928.13+stretch~1.gbp9b5cab

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gs46527`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bans`
--

CREATE TABLE `bans` (
  `name` varchar(24) NOT NULL,
  `bandate` varchar(12) NOT NULL,
  `unbandate` int(11) NOT NULL,
  `bantime` varchar(10) NOT NULL,
  `admin` varchar(24) NOT NULL,
  `reason` varchar(26) NOT NULL,
  `ipban` varchar(15) NOT NULL,
  `idacc` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `ID` int(6) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Log` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `referal`
--

CREATE TABLE `referal` (
  `Name` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Pass` varchar(32) NOT NULL,
  `Email` varchar(46) NOT NULL,
  `EmailActive` int(11) NOT NULL,
  `Referal` varchar(24) NOT NULL,
  `Date Reg` varchar(10) NOT NULL,
  `Nations` int(2) NOT NULL,
  `Age` int(3) NOT NULL,
  `Sex` int(1) NOT NULL,
  `Skin` int(3) NOT NULL,
  `Money` int(11) NOT NULL,
  `Level` int(4) NOT NULL,
  `Admin` int(11) NOT NULL,
  `House` int(11) NOT NULL,
  `Apass` varchar(32) NOT NULL,
  `Car` int(3) NOT NULL,
  `CColor1` int(4) NOT NULL,
  `CColor2` int(5) NOT NULL,
  `CarX` varchar(32) NOT NULL,
  `CarY` varchar(32) NOT NULL,
  `CarZ` varchar(32) NOT NULL,
  `CarAngel` varchar(32) NOT NULL,
  `CarNumber` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `Name`, `Pass`, `Email`, `EmailActive`, `Referal`, `Date Reg`, `Nations`, `Age`, `Sex`, `Skin`, `Money`, `Level`, `Admin`, `House`, `Apass`, `Car`, `CColor1`, `CColor2`, `CarX`, `CarY`, `CarZ`, `CarAngel`, `CarNumber`) VALUES
(1, 'David_Jhonson', '123123', '123412.@a', 0, '', '04/08/2020', 1, 11, 1, 46, 349000, 0, 9, 0, '', 496, 21, 0, '1099.164794', '-1757.823608', '13.066303', '90.023597', 'A777UF'),
(6, 'Sean_Wilson', '123123123', 'sean.vilson@ya.ru', 0, '', '15/08/2020', 1, 14, 1, 311, 770000, 1, 8, 0, 'h4yYH3', 560, 0, 0, '1517.575683', '-694.681213', '94.454833', '89.753463', ''),
(7, 'Maddy_White', 'qazxcvbnm1342', 'ojafjosfhoa@mail.ru', 0, '', '16/08/2020', 5, 24, 1, 79, 0, 1, 0, 0, '', 0, 0, 0, '0', '0', '0', '', ''),
(8, 'Artur_Melnik', '123123123', 'melnicenkon627@gmail.com', 0, '', '17/08/2020', 1, 99, 1, 133, 1000000, 1, 9, 0, 'h4yYH3', 0, 0, 0, '0', '0', '0', '', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
