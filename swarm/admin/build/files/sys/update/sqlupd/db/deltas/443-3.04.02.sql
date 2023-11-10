--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `cabinet_menu_items` (`id`, `name`, `link`, `usersgroupid`, `parent`, `sort`, `hide`, `icon`, `hook`) VALUES
(1, 'Главная', '/', 0, 0, 0, 0, 'icon-home', ''),
(2, 'Услуги', '#', 0, 0, 0, 0, 'icon-check', 'services'),
(3, 'Доп. услуги', '/index/main/lkview/services', 0, 0, 0, 0, 'icon-check', 'services_additional'),
(4, 'Пополнение', '/index/main/lkview/payment', 0, 0, 0, 0, 'icon-money', 'payment'),
(5, 'OmegaTV', '/index/main/lkview/omegatv', 0, 0, 0, 0, 'icon-star', 'omegatv'),
(6, 'TRINITY-TV', '/index/main/lkview/trinitytv', 0, 0, 0, 0, 'icon-star', 'trinitytv'),
(7, 'IVI.RU', '/index/main/lkview/ivi', 0, 0, 0, 0, 'icon-star', 'ivi'),
(8, '24h.tv', '/index/main/lkview/24htv', 0, 0, 0, 0, 'icon-star', '24htv'),
(9, 'Smotreshka', '/index/main/lkview/smotreshka', 0, 0, 0, 0, 'icon-star', 'smotreshka'),
(10, 'Megogo', '/index/main/lkview/megogo', 0, 0, 0, 0, 'icon-star', 'megogo'),
(11, 'Oll.TV', '/index/main/lkview/olltv', 0, 0, 0, 0, 'icon-star', 'olltv'),
(12, 'IptvPortal', '/index/main/lkview/iptvportal', 0, 0, 0, 0, 'icon-star', 'iptvportal'),
(13, 'Антивирусы и ПО', '/index/main/lkview/rentsoft', 0, 0, 0, 0, 'icon-shield', 'rentsoft'),
(14, 'История', '#', 0, 0, 0, 0, 'icon-time', 'history'),
(15, 'Контакты', '/index/main/lkview/contact', 0, 0, 0, 0, 'icon-envelope', 'contact'),
(16, 'Смена тарифа', '/index/main/lkview/tariff', 0, 2, 0, 0, '', 'tariff'),
(17, 'Турбо', '/index/main/lkview/turbo', 0, 2, 0, 0, '', 'turbo'),
(18, 'Реальный IP', '/index/main/lkview/deactivaterealip', 0, 2, 0, 0, '', 'deactivaterealip'),
(19, 'Реальный IP', '/index/main/lkview/activaterealip', 0, 2, 0, 0, '', 'activaterealip'),
(20, 'Перевод средств', '/index/main/lkview/perevod', 0, 2, 0, 0, '', 'perevod'),
(21, 'Кредит', '/index/main/lkview/credit', 0, 2, 0, 0, '', 'credit'),
(22, 'Заморозка', '/index/main/lkview/freeze', 0, 2, 0, 0, '', 'freeze'),
(23, 'История платежей', '/index/main/lkview/historypayment', 0, 14, 0, 0, '', 'historypayment'),
(24, 'История сессий', '/index/main/lkview/historysession', 0, 14, 0, 0, '', 'historysession'),
(100, 'Тестовое меню', '#', 0, 0, 0, 1, 'icon-shield', '');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;