SET NAMES 'utf8';

DELIMITER $$

DROP FUNCTION IF EXISTS check_money_func$$
CREATE FUNCTION check_money_func(input_uid int)
  RETURNS int(11)
  DETERMINISTIC
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT 'get sum by user'
BEGIN
  DECLARE tmp_value int;
  DECLARE return_value int DEFAULT 0;

  # do basic search
  SELECT
    SUM(deposit + credit) INTO tmp_value
  FROM users
  WHERE uid = input_uid;

  IF tmp_value
  THEN
    SET return_value = tmp_value;
  ELSE
    # search in freezed
    SELECT
      SUM(deposit + credit) INTO tmp_value
    FROM usersfreeze
    WHERE uid = input_uid;
    # do check
    IF tmp_value
    THEN
      SET return_value = tmp_value;
    ELSE
      # search in otkl
      SELECT
        SUM(deposit + credit) INTO tmp_value
      FROM usersblok
      WHERE uid = input_uid;
      # do check
      IF tmp_value
      THEN
        SET return_value = tmp_value;
      ELSE
        # search in deleted
        SELECT
          SUM(deposit + credit) INTO tmp_value
        FROM usersdel
        WHERE uid = input_uid;
        IF tmp_value
        THEN
          SET return_value = tmp_value;
        ELSE
          #user unknown
          SET return_value = NULL;
        END IF;
      END IF;
    END IF;
  END IF;
  RETURN return_value;

END
$$

DELIMITER ;

DELIMITER $$

DROP FUNCTION IF EXISTS check_blocked_func$$
CREATE FUNCTION check_blocked_func(input_uid int)
  RETURNS int(11)
  DETERMINISTIC
  SQL SECURITY INVOKER
  READS SQL DATA
  COMMENT 'Check user for blocked=1'
BEGIN
  DECLARE tmp_value int;
  DECLARE return_value int DEFAULT 0;

  # do basic search
  SELECT
    blocked INTO tmp_value
  FROM users
  WHERE uid = input_uid;

  IF tmp_value
  THEN
    SET return_value = tmp_value;
  ELSE
    # search in freezed
    SELECT
      blocked INTO tmp_value
    FROM usersfreeze
    WHERE uid = input_uid;
    # do check
    IF tmp_value
    THEN
      SET return_value = tmp_value;
    ELSE
      # search in otkl
      SELECT
        blocked INTO tmp_value
      FROM usersblok
      WHERE uid = input_uid;
      # do check
      IF tmp_value
      THEN
        SET return_value = tmp_value;
      ELSE
        # search in deleted
        SELECT
          blocked INTO tmp_value
        FROM usersdel
        WHERE uid = input_uid;
        IF tmp_value
        THEN
          SET return_value = tmp_value;
        ELSE
          #user unknown
          SET return_value = NULL;
        END IF;
      END IF;
    END IF;
  END IF;
  RETURN return_value;
END
$$

DELIMITER ;
