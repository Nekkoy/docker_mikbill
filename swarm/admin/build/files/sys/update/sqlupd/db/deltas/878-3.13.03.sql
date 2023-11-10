--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mod_omnicell_transactions` (
	`transaction_id` VARCHAR(40) NOT NULL COMMENT 'ID транзакции' ,
	`uid` INT NOT NULL DEFAULT '0' COMMENT 'ID абонента' ,
	`operation_name` VARCHAR(64) NULL DEFAULT NULL COMMENT 'название запроса' ,
	`request_body` TINYBLOB NULL DEFAULT NULL COMMENT 'body запроса' ,
	`failed_attempts` TINYINT NOT NULL DEFAULT '0' COMMENT 'количество неудач' ,
	`response_code` VARCHAR(16) NULL DEFAULT NULL COMMENT 'код ответа' ,
	`response_desc` VARCHAR(254) NULL DEFAULT NULL COMMENT 'описание из ответа'
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `mod_omnicell_transactions` ADD UNIQUE `transaction_id` (`transaction_id`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;