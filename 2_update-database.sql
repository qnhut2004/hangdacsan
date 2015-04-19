UPDATE `ps_employee` SET `passwd` = md5(CONCAT('sOItYPbIqLqt6dfykLVy9RqOWhn4ai25WFKQ4MsW2Z3zC2TT2vrUbjWD','presthemes')), `email`='demo@presthemes.com' WHERE `ps_employee`.`id_employee`=1;
UPDATE ps_configuration SET `value`='1' where `name`='PS_SMARTY_CACHE';
UPDATE ps_configuration SET `value`='0' where `name`='PS_SMARTY_FORCE_COMPILE';
UPDATE ps_shop_url SET `domain`='YOUR_DOMAIN';
UPDATE ps_shop_url SET `domain_ssl`='YOUR_DOMAIN';
UPDATE ps_shop_url SET `physical_uri`='/YOUR_BASE_URI/';
