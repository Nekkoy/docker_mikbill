--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='pass' AND logtypeid = 11;

UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='pass' AND logtypeid = 19;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='comunity' AND logtypeid = 19;

UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='naspass' AND logtypeid = 7;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='secret' AND logtypeid = 7;

UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='smtppass' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='iptvportal_pass' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='sms_gateway_password' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='olltv_pass' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='stalkerportal_pass' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='sms_gateway_apikey' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='api_key' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='nonstop_key' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='merc_sign' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='merc_sign_other' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='copayco_sign_key' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='wqiwiru_secret' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='compay_secret' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='onpay_secret' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='privat24_sign' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='pscb_MrchKey' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='paymaster_secretkey' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='cyberplat_private_passphrase' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='simplepay_secretKey' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='simplepay_secretKeyRes' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='isbank_store_key' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='tinkoff_secret_key' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='kassira_net_password' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='platezhka_password' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='sberbank_russia_password' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='familny_secret' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='alltime24_secret' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='wqiwiru_rest_pwd' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='wqiwiru_rest_api_pwd' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='robokassa_mrh_pass2' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='robokassa_mrh_pass1' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='stripe_secret_key' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='paykeeper_secret_seed' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='ukrpays_secret_seed' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='ukrpays_file_cert' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='yandex_private_key' AND logtypeid = 5;
UPDATE logs SET oldvalue = '', newvalue = '' WHERE valuename='yandex_secret_seed' AND logtypeid = 5;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
