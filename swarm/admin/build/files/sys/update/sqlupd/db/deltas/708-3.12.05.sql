--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

DELIMITER //
CREATE FUNCTION firstNumber(s TEXT)
    RETURNS INTEGER
    COMMENT 'Returns the first integer found in a string'
    DETERMINISTIC
    BEGIN

    DECLARE token TEXT DEFAULT '';
    DECLARE len INTEGER DEFAULT 0;
    DECLARE ind INTEGER DEFAULT 0;
    DECLARE thisChar CHAR(1) DEFAULT ' ';

    SET len = CHAR_LENGTH(s);
    SET ind = 1;
    WHILE ind <= len DO
        SET thisChar = SUBSTRING(s, ind, 1);
        IF (ORD(thisChar) >= 48 AND ORD(thisChar) <= 57) THEN
            SET token = CONCAT(token, thisChar);
        ELSEIF token <> '' THEN
            SET ind = len + 1;
        END IF;
        SET ind = ind + 1;
    END WHILE;

    IF token = '' THEN
        RETURN 0;
    END IF;

    RETURN token;

    END //
DELIMITER ;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
