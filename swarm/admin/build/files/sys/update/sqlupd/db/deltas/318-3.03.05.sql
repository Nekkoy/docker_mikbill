--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES
('absebbankas_on', '0'),
('absebbankas_procent', '0'),
('luminorbank_on', '0'),
('luminorbank_procent', '0'),
('swedbank_on', '0'),
('swedbank_procent', '0'),
('vienasaskaita_on', '0'),
('vienasaskaita_procent', '0'),
('perlas_on', '0'),
('perlas_procent', '0'),
('maxima_on', '0'),
('maxima_procent', '0');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
