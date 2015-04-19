
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `ps_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_tab` int(10) unsigned NOT NULL,
  `view` int(11) NOT NULL,
  `add` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `delete` int(11) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_accessory` (
  `id_product_1` int(10) unsigned NOT NULL,
  `id_product_2` int(10) unsigned NOT NULL,
  KEY `accessory_product` (`id_product_1`,`id_product_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_address` (
  `id_address` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_manufacturer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_supplier` int(10) unsigned NOT NULL DEFAULT '0',
  `id_warehouse` int(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(32) NOT NULL,
  `company` varchar(64) DEFAULT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `other` text,
  `phone` varchar(32) DEFAULT NULL,
  `phone_mobile` varchar(32) DEFAULT NULL,
  `vat_number` varchar(32) DEFAULT NULL,
  `dni` varchar(16) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_address`),
  KEY `address_customer` (`id_customer`),
  KEY `id_country` (`id_country`),
  KEY `id_state` (`id_state`),
  KEY `id_manufacturer` (`id_manufacturer`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_warehouse` (`id_warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_address_format` (
  `id_country` int(10) unsigned NOT NULL,
  `format` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_advice` (
  `id_advice` int(11) NOT NULL AUTO_INCREMENT,
  `id_ps_advice` int(11) NOT NULL,
  `id_tab` int(11) NOT NULL,
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `location` enum('after','before') NOT NULL,
  `selector` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_advice`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_advice_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_advice_lang` (
  `id_advice` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `html` text,
  PRIMARY KEY (`id_advice`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_alias` (
  `id_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `search` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_attachment` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(40) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `mime` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_attachment_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_attachment_lang` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_attachment`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_attribute` (
  `id_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_attribute_group` int(10) unsigned NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute`),
  KEY `attribute_group` (`id_attribute_group`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_attribute_group` (
  `id_attribute_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_color_group` tinyint(1) NOT NULL DEFAULT '0',
  `group_type` enum('select','radio','color') NOT NULL DEFAULT 'select',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_attribute_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_attribute_group_lang` (
  `id_attribute_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `public_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_attribute_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_attribute_group_shop` (
  `id_attribute_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_attribute_impact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_attribute_impact` (
  `id_attribute_impact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_attribute` int(11) unsigned NOT NULL,
  `weight` decimal(20,6) NOT NULL,
  `price` decimal(17,2) NOT NULL,
  PRIMARY KEY (`id_attribute_impact`),
  UNIQUE KEY `id_product` (`id_product`,`id_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_attribute_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_attribute_lang` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_attribute_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_attribute_shop` (
  `id_attribute` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_badge` (
  `id_badge` int(11) NOT NULL AUTO_INCREMENT,
  `id_ps_badge` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `id_group` int(11) NOT NULL,
  `group_position` int(11) NOT NULL,
  `scoring` int(11) NOT NULL,
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_badge`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_badge_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_badge_lang` (
  `id_badge` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_badge`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_carrier` (
  `id_carrier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_reference` int(10) unsigned NOT NULL,
  `id_tax_rules_group` int(10) unsigned DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_handling` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `range_behavior` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_module` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_external` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `need_range` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_module_name` varchar(64) DEFAULT NULL,
  `shipping_method` int(2) NOT NULL DEFAULT '0',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `max_width` int(10) DEFAULT '0',
  `max_height` int(10) DEFAULT '0',
  `max_depth` int(10) DEFAULT '0',
  `max_weight` decimal(20,6) DEFAULT '0.000000',
  `grade` int(10) DEFAULT '0',
  PRIMARY KEY (`id_carrier`),
  KEY `deleted` (`deleted`,`active`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_carrier_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_carrier_group` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_carrier_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_carrier_lang` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `delay` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_lang`,`id_shop`,`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_carrier_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_carrier_shop` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_carrier_tax_rules_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_carrier_tax_rules_group_shop` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_tax_rules_group`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_carrier_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_carrier_zone` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart` (
  `id_cart` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_carrier` int(10) unsigned NOT NULL,
  `delivery_option` text NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_guest` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT '0',
  `allow_seperated_package` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `cart_customer` (`id_customer`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_guest` (`id_guest`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_cart_rule` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_cart_rule` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart`,`id_cart_rule`),
  KEY `id_cart_rule` (`id_cart_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_product` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned DEFAULT '0',
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_product_attribute` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  KEY `cart_product_index` (`id_cart`,`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule` (
  `id_cart_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `description` text,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity_per_user` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '1',
  `partial_use` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `code` varchar(254) NOT NULL,
  `minimum_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `minimum_amount_tax` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_amount_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `minimum_amount_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `country_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `carrier_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cart_rule_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `product_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shop_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `reduction_tax` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reduction_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `reduction_product` int(10) NOT NULL DEFAULT '0',
  `gift_product` int(10) unsigned NOT NULL DEFAULT '0',
  `gift_product_attribute` int(10) unsigned NOT NULL DEFAULT '0',
  `highlight` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_cart_rule`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule_carrier` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_carrier` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule_combination` (
  `id_cart_rule_1` int(10) unsigned NOT NULL,
  `id_cart_rule_2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule_1`,`id_cart_rule_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule_country` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule_group` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule_lang` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(254) NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule_product_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule_product_rule` (
  `id_product_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_rule_group` int(10) unsigned NOT NULL,
  `type` enum('products','categories','attributes','manufacturers','suppliers') NOT NULL,
  PRIMARY KEY (`id_product_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule_product_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule_product_rule_group` (
  `id_product_rule_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart_rule` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_rule_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule_product_rule_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule_product_rule_value` (
  `id_product_rule` int(10) unsigned NOT NULL,
  `id_item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_rule`,`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cart_rule_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cart_rule_shop` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT '1',
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nleft` int(10) unsigned NOT NULL DEFAULT '0',
  `nright` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_root_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  KEY `category_parent` (`id_parent`),
  KEY `nleftright` (`nleft`,`nright`),
  KEY `nleftrightactive` (`nleft`,`nright`,`active`),
  KEY `level_depth` (`level_depth`),
  KEY `nright` (`nright`),
  KEY `nleft` (`nleft`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_category_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_category_group` (
  `id_category` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_category`,`id_group`),
  KEY `id_category` (`id_category`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_category_lang` (
  `id_category` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`,`id_shop`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_category_product` (
  `id_category` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`,`id_product`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_category_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_category_shop` (
  `id_category` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_category` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cms`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cms_block` (
  `id_cms_block` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_category` int(10) unsigned NOT NULL,
  `location` tinyint(1) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `display_store` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cms_block`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cms_block_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cms_block_lang` (
  `id_cms_block` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cms_block`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cms_block_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cms_block_page` (
  `id_cms_block_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_block` int(10) unsigned NOT NULL,
  `id_cms` int(10) unsigned NOT NULL,
  `is_category` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_block_page`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cms_block_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cms_block_shop` (
  `id_cms_block` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_block`,`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cms_category` (
  `id_cms_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cms_category`),
  KEY `category_parent` (`id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cms_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cms_category_lang` (
  `id_cms_category` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cms_category`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cms_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cms_lang` (
  `id_cms` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `meta_title` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content` longtext,
  `link_rewrite` varchar(128) NOT NULL,
  PRIMARY KEY (`id_cms`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cms_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cms_shop` (
  `id_cms` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_cms`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_compare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_compare` (
  `id_compare` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_compare`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_compare_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_compare_product` (
  `id_compare` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_compare`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_condition` (
  `id_condition` int(11) NOT NULL AUTO_INCREMENT,
  `id_ps_condition` int(11) NOT NULL,
  `type` enum('configuration','install','sql') NOT NULL,
  `request` text,
  `operator` varchar(32) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `result` varchar(64) DEFAULT NULL,
  `calculation_type` enum('hook','time') DEFAULT NULL,
  `calculation_detail` varchar(64) DEFAULT NULL,
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_condition`,`id_ps_condition`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_condition_advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_condition_advice` (
  `id_condition` int(11) NOT NULL,
  `id_advice` int(11) NOT NULL,
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_condition`,`id_advice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_condition_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_condition_badge` (
  `id_condition` int(11) NOT NULL,
  `id_badge` int(11) NOT NULL,
  PRIMARY KEY (`id_condition`,`id_badge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_configuration` (
  `id_configuration` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned DEFAULT NULL,
  `id_shop` int(11) unsigned DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `value` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration`),
  KEY `name` (`name`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_configuration_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_configuration_lang` (
  `id_configuration` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` text,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_connections` (
  `id_connections` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_guest` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `ip_address` bigint(20) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_connections`),
  KEY `id_guest` (`id_guest`),
  KEY `date_add` (`date_add`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=355 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_connections_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_connections_page` (
  `id_connections` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id_connections`,`id_page`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_connections_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_connections_source` (
  `id_connections_source` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_connections` int(10) unsigned NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `request_uri` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_connections_source`),
  KEY `connections` (`id_connections`),
  KEY `orderby` (`date_add`),
  KEY `http_referer` (`http_referer`),
  KEY `request_uri` (`request_uri`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_contact` (
  `id_contact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `customer_service` tinyint(1) NOT NULL DEFAULT '0',
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_contact_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_contact_lang` (
  `id_contact` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text,
  PRIMARY KEY (`id_contact`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_contact_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_contact_shop` (
  `id_contact` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_contact`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_country` (
  `id_country` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_zone` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_code` varchar(3) NOT NULL,
  `call_prefix` int(10) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `contains_states` tinyint(1) NOT NULL DEFAULT '0',
  `need_identification_number` tinyint(1) NOT NULL DEFAULT '0',
  `need_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `zip_code_format` varchar(12) NOT NULL DEFAULT '',
  `display_tax_label` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_country`),
  KEY `country_iso_code` (`iso_code`),
  KEY `country_` (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_country_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_country_lang` (
  `id_country` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_country`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_country_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_country_shop` (
  `id_country` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_country`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csfilterproductcenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csfilterproductcenter` (
  `id_tab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_type` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `hook` int(10) unsigned DEFAULT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tab`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csfilterproductcenter_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csfilterproductcenter_lang` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tab`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csfilterproductcenter_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csfilterproductcenter_shop` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tab`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csfilterproductleft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csfilterproductleft` (
  `id_tab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_type` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `hook` int(10) unsigned DEFAULT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tab`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csfilterproductleft_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csfilterproductleft_lang` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tab`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csfilterproductleft_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csfilterproductleft_shop` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tab`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csfilterproductright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csfilterproductright` (
  `id_tab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_type` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `hook` int(10) unsigned DEFAULT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tab`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csfilterproductright_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csfilterproductright_lang` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tab`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csfilterproductright_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csfilterproductright_shop` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tab`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cshometab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cshometab` (
  `id_tab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_type` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tab`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cshometab_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cshometab_lang` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_tab`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_cshometab_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_cshometab_shop` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tab`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csmegamenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csmegamenu` (
  `id_menu` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number_column` int(10) unsigned DEFAULT '1',
  `width` int(10) unsigned DEFAULT '120',
  `link_of_title` varchar(300) DEFAULT NULL,
  `icon` varchar(255) DEFAULT '',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  `display_icon` tinyint(1) NOT NULL DEFAULT '1',
  `classes` varchar(150) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csmegamenu_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csmegamenu_lang` (
  `id_menu` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`id_menu`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csmegamenu_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csmegamenu_option` (
  `id_option` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_menu` int(10) unsigned NOT NULL,
  `type_option` int(10) unsigned NOT NULL,
  `position_option` int(10) unsigned DEFAULT '0',
  `content_option` text,
  PRIMARY KEY (`id_option`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csmegamenu_option_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csmegamenu_option_shop` (
  `id_option` int(10) unsigned NOT NULL,
  `id_menu` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `type_option` int(10) unsigned NOT NULL,
  `position_option` int(10) unsigned DEFAULT '0',
  `content_option` text,
  PRIMARY KEY (`id_option`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csmegamenu_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csmegamenu_shop` (
  `id_menu` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `number_column` int(10) unsigned DEFAULT '1',
  `width` int(10) unsigned DEFAULT '120',
  `link_of_title` varchar(300) DEFAULT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id_menu`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csslider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csslider` (
  `id_slider` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `animation` text,
  `image` varchar(255) NOT NULL DEFAULT '',
  `position` int(10) unsigned DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_slider`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csslider_caption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csslider_caption` (
  `id_caption` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_slider` int(10) unsigned NOT NULL,
  `layer` int(10) unsigned NOT NULL,
  `content` text,
  PRIMARY KEY (`id_caption`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_csslider_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_csslider_shop` (
  `id_slider` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `animation` text,
  `image` varchar(255) NOT NULL DEFAULT '',
  `position` int(10) unsigned DEFAULT '0',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_slider`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_currency` (
  `id_currency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `iso_code` varchar(3) NOT NULL DEFAULT '0',
  `iso_code_num` varchar(3) NOT NULL DEFAULT '0',
  `sign` varchar(8) NOT NULL,
  `blank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `format` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `conversion_rate` decimal(13,6) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_currency`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_currency_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_currency_shop` (
  `id_currency` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL,
  PRIMARY KEY (`id_currency`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_customer` (
  `id_customer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_gender` int(10) unsigned NOT NULL,
  `id_default_group` int(10) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned DEFAULT NULL,
  `id_risk` int(10) unsigned NOT NULL DEFAULT '1',
  `company` varchar(64) DEFAULT NULL,
  `siret` varchar(14) DEFAULT NULL,
  `ape` varchar(5) DEFAULT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday` date DEFAULT NULL,
  `newsletter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip_registration_newsletter` varchar(15) DEFAULT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `optin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `website` varchar(128) DEFAULT NULL,
  `outstanding_allow_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `show_public_prices` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_payment_days` int(10) unsigned NOT NULL DEFAULT '60',
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `note` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `customer_email` (`email`),
  KEY `customer_login` (`email`,`passwd`),
  KEY `id_customer_passwd` (`id_customer`,`passwd`),
  KEY `id_gender` (`id_gender`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_customer_group` (
  `id_customer` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_customer`,`id_group`),
  KEY `customer_login` (`id_group`),
  KEY `id_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_customer_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_customer_message` (
  `id_customer_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer_thread` int(11) DEFAULT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `message` text NOT NULL,
  `file_name` varchar(18) DEFAULT NULL,
  `ip_address` int(11) DEFAULT NULL,
  `user_agent` varchar(128) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customer_message`),
  KEY `id_customer_thread` (`id_customer_thread`),
  KEY `id_employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_customer_message_sync_imap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_customer_message_sync_imap` (
  `md5_header` varbinary(32) NOT NULL,
  KEY `md5_header_index` (`md5_header`(4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_customer_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_customer_thread` (
  `id_customer_thread` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `id_contact` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned DEFAULT NULL,
  `id_product` int(10) unsigned DEFAULT NULL,
  `status` enum('open','closed','pending1','pending2') NOT NULL DEFAULT 'open',
  `email` varchar(128) NOT NULL,
  `token` varchar(12) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer_thread`),
  KEY `id_shop` (`id_shop`),
  KEY `id_lang` (`id_lang`),
  KEY `id_contact` (`id_contact`),
  KEY `id_customer` (`id_customer`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_customization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_customization` (
  `id_customization` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_attribute` int(10) unsigned NOT NULL DEFAULT '0',
  `id_address_delivery` int(10) unsigned NOT NULL DEFAULT '0',
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `quantity_refunded` int(11) NOT NULL DEFAULT '0',
  `quantity_returned` int(11) NOT NULL DEFAULT '0',
  `in_cart` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customization`,`id_cart`,`id_product`,`id_address_delivery`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_customization_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_customization_field` (
  `id_customization_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_customization_field`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_customization_field_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_customization_field_lang` (
  `id_customization_field` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization_field`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_customized_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_customized_data` (
  `id_customization` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `index` int(3) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization`,`type`,`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_date_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_date_range` (
  `id_date_range` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  PRIMARY KEY (`id_date_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_delivery` (
  `id_delivery` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned DEFAULT NULL,
  `id_shop_group` int(10) unsigned DEFAULT NULL,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_range_price` int(10) unsigned DEFAULT NULL,
  `id_range_weight` int(10) unsigned DEFAULT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `id_zone` (`id_zone`),
  KEY `id_carrier` (`id_carrier`,`id_zone`),
  KEY `id_range_price` (`id_range_price`),
  KEY `id_range_weight` (`id_range_weight`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_employee` (
  `id_employee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL DEFAULT '0',
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stats_date_from` date DEFAULT NULL,
  `stats_date_to` date DEFAULT NULL,
  `bo_color` varchar(32) DEFAULT NULL,
  `bo_theme` varchar(32) DEFAULT NULL,
  `default_tab` int(10) unsigned NOT NULL DEFAULT '0',
  `bo_width` int(10) unsigned NOT NULL DEFAULT '0',
  `bo_show_screencast` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_last_order` int(10) unsigned NOT NULL DEFAULT '0',
  `id_last_customer_message` int(10) unsigned NOT NULL DEFAULT '0',
  `id_last_customer` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_employee`),
  KEY `employee_login` (`email`,`passwd`),
  KEY `id_employee_passwd` (`id_employee`,`passwd`),
  KEY `id_profile` (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_employee_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_employee_shop` (
  `id_employee` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_employee`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_favorite_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_favorite_product` (
  `id_favorite_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_favorite_product`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_feature` (
  `id_feature` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_feature_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_feature_lang` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_feature_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_feature_product` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_feature_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_product`),
  KEY `id_feature_value` (`id_feature_value`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_feature_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_feature_shop` (
  `id_feature` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_feature_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_feature_value` (
  `id_feature_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_feature` int(10) unsigned NOT NULL,
  `custom` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`),
  KEY `feature` (`id_feature`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_feature_value_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_feature_value_lang` (
  `id_feature_value` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_gender` (
  `id_gender` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_gender_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_gender_lang` (
  `id_gender` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_gender`,`id_lang`),
  KEY `id_gender` (`id_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reduction` decimal(17,2) NOT NULL DEFAULT '0.00',
  `price_display_method` tinyint(4) NOT NULL DEFAULT '0',
  `show_prices` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_group_lang` (
  `id_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_group_reduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_group_reduction` (
  `id_group_reduction` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_group_reduction`),
  UNIQUE KEY `id_group` (`id_group`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_group_shop` (
  `id_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_guest` (
  `id_guest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_operating_system` int(10) unsigned DEFAULT NULL,
  `id_web_browser` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `javascript` tinyint(1) DEFAULT '0',
  `screen_resolution_x` smallint(5) unsigned DEFAULT NULL,
  `screen_resolution_y` smallint(5) unsigned DEFAULT NULL,
  `screen_color` tinyint(3) unsigned DEFAULT NULL,
  `sun_java` tinyint(1) DEFAULT NULL,
  `adobe_flash` tinyint(1) DEFAULT NULL,
  `adobe_director` tinyint(1) DEFAULT NULL,
  `apple_quicktime` tinyint(1) DEFAULT NULL,
  `real_player` tinyint(1) DEFAULT NULL,
  `windows_media` tinyint(1) DEFAULT NULL,
  `accept_language` varchar(8) DEFAULT NULL,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_guest`),
  KEY `id_customer` (`id_customer`),
  KEY `id_operating_system` (`id_operating_system`),
  KEY `id_web_browser` (`id_web_browser`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_help_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_help_access` (
  `id_help_access` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  `version` varchar(8) NOT NULL,
  PRIMARY KEY (`id_help_access`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_hook` (
  `id_hook` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  `live_edit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_hook`),
  UNIQUE KEY `hook_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_hook_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_hook_alias` (
  `id_hook_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_hook_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_hook_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_hook_module` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_hook` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_hook`,`id_shop`),
  KEY `id_hook` (`id_hook`),
  KEY `id_module` (`id_module`),
  KEY `position` (`id_shop`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_hook_module_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_hook_module_exceptions` (
  `id_hook_module_exceptions` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hook_module_exceptions`),
  KEY `id_module` (`id_module`),
  KEY `id_hook` (`id_hook`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_image` (
  `id_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `position` smallint(2) unsigned NOT NULL DEFAULT '0',
  `cover` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_image`),
  UNIQUE KEY `idx_product_image` (`id_image`,`id_product`,`cover`),
  KEY `image_product` (`id_product`),
  KEY `id_product_cover` (`id_product`,`cover`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_image_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_image_lang` (
  `id_image` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `legend` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_image`,`id_lang`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_image_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_image_shop` (
  `id_image` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `cover` tinyint(1) NOT NULL,
  KEY `id_image` (`id_image`,`id_shop`,`cover`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_image_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_image_type` (
  `id_image_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `products` tinyint(1) NOT NULL DEFAULT '1',
  `categories` tinyint(1) NOT NULL DEFAULT '1',
  `manufacturers` tinyint(1) NOT NULL DEFAULT '1',
  `suppliers` tinyint(1) NOT NULL DEFAULT '1',
  `scenes` tinyint(1) NOT NULL DEFAULT '1',
  `stores` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_image_type`),
  KEY `image_type_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_import_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_import_match` (
  `id_import_match` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `match` text NOT NULL,
  `skip` int(2) NOT NULL,
  PRIMARY KEY (`id_import_match`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_lang` (
  `id_lang` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `iso_code` char(2) NOT NULL,
  `language_code` char(5) NOT NULL,
  `date_format_lite` char(32) NOT NULL DEFAULT 'Y-m-d',
  `date_format_full` char(32) NOT NULL DEFAULT 'Y-m-d H:i:s',
  `is_rtl` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_lang`),
  KEY `lang_iso_code` (`iso_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_lang_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_lang_shop` (
  `id_lang` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_lang`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_category` (
  `id_layered_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `id_value` int(10) unsigned DEFAULT '0',
  `type` enum('category','id_feature','id_attribute_group','quantity','condition','manufacturer','weight','price') NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `filter_type` int(10) unsigned NOT NULL DEFAULT '0',
  `filter_show_limit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_layered_category`),
  KEY `id_category` (`id_category`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=1296 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_filter` (
  `id_layered_filter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `filters` text,
  `n_categories` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_layered_filter`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_filter_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_filter_shop` (
  `id_layered_filter` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_layered_filter`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_friendly_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_friendly_url` (
  `id_layered_friendly_url` int(11) NOT NULL AUTO_INCREMENT,
  `url_key` varchar(32) NOT NULL,
  `data` varchar(200) NOT NULL,
  `id_lang` int(11) NOT NULL,
  PRIMARY KEY (`id_layered_friendly_url`),
  KEY `id_lang` (`id_lang`),
  KEY `url_key` (`url_key`(5))
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_indexable_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_indexable_attribute_group` (
  `id_attribute_group` int(11) NOT NULL,
  `indexable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_indexable_attribute_group_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_indexable_attribute_group_lang_value` (
  `id_attribute_group` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(20) DEFAULT NULL,
  `meta_title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_indexable_attribute_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_indexable_attribute_lang_value` (
  `id_attribute` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(20) DEFAULT NULL,
  `meta_title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_indexable_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_indexable_feature` (
  `id_feature` int(11) NOT NULL,
  `indexable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_indexable_feature_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_indexable_feature_lang_value` (
  `id_feature` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(20) NOT NULL,
  `meta_title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_indexable_feature_value_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_indexable_feature_value_lang_value` (
  `id_feature_value` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(20) DEFAULT NULL,
  `meta_title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_price_index` (
  `id_product` int(11) NOT NULL,
  `id_currency` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `price_min` int(11) NOT NULL,
  `price_max` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_currency`,`id_shop`),
  KEY `id_currency` (`id_currency`),
  KEY `price_min` (`price_min`),
  KEY `price_max` (`price_max`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_layered_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_layered_product_attribute` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_attribute_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  KEY `id_attribute` (`id_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_linksmenutop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_linksmenutop` (
  `id_linksmenutop` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `new_window` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_linksmenutop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_linksmenutop_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_linksmenutop_lang` (
  `id_linksmenutop` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `label` varchar(128) NOT NULL,
  `link` varchar(128) NOT NULL,
  KEY `id_linksmenutop` (`id_linksmenutop`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_log` (
  `id_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` tinyint(1) NOT NULL,
  `error_code` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_manufacturer` (
  `id_manufacturer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_manufacturer_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_manufacturer_lang` (
  `id_manufacturer` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `short_description` varchar(254) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_manufacturer_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_manufacturer_shop` (
  `id_manufacturer` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_memcached_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_memcached_servers` (
  `id_memcached_server` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(254) NOT NULL,
  `port` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_memcached_server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_message` (
  `id_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `message_order` (`id_order`),
  KEY `id_cart` (`id_cart`),
  KEY `id_customer` (`id_customer`),
  KEY `id_employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_message_readed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_message_readed` (
  `id_message` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`,`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_meta` (
  `id_meta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(64) NOT NULL,
  PRIMARY KEY (`id_meta`),
  KEY `meta_name` (`page`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_meta_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_meta_lang` (
  `id_meta` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `url_rewrite` varchar(254) NOT NULL,
  PRIMARY KEY (`id_meta`,`id_shop`,`id_lang`),
  KEY `id_shop` (`id_shop`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(8) NOT NULL,
  PRIMARY KEY (`id_module`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_module_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_module_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_module` int(10) unsigned NOT NULL,
  `view` tinyint(1) NOT NULL,
  `configure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_module_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_module_country` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_module_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_module_currency` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_currency` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_currency`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_module_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_module_group` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_group` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_module_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_module_preference` (
  `id_module_preference` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `interest` tinyint(1) DEFAULT NULL,
  `favorite` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_module_preference`),
  UNIQUE KEY `employee_module` (`id_employee`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_module_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_module_shop` (
  `id_module` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_newsletter` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `email` varchar(255) NOT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `ip_registration_newsletter` varchar(15) NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_operating_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_operating_system` (
  `id_operating_system` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_operating_system`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_carrier` (
  `id_order_carrier` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) unsigned NOT NULL,
  `id_carrier` int(11) unsigned NOT NULL,
  `id_order_invoice` int(11) unsigned DEFAULT NULL,
  `weight` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_excl` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_incl` decimal(20,6) DEFAULT NULL,
  `tracking_number` varchar(64) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_carrier`),
  KEY `id_order` (`id_order`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_order_invoice` (`id_order_invoice`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_cart_rule` (
  `id_order_cart_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_order_invoice` int(10) unsigned DEFAULT '0',
  `name` varchar(254) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT '0.00',
  `value_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_cart_rule`),
  KEY `id_order` (`id_order`),
  KEY `id_cart_rule` (`id_cart_rule`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_detail` (
  `id_order_detail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_invoice` int(11) DEFAULT NULL,
  `id_warehouse` int(10) unsigned DEFAULT '0',
  `id_shop` int(11) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_attribute_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_in_stock` int(10) NOT NULL DEFAULT '0',
  `product_quantity_refunded` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_return` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_reinjected` int(10) unsigned NOT NULL DEFAULT '0',
  `product_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_amount_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_amount_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `group_reduction` decimal(10,2) NOT NULL DEFAULT '0.00',
  `product_quantity_discount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `product_ean13` varchar(13) DEFAULT NULL,
  `product_upc` varchar(12) DEFAULT NULL,
  `product_reference` varchar(32) DEFAULT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_weight` decimal(20,6) NOT NULL,
  `tax_computation_method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tax_name` varchar(16) NOT NULL,
  `tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `ecotax` decimal(21,6) NOT NULL DEFAULT '0.000000',
  `ecotax_tax_rate` decimal(5,3) NOT NULL DEFAULT '0.000',
  `discount_quantity_applied` tinyint(1) NOT NULL DEFAULT '0',
  `download_hash` varchar(255) DEFAULT NULL,
  `download_nb` int(10) unsigned DEFAULT '0',
  `download_deadline` datetime DEFAULT NULL,
  `total_price_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_price_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_price_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_price_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `purchase_supplier_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `original_product_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id_order_detail`),
  KEY `order_detail_order` (`id_order`),
  KEY `product_id` (`product_id`),
  KEY `product_attribute_id` (`product_attribute_id`),
  KEY `id_order_id_order_detail` (`id_order`,`id_order_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_detail_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_detail_tax` (
  `id_order_detail` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `unit_amount` decimal(16,6) NOT NULL DEFAULT '0.000000',
  `total_amount` decimal(16,6) NOT NULL DEFAULT '0.000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_history` (
  `id_order_history` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_state` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_history`),
  KEY `order_history_order` (`id_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_order_state` (`id_order_state`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_invoice` (
  `id_order_invoice` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `delivery_number` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `total_discount_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_discount_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products_wt` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `shipping_tax_computation_method` int(10) unsigned NOT NULL,
  `total_wrapping_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_wrapping_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `note` text,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_invoice`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_invoice_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_invoice_payment` (
  `id_order_invoice` int(11) unsigned NOT NULL,
  `id_order_payment` int(11) unsigned NOT NULL,
  `id_order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_order_invoice`,`id_order_payment`),
  KEY `order_payment` (`id_order_payment`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_invoice_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_invoice_tax` (
  `id_order_invoice` int(11) NOT NULL,
  `type` varchar(15) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `amount` decimal(10,6) NOT NULL DEFAULT '0.000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_message` (
  `id_order_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_message`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_message_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_message_lang` (
  `id_order_message` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id_order_message`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_payment` (
  `id_order_payment` int(11) NOT NULL AUTO_INCREMENT,
  `order_reference` varchar(9) DEFAULT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `transaction_id` varchar(254) DEFAULT NULL,
  `card_number` varchar(254) DEFAULT NULL,
  `card_brand` varchar(254) DEFAULT NULL,
  `card_expiration` char(7) DEFAULT NULL,
  `card_holder` varchar(254) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_payment`),
  KEY `order_reference` (`order_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_return` (
  `id_order_return` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `question` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_return`),
  KEY `order_return_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_return_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_return_detail` (
  `id_order_return` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `id_customization` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_return`,`id_order_detail`,`id_customization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_return_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_return_state` (
  `id_order_return_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_order_return_state`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_return_state_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_return_state_lang` (
  `id_order_return_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_return_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_slip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_slip` (
  `id_order_slip` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `shipping_cost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL,
  `shipping_cost_amount` decimal(10,2) NOT NULL,
  `partial` tinyint(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_slip`),
  KEY `order_slip_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_slip_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_slip_detail` (
  `id_order_slip` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `amount_tax_excl` decimal(10,2) DEFAULT NULL,
  `amount_tax_incl` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_order_slip`,`id_order_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_state` (
  `id_order_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice` tinyint(1) unsigned DEFAULT '0',
  `send_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module_name` varchar(255) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `unremovable` tinyint(1) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logable` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipped` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `paid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_state`),
  KEY `module_name` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_order_state_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_order_state_lang` (
  `id_order_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_orders` (
  `id_order` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(9) DEFAULT NULL,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_cart` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `current_state` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `payment` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `module` varchar(255) DEFAULT NULL,
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_number` varchar(32) DEFAULT NULL,
  `total_discounts` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_discounts_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_discounts_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_paid_real` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_products_wt` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_shipping_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `carrier_tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_wrapping` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_wrapping_tax_incl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `total_wrapping_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `invoice_number` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_number` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `valid` int(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_customer` (`id_customer`),
  KEY `id_cart` (`id_cart`),
  KEY `invoice_number` (`invoice_number`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_shop` (`id_shop`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_pack` (
  `id_product_pack` int(10) unsigned NOT NULL,
  `id_product_item` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_pack`,`id_product_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_page` (
  `id_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_page_type` int(10) unsigned NOT NULL,
  `id_object` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_page`),
  KEY `id_page_type` (`id_page_type`),
  KEY `id_object` (`id_object`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_page_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_page_type` (
  `id_page_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_type`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_page_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_page_viewed` (
  `id_page` int(10) unsigned NOT NULL,
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_date_range` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_page`,`id_date_range`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_pagenotfound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_pagenotfound` (
  `id_pagenotfound` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `request_uri` varchar(256) NOT NULL,
  `http_referer` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_pagenotfound`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product` (
  `id_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(10) unsigned DEFAULT NULL,
  `id_manufacturer` int(10) unsigned DEFAULT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT '1',
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `width` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `height` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `depth` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `out_of_stock` int(10) unsigned NOT NULL DEFAULT '2',
  `quantity_discount` tinyint(1) DEFAULT '0',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `redirect_type` enum('','404','301','302') NOT NULL DEFAULT '',
  `id_product_redirected` int(10) unsigned NOT NULL DEFAULT '0',
  `available_for_order` tinyint(1) NOT NULL DEFAULT '1',
  `available_date` date NOT NULL,
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT '1',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_is_pack` tinyint(1) NOT NULL DEFAULT '0',
  `cache_has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_product`),
  KEY `product_supplier` (`id_supplier`),
  KEY `product_manufacturer` (`id_manufacturer`),
  KEY `id_category_default` (`id_category_default`),
  KEY `indexed` (`indexed`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_attachment` (
  `id_product` int(10) unsigned NOT NULL,
  `id_attachment` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_attribute` (
  `id_product_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_impact` decimal(17,2) NOT NULL DEFAULT '0.00',
  `default_on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `available_date` date NOT NULL,
  PRIMARY KEY (`id_product_attribute`),
  KEY `product_attribute_product` (`id_product`),
  KEY `reference` (`reference`),
  KEY `supplier_reference` (`supplier_reference`),
  KEY `product_default` (`id_product`,`default_on`),
  KEY `id_product_id_product_attribute` (`id_product_attribute`,`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_attribute_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_attribute_combination` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_product_attribute`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_attribute_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_attribute_image` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_image` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_image`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_attribute_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_attribute_shop` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_impact` decimal(17,2) NOT NULL DEFAULT '0.00',
  `default_on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `available_date` date NOT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_carrier` (
  `id_product` int(10) unsigned NOT NULL,
  `id_carrier_reference` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_carrier_reference`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_comment` (
  `id_product_comment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_guest` int(10) unsigned DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `content` text NOT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `grade` float unsigned NOT NULL,
  `validate` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_product_comment`),
  KEY `id_product` (`id_product`),
  KEY `id_customer` (`id_customer`),
  KEY `id_guest` (`id_guest`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_comment_criterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_comment_criterion` (
  `id_product_comment_criterion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_comment_criterion_type` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_product_comment_criterion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_comment_criterion_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_comment_criterion_category` (
  `id_product_comment_criterion` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment_criterion`,`id_category`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_comment_criterion_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_comment_criterion_lang` (
  `id_product_comment_criterion` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_product_comment_criterion`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_comment_criterion_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_comment_criterion_product` (
  `id_product` int(10) unsigned NOT NULL,
  `id_product_comment_criterion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_product_comment_criterion`),
  KEY `id_product_comment_criterion` (`id_product_comment_criterion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_comment_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_comment_grade` (
  `id_product_comment` int(10) unsigned NOT NULL,
  `id_product_comment_criterion` int(10) unsigned NOT NULL,
  `grade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment`,`id_product_comment_criterion`),
  KEY `id_product_comment_criterion` (`id_product_comment_criterion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_comment_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_comment_report` (
  `id_product_comment` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment`,`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_comment_usefulness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_comment_usefulness` (
  `id_product_comment` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `usefulness` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id_product_comment`,`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_country_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_country_tax` (
  `id_product` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_download` (
  `id_product_download` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `display_filename` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `nb_days_accessible` int(10) unsigned DEFAULT NULL,
  `nb_downloadable` int(10) unsigned DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shareable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_product_download`),
  KEY `product_active` (`id_product`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_group_reduction_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_group_reduction_cache` (
  `id_product` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_product`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_lang` (
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `description_short` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_shop`,`id_lang`),
  KEY `id_lang` (`id_lang`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_sale` (
  `id_product` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sale_nbr` int(10) unsigned NOT NULL DEFAULT '0',
  `date_upd` date NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_shop` (
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `redirect_type` enum('','404','301','302') NOT NULL DEFAULT '',
  `id_product_redirected` int(10) unsigned NOT NULL DEFAULT '0',
  `available_for_order` tinyint(1) NOT NULL DEFAULT '1',
  `available_date` date NOT NULL,
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT '1',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_product`,`id_shop`),
  KEY `id_category_default` (`id_category_default`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_supplier` (
  `id_product_supplier` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL DEFAULT '0',
  `id_supplier` int(11) unsigned NOT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_supplier_price_te` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `id_currency` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_product_supplier`),
  UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_product_tag` (
  `id_product` int(10) unsigned NOT NULL,
  `id_tag` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_tag`),
  KEY `id_tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_profile` (
  `id_profile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_profile_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_profile_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_quick_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_quick_access` (
  `id_quick_access` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(128) NOT NULL,
  PRIMARY KEY (`id_quick_access`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_quick_access_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_quick_access_lang` (
  `id_quick_access` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_quick_access`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_range_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_range_price` (
  `id_range_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_price`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_range_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_range_weight` (
  `id_range_weight` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_weight`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_referrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_referrer` (
  `id_referrer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `http_referer_regexp` varchar(64) DEFAULT NULL,
  `http_referer_like` varchar(64) DEFAULT NULL,
  `request_uri_regexp` varchar(64) DEFAULT NULL,
  `request_uri_like` varchar(64) DEFAULT NULL,
  `http_referer_regexp_not` varchar(64) DEFAULT NULL,
  `http_referer_like_not` varchar(64) DEFAULT NULL,
  `request_uri_regexp_not` varchar(64) DEFAULT NULL,
  `request_uri_like_not` varchar(64) DEFAULT NULL,
  `base_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `percent_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `click_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_referrer_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_referrer_cache` (
  `id_connections_source` int(11) unsigned NOT NULL,
  `id_referrer` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_connections_source`,`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_referrer_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_referrer_shop` (
  `id_referrer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_visitors` int(11) DEFAULT NULL,
  `cache_visits` int(11) DEFAULT NULL,
  `cache_pages` int(11) DEFAULT NULL,
  `cache_registrations` int(11) DEFAULT NULL,
  `cache_orders` int(11) DEFAULT NULL,
  `cache_sales` decimal(17,2) DEFAULT NULL,
  `cache_reg_rate` decimal(5,4) DEFAULT NULL,
  `cache_order_rate` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`id_referrer`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_request_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_request_sql` (
  `id_request_sql` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `sql` text NOT NULL,
  PRIMARY KEY (`id_request_sql`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_required_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_required_field` (
  `id_required_field` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(32) NOT NULL,
  `field_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_required_field`),
  KEY `object_name` (`object_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_risk` (
  `id_risk` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `percent` tinyint(3) NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_risk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_risk_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_risk_lang` (
  `id_risk` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_risk`,`id_lang`),
  KEY `id_risk` (`id_risk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_scene` (
  `id_scene` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_scene`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_scene_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_scene_category` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_scene`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_scene_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_scene_lang` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_scene_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_scene_products` (
  `id_scene` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `x_axis` int(4) NOT NULL,
  `y_axis` int(4) NOT NULL,
  `zone_width` int(3) NOT NULL,
  `zone_height` int(3) NOT NULL,
  PRIMARY KEY (`id_scene`,`id_product`,`x_axis`,`y_axis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_scene_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_scene_shop` (
  `id_scene` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_scene`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_search_engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_search_engine` (
  `id_search_engine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(64) NOT NULL,
  `getvar` varchar(16) NOT NULL,
  PRIMARY KEY (`id_search_engine`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_search_index` (
  `id_product` int(11) unsigned NOT NULL,
  `id_word` int(11) unsigned NOT NULL,
  `weight` smallint(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_word`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_search_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_search_word` (
  `id_word` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `word` varchar(15) NOT NULL,
  PRIMARY KEY (`id_word`),
  UNIQUE KEY `id_lang` (`id_lang`,`id_shop`,`word`)
) ENGINE=InnoDB AUTO_INCREMENT=1321 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_sekeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_sekeyword` (
  `id_sekeyword` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `keyword` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_sekeyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_shop` (
  `id_shop` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `id_category` int(11) unsigned NOT NULL DEFAULT '1',
  `id_theme` int(1) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_category` (`id_category`),
  KEY `id_theme` (`id_theme`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_shop_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_shop_group` (
  `id_shop_group` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `share_customer` tinyint(1) NOT NULL,
  `share_order` tinyint(1) NOT NULL,
  `share_stock` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_shop_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_shop_url` (
  `id_shop_url` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `domain` varchar(150) NOT NULL,
  `domain_ssl` varchar(150) NOT NULL,
  `physical_uri` varchar(64) NOT NULL,
  `virtual_uri` varchar(64) NOT NULL,
  `main` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_shop_url`),
  UNIQUE KEY `full_shop_url` (`domain`,`physical_uri`,`virtual_uri`),
  UNIQUE KEY `full_shop_url_ssl` (`domain_ssl`,`physical_uri`,`virtual_uri`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_specific_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_specific_price` (
  `id_specific_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule` int(11) unsigned NOT NULL,
  `id_cart` int(11) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(11) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  `from_quantity` mediumint(8) unsigned NOT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`id_specific_price`),
  KEY `id_product` (`id_product`,`id_shop`,`id_currency`,`id_country`,`id_group`,`id_customer`,`from_quantity`,`from`,`to`),
  KEY `from_quantity` (`from_quantity`),
  KEY `id_specific_price_rule` (`id_specific_price_rule`),
  KEY `id_cart` (`id_cart`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_specific_price_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_specific_price_priority` (
  `id_specific_price_priority` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `priority` varchar(80) NOT NULL,
  PRIMARY KEY (`id_specific_price_priority`,`id_product`),
  UNIQUE KEY `id_product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_specific_price_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_specific_price_rule` (
  `id_specific_price_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_currency` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `from_quantity` mediumint(8) unsigned NOT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`id_specific_price_rule`),
  KEY `id_product` (`id_shop`,`id_currency`,`id_country`,`id_group`,`from_quantity`,`from`,`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_specific_price_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_specific_price_rule_condition` (
  `id_specific_price_rule_condition` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule_condition_group` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_specific_price_rule_condition`),
  KEY `id_specific_price_rule_condition_group` (`id_specific_price_rule_condition_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_specific_price_rule_condition_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_specific_price_rule_condition_group` (
  `id_specific_price_rule_condition_group` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_specific_price_rule_condition_group`,`id_specific_price_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_state` (
  `id_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(11) unsigned NOT NULL,
  `id_zone` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `iso_code` varchar(7) NOT NULL,
  `tax_behavior` smallint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_state`),
  KEY `id_country` (`id_country`),
  KEY `name` (`name`),
  KEY `id_zone` (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_staticblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_staticblock` (
  `id_block` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier_block` varchar(255) NOT NULL DEFAULT '',
  `hook` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_block`),
  UNIQUE KEY `identifier_block` (`identifier_block`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_staticblock_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_staticblock_lang` (
  `id_block` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext,
  PRIMARY KEY (`id_block`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_staticblock_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_staticblock_shop` (
  `id_block` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_block`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_statssearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_statssearch` (
  `id_statssearch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL,
  `results` int(6) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_statssearch`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_stock` (
  `id_stock` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_warehouse` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `reference` varchar(32) NOT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `physical_quantity` int(11) unsigned NOT NULL,
  `usable_quantity` int(11) unsigned NOT NULL,
  `price_te` decimal(20,6) DEFAULT '0.000000',
  PRIMARY KEY (`id_stock`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_stock_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_stock_available` (
  `id_stock_available` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `id_shop_group` int(11) unsigned NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `depends_on_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `out_of_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_stock_available`),
  UNIQUE KEY `product_sqlstock` (`id_product`,`id_product_attribute`,`id_shop`,`id_shop_group`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_stock_mvt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_stock_mvt` (
  `id_stock_mvt` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_stock` int(11) unsigned NOT NULL,
  `id_order` int(11) unsigned DEFAULT NULL,
  `id_supply_order` int(11) unsigned DEFAULT NULL,
  `id_stock_mvt_reason` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `physical_quantity` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `sign` tinyint(1) NOT NULL DEFAULT '1',
  `price_te` decimal(20,6) DEFAULT '0.000000',
  `last_wa` decimal(20,6) DEFAULT '0.000000',
  `current_wa` decimal(20,6) DEFAULT '0.000000',
  `referer` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_stock_mvt`),
  KEY `id_stock` (`id_stock`),
  KEY `id_stock_mvt_reason` (`id_stock_mvt_reason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_stock_mvt_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_stock_mvt_reason` (
  `id_stock_mvt_reason` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sign` tinyint(1) NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_stock_mvt_reason`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_stock_mvt_reason_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_stock_mvt_reason_lang` (
  `id_stock_mvt_reason` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_stock_mvt_reason`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_store` (
  `id_store` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `postcode` varchar(12) NOT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `hours` varchar(254) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `note` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_store`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_store_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_store_shop` (
  `id_store` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_store`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_supplier` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_supplier_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_supplier_lang` (
  `id_supplier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_supplier_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_supplier_shop` (
  `id_supplier` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_supplier`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_supply_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_supply_order` (
  `id_supply_order` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) unsigned NOT NULL,
  `supplier_name` varchar(64) NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `id_currency` int(11) unsigned NOT NULL,
  `id_ref_currency` int(11) unsigned NOT NULL,
  `reference` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `date_delivery_expected` datetime DEFAULT NULL,
  `total_te` decimal(20,6) DEFAULT '0.000000',
  `total_with_discount_te` decimal(20,6) DEFAULT '0.000000',
  `total_tax` decimal(20,6) DEFAULT '0.000000',
  `total_ti` decimal(20,6) DEFAULT '0.000000',
  `discount_rate` decimal(20,6) DEFAULT '0.000000',
  `discount_value_te` decimal(20,6) DEFAULT '0.000000',
  `is_template` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_supply_order`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `reference` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_supply_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_supply_order_detail` (
  `id_supply_order_detail` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order` int(11) unsigned NOT NULL,
  `id_currency` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `reference` varchar(32) NOT NULL,
  `supplier_reference` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `exchange_rate` decimal(20,6) DEFAULT '0.000000',
  `unit_price_te` decimal(20,6) DEFAULT '0.000000',
  `quantity_expected` int(11) unsigned NOT NULL,
  `quantity_received` int(11) unsigned NOT NULL,
  `price_te` decimal(20,6) DEFAULT '0.000000',
  `discount_rate` decimal(20,6) DEFAULT '0.000000',
  `discount_value_te` decimal(20,6) DEFAULT '0.000000',
  `price_with_discount_te` decimal(20,6) DEFAULT '0.000000',
  `tax_rate` decimal(20,6) DEFAULT '0.000000',
  `tax_value` decimal(20,6) DEFAULT '0.000000',
  `price_ti` decimal(20,6) DEFAULT '0.000000',
  `tax_value_with_order_discount` decimal(20,6) DEFAULT '0.000000',
  `price_with_order_discount_te` decimal(20,6) DEFAULT '0.000000',
  PRIMARY KEY (`id_supply_order_detail`),
  KEY `id_supply_order` (`id_supply_order`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_product_product_attribute` (`id_product`,`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_supply_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_supply_order_history` (
  `id_supply_order_history` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `id_state` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_supply_order_history`),
  KEY `id_supply_order` (`id_supply_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_state` (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_supply_order_receipt_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_supply_order_receipt_history` (
  `id_supply_order_receipt_history` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order_detail` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `quantity` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_supply_order_receipt_history`),
  KEY `id_supply_order_detail` (`id_supply_order_detail`),
  KEY `id_supply_order_state` (`id_supply_order_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_supply_order_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_supply_order_state` (
  `id_supply_order_state` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_note` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `receipt_state` tinyint(1) NOT NULL DEFAULT '0',
  `pending_receipt` tinyint(1) NOT NULL DEFAULT '0',
  `enclosed` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_supply_order_state`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_supply_order_state_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_supply_order_state_lang` (
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_supply_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_tab` (
  `id_tab` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL,
  `class_name` varchar(64) NOT NULL,
  `module` varchar(64) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tab`),
  KEY `class_name` (`class_name`),
  KEY `id_parent` (`id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_tab_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_tab_lang` (
  `id_tab` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_tab`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_tab_module_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_tab_module_preference` (
  `id_tab_module_preference` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `id_tab` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tab_module_preference`),
  UNIQUE KEY `employee_module` (`id_employee`,`id_tab`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_tag` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tag`),
  KEY `tag_name` (`name`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_tax` (
  `id_tax` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,3) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tax`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_tax_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_tax_lang` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tax`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_tax_rule` (
  `id_tax_rule` int(11) NOT NULL AUTO_INCREMENT,
  `id_tax_rules_group` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `zipcode_from` varchar(12) NOT NULL,
  `zipcode_to` varchar(12) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `behavior` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tax_rule`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `id_tax` (`id_tax`),
  KEY `category_getproducts` (`id_tax_rules_group`,`id_country`,`id_state`,`zipcode_from`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_tax_rules_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_tax_rules_group` (
  `id_tax_rules_group` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_tax_rules_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_tax_rules_group_shop` (
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_theme` (
  `id_theme` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `directory` varchar(64) NOT NULL,
  PRIMARY KEY (`id_theme`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_theme_specific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_theme_specific` (
  `id_theme` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `entity` int(11) unsigned NOT NULL,
  `id_object` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_theme`,`id_shop`,`entity`,`id_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_timezone` (
  `id_timezone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_timezone`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_warehouse` (
  `id_warehouse` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_currency` int(11) unsigned NOT NULL,
  `id_address` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `management_type` enum('WA','FIFO','LIFO') NOT NULL DEFAULT 'WA',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_warehouse_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_warehouse_carrier` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_warehouse`,`id_carrier`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_carrier` (`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_warehouse_product_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_warehouse_product_location` (
  `id_warehouse_product_location` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  `location` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_warehouse_product_location`),
  UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_warehouse_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_warehouse_shop` (
  `id_shop` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_warehouse`,`id_shop`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_web_browser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_web_browser` (
  `id_web_browser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_web_browser`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_webservice_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_webservice_account` (
  `id_webservice_account` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `description` text,
  `class_name` varchar(50) NOT NULL DEFAULT 'WebserviceRequest',
  `is_module` tinyint(2) NOT NULL DEFAULT '0',
  `module_name` varchar(50) DEFAULT NULL,
  `active` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_webservice_account`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_webservice_account_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_webservice_account_shop` (
  `id_webservice_account` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_webservice_account`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_webservice_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_webservice_permission` (
  `id_webservice_permission` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL,
  `method` enum('GET','POST','PUT','DELETE','HEAD') NOT NULL,
  `id_webservice_account` int(11) NOT NULL,
  PRIMARY KEY (`id_webservice_permission`),
  UNIQUE KEY `resource_2` (`resource`,`method`,`id_webservice_account`),
  KEY `resource` (`resource`),
  KEY `method` (`method`),
  KEY `id_webservice_account` (`id_webservice_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_zone` (
  `id_zone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ps_zone_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ps_zone_shop` (
  `id_zone` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_zone`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `ps_access` WRITE;
/*!40000 ALTER TABLE `ps_access` DISABLE KEYS */;
INSERT INTO `ps_access` VALUES (1,0,1,1,1,1),(1,1,1,1,1,1),(1,5,1,1,1,1),(1,7,1,1,1,1),(1,9,1,1,1,1),(1,10,1,1,1,1),(1,11,1,1,1,1),(1,13,1,1,1,1),(1,14,1,1,1,1),(1,15,1,1,1,1),(1,16,1,1,1,1),(1,19,1,1,1,1),(1,20,1,1,1,1),(1,21,1,1,1,1),(1,22,1,1,1,1),(1,23,1,1,1,1),(1,24,1,1,1,1),(1,25,1,1,1,1),(1,26,1,1,1,1),(1,27,1,1,1,1),(1,28,1,1,1,1),(1,29,1,1,1,1),(1,30,1,1,1,1),(1,32,1,1,1,1),(1,33,1,1,1,1),(1,34,1,1,1,1),(1,35,1,1,1,1),(1,36,1,1,1,1),(1,37,1,1,1,1),(1,39,1,1,1,1),(1,40,1,1,1,1),(1,41,1,1,1,1),(1,42,1,1,1,1),(1,43,1,1,1,1),(1,45,1,1,1,1),(1,46,1,1,1,1),(1,50,1,1,1,1),(1,51,1,1,1,1),(1,52,1,1,1,1),(1,54,1,1,1,1),(1,55,1,1,1,1),(1,56,1,1,1,1),(1,57,1,1,1,1),(1,58,1,1,1,1),(1,59,1,1,1,1),(1,60,1,1,1,1),(1,61,1,1,1,1),(1,63,1,1,1,1),(1,64,1,1,1,1),(1,65,1,1,1,1),(1,68,1,1,1,1),(1,69,1,1,1,1),(1,70,1,1,1,1),(1,71,1,1,1,1),(1,72,1,1,1,1),(1,73,1,1,1,1),(1,75,1,1,1,1),(1,76,1,1,1,1),(1,77,1,1,1,1),(1,78,1,1,1,1),(1,79,1,1,1,1),(1,80,1,1,1,1),(1,82,1,1,1,1),(1,83,1,1,1,1),(1,84,1,1,1,1),(1,85,1,1,1,1),(1,86,1,1,1,1),(1,88,1,1,1,1),(1,89,1,1,1,1),(1,90,1,1,1,1),(1,91,1,1,1,1),(1,94,1,1,1,1),(1,95,1,1,1,1),(1,96,1,1,1,1),(1,97,1,1,1,1),(1,98,1,1,1,1),(1,101,1,1,1,1),(1,102,1,1,1,1),(2,0,1,1,1,1),(2,1,1,1,1,1),(2,2,0,0,0,0),(2,3,0,0,0,0),(2,4,0,0,0,0),(2,5,1,1,1,1),(2,6,1,1,1,1),(2,7,1,1,1,1),(2,8,0,0,0,0),(2,9,1,1,1,1),(2,10,1,1,1,1),(2,11,1,1,1,1),(2,12,0,0,0,0),(2,13,1,1,1,1),(2,14,1,1,1,1),(2,15,1,1,1,1),(2,16,1,1,1,1),(2,17,0,0,0,0),(2,18,1,1,1,1),(2,19,1,1,1,1),(2,20,1,1,1,1),(2,21,1,1,1,1),(2,22,1,1,1,1),(2,23,1,1,1,1),(2,24,1,1,1,1),(2,25,1,1,1,1),(2,26,1,1,1,1),(2,27,1,1,1,1),(2,28,1,1,1,1),(2,29,1,1,1,1),(2,30,1,1,1,1),(2,31,1,1,1,1),(2,32,1,1,1,1),(2,33,1,1,1,1),(2,34,1,1,1,1),(2,35,1,1,1,1),(2,36,1,1,1,1),(2,37,1,1,1,1),(2,38,1,1,1,1),(2,39,1,1,1,1),(2,40,1,1,1,1),(2,41,1,1,1,1),(2,42,1,1,1,1),(2,43,1,1,1,1),(2,44,0,0,0,0),(2,45,1,1,1,1),(2,46,1,1,1,1),(2,47,0,0,0,0),(2,48,0,0,0,0),(2,49,1,1,1,1),(2,50,1,1,1,1),(2,51,1,1,1,1),(2,52,1,1,1,1),(2,53,1,1,1,1),(2,54,1,1,1,1),(2,55,1,1,1,1),(2,56,1,1,1,1),(2,57,1,1,1,1),(2,58,1,1,1,1),(2,59,1,1,1,1),(2,60,1,1,1,1),(2,61,1,1,1,1),(2,62,1,1,1,1),(2,63,1,1,1,1),(2,64,1,1,1,1),(2,65,1,1,1,1),(2,66,1,1,1,1),(2,67,1,1,1,1),(2,68,1,1,1,1),(2,69,1,1,1,1),(2,70,1,1,1,1),(2,71,1,1,1,1),(2,72,1,1,1,1),(2,73,1,1,1,1),(2,74,0,0,0,0),(2,75,1,1,1,1),(2,76,1,1,1,1),(2,77,1,1,1,1),(2,78,1,1,1,1),(2,79,1,1,1,1),(2,80,1,1,1,1),(2,81,0,0,0,0),(2,82,1,1,1,1),(2,83,1,1,1,1),(2,84,1,1,1,1),(2,85,1,1,1,1),(2,86,1,1,1,1),(2,87,1,1,1,1),(2,88,1,1,1,1),(2,89,1,1,1,1),(2,90,1,1,1,1),(2,91,1,1,1,1),(2,92,0,0,0,0),(2,93,1,1,1,1),(2,94,1,1,1,1),(2,95,1,1,1,1),(2,96,1,1,1,1),(2,97,1,1,1,1),(2,98,1,1,1,1),(2,99,0,0,0,0),(2,100,0,0,0,0),(2,101,1,1,1,1),(2,102,1,1,1,1),(2,103,0,0,0,0),(3,0,1,1,1,1),(3,1,0,0,0,0),(3,2,0,0,0,0),(3,3,0,0,0,0),(3,4,0,0,0,0),(3,5,0,0,0,0),(3,6,0,0,0,0),(3,7,0,0,0,0),(3,8,0,0,0,0),(3,9,1,1,1,1),(3,10,1,1,1,1),(3,11,1,1,1,1),(3,12,0,0,0,0),(3,13,1,1,1,1),(3,14,0,0,0,0),(3,15,0,0,0,0),(3,16,0,0,0,0),(3,17,0,0,0,0),(3,18,0,0,0,0),(3,19,0,0,0,0),(3,20,1,1,1,1),(3,21,1,1,1,1),(3,22,1,1,1,1),(3,23,1,1,1,1),(3,24,0,0,0,0),(3,25,0,0,0,0),(3,26,0,0,0,0),(3,27,1,1,1,1),(3,28,0,0,0,0),(3,29,0,0,0,0),(3,30,0,0,0,0),(3,31,1,1,1,1),(3,32,1,1,1,1),(3,33,1,1,1,1),(3,34,1,1,1,1),(3,35,1,1,1,1),(3,36,1,1,1,1),(3,37,0,0,0,0),(3,38,1,1,1,1),(3,39,1,1,1,1),(3,40,0,0,0,0),(3,41,0,0,0,0),(3,42,0,0,0,0),(3,43,0,0,0,0),(3,44,0,0,0,0),(3,45,0,0,0,0),(3,46,0,0,0,0),(3,47,0,0,0,0),(3,48,0,0,0,0),(3,49,1,1,1,1),(3,50,1,1,1,1),(3,51,1,1,1,1),(3,52,1,1,1,1),(3,53,0,0,0,0),(3,54,0,0,0,0),(3,55,0,0,0,0),(3,56,0,0,0,0),(3,57,0,0,0,0),(3,58,0,0,0,0),(3,59,0,0,0,0),(3,60,0,0,0,0),(3,61,0,0,0,0),(3,62,1,1,1,1),(3,63,0,0,0,0),(3,64,0,0,0,0),(3,65,0,0,0,0),(3,66,0,0,0,0),(3,67,0,0,0,0),(3,68,0,0,0,0),(3,69,0,0,0,0),(3,70,0,0,0,0),(3,71,0,0,0,0),(3,72,0,0,0,0),(3,73,0,0,0,0),(3,74,0,0,0,0),(3,75,0,0,0,0),(3,76,0,0,0,0),(3,77,0,0,0,0),(3,78,0,0,0,0),(3,79,0,0,0,0),(3,80,0,0,0,0),(3,81,0,0,0,0),(3,82,0,0,0,0),(3,83,0,0,0,0),(3,84,0,0,0,0),(3,85,0,0,0,0),(3,86,0,0,0,0),(3,87,0,0,0,0),(3,88,0,0,0,0),(3,89,0,0,0,0),(3,90,0,0,0,0),(3,91,0,0,0,0),(3,92,0,0,0,0),(3,93,0,0,0,0),(3,94,0,0,0,0),(3,95,0,0,0,0),(3,96,1,1,1,1),(3,97,1,1,1,1),(3,98,1,1,1,1),(3,99,0,0,0,0),(3,100,0,0,0,0),(3,101,1,1,1,1),(3,102,1,1,1,1),(3,103,0,0,0,0),(4,0,1,1,1,1),(4,1,0,0,0,0),(4,2,0,0,0,0),(4,3,0,0,0,0),(4,4,0,0,0,0),(4,5,1,0,0,0),(4,6,0,0,0,0),(4,7,0,0,0,0),(4,8,0,0,0,0),(4,9,1,1,1,1),(4,10,0,0,0,0),(4,11,0,0,0,0),(4,12,0,0,0,0),(4,13,0,0,0,0),(4,14,0,0,0,0),(4,15,0,0,0,0),(4,16,0,0,0,0),(4,17,0,0,0,0),(4,18,0,0,0,0),(4,19,0,0,0,0),(4,20,0,0,0,0),(4,21,1,1,1,1),(4,22,1,1,1,1),(4,23,0,0,0,0),(4,24,0,0,0,0),(4,25,0,0,0,0),(4,26,0,0,0,0),(4,27,0,0,0,0),(4,28,0,0,0,0),(4,29,0,0,0,0),(4,30,0,0,0,0),(4,31,0,0,0,0),(4,32,0,0,0,0),(4,33,0,0,0,0),(4,34,0,0,0,0),(4,35,0,0,0,0),(4,36,0,0,0,0),(4,37,0,0,0,0),(4,38,0,0,0,0),(4,39,0,0,0,0),(4,40,0,0,0,0),(4,41,0,0,0,0),(4,42,0,0,0,0),(4,43,0,0,0,0),(4,44,0,0,0,0),(4,45,0,0,0,0),(4,46,0,0,0,0),(4,47,0,0,0,0),(4,48,0,0,0,0),(4,49,0,0,0,0),(4,50,0,0,0,0),(4,51,0,0,0,0),(4,52,0,0,0,0),(4,53,0,0,0,0),(4,54,0,0,0,0),(4,55,0,0,0,0),(4,56,0,0,0,0),(4,57,0,0,0,0),(4,58,0,0,0,0),(4,59,0,0,0,0),(4,60,0,0,0,0),(4,61,1,1,1,1),(4,62,0,0,0,0),(4,63,0,0,0,0),(4,64,0,0,0,0),(4,65,0,0,0,0),(4,66,0,0,0,0),(4,67,0,0,0,0),(4,68,0,0,0,0),(4,69,0,0,0,0),(4,70,0,0,0,0),(4,71,0,0,0,0),(4,72,1,1,1,1),(4,73,0,0,0,0),(4,74,0,0,0,0),(4,75,0,0,0,0),(4,76,0,0,0,0),(4,77,0,0,0,0),(4,78,0,0,0,0),(4,79,0,0,0,0),(4,80,0,0,0,0),(4,81,0,0,0,0),(4,82,0,0,0,0),(4,83,0,0,0,0),(4,84,0,0,0,0),(4,85,0,0,0,0),(4,86,0,0,0,0),(4,87,0,0,0,0),(4,88,0,0,0,0),(4,89,0,0,0,0),(4,90,0,0,0,0),(4,91,0,0,0,0),(4,92,0,0,0,0),(4,93,0,0,0,0),(4,94,0,0,0,0),(4,95,0,0,0,0),(4,96,0,0,0,0),(4,97,0,0,0,0),(4,98,0,0,0,0),(4,99,0,0,0,0),(4,100,0,0,0,0),(4,101,0,0,0,0),(4,102,0,0,0,0),(4,103,0,0,0,0),(5,0,1,1,1,1),(5,1,0,0,0,0),(5,2,0,0,0,0),(5,3,0,0,0,0),(5,4,0,0,0,0),(5,5,1,0,0,0),(5,6,0,0,0,0),(5,7,0,0,0,0),(5,8,0,0,0,0),(5,9,1,1,1,1),(5,10,1,1,1,1),(5,11,1,1,1,1),(5,12,0,0,0,0),(5,13,0,0,0,0),(5,14,0,0,0,0),(5,15,0,0,0,0),(5,16,0,0,0,0),(5,17,0,0,0,0),(5,18,0,0,0,0),(5,19,1,1,1,1),(5,20,1,0,0,0),(5,21,1,1,1,1),(5,22,1,1,1,1),(5,23,0,0,0,0),(5,24,0,0,0,0),(5,25,0,0,0,0),(5,26,1,0,0,0),(5,27,0,0,0,0),(5,28,0,0,0,0),(5,29,0,0,0,0),(5,30,0,0,0,0),(5,31,1,1,1,1),(5,32,1,1,1,1),(5,33,0,0,0,0),(5,34,0,0,0,0),(5,35,1,1,1,1),(5,36,0,0,0,0),(5,37,1,1,1,1),(5,38,1,1,1,1),(5,39,1,1,1,1),(5,40,1,1,1,1),(5,41,1,1,1,1),(5,42,0,0,0,0),(5,43,0,0,0,0),(5,44,0,0,0,0),(5,45,0,0,0,0),(5,46,0,0,0,0),(5,47,0,0,0,0),(5,48,0,0,0,0),(5,49,0,0,0,0),(5,50,0,0,0,0),(5,51,0,0,0,0),(5,52,0,0,0,0),(5,53,0,0,0,0),(5,54,0,0,0,0),(5,55,0,0,0,0),(5,56,0,0,0,0),(5,57,0,0,0,0),(5,58,0,0,0,0),(5,59,0,0,0,0),(5,60,0,0,0,0),(5,61,0,0,0,0),(5,62,1,1,1,1),(5,63,0,0,0,0),(5,64,0,0,0,0),(5,65,0,0,0,0),(5,66,0,0,0,0),(5,67,0,0,0,0),(5,68,0,0,0,0),(5,69,0,0,0,0),(5,70,0,0,0,0),(5,71,0,0,0,0),(5,72,0,0,0,0),(5,73,0,0,0,0),(5,74,0,0,0,0),(5,75,0,0,0,0),(5,76,0,0,0,0),(5,77,0,0,0,0),(5,78,0,0,0,0),(5,79,0,0,0,0),(5,80,0,0,0,0),(5,81,0,0,0,0),(5,82,0,0,0,0),(5,83,0,0,0,0),(5,84,0,0,0,0),(5,85,0,0,0,0),(5,86,1,1,1,1),(5,87,0,0,0,0),(5,88,0,0,0,0),(5,89,0,0,0,0),(5,90,0,0,0,0),(5,91,0,0,0,0),(5,92,0,0,0,0),(5,93,1,1,1,1),(5,94,0,0,0,0),(5,95,1,1,1,1),(5,96,0,0,0,0),(5,97,0,0,0,0),(5,98,0,0,0,0),(5,99,0,0,0,0),(5,100,0,0,0,0),(5,101,1,0,0,0),(5,102,0,0,0,0),(5,103,0,0,0,0);
/*!40000 ALTER TABLE `ps_access` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_accessory` WRITE;
/*!40000 ALTER TABLE `ps_accessory` DISABLE KEYS */;
INSERT INTO `ps_accessory` VALUES (8,17),(8,18),(8,19),(8,20),(8,28),(17,8),(17,18),(17,19),(17,20);
/*!40000 ALTER TABLE `ps_accessory` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_address` WRITE;
/*!40000 ALTER TABLE `ps_address` DISABLE KEYS */;
INSERT INTO `ps_address` VALUES (1,21,0,0,1,0,0,'manufacturer','','JOBS','STEVE','1 Infinite Loop','','95014','Cupertino','','(800) 275-2273','','','','2013-06-18 03:24:45','2013-06-18 03:24:45',1,0),(2,8,0,1,0,0,0,'Mon adresse','My Company','DOE','John','16, Main street','2nd floor','75002','Paris ','','0102030405','','','','2013-06-18 03:24:46','2013-06-18 03:24:46',1,0),(3,21,32,0,0,1,0,'supplier','Apple','supplier','supplier','767 Fifth Ave.','','10153','New York','','(212) 336-1440','','','','2013-06-18 03:24:46','2013-06-18 03:24:46',1,0),(4,21,13,0,0,2,0,'supplier','Shure','supplier','supplier','5800 W. Touhy Ave','','60714','Niles','','800-434-3350','','','','2013-06-18 03:24:46','2013-06-18 03:24:46',1,0),(5,21,15,3,0,0,0,'My addressjghjhg','','Nguyen','Duyen','JHGJHGJ','','70000','ghjhgjhg','','0902830569','','','','2013-06-27 05:51:09','2013-06-27 05:51:09',1,0),(6,21,1,2,0,0,0,'My address','','nguyen','anh','TRL N H NG O','','12345','codespot','','0979123345','','','','2013-06-27 23:43:12','2013-06-27 23:43:12',1,0);
/*!40000 ALTER TABLE `ps_address` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_address_format` WRITE;
/*!40000 ALTER TABLE `ps_address_format` DISABLE KEYS */;
INSERT INTO `ps_address_format` VALUES (1,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(2,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(3,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(4,'firstname lastname\ncompany\naddress1\naddress2\ncity State:name postcode\nCountry:name\nphone'),(5,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(6,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(7,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(8,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(9,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(10,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(11,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(12,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(13,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(14,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(15,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(16,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(17,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(18,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(19,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(20,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(21,'firstname lastname\ncompany\naddress1 address2\ncity, State:name postcode\nCountry:name\nphone'),(22,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(23,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(24,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(25,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(26,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(27,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(28,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(29,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(30,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(31,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(32,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(33,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(34,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(35,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(36,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(37,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(38,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(39,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(40,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(41,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(42,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(43,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(44,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(45,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(46,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(47,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(48,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(49,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(50,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(51,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(52,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(53,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(54,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(55,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(56,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(57,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(58,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(59,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(60,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(61,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(62,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(63,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(64,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(65,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(66,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(67,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(68,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(69,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(70,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(71,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(72,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(73,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(74,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(75,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(76,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(77,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(78,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(79,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(80,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(81,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(82,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(83,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(84,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(85,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(86,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(87,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(88,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(89,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(90,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(91,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(92,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(93,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(94,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(95,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(96,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(97,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(98,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(99,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(100,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(101,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(102,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(103,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(104,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(105,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(106,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(107,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(108,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(109,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(110,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(111,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(112,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(113,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(114,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(115,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(116,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(117,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(118,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(119,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(120,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(121,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(122,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(123,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(124,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(125,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(126,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(127,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(128,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(129,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(130,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(131,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(132,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(133,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(134,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(135,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(136,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(137,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(138,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(139,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(140,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(141,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(142,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(143,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(144,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(145,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(146,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(147,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(148,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(149,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(150,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(151,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(152,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(153,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(154,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(155,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(156,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(157,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(158,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(159,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(160,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(161,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(162,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(163,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(164,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(165,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(166,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(167,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(168,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(169,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(170,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(171,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(172,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(173,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(174,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(175,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(176,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(177,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(178,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(179,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(180,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(181,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(182,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(183,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(184,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(185,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(186,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(187,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(188,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(189,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(190,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(191,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(192,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(193,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(194,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(195,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(196,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(197,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(198,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(199,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(200,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(201,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(202,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(203,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(204,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(205,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(206,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(207,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(208,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(209,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(210,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(211,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(212,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(213,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(214,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(215,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(216,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(217,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(218,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(219,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(220,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(221,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(222,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(223,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(224,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(225,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(226,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(227,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(228,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(229,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(230,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(231,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(232,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(233,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(234,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(235,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(236,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(237,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(238,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(239,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(240,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(241,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(242,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(243,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(244,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone');
/*!40000 ALTER TABLE `ps_address_format` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_advice` WRITE;
/*!40000 ALTER TABLE `ps_advice` DISABLE KEYS */;
INSERT INTO `ps_advice` VALUES (1,1,53,0,'before','#configuration_form');
/*!40000 ALTER TABLE `ps_advice` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_advice_lang` WRITE;
/*!40000 ALTER TABLE `ps_advice_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_advice_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_alias` WRITE;
/*!40000 ALTER TABLE `ps_alias` DISABLE KEYS */;
INSERT INTO `ps_alias` VALUES (1,'ipdo','ipod',1),(2,'piod','ipod',1);
/*!40000 ALTER TABLE `ps_alias` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_attachment` WRITE;
/*!40000 ALTER TABLE `ps_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_attachment` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_attachment_lang` WRITE;
/*!40000 ALTER TABLE `ps_attachment_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_attachment_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_attribute` WRITE;
/*!40000 ALTER TABLE `ps_attribute` DISABLE KEYS */;
INSERT INTO `ps_attribute` VALUES (1,1,'',0),(2,1,'',1),(3,2,'#D2D6D5',0),(4,2,'#008CB7',1),(5,2,'#F3349E',2),(6,2,'#93D52D',3),(7,2,'#FD9812',4),(8,1,'',2),(9,1,'',3),(10,3,'',0),(11,3,'',1),(12,1,'',4),(13,1,'',5),(14,2,'#000000',5),(15,1,'',6),(16,1,'',7),(17,1,'',8),(18,2,'#7800F0',6),(19,2,'#F6EF04',7),(20,2,'#F60409',8);
/*!40000 ALTER TABLE `ps_attribute` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_attribute_group` WRITE;
/*!40000 ALTER TABLE `ps_attribute_group` DISABLE KEYS */;
INSERT INTO `ps_attribute_group` VALUES (1,0,'select',0),(2,1,'color',1),(3,0,'select',2);
/*!40000 ALTER TABLE `ps_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_attribute_group_lang` WRITE;
/*!40000 ALTER TABLE `ps_attribute_group_lang` DISABLE KEYS */;
INSERT INTO `ps_attribute_group_lang` VALUES (1,1,'Disk space','Disk space'),(1,2,'Disk space','Disk space'),(2,1,'Color','Color'),(2,2,'Color','Color'),(3,1,'ICU','Processor'),(3,2,'ICU','Processor');
/*!40000 ALTER TABLE `ps_attribute_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_attribute_group_shop` WRITE;
/*!40000 ALTER TABLE `ps_attribute_group_shop` DISABLE KEYS */;
INSERT INTO `ps_attribute_group_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5);
/*!40000 ALTER TABLE `ps_attribute_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_attribute_impact` WRITE;
/*!40000 ALTER TABLE `ps_attribute_impact` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_attribute_impact` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_attribute_lang` WRITE;
/*!40000 ALTER TABLE `ps_attribute_lang` DISABLE KEYS */;
INSERT INTO `ps_attribute_lang` VALUES (1,1,'2GB'),(1,2,'2GB'),(2,1,'4GB'),(2,2,'4GB'),(3,1,'Metal'),(3,2,'Metal'),(4,1,'Blue'),(4,2,'Blue'),(5,1,'Pink'),(5,2,'Pink'),(6,1,'Green'),(6,2,'Green'),(7,1,'Orange'),(7,2,'Orange'),(8,1,'Optional 64GB solid-state drive'),(8,2,'Optional 64GB solid-state drive'),(9,1,'80GB Parallel ATA Drive @ 4200 rpm'),(9,2,'80GB Parallel ATA Drive @ 4200 rpm'),(10,1,'1.60GHz Intel Core 2 Duo'),(10,2,'1.60GHz Intel Core 2 Duo'),(11,1,'1.80GHz Intel Core 2 Duo'),(11,2,'1.80GHz Intel Core 2 Duo'),(12,1,'80GB: 20,000 Songs'),(12,2,'80GB: 20,000 Songs'),(13,1,'160GB: 40,000 Songs'),(13,2,'160GB: 40,000 Songs'),(14,1,'Black'),(14,2,'Black'),(15,1,'8GB'),(15,2,'8GB'),(16,1,'16GB'),(16,2,'16GB'),(17,1,'32GB'),(17,2,'32GB'),(18,1,'Purple'),(18,2,'Purple'),(19,1,'Yellow'),(19,2,'Yellow'),(20,1,'Red'),(20,2,'Red');
/*!40000 ALTER TABLE `ps_attribute_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_attribute_shop` WRITE;
/*!40000 ALTER TABLE `ps_attribute_shop` DISABLE KEYS */;
INSERT INTO `ps_attribute_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(7,1),(7,2),(7,3),(7,4),(7,5),(8,1),(8,2),(8,3),(8,4),(8,5),(9,1),(9,2),(9,3),(9,4),(9,5),(10,1),(10,2),(10,3),(10,4),(10,5),(11,1),(11,2),(11,3),(11,4),(11,5),(12,1),(12,2),(12,3),(12,4),(12,5),(13,1),(13,2),(13,3),(13,4),(13,5),(14,1),(14,2),(14,3),(14,4),(14,5),(15,1),(15,2),(15,3),(15,4),(15,5),(16,1),(16,2),(16,3),(16,4),(16,5),(17,1),(17,2),(17,3),(17,4),(17,5),(18,1),(18,2),(18,3),(18,4),(18,5),(19,1),(19,2),(19,3),(19,4),(19,5),(20,1),(20,2),(20,3),(20,4),(20,5);
/*!40000 ALTER TABLE `ps_attribute_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_badge` WRITE;
/*!40000 ALTER TABLE `ps_badge` DISABLE KEYS */;
INSERT INTO `ps_badge` VALUES (1,1,'feature',1,1,10,1),(2,2,'feature',2,1,10,1),(3,3,'feature',2,2,15,0),(4,4,'feature',3,1,15,0),(5,5,'feature',3,2,15,0),(6,6,'feature',4,1,15,0),(7,7,'feature',4,2,15,0),(8,8,'feature',5,1,5,1),(9,9,'feature',5,2,10,1),(10,10,'feature',6,1,15,1),(11,11,'feature',6,2,10,0),(12,12,'feature',6,3,10,0),(13,13,'feature',5,3,10,0),(14,14,'feature',5,4,15,0),(15,15,'feature',5,5,20,0),(16,16,'feature',5,6,20,0),(17,17,'achievement',7,1,5,1),(18,18,'achievement',7,2,10,0),(19,19,'feature',8,1,15,0),(20,20,'feature',8,2,15,0),(21,21,'feature',9,1,15,0),(22,22,'feature',10,1,10,1),(23,23,'feature',10,2,10,1),(24,24,'feature',10,3,10,0),(25,25,'feature',10,4,10,0),(26,26,'feature',10,5,10,0),(27,27,'feature',4,3,10,0),(28,28,'feature',3,3,10,0),(29,29,'achievement',11,1,5,0),(30,30,'achievement',11,2,10,0),(31,31,'achievement',11,3,15,0),(32,32,'achievement',11,4,20,0),(33,33,'achievement',11,5,25,0),(34,34,'achievement',11,6,30,0),(35,35,'achievement',7,3,15,0),(36,36,'achievement',7,4,20,0),(37,37,'achievement',7,5,25,0),(38,38,'achievement',7,6,30,0),(39,39,'achievement',12,1,5,1),(40,40,'achievement',12,2,10,0),(41,41,'achievement',12,3,15,0),(42,42,'achievement',12,4,20,0),(43,43,'achievement',12,5,25,0),(44,44,'achievement',12,6,30,0),(45,45,'achievement',13,1,5,1),(46,46,'achievement',13,2,10,1),(47,47,'achievement',13,3,15,0),(48,48,'achievement',13,4,20,0),(49,49,'achievement',13,5,25,0),(50,50,'achievement',13,6,30,0),(51,51,'achievement',14,1,5,1),(52,52,'achievement',14,2,10,0),(53,53,'achievement',14,3,15,0),(54,54,'achievement',14,4,20,0),(55,55,'achievement',14,5,25,0),(56,56,'achievement',14,6,30,0),(57,57,'achievement',15,1,5,0),(58,58,'achievement',15,2,10,0),(59,59,'achievement',15,3,15,0),(60,60,'achievement',15,4,20,0),(61,61,'achievement',15,5,25,0),(62,62,'achievement',15,6,30,0),(63,63,'achievement',16,1,5,1),(64,64,'achievement',16,2,10,0),(65,65,'achievement',16,3,15,0),(66,66,'achievement',16,4,20,0),(67,67,'achievement',16,5,25,0),(68,68,'achievement',16,6,30,0),(69,74,'international',22,1,10,0),(70,75,'international',23,1,10,0),(71,83,'international',31,1,10,0),(72,84,'international',25,1,10,0),(73,85,'international',32,1,10,0),(74,86,'international',33,1,10,0),(75,87,'international',34,1,10,0),(76,88,'feature',35,1,5,0),(77,89,'feature',35,2,10,0),(78,90,'feature',35,3,10,0),(79,91,'feature',35,4,10,0),(80,92,'feature',35,5,10,0),(81,93,'feature',35,6,10,0),(82,94,'feature',36,1,5,1),(83,95,'feature',36,2,5,1),(84,96,'feature',36,3,10,1),(85,97,'feature',36,4,10,0),(86,98,'feature',36,5,20,0),(87,99,'feature',36,6,20,0),(88,100,'feature',8,3,15,0),(89,101,'achievement',37,1,5,0),(90,102,'achievement',37,2,5,0),(91,103,'achievement',37,3,10,0),(92,104,'achievement',37,4,10,0),(93,105,'achievement',37,5,15,0),(94,106,'achievement',37,6,15,0),(95,107,'achievement',38,1,10,0),(96,108,'achievement',38,2,10,0),(97,109,'achievement',38,3,15,0),(98,110,'achievement',38,4,20,0),(99,111,'achievement',38,5,25,0),(100,112,'achievement',38,6,30,0);
/*!40000 ALTER TABLE `ps_badge` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_badge_lang` WRITE;
/*!40000 ALTER TABLE `ps_badge_lang` DISABLE KEYS */;
INSERT INTO `ps_badge_lang` VALUES (1,1,'SEO','You enabled the URL rewriting through the tab \"Preferences > SEO and URLs\".','SEO'),(1,2,'SEO','You enabled the URL rewriting through the tab \"Preferences > SEO and URLs\".','SEO'),(2,1,'Site Performance','You enabled CCC (Combine, Compress and Cache), Rijndael and Smarty through the tab \r\nAdvanced Parameters > Performance.','Site Performance'),(2,2,'Site Performance','You enabled CCC (Combine, Compress and Cache), Rijndael and Smarty through the tab \r\nAdvanced Parameters > Performance.','Site Performance'),(3,1,'Site Performance','You enabled medias servers through the tab \"Advanced parameters > Performances\".','Site Performance'),(3,2,'Site Performance','You enabled medias servers through the tab \"Advanced parameters > Performances\".','Site Performance'),(4,1,'Payment','You configured a payment solution on your store.','Payment'),(4,2,'Payment','You configured a payment solution on your store.','Payment'),(5,1,'Payment','You offer two different payment methods to your customers.','Payment'),(5,2,'Payment','You offer two different payment methods to your customers.','Payment'),(6,1,'Shipping','You configured a carrier on your store.','Shipping'),(6,2,'Shipping','You configured a carrier on your store.','Shipping'),(7,1,'Shipping','You offer two shipping solutions (carriers) to your customers.','Shipping'),(7,2,'Shipping','You offer two shipping solutions (carriers) to your customers.','Shipping'),(8,1,'Catalog Size','You added your first product to your catalog!','Catalog Size'),(8,2,'Catalog Size','You added your first product to your catalog!','Catalog Size'),(9,1,'Catalog Size','You have 10 products within your catalog.','Catalog Size'),(9,2,'Catalog Size','You have 10 products within your catalog.','Catalog Size'),(10,1,'Contact information','You configured your phone number so your customers can reach you!','Contact information'),(10,2,'Contact information','You configured your phone number so your customers can reach you!','Contact information'),(11,1,'Contact information','You added a third email address to your contact form.','Contact information'),(11,2,'Contact information','You added a third email address to your contact form.','Contact information'),(12,1,'Contact information','You suggest a total of 5 departments to be reached by your customers via your contact form.','Contact information'),(12,2,'Contact information','You suggest a total of 5 departments to be reached by your customers via your contact form.','Contact information'),(13,1,'Catalog Size','You have 100 products within your catalog.','Catalog Size'),(13,2,'Catalog Size','You have 100 products within your catalog.','Catalog Size'),(14,1,'Catalog Size','You have 1,000 products within your catalog.','Catalog Size'),(14,2,'Catalog Size','You have 1,000 products within your catalog.','Catalog Size'),(15,1,'Catalog Size','You have 10,000 products within your catalog.','Catalog Size'),(15,2,'Catalog Size','You have 10,000 products within your catalog.','Catalog Size'),(16,1,'Catalog Size','You have 100,000 products within your catalog.','Catalog Size'),(16,2,'Catalog Size','You have 100,000 products within your catalog.','Catalog Size'),(17,1,'Days of Experience','You just installed PrestaShop!','Days of Experience'),(17,2,'Days of Experience','You just installed PrestaShop!','Days of Experience'),(18,1,'Days of Experience','You installed PrestaShop a week ago!','Days of Experience'),(18,2,'Days of Experience','You installed PrestaShop a week ago!','Days of Experience'),(19,1,'Customization','You uploaded your own logo.','Customization'),(19,2,'Customization','You uploaded your own logo.','Customization'),(20,1,'Customization','You installed a new template.','Customization'),(20,2,'Customization','You installed a new template.','Customization'),(21,1,'Addons','You connected your back-office to the Addons platform using your PrestaShop Addons account.','Addons'),(21,2,'Addons','You connected your back-office to the Addons platform using your PrestaShop Addons account.','Addons'),(22,1,'Multistores','You enabled the Multistores feature.','Multistores'),(22,2,'Multistores','You enabled the Multistores feature.','Multistores'),(23,1,'Multistores','You manage two stores with the Multistores feature.','Multistores'),(23,2,'Multistores','You manage two stores with the Multistores feature.','Multistores'),(24,1,'Multistores','You manage two different groups of stores using the Multistores feature.','Multistores'),(24,2,'Multistores','You manage two different groups of stores using the Multistores feature.','Multistores'),(25,1,'Multistores','You manage five stores with the Multistores feature.','Multistores'),(25,2,'Multistores','You manage five stores with the Multistores feature.','Multistores'),(26,1,'Multistores','You manage five different groups of stores using the Multistores feature.','Multistores'),(26,2,'Multistores','You manage five different groups of stores using the Multistores feature.','Multistores'),(27,1,'Shipping','You offer three different shipping solutions (carriers) to your customers.','Shipping'),(27,2,'Shipping','You offer three different shipping solutions (carriers) to your customers.','Shipping'),(28,1,'Payment','You offer three different payment methods to your customers.','Payment'),(28,2,'Payment','You offer three different payment methods to your customers.','Payment'),(29,1,'Revenue','You get this badge when you reach 100¤ in sales.','Revenue'),(29,2,'Revenue','You get this badge when you reach 100¤ in sales.','Revenue'),(30,1,'Revenue','You get this badge when you reach 1,000¤ in sales.','Revenue'),(30,2,'Revenue','You get this badge when you reach 1,000¤ in sales.','Revenue'),(31,1,'Revenue','You get this badge when you reach 10,000¤ in sales.','Revenue'),(31,2,'Revenue','You get this badge when you reach 10,000¤ in sales.','Revenue'),(32,1,'Revenue','You get this badge when you reach 100,000¤ in sales.','Revenue'),(32,2,'Revenue','You get this badge when you reach 100,000¤ in sales.','Revenue'),(33,1,'Revenue','You get this badge when you reach 1,000,000¤ in sales.','Revenue'),(33,2,'Revenue','You get this badge when you reach 1,000,000¤ in sales.','Revenue'),(34,1,'Revenue','You get this badge when you reach 10,000,000¤ in sales.','Revenue'),(34,2,'Revenue','You get this badge when you reach 10,000,000¤ in sales.','Revenue'),(35,1,'Days of Experience','You installed PrestaShop a month ago!','Days of Experience'),(35,2,'Days of Experience','You installed PrestaShop a month ago!','Days of Experience'),(36,1,'Days of Experience','You installed PrestaShop six months ago!','Days of Experience'),(36,2,'Days of Experience','You installed PrestaShop six months ago!','Days of Experience'),(37,1,'Days of Experience','You installed PrestaShop a year ago!','Days of Experience'),(37,2,'Days of Experience','You installed PrestaShop a year ago!','Days of Experience'),(38,1,'Days of Experience','You installed PrestaShop two years ago!','Days of Experience'),(38,2,'Days of Experience','You installed PrestaShop two years ago!','Days of Experience'),(39,1,'Visitors','You reached 10 visitors!','Visitors'),(39,2,'Visitors','You reached 10 visitors!','Visitors'),(40,1,'Visitors','You reached 100 visitors!','Visitors'),(40,2,'Visitors','You reached 100 visitors!','Visitors'),(41,1,'Visitors','You reached 1,000 visitors!','Visitors'),(41,2,'Visitors','You reached 1,000 visitors!','Visitors'),(42,1,'Visitors','You reached 10,000 visitors!','Visitors'),(42,2,'Visitors','You reached 10,000 visitors!','Visitors'),(43,1,'Visitors','You reached 100,000 visitors!','Visitors'),(43,2,'Visitors','You reached 100,000 visitors!','Visitors'),(44,1,'Visitors','You reached 1,000,000 visitors!','Visitors'),(44,2,'Visitors','',''),(45,1,'Customer Carts','Two carts have been created by visitors.','Customer Carts'),(45,2,'Customer Carts','',''),(46,1,'Customer Carts','Ten carts have been created by visitors.','Customer Carts'),(46,2,'Customer Carts','',''),(47,1,'Customer Carts','A hundred carts have been created by visitors on your store.','Customer Carts'),(47,2,'Customer Carts','',''),(48,1,'Customer Carts','A thousand carts have been created by visitors on your store.','Customer Carts'),(48,2,'Customer Carts','',''),(49,1,'Customer Carts','10,000 carts have been created by visitors.','Customer Carts'),(49,2,'Customer Carts','',''),(50,1,'Customer Carts','100,000 carts have been created by visitors.','Customer Carts'),(50,2,'Customer Carts','',''),(51,1,'Orders','You received your first order.','Orders'),(51,2,'Orders','',''),(52,1,'Orders','10 orders have been placed through your online store.','Orders'),(52,2,'Orders','',''),(53,1,'Orders','You received 100 orders through your online store!','Orders'),(53,2,'Orders','',''),(54,1,'Orders','You received 1,000 orders through your online store, congrats!','Orders'),(54,2,'Orders','',''),(55,1,'Orders','You received 10,000 orders through your online store, cheers!','Orders'),(55,2,'Orders','',''),(56,1,'Orders','You received 100,000 orders through your online store!','Orders'),(56,2,'Orders','',''),(57,1,'Customer Service Threads','You received  your first customer\'s message.','Customer Service Threads'),(57,2,'Customer Service Threads','',''),(58,1,'Customer Service Threads','You received 10 messages from your customers.','Customer Service Threads'),(58,2,'Customer Service Threads','',''),(59,1,'Customer Service Threads','You received 100 messages from your customers.','Customer Service Threads'),(59,2,'Customer Service Threads','',''),(60,1,'Customer Service Threads','You received 1,000 messages from your customers.','Customer Service Threads'),(60,2,'Customer Service Threads','',''),(61,1,'Customer Service Threads','You received 10,000 messages from your customers.','Customer Service Threads'),(61,2,'Customer Service Threads','',''),(62,1,'Customer Service Threads','You received 100,000 messages from your customers.','Customer Service Threads'),(62,2,'Customer Service Threads','',''),(63,1,'Customers','You got the first customer registered on your store!','Customers'),(63,2,'Customers','',''),(64,1,'Customers','You have over 10 customers registered on your store.','Customers'),(64,2,'Customers','',''),(65,1,'Customers','You have over 100 customers registered on your store.','Customers'),(65,2,'Customers','',''),(66,1,'Customers','You have over 1,000 customers registered on your store.','Customers'),(66,2,'Customers','',''),(67,1,'Customers','You have over 10,000 customers registered on your store.','Customers'),(67,2,'Customers','',''),(68,1,'Customers','You have over 100,000 customers registered on your store.','Customers'),(68,2,'Customers','',''),(69,1,'North America','You got your first sale in North America','North America'),(69,2,'North America','',''),(70,1,'Oceania','You got your first sale in Oceania','Oceania'),(70,2,'Oceania','',''),(71,1,'Asia','You got your first sale in Asia','Asia'),(71,2,'Asia','',''),(72,1,'South America','You got your first sale in South America','South America'),(72,2,'South America','',''),(73,1,'Europe','You got your first sale in  Europe!','Europe'),(73,2,'Europe','',''),(74,1,'Africa','You got your first sale in Africa','Africa'),(74,2,'Africa','',''),(75,1,'Maghreb','You got your first sale in Maghreb','Maghreb'),(75,2,'Maghreb','',''),(76,1,'Your Team\'s Employees','First employees accounts added to your shop','Your Team\'s Employees'),(76,2,'Your Team\'s Employees','',''),(77,1,'Your Team\'s Employees','3 employees accounts added to your shop','Your Team\'s Employees'),(77,2,'Your Team\'s Employees','',''),(78,1,'Your Team\'s Employees','5 employees accounts added to your shop','Your Team\'s Employees'),(78,2,'Your Team\'s Employees','',''),(79,1,'Your Team\'s Employees','10 employees accounts added to your shop','Your Team\'s Employees'),(79,2,'Your Team\'s Employees','',''),(80,1,'Your Team\'s Employees','20 employees accounts added to your shop','Your Team\'s Employees'),(80,2,'Your Team\'s Employees','',''),(81,1,'Your Team\'s Employees','40 employees accounts added to your shop','Your Team\'s Employees'),(81,2,'Your Team\'s Employees','',''),(82,1,'Product Pictures','First photo added to your catalog','Product Pictures'),(82,2,'Product Pictures','',''),(83,1,'Product Pictures','50 photos added to your catalog','Product Pictures'),(83,2,'Product Pictures','',''),(84,1,'Product Pictures','100 photos added to your catalog','Product Pictures'),(84,2,'Product Pictures','',''),(85,1,'Product Pictures','1000 photos added to your catalog','Product Pictures'),(85,2,'Product Pictures','',''),(86,1,'Product Pictures','10000 photos added to your catalog','Product Pictures'),(86,2,'Product Pictures','',''),(87,1,'Product Pictures','50000 photos added to your catalog','Product Pictures'),(87,2,'Product Pictures','',''),(88,1,'Customization','First CMS page added to your catalog','Customization'),(88,2,'Customization','',''),(89,1,'Cart Rules','First cart rules configured on your shop','Cart Rules'),(89,2,'Cart Rules','',''),(90,1,'Cart Rules','You have 10 cart rules configured on your shop','Cart Rules'),(90,2,'Cart Rules','',''),(91,1,'Cart Rules','You have 100 cart rules configured on your shop','Cart Rules'),(91,2,'Cart Rules','',''),(92,1,'Cart Rules','You have 500 cart rules configured on your shop','Cart Rules'),(92,2,'Cart Rules','',''),(93,1,'Cart Rules','You have 1000 cart rules configured on your shop','Cart Rules'),(93,2,'Cart Rules','',''),(94,1,'Cart Rules','You have 5000 cart rules configured on your shop','Cart Rules'),(94,2,'Cart Rules','',''),(95,1,'International Orders','First international order placed on your store','International Orders'),(95,2,'International Orders','',''),(96,1,'International Orders','10 international order placed on your store','International Orders'),(96,2,'International Orders','',''),(97,1,'International Orders','100 international order placed on your store','International Orders'),(97,2,'International Orders','',''),(98,1,'International Orders','1000 international order placed on your store','International Orders'),(98,2,'International Orders','',''),(99,1,'International Orders','5000 international order placed on your store','International Orders'),(99,2,'International Orders','',''),(100,1,'International Orders','10000 international order placed on your store','International Orders'),(100,2,'International Orders','','');
/*!40000 ALTER TABLE `ps_badge_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_carrier` WRITE;
/*!40000 ALTER TABLE `ps_carrier` DISABLE KEYS */;
INSERT INTO `ps_carrier` VALUES (1,1,0,'0','',1,0,0,0,0,0,0,0,'',0,0,0,0,0,0.000000,0),(2,2,0,'My carrier','',1,0,1,0,0,0,0,0,'',0,1,0,0,0,0.000000,0);
/*!40000 ALTER TABLE `ps_carrier` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_carrier_group` WRITE;
/*!40000 ALTER TABLE `ps_carrier_group` DISABLE KEYS */;
INSERT INTO `ps_carrier_group` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3);
/*!40000 ALTER TABLE `ps_carrier_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_carrier_lang` WRITE;
/*!40000 ALTER TABLE `ps_carrier_lang` DISABLE KEYS */;
INSERT INTO `ps_carrier_lang` VALUES (1,1,1,'Pick up in-store'),(2,1,1,'Delivery next day!'),(1,2,1,'Pick up in-store'),(2,2,1,'Delivery next day!'),(1,3,1,'Pick up in-store'),(2,3,1,'Delivery next day!'),(1,4,1,'Pick up in-store'),(2,4,1,'Delivery next day!'),(1,5,1,'Pick up in-store'),(2,5,1,'Delivery next day!'),(1,1,2,'Pick up in-store'),(2,1,2,'Delivery next day!'),(1,2,2,'Pick up in-store'),(2,2,2,'Delivery next day!'),(1,3,2,'Pick up in-store'),(2,3,2,'Delivery next day!'),(1,4,2,'Pick up in-store'),(2,4,2,'Delivery next day!'),(1,5,2,'Pick up in-store'),(2,5,2,'Delivery next day!');
/*!40000 ALTER TABLE `ps_carrier_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_carrier_shop` WRITE;
/*!40000 ALTER TABLE `ps_carrier_shop` DISABLE KEYS */;
INSERT INTO `ps_carrier_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5);
/*!40000 ALTER TABLE `ps_carrier_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_carrier_tax_rules_group_shop` WRITE;
/*!40000 ALTER TABLE `ps_carrier_tax_rules_group_shop` DISABLE KEYS */;
INSERT INTO `ps_carrier_tax_rules_group_shop` VALUES (1,1,1),(1,1,2),(1,1,3),(1,1,4),(1,1,5),(2,1,1),(2,1,2),(2,1,3),(2,1,4),(2,1,5);
/*!40000 ALTER TABLE `ps_carrier_tax_rules_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_carrier_zone` WRITE;
/*!40000 ALTER TABLE `ps_carrier_zone` DISABLE KEYS */;
INSERT INTO `ps_carrier_zone` VALUES (1,1),(2,1),(2,2);
/*!40000 ALTER TABLE `ps_carrier_zone` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart` WRITE;
/*!40000 ALTER TABLE `ps_cart` DISABLE KEYS */;
INSERT INTO `ps_cart` VALUES (1,1,1,2,'',1,2,2,1,1,1,'-1',1,0,'',0,0,'2013-06-18 03:24:48','2013-06-18 03:24:48'),(2,1,1,0,'',1,0,0,1,2,2,'3535fcd47c048f9466e2372e7fac49b2',0,0,'',0,0,'2013-06-18 22:17:09','2013-06-21 04:07:48'),(3,1,1,0,'',1,0,0,1,0,16,'',0,0,'',0,0,'2013-06-26 04:39:35','2013-06-26 04:39:36'),(4,1,1,0,'',1,0,0,1,0,17,'',0,0,'',0,0,'2013-06-26 04:45:55','2013-06-26 04:45:57'),(5,1,1,2,'',1,6,6,1,2,20,'3535fcd47c048f9466e2372e7fac49b2',0,0,'',0,0,'2013-06-26 22:18:14','2013-06-28 04:02:48'),(6,1,1,2,'a:1:{i:5;s:2:\"2,\";}',1,5,5,1,3,3,'42bf96bf3373fe56914f978e3087e1ea',0,0,'',0,0,'2013-06-26 23:45:19','2013-06-27 21:51:36'),(7,1,1,2,'',1,5,5,1,3,20,'42bf96bf3373fe56914f978e3087e1ea',0,0,'',0,0,'2013-06-27 23:17:45','2013-06-27 23:51:22'),(8,1,1,2,'a:1:{i:5;s:2:\"2,\";}',1,5,5,1,3,21,'42bf96bf3373fe56914f978e3087e1ea',0,0,'',0,0,'2013-06-28 04:59:08','2013-07-12 00:54:14'),(9,1,1,2,'',1,0,0,1,0,29,'',0,0,'',0,0,'2013-07-08 06:08:46','2013-07-08 06:50:24'),(10,1,1,0,'',1,0,0,1,0,32,'',0,0,'',0,0,'2013-07-12 00:43:54','2013-07-12 00:56:32'),(11,1,1,0,'',1,5,5,1,3,30,'42bf96bf3373fe56914f978e3087e1ea',0,0,'',0,0,'2013-07-12 03:12:57','2013-07-16 04:23:39'),(12,1,1,2,'a:1:{i:5;s:2:\"2,\";}',1,5,5,1,3,39,'42bf96bf3373fe56914f978e3087e1ea',0,0,'',0,0,'2013-07-12 04:02:58','2013-07-14 22:47:07'),(13,1,1,0,'',1,0,0,1,4,40,'d7b950100f28b1555b036b315a6764d9',0,0,'',0,0,'2013-07-12 04:44:20','2013-07-12 05:34:17'),(14,1,1,0,'',1,0,0,1,0,5,'',0,0,'',0,0,'2013-07-15 03:22:29','2013-07-15 03:22:53'),(15,1,1,0,'',1,0,0,1,0,5,'',0,0,'',0,0,'2013-07-15 03:22:29','2013-07-15 03:22:30'),(16,1,1,0,'',1,0,0,1,0,5,'',0,0,'',0,0,'2013-07-15 03:22:30','2013-07-15 03:22:30'),(17,1,1,0,'',1,5,5,1,3,43,'42bf96bf3373fe56914f978e3087e1ea',0,0,'',0,0,'2013-07-15 05:24:53','2013-07-15 05:58:32'),(18,1,1,0,'',1,0,0,1,0,47,'',0,0,'',0,0,'2013-07-15 05:53:04','2013-07-15 05:53:05'),(19,1,1,0,'',2,6,6,1,2,47,'3535fcd47c048f9466e2372e7fac49b2',0,0,'',0,0,'2013-07-15 05:53:05','2013-07-21 22:16:49'),(20,1,1,0,'',1,5,5,1,3,49,'42bf96bf3373fe56914f978e3087e1ea',0,0,'',0,0,'2013-07-16 04:11:02','2013-07-16 22:09:28'),(21,1,1,0,'',1,0,0,1,0,49,'',0,0,'',0,0,'2013-07-17 03:04:19','2013-07-17 03:15:44'),(22,1,1,0,'',1,5,5,1,3,53,'42bf96bf3373fe56914f978e3087e1ea',0,0,'',0,0,'2013-07-17 03:05:54','2013-07-19 06:02:50'),(23,1,1,0,'',1,0,0,1,0,52,'',0,0,'',1,0,'2013-07-17 05:37:28','2013-07-17 05:42:07'),(24,1,1,0,'',1,0,0,1,0,50,'',0,0,'',0,0,'2013-07-17 05:48:33','2013-07-17 05:48:33'),(25,1,1,0,'',1,0,0,1,0,56,'',0,0,'',0,0,'2013-07-21 22:07:50','2013-07-21 22:07:52'),(26,1,1,2,'a:1:{i:6;s:2:\"2,\";}',2,6,6,2,2,57,'3535fcd47c048f9466e2372e7fac49b2',0,0,'',0,0,'2013-07-21 23:46:35','2013-07-21 23:48:02'),(27,1,1,0,'',1,0,0,1,0,69,'',0,0,'',0,0,'2013-07-22 05:50:43','2013-07-23 04:04:16'),(28,1,1,0,'',1,0,0,1,0,58,'',0,0,'',0,0,'2013-07-22 06:37:23','2013-07-22 06:37:23'),(29,1,1,2,'a:1:{i:6;s:2:\"2,\";}',2,6,6,1,2,74,'3535fcd47c048f9466e2372e7fac49b2',0,0,'',0,0,'2013-07-23 22:01:53','2013-07-23 22:06:23'),(30,1,1,0,'',1,0,0,1,0,77,'',0,0,'',0,0,'2013-07-24 06:03:09','2013-07-24 06:03:09'),(31,1,1,2,'',2,0,0,1,0,78,'',0,0,'',0,0,'2013-07-24 07:08:50','2013-07-24 22:00:17'),(32,1,1,2,'',1,0,0,1,0,79,'',0,0,'',0,0,'2013-07-24 07:10:30','2013-07-25 06:18:51'),(33,1,1,2,'',1,0,0,1,0,75,'',0,0,'',0,0,'2013-07-24 21:22:25','2013-07-25 03:18:22'),(34,1,1,2,'',1,0,0,1,0,82,'',0,0,'',0,0,'2013-07-25 04:53:34','2013-07-25 04:53:39');
/*!40000 ALTER TABLE `ps_cart` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_cart_rule` WRITE;
/*!40000 ALTER TABLE `ps_cart_cart_rule` DISABLE KEYS */;
INSERT INTO `ps_cart_cart_rule` VALUES (6,1);
/*!40000 ALTER TABLE `ps_cart_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_product` WRITE;
/*!40000 ALTER TABLE `ps_cart_product` DISABLE KEYS */;
INSERT INTO `ps_cart_product` VALUES (2,8,0,1,28,1,'2013-06-21 03:25:14'),(3,19,0,1,34,1,'2013-06-26 04:39:36'),(4,19,0,1,34,1,'2013-06-26 04:45:55'),(4,20,0,1,36,1,'2013-06-26 04:45:56'),(4,21,0,1,38,1,'2013-06-26 04:45:57'),(5,8,6,1,28,2,'2013-06-27 09:19:00'),(6,18,5,1,32,1,'2013-06-26 23:45:19'),(6,21,5,1,38,1,'2013-06-26 23:45:51'),(6,29,5,1,54,1,'2013-06-26 23:45:53'),(5,19,6,1,34,1,'2013-06-27 05:47:09'),(5,20,6,1,36,2,'2013-06-28 15:02:48'),(7,17,5,1,30,1,'2013-06-27 23:17:46'),(7,8,5,1,28,1,'2013-06-27 23:17:47'),(7,23,5,1,42,1,'2013-06-27 23:17:48'),(5,21,6,1,38,1,'2013-06-28 04:02:43'),(8,32,5,1,60,1,'2013-06-28 05:07:33'),(8,29,5,1,54,1,'2013-06-28 05:48:35'),(8,31,5,1,58,1,'2013-06-28 05:51:30'),(9,18,0,1,32,2,'2013-07-08 17:50:24'),(9,30,0,1,56,1,'2013-07-08 06:09:40'),(8,18,5,1,32,1,'2013-07-12 00:41:24'),(10,20,0,1,36,5,'2013-07-12 11:56:28'),(10,19,0,1,34,1,'2013-07-12 00:43:58'),(10,23,0,1,42,3,'2013-07-12 11:56:30'),(8,21,5,1,38,2,'2013-07-12 11:54:14'),(10,24,0,1,44,1,'2013-07-12 00:56:32'),(11,24,5,1,44,1,'2013-07-12 03:12:57'),(12,19,5,1,34,1,'2013-07-12 04:02:58'),(12,20,5,1,36,1,'2013-07-12 04:03:00'),(13,18,0,1,32,1,'2013-07-12 04:44:20'),(13,19,0,1,34,1,'2013-07-12 04:44:21'),(15,20,0,1,36,1,'2013-07-15 03:22:30'),(14,21,0,1,38,1,'2013-07-15 03:22:30'),(16,22,0,1,40,1,'2013-07-15 03:22:30'),(14,23,0,1,42,1,'2013-07-15 03:22:53'),(17,22,5,1,40,1,'2013-07-15 05:25:00'),(18,19,0,1,34,1,'2013-07-15 05:53:05'),(17,18,5,1,32,1,'2013-07-15 05:55:39'),(17,19,5,1,34,1,'2013-07-15 05:55:56'),(17,21,5,1,38,1,'2013-07-15 05:58:32'),(11,29,5,1,54,1,'2013-07-16 04:23:39'),(22,21,5,1,38,1,'2013-07-17 03:05:54'),(21,25,0,1,46,1,'2013-07-17 03:12:22'),(21,23,0,1,42,1,'2013-07-17 03:15:43'),(23,19,0,1,34,1,'2013-07-17 05:37:29'),(22,17,5,1,30,2,'2013-07-17 16:39:56'),(23,18,0,1,32,3,'2013-07-17 16:42:07'),(24,19,0,1,34,1,'2013-07-17 05:48:33'),(19,19,6,1,34,1,'2013-07-17 05:51:33'),(19,17,6,1,30,1,'2013-07-19 00:15:46'),(25,20,0,1,36,1,'2013-07-21 22:07:50'),(25,24,0,1,44,1,'2013-07-21 22:07:51'),(26,17,6,1,30,1,'2013-07-21 23:46:35'),(27,27,0,1,50,1,'2013-07-22 05:50:43'),(27,32,0,1,60,1,'2013-07-22 05:50:47'),(28,18,0,1,32,1,'2013-07-22 06:37:23'),(29,18,6,1,32,1,'2013-07-23 22:01:53'),(30,19,0,1,34,1,'2013-07-24 06:03:09'),(31,17,0,1,30,1,'2013-07-24 07:08:50'),(32,23,0,1,42,1,'2013-07-24 07:10:30'),(32,24,0,1,44,1,'2013-07-24 07:10:33'),(31,19,0,1,34,1,'2013-07-24 21:59:47'),(33,21,0,1,38,1,'2013-07-24 22:53:57'),(33,22,0,1,40,1,'2013-07-24 23:11:35'),(33,23,0,1,42,1,'2013-07-24 23:11:37'),(34,19,0,1,34,2,'2013-07-25 04:53:35');
/*!40000 ALTER TABLE `ps_cart_product` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule` DISABLE KEYS */;
INSERT INTO `ps_cart_rule` VALUES (1,0,'2013-06-27 03:00:00','2014-06-19 14:20:14','',1232,15,1,1,'123',0.00,0,1,0,0,0,0,0,0,0,0,10.00,0.00,0,1,0,0,0,0,1,'2013-06-27 03:20:57','2013-06-27 22:07:54');
/*!40000 ALTER TABLE `ps_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule_carrier` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_cart_rule_carrier` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule_combination` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_cart_rule_combination` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule_country` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_cart_rule_country` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule_group` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_cart_rule_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule_lang` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule_lang` DISABLE KEYS */;
INSERT INTO `ps_cart_rule_lang` VALUES (1,1,'gift'),(1,2,'gift');
/*!40000 ALTER TABLE `ps_cart_rule_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule_product_rule` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule_product_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_cart_rule_product_rule` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule_product_rule_group` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule_product_rule_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_cart_rule_product_rule_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule_product_rule_value` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule_product_rule_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_cart_rule_product_rule_value` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cart_rule_shop` WRITE;
/*!40000 ALTER TABLE `ps_cart_rule_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_cart_rule_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_category` WRITE;
/*!40000 ALTER TABLE `ps_category` DISABLE KEYS */;
INSERT INTO `ps_category` VALUES (1,0,1,0,1,74,1,'2013-06-18 03:23:28','2013-06-18 03:23:28',0,0),(2,1,1,1,2,73,1,'2013-06-18 03:23:28','2013-06-18 03:23:28',0,1),(6,2,1,2,5,64,1,'2013-06-18 04:57:12','2013-06-26 03:22:23',1,0),(7,2,1,2,65,66,1,'2013-06-18 04:57:31','2013-06-26 03:28:48',2,0),(8,2,1,2,67,68,1,'2013-06-18 05:27:24','2013-06-26 03:28:53',3,0),(9,2,1,2,69,70,1,'2013-06-18 05:27:49','2013-06-26 03:29:00',4,0),(10,2,1,2,71,72,1,'2013-06-18 05:28:14','2013-06-26 03:29:05',5,0),(11,6,1,3,6,25,1,'2013-06-18 05:41:37','2013-07-16 22:35:02',1,0),(12,6,1,3,26,35,1,'2013-06-18 05:41:43','2013-06-18 23:42:00',2,0),(13,6,1,3,36,45,1,'2013-06-18 05:41:45','2013-06-18 23:42:04',3,0),(14,6,1,3,46,55,1,'2013-06-18 05:41:48','2013-06-18 23:42:09',4,0),(15,11,1,4,7,18,1,'2013-06-18 05:42:58','2013-07-16 22:40:03',1,0),(16,11,1,4,19,20,1,'2013-06-18 05:43:04','2013-06-18 05:43:04',0,0),(17,11,1,4,21,22,1,'2013-06-18 05:43:07','2013-06-18 05:43:07',0,0),(18,11,1,4,23,24,1,'2013-06-18 05:43:10','2013-06-18 05:43:10',0,0),(19,12,1,4,27,28,1,'2013-06-18 05:45:36','2013-06-18 05:45:36',0,0),(20,12,1,4,29,30,1,'2013-06-18 05:45:43','2013-06-18 05:45:43',0,0),(21,12,1,4,31,32,1,'2013-06-18 05:45:51','2013-06-18 05:45:51',0,0),(22,13,1,4,37,38,1,'2013-06-18 05:46:00','2013-06-18 05:46:00',0,0),(23,12,1,4,33,34,1,'2013-06-18 05:46:09','2013-06-18 05:46:09',0,0),(24,13,1,4,39,40,1,'2013-06-18 05:46:14','2013-06-18 05:46:14',0,0),(25,13,1,4,41,42,1,'2013-06-18 05:46:17','2013-06-18 05:46:17',0,0),(26,13,1,4,43,44,1,'2013-06-18 05:46:19','2013-06-18 05:46:19',0,0),(27,14,1,4,47,48,1,'2013-06-18 05:46:22','2013-06-18 05:46:22',0,0),(28,14,1,4,49,50,1,'2013-06-18 05:46:24','2013-06-18 05:46:24',0,0),(29,14,1,4,51,52,1,'2013-06-18 05:46:28','2013-06-18 05:46:28',0,0),(30,14,1,4,53,54,1,'2013-06-18 05:46:30','2013-06-18 05:46:30',0,0),(31,2,1,2,3,4,1,'2013-06-18 05:47:49','2013-06-26 03:30:03',6,0),(32,6,1,3,56,57,1,'2013-06-18 21:51:54','2013-06-18 21:51:54',0,0),(33,6,1,3,58,59,1,'2013-06-18 21:51:58','2013-06-18 21:51:58',0,0),(34,6,1,3,60,61,1,'2013-06-18 21:52:04','2013-06-18 21:52:04',0,0),(35,6,1,3,62,63,1,'2013-06-18 21:52:11','2013-06-18 21:52:11',0,0),(36,15,1,5,8,9,1,'2013-06-20 22:02:20','2013-06-20 22:02:20',0,0),(37,15,1,5,10,11,1,'2013-06-20 22:02:24','2013-06-20 22:02:24',0,0),(38,15,1,5,12,15,1,'2013-06-20 22:02:35','2013-06-20 22:02:35',0,0),(39,15,1,5,16,17,1,'2013-06-20 22:02:38','2013-06-20 22:02:38',0,0),(40,38,1,6,13,14,1,'2013-06-20 22:57:14','2013-06-20 22:57:14',0,0);
/*!40000 ALTER TABLE `ps_category` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_category_group` WRITE;
/*!40000 ALTER TABLE `ps_category_group` DISABLE KEYS */;
INSERT INTO `ps_category_group` VALUES (1,0),(2,0),(2,1),(2,2),(2,3),(6,1),(6,2),(6,3),(7,1),(7,2),(7,3),(8,1),(8,2),(8,3),(9,1),(9,2),(9,3),(10,1),(10,2),(10,3),(11,1),(11,2),(11,3),(12,1),(12,2),(12,3),(13,1),(13,2),(13,3),(14,1),(14,2),(14,3),(15,1),(15,2),(15,3),(16,1),(16,2),(16,3),(17,1),(17,2),(17,3),(18,1),(18,2),(18,3),(19,1),(19,2),(19,3),(20,1),(20,2),(20,3),(21,1),(21,2),(21,3),(22,1),(22,2),(22,3),(23,1),(23,2),(23,3),(24,1),(24,2),(24,3),(25,1),(25,2),(25,3),(26,1),(26,2),(26,3),(27,1),(27,2),(27,3),(28,1),(28,2),(28,3),(29,1),(29,2),(29,3),(30,1),(30,2),(30,3),(31,1),(31,2),(31,3),(32,1),(32,2),(32,3),(33,1),(33,2),(33,3),(34,1),(34,2),(34,3),(35,1),(35,2),(35,3),(36,1),(36,2),(36,3),(37,1),(37,2),(37,3),(38,1),(38,2),(38,3),(39,1),(39,2),(39,3),(40,1),(40,2),(40,3);
/*!40000 ALTER TABLE `ps_category_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_category_lang` WRITE;
/*!40000 ALTER TABLE `ps_category_lang` DISABLE KEYS */;
INSERT INTO `ps_category_lang` VALUES (1,1,1,'Root','','root','','',''),(1,1,2,'Root','','root','','',''),(1,2,1,'Root','','root','','',''),(1,2,2,'Root','','root','','',''),(1,3,1,'Root','','root','','',''),(1,3,2,'Root','','root','','',''),(1,4,1,'Root','','root','','',''),(1,4,2,'Root','','root','','',''),(1,5,1,'Root','','root','','',''),(1,5,2,'Root','','root','','',''),(2,1,1,'Home','','home','','',''),(2,1,2,'Home','','home','','',''),(2,2,1,'Home','','home','','',''),(2,2,2,'Home','','home','','',''),(2,3,1,'Home','','home','','',''),(2,3,2,'Home','','home','','',''),(2,4,1,'Home','','home','','',''),(2,4,2,'Home','','home','','',''),(2,5,1,'Home','','home','','',''),(2,5,2,'Home','','home','','',''),(6,1,1,'Clothes for men','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-men','','',''),(6,1,2,'Clothes for men','','clothes-for-men','','',''),(6,2,1,'Clothes for men','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-men','','',''),(6,2,2,'Clothes for men','','clothes-for-men','','',''),(6,3,1,'Clothes for men','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-men','','',''),(6,3,2,'Clothes for men','','clothes-for-men','','',''),(6,4,1,'Clothes for men','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-men','','',''),(6,4,2,'Clothes for men','','clothes-for-men','','',''),(6,5,1,'Clothes for men','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-men','','',''),(6,5,2,'Clothes for men','','clothes-for-men','','',''),(7,1,1,'Clothes for women','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-women','','',''),(7,1,2,'Clothes for women','','clothes-for-women','','',''),(7,2,1,'Clothes for women','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-women','','',''),(7,2,2,'Clothes for women','','clothes-for-women','','',''),(7,3,1,'Clothes for women','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-women','','',''),(7,3,2,'Clothes for women','','clothes-for-women','','',''),(7,4,1,'Clothes for women','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-women','','',''),(7,4,2,'Clothes for women','','clothes-for-women','','',''),(7,5,1,'Clothes for women','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','clothes-for-women','','',''),(7,5,2,'Clothes for women','','clothes-for-women','','',''),(8,1,1,'Mobile & Accessories','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','mobile-accessories','','',''),(8,1,2,'Mobile & Accessories','','mobile-accessories','','',''),(8,2,1,'Mobile & Accessories','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','mobile-accessories','','',''),(8,2,2,'Mobile & Accessories','','mobile-accessories','','',''),(8,3,1,'Mobile & Accessories','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','mobile-accessories','','',''),(8,3,2,'Mobile & Accessories','','mobile-accessories','','',''),(8,4,1,'Mobile & Accessories','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','mobile-accessories','','',''),(8,4,2,'Mobile & Accessories','','mobile-accessories','','',''),(8,5,1,'Mobile & Accessories','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','mobile-accessories','','',''),(8,5,2,'Mobile & Accessories','','mobile-accessories','','',''),(9,1,1,'computer & laptop','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','computer-laptop','','',''),(9,1,2,'computer & laptop','','computer-laptop','','',''),(9,2,1,'computer & laptop','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','computer-laptop','','',''),(9,2,2,'computer & laptop','','computer-laptop','','',''),(9,3,1,'computer & laptop','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','computer-laptop','','',''),(9,3,2,'computer & laptop','','computer-laptop','','',''),(9,4,1,'computer & laptop','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','computer-laptop','','',''),(9,4,2,'computer & laptop','','computer-laptop','','',''),(9,5,1,'computer & laptop','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','computer-laptop','','',''),(9,5,2,'computer & laptop','','computer-laptop','','',''),(10,1,1,'Household electronics','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','household-electronics','','',''),(10,1,2,'Household electronics','','household-electronics','','',''),(10,2,1,'Household electronics','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','household-electronics','','',''),(10,2,2,'Household electronics','','household-electronics','','',''),(10,3,1,'Household electronics','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','household-electronics','','',''),(10,3,2,'Household electronics','','household-electronics','','',''),(10,4,1,'Household electronics','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','household-electronics','','',''),(10,4,2,'Household electronics','','household-electronics','','',''),(10,5,1,'Household electronics','Aliquam accumsan vitea sueretrpi mas llcrem metusut pharetra. Lorem sed sedlir vestibulum ullancorper sollicituim lorem, acc varuis delis ductum vel. Curabitur tristique adipsicingqeu velit elit, ac eusimid mi. Dui egestas fincidunt molliser tristique adipising.','household-electronics','','',''),(10,5,2,'Household electronics','','household-electronics','','',''),(11,1,1,'Suspendisse risus','','suspendisse-risus','','',''),(11,1,2,'Suspendisse risus','','suspendisse-risus','','',''),(11,2,1,'Suspendisse risus','','suspendisse-risus','','',''),(11,2,2,'Suspendisse risus','','suspendisse-risus','','',''),(11,3,1,'Suspendisse risus','','suspendisse-risus','','',''),(11,3,2,'Suspendisse risus','','suspendisse-risus','','',''),(11,4,1,'Suspendisse risus','','suspendisse-risus','','',''),(11,4,2,'Suspendisse risus','','suspendisse-risus','','',''),(11,5,1,'Suspendisse risus','','suspendisse-risus','','',''),(11,5,2,'Suspendisse risus','','suspendisse-risus','','',''),(12,1,1,'Suspendisse risus','','suspendisse-risus','','',''),(12,1,2,'Suspendisse risus','','suspendisse-risus','','',''),(12,2,1,'Suspendisse risus','','suspendisse-risus','','',''),(12,2,2,'Suspendisse risus','','suspendisse-risus','','',''),(12,3,1,'Suspendisse risus','','suspendisse-risus','','',''),(12,3,2,'Suspendisse risus','','suspendisse-risus','','',''),(12,4,1,'Suspendisse risus','','suspendisse-risus','','',''),(12,4,2,'Suspendisse risus','','suspendisse-risus','','',''),(12,5,1,'Suspendisse risus','','suspendisse-risus','','',''),(12,5,2,'Suspendisse risus','','suspendisse-risus','','',''),(13,1,1,'Suspendisse risus','','suspendisse-risus','','',''),(13,1,2,'Suspendisse risus','','suspendisse-risus','','',''),(13,2,1,'Suspendisse risus','','suspendisse-risus','','',''),(13,2,2,'Suspendisse risus','','suspendisse-risus','','',''),(13,3,1,'Suspendisse risus','','suspendisse-risus','','',''),(13,3,2,'Suspendisse risus','','suspendisse-risus','','',''),(13,4,1,'Suspendisse risus','','suspendisse-risus','','',''),(13,4,2,'Suspendisse risus','','suspendisse-risus','','',''),(13,5,1,'Suspendisse risus','','suspendisse-risus','','',''),(13,5,2,'Suspendisse risus','','suspendisse-risus','','',''),(14,1,1,'Suspendisse risus','','suspendisse-risus','','',''),(14,1,2,'Suspendisse risus','','suspendisse-risus','','',''),(14,2,1,'Suspendisse risus','','suspendisse-risus','','',''),(14,2,2,'Suspendisse risus','','suspendisse-risus','','',''),(14,3,1,'Suspendisse risus','','suspendisse-risus','','',''),(14,3,2,'Suspendisse risus','','suspendisse-risus','','',''),(14,4,1,'Suspendisse risus','','suspendisse-risus','','',''),(14,4,2,'Suspendisse risus','','suspendisse-risus','','',''),(14,5,1,'Suspendisse risus','','suspendisse-risus','','',''),(14,5,2,'Suspendisse risus','','suspendisse-risus','','',''),(15,1,1,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(15,1,2,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(15,2,1,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(15,2,2,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(15,3,1,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(15,3,2,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(15,4,1,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(15,4,2,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(15,5,1,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(15,5,2,'Etiam sedduit massa sed ','','etiam-sedduit-massa-sed-','','',''),(16,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(16,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(16,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(16,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(16,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(16,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(16,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(16,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(16,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(16,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(17,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(18,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(19,1,1,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(19,1,2,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(19,2,1,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(19,2,2,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(19,3,1,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(19,3,2,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(19,4,1,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(19,4,2,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(19,5,1,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(19,5,2,'Nulla enim elit lorem','','nulla-enim-elit-lorem','','',''),(20,1,1,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(20,1,2,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(20,2,1,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(20,2,2,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(20,3,1,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(20,3,2,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(20,4,1,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(20,4,2,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(20,5,1,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(20,5,2,'Lorem ispums pendisse nulla','','lorem-ispums-pendisse-nulla','','',''),(21,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(21,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(21,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(21,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(21,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(21,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(21,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(21,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(21,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(21,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(22,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(23,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(24,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(25,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(26,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(27,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(28,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(29,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,1,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,1,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,2,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,2,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,3,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,3,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,4,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,4,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,5,1,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(30,5,2,'Turpiis massa lorem','','turpiis-massa-lorem','','',''),(31,1,1,'watches','','watches','','',''),(31,1,2,'watches','','watches','','',''),(31,2,1,'watches','','watches','','',''),(31,2,2,'watches','','watches','','',''),(31,3,1,'watches','','watches','','',''),(31,3,2,'watches','','watches','','',''),(31,4,1,'watches','','watches','','',''),(31,4,2,'watches','','watches','','',''),(31,5,1,'watches','','watches','','',''),(31,5,2,'watches','','watches','','',''),(32,1,1,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(32,1,2,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(32,2,1,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(32,2,2,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(32,3,1,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(32,3,2,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(32,4,1,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(32,4,2,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(32,5,1,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(32,5,2,'Praesent tempor sem sodales','','praesent-tempor-sem-sodales','','',''),(33,1,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(33,1,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(33,2,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(33,2,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(33,3,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(33,3,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(33,4,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(33,4,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(33,5,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(33,5,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(34,1,1,'Mobile Phones','','mobile-phones','','',''),(34,1,2,'Mobile Phones','','mobile-phones','','',''),(34,2,1,'Mobile Phones','','mobile-phones','','',''),(34,2,2,'Mobile Phones','','mobile-phones','','',''),(34,3,1,'Mobile Phones','','mobile-phones','','',''),(34,3,2,'Mobile Phones','','mobile-phones','','',''),(34,4,1,'Mobile Phones','','mobile-phones','','',''),(34,4,2,'Mobile Phones','','mobile-phones','','',''),(34,5,1,'Mobile Phones','','mobile-phones','','',''),(34,5,2,'Mobile Phones','','mobile-phones','','',''),(35,1,1,'Kelit Portas','','kelit-portas','','',''),(35,1,2,'Kelit Portas','','kelit-portas','','',''),(35,2,1,'Kelit Portas','','kelit-portas','','',''),(35,2,2,'Kelit Portas','','kelit-portas','','',''),(35,3,1,'Kelit Portas','','kelit-portas','','',''),(35,3,2,'Kelit Portas','','kelit-portas','','',''),(35,4,1,'Kelit Portas','','kelit-portas','','',''),(35,4,2,'Kelit Portas','','kelit-portas','','',''),(35,5,1,'Kelit Portas','','kelit-portas','','',''),(35,5,2,'Kelit Portas','','kelit-portas','','',''),(36,1,1,'Belkin Leather Folio','','belkin-leather-folio','','',''),(36,1,2,'Belkin Leather Folio','','belkin-leather-folio','','',''),(36,2,1,'Belkin Leather Folio','','belkin-leather-folio','','',''),(36,2,2,'Belkin Leather Folio','','belkin-leather-folio','','',''),(36,3,1,'Belkin Leather Folio','','belkin-leather-folio','','',''),(36,3,2,'Belkin Leather Folio','','belkin-leather-folio','','',''),(36,4,1,'Belkin Leather Folio','','belkin-leather-folio','','',''),(36,4,2,'Belkin Leather Folio','','belkin-leather-folio','','',''),(36,5,1,'Belkin Leather Folio','','belkin-leather-folio','','',''),(36,5,2,'Belkin Leather Folio','','belkin-leather-folio','','',''),(37,1,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(37,1,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(37,2,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(37,2,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(37,3,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(37,3,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(37,4,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(37,4,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(37,5,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(37,5,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,1,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,1,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,2,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,2,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,3,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,3,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,4,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,4,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,5,1,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(38,5,2,'Nam vitae orci nisi eu eleifend','','nam-vitae-orci-nisi-eu-eleifend','','',''),(39,1,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(39,1,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(39,2,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(39,2,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(39,3,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(39,3,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(39,4,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(39,4,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(39,5,1,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(39,5,2,'Cursus magna lacus antedios','','cursus-magna-lacus-antedios','','',''),(40,1,1,'Test','','test','','',''),(40,1,2,'Test','','test','','',''),(40,2,1,'Test','','test','','',''),(40,2,2,'Test','','test','','',''),(40,3,1,'Test','','test','','',''),(40,3,2,'Test','','test','','',''),(40,4,1,'Test','','test','','',''),(40,4,2,'Test','','test','','',''),(40,5,1,'Test','','test','','',''),(40,5,2,'Test','','test','','','');
/*!40000 ALTER TABLE `ps_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_category_product` WRITE;
/*!40000 ALTER TABLE `ps_category_product` DISABLE KEYS */;
INSERT INTO `ps_category_product` VALUES (2,13,0),(2,17,1),(2,18,2),(2,19,3),(2,20,4),(2,21,5),(2,22,6),(2,23,7),(2,24,8),(2,25,9),(2,26,10),(2,27,11),(2,28,12),(2,29,13),(2,30,14),(2,31,15),(2,32,16),(2,33,17),(2,34,18),(2,35,19),(2,36,20),(2,37,21),(2,38,22),(2,39,23),(2,40,24),(2,41,25),(2,42,26),(2,43,27),(6,13,0),(6,18,1),(6,19,2),(6,20,3),(6,21,4),(6,22,5),(6,23,6),(6,24,7),(6,25,8),(6,26,9),(6,27,10),(6,28,11),(6,29,12),(6,30,13),(6,31,14),(6,32,15),(6,33,16),(6,34,17),(6,35,18),(6,36,19),(6,37,20),(6,38,21),(6,39,22),(6,40,23),(6,41,24),(6,42,25),(6,43,26),(7,13,0),(7,19,1),(7,20,2),(7,21,3),(7,22,4),(7,23,5),(7,24,6),(7,25,7),(7,26,8),(7,27,9),(7,28,10),(7,29,11),(7,30,12),(7,31,13),(7,32,14),(7,33,15),(7,34,16),(7,35,17),(7,36,18),(7,37,19),(7,38,20),(7,39,21),(7,40,22),(7,41,23),(7,43,24),(8,8,0),(8,13,1),(8,17,2),(8,18,3),(8,19,4),(8,20,5),(8,21,6),(8,22,7),(8,23,8),(8,24,9),(8,25,10),(8,26,11),(8,27,12),(8,28,13),(8,29,14),(8,30,15),(8,31,16),(8,32,17),(8,33,18),(8,34,19),(8,35,20),(8,36,21),(8,37,22),(8,38,23),(8,39,24),(8,40,25),(8,41,26),(8,42,27),(8,43,28),(9,13,0),(9,17,1),(9,18,2),(9,19,3),(9,20,4),(9,21,5),(9,22,6),(9,23,7),(9,24,8),(9,25,9),(9,26,10),(9,27,11),(9,28,12),(9,29,13),(9,30,14),(9,31,15),(9,32,16),(9,33,17),(9,34,18),(9,35,19),(9,36,20),(9,37,21),(9,38,22),(9,39,23),(9,40,24),(9,41,25),(9,42,26),(9,43,27),(10,13,0),(10,17,1),(10,18,2),(10,19,3),(10,20,4),(10,21,5),(10,22,6),(10,23,7),(10,24,8),(10,25,9),(10,26,10),(10,27,11),(10,28,12),(10,29,13),(10,30,14),(10,31,15),(10,32,16),(10,33,17),(10,34,18),(10,35,19),(10,36,20),(10,37,21),(10,38,22),(10,39,23),(10,40,24),(10,41,25),(10,42,26),(10,43,27),(11,13,0),(11,18,1),(11,19,2),(11,20,3),(11,21,4),(11,22,5),(11,23,6),(11,24,7),(11,25,8),(11,26,9),(11,27,10),(11,28,11),(11,29,12),(11,30,13),(11,31,14),(11,32,15),(11,33,16),(11,34,17),(11,35,18),(11,36,19),(11,37,20),(11,38,21),(11,39,22),(11,40,23),(11,41,24),(11,42,25),(11,43,26),(12,13,0),(12,18,1),(12,19,2),(12,20,3),(12,21,4),(12,22,5),(12,23,6),(12,24,7),(12,25,8),(12,26,9),(12,27,10),(12,28,11),(12,29,12),(12,30,13),(12,31,14),(12,32,15),(12,33,16),(12,34,17),(12,35,18),(12,36,19),(12,37,20),(12,38,21),(12,39,22),(12,40,23),(12,41,24),(12,42,25),(12,43,26),(13,13,0),(13,18,1),(13,19,2),(13,20,3),(13,21,4),(13,22,5),(13,23,6),(13,24,7),(13,25,8),(13,26,9),(13,27,10),(13,28,11),(13,29,12),(13,30,13),(13,31,14),(13,32,15),(13,33,16),(13,34,17),(13,35,18),(13,36,19),(13,37,20),(13,38,21),(13,39,22),(13,40,23),(13,41,24),(13,42,25),(13,43,26),(14,13,0),(14,18,1),(14,19,2),(14,20,3),(14,21,4),(14,22,5),(14,23,6),(14,24,7),(14,25,8),(14,26,9),(14,27,10),(14,28,11),(14,29,12),(14,30,13),(14,31,14),(14,32,15),(14,33,16),(14,34,17),(14,35,18),(14,36,19),(14,37,20),(14,38,21),(14,39,22),(14,40,23),(14,41,24),(14,42,25),(14,43,26),(15,13,0),(15,18,1),(15,19,2),(15,20,3),(15,21,4),(15,22,5),(15,23,6),(15,24,7),(15,25,8),(15,26,9),(15,27,10),(15,28,11),(15,29,12),(15,30,13),(15,31,14),(15,32,15),(15,33,16),(15,34,17),(15,35,18),(15,36,19),(15,37,20),(15,38,21),(15,39,22),(15,40,23),(15,41,24),(15,42,25),(15,43,26),(16,13,0),(16,18,1),(16,19,2),(16,20,3),(16,21,4),(16,22,5),(16,23,6),(16,24,7),(16,25,8),(16,26,9),(16,27,10),(16,28,11),(16,29,12),(16,30,13),(16,31,14),(16,32,15),(16,33,16),(16,34,17),(16,35,18),(16,36,19),(16,37,20),(16,38,21),(16,39,22),(16,40,23),(16,41,24),(16,42,25),(16,43,26),(17,13,0),(17,18,1),(17,19,2),(17,20,3),(17,21,4),(17,22,5),(17,23,6),(17,24,7),(17,25,8),(17,26,9),(17,27,10),(17,28,11),(17,29,12),(17,30,13),(17,31,14),(17,32,15),(17,33,16),(17,34,17),(17,35,18),(17,36,19),(17,37,20),(17,38,21),(17,39,22),(17,40,23),(17,41,24),(17,42,25),(17,43,26),(18,13,0),(18,18,1),(18,19,2),(18,20,3),(18,21,4),(18,22,5),(18,23,6),(18,24,7),(18,25,8),(18,26,9),(18,27,10),(18,28,11),(18,29,12),(18,30,13),(18,31,14),(18,32,15),(18,33,16),(18,34,17),(18,35,18),(18,36,19),(18,37,20),(18,38,21),(18,39,22),(18,40,23),(18,41,24),(18,42,25),(18,43,26),(19,13,0),(19,18,1),(19,19,2),(19,20,3),(19,21,4),(19,22,5),(19,23,6),(19,24,7),(19,25,8),(19,26,9),(19,27,10),(19,28,11),(19,29,12),(19,30,13),(19,31,14),(19,32,15),(19,33,16),(19,34,17),(19,35,18),(19,36,19),(19,37,20),(19,38,21),(19,39,22),(19,40,23),(19,41,24),(19,42,25),(19,43,26),(20,13,0),(20,18,1),(20,19,2),(20,20,3),(20,21,4),(20,22,5),(20,23,6),(20,24,7),(20,25,8),(20,26,9),(20,27,10),(20,28,11),(20,29,12),(20,30,13),(20,31,14),(20,32,15),(20,33,16),(20,34,17),(20,35,18),(20,36,19),(20,37,20),(20,38,21),(20,39,22),(20,40,23),(20,41,24),(20,42,25),(20,43,26),(21,13,0),(21,18,1),(21,19,2),(21,20,3),(21,21,4),(21,22,5),(21,23,6),(21,24,7),(21,25,8),(21,26,9),(21,27,10),(21,28,11),(21,29,12),(21,30,13),(21,31,14),(21,32,15),(21,33,16),(21,34,17),(21,35,18),(21,36,19),(21,37,20),(21,38,21),(21,39,22),(21,40,23),(21,41,24),(21,42,25),(21,43,26),(22,13,0),(22,18,1),(22,19,2),(22,20,3),(22,21,4),(22,22,5),(22,23,6),(22,24,7),(22,25,8),(22,26,9),(22,27,10),(22,28,11),(22,29,12),(22,30,13),(22,31,14),(22,32,15),(22,33,16),(22,34,17),(22,35,18),(22,36,19),(22,37,20),(22,38,21),(22,39,22),(22,40,23),(22,41,24),(22,42,25),(22,43,26),(23,13,0),(23,18,1),(23,19,2),(23,20,3),(23,21,4),(23,22,5),(23,23,6),(23,24,7),(23,25,8),(23,26,9),(23,27,10),(23,28,11),(23,29,12),(23,30,13),(23,31,14),(23,32,15),(23,33,16),(23,34,17),(23,35,18),(23,36,19),(23,37,20),(23,38,21),(23,39,22),(23,40,23),(23,41,24),(23,42,25),(23,43,26),(24,13,0),(24,18,1),(24,19,2),(24,20,3),(24,21,4),(24,22,5),(24,23,6),(24,24,7),(24,25,8),(24,26,9),(24,27,10),(24,28,11),(24,29,12),(24,30,13),(24,31,14),(24,32,15),(24,33,16),(24,34,17),(24,35,18),(24,36,19),(24,37,20),(24,38,21),(24,39,22),(24,40,23),(24,41,24),(24,42,25),(24,43,26),(25,13,0),(25,18,1),(25,19,2),(25,20,3),(25,21,4),(25,22,5),(25,23,6),(25,24,7),(25,25,8),(25,26,9),(25,27,10),(25,28,11),(25,29,12),(25,30,13),(25,31,14),(25,32,15),(25,33,16),(25,34,17),(25,35,18),(25,36,19),(25,37,20),(25,38,21),(25,39,22),(25,40,23),(25,41,24),(25,42,25),(25,43,26),(26,13,0),(26,18,1),(26,19,2),(26,20,3),(26,21,4),(26,22,5),(26,23,6),(26,24,7),(26,25,8),(26,26,9),(26,27,10),(26,28,11),(26,29,12),(26,30,13),(26,31,14),(26,32,15),(26,33,16),(26,34,17),(26,35,18),(26,36,19),(26,37,20),(26,38,21),(26,39,22),(26,40,23),(26,41,24),(26,42,25),(26,43,26),(27,13,0),(27,18,1),(27,19,2),(27,20,3),(27,21,4),(27,22,5),(27,23,6),(27,24,7),(27,25,8),(27,26,9),(27,27,10),(27,28,11),(27,29,12),(27,30,13),(27,31,14),(27,32,15),(27,33,16),(27,34,17),(27,35,18),(27,36,19),(27,37,20),(27,38,21),(27,39,22),(27,40,23),(27,41,24),(27,42,25),(27,43,26),(28,13,0),(28,18,1),(28,19,2),(28,20,3),(28,21,4),(28,22,5),(28,23,6),(28,24,7),(28,25,8),(28,26,9),(28,27,10),(28,28,11),(28,29,12),(28,30,13),(28,31,14),(28,32,15),(28,33,16),(28,34,17),(28,35,18),(28,36,19),(28,37,20),(28,38,21),(28,39,22),(28,40,23),(28,41,24),(28,42,25),(28,43,26),(29,13,0),(29,18,1),(29,19,2),(29,20,3),(29,21,4),(29,22,5),(29,23,6),(29,24,7),(29,25,8),(29,26,9),(29,27,10),(29,28,11),(29,29,12),(29,30,13),(29,31,14),(29,32,15),(29,33,16),(29,34,17),(29,35,18),(29,36,19),(29,37,20),(29,38,21),(29,39,22),(29,40,23),(29,41,24),(29,42,25),(29,43,26),(30,13,0),(30,18,1),(30,19,2),(30,20,3),(30,21,4),(30,22,5),(30,23,6),(30,24,7),(30,25,8),(30,26,9),(30,27,10),(30,28,11),(30,29,12),(30,30,13),(30,31,14),(30,32,15),(30,33,16),(30,34,17),(30,35,18),(30,36,19),(30,37,20),(30,38,21),(30,39,22),(30,40,23),(30,41,24),(30,42,25),(30,43,26),(31,13,0),(31,17,1),(31,18,2),(31,19,3),(31,20,4),(31,21,5),(31,22,6),(31,23,7),(31,24,8),(31,25,9),(31,26,10),(31,27,11),(31,28,12),(31,29,13),(31,30,14),(31,31,15),(31,32,16),(31,33,17),(31,34,18),(31,35,19),(31,36,20),(31,37,21),(31,38,22),(31,39,23),(31,40,24),(31,41,25),(31,42,26),(31,43,27),(32,13,0),(32,18,1),(32,19,2),(32,20,3),(32,21,4),(32,22,5),(32,23,6),(32,24,7),(32,25,8),(32,26,9),(32,27,10),(32,28,11),(32,29,12),(32,30,13),(32,31,14),(32,32,15),(32,33,16),(32,34,17),(32,35,18),(32,36,19),(32,37,20),(32,38,21),(32,39,22),(32,40,23),(32,41,24),(32,42,25),(32,43,26),(33,13,0),(33,18,1),(33,19,2),(33,20,3),(33,21,4),(33,22,5),(33,23,6),(33,24,7),(33,25,8),(33,26,9),(33,27,10),(33,28,11),(33,29,12),(33,30,13),(33,31,14),(33,32,15),(33,33,16),(33,34,17),(33,35,18),(33,36,19),(33,37,20),(33,38,21),(33,39,22),(33,40,23),(33,41,24),(33,42,25),(33,43,26),(34,13,0),(34,18,1),(34,19,2),(34,20,3),(34,21,4),(34,22,5),(34,23,6),(34,24,7),(34,25,8),(34,26,9),(34,27,10),(34,28,11),(34,29,12),(34,30,13),(34,31,14),(34,32,15),(34,33,16),(34,34,17),(34,35,18),(34,36,19),(34,37,20),(34,38,21),(34,39,22),(34,40,23),(34,41,24),(34,42,25),(34,43,26),(35,13,0),(35,18,1),(35,19,2),(35,20,3),(35,21,4),(35,22,5),(35,23,6),(35,24,7),(35,25,8),(35,26,9),(35,27,10),(35,28,11),(35,29,12),(35,30,13),(35,31,14),(35,32,15),(35,33,16),(35,34,17),(35,35,18),(35,36,19),(35,37,20),(35,38,21),(35,39,22),(35,40,23),(35,41,24),(35,42,25),(35,43,26);
/*!40000 ALTER TABLE `ps_category_product` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_category_shop` WRITE;
/*!40000 ALTER TABLE `ps_category_shop` DISABLE KEYS */;
INSERT INTO `ps_category_shop` VALUES (2,1,1),(2,2,1),(2,3,1),(2,4,1),(2,5,1),(6,1,1),(6,2,2),(6,3,1),(6,4,1),(6,5,1),(7,1,2),(7,2,3),(7,3,2),(7,4,2),(7,5,2),(8,1,3),(8,2,4),(8,3,3),(8,4,3),(8,5,3),(9,1,4),(9,2,5),(9,3,4),(9,4,4),(9,5,4),(10,1,5),(10,2,6),(10,3,5),(10,4,5),(10,5,5),(11,1,1),(11,2,1),(11,3,1),(11,4,1),(11,5,1),(12,1,2),(12,2,2),(12,3,2),(12,4,2),(12,5,2),(13,1,3),(13,2,3),(13,3,3),(13,4,3),(13,5,3),(14,1,4),(14,2,4),(14,3,4),(14,4,4),(14,5,4),(15,1,1),(15,2,1),(15,3,1),(15,4,1),(15,5,1),(16,1,2),(16,2,2),(16,3,2),(16,4,2),(16,5,2),(17,1,3),(17,2,3),(17,3,3),(17,4,3),(17,5,3),(18,1,4),(18,2,4),(18,3,4),(18,4,4),(18,5,4),(19,1,1),(19,2,1),(19,3,1),(19,4,1),(19,5,1),(20,1,2),(20,2,2),(20,3,2),(20,4,2),(20,5,2),(21,1,3),(21,2,3),(21,3,3),(21,4,3),(21,5,3),(22,1,1),(22,2,1),(22,3,1),(22,4,1),(22,5,1),(23,1,4),(23,2,4),(23,3,4),(23,4,4),(23,5,4),(24,1,2),(24,2,2),(24,3,2),(24,4,2),(24,5,2),(25,1,3),(25,2,3),(25,3,3),(25,4,3),(25,5,3),(26,1,4),(26,2,4),(26,3,4),(26,4,4),(26,5,4),(27,1,1),(27,2,1),(27,3,1),(27,4,1),(27,5,1),(28,1,2),(28,2,2),(28,3,2),(28,4,2),(28,5,2),(29,1,3),(29,2,3),(29,3,3),(29,4,3),(29,5,3),(30,1,4),(30,2,4),(30,3,4),(30,4,4),(30,5,4),(31,1,6),(31,2,1),(31,3,6),(31,4,6),(31,5,6),(32,1,5),(32,2,5),(32,3,5),(32,4,5),(32,5,5),(33,1,6),(33,2,6),(33,3,6),(33,4,6),(33,5,6),(34,1,7),(34,2,7),(34,3,7),(34,4,7),(34,5,7),(35,1,8),(35,2,8),(35,3,8),(35,4,8),(35,5,8),(36,1,1),(36,2,1),(36,3,1),(36,4,1),(36,5,1),(37,1,2),(37,2,2),(37,3,2),(37,4,2),(37,5,2),(38,1,3),(38,2,3),(38,3,3),(38,4,3),(38,5,3),(39,1,4),(39,2,4),(39,3,4),(39,4,4),(39,5,4),(40,1,1),(40,2,1),(40,3,1),(40,4,1),(40,5,1);
/*!40000 ALTER TABLE `ps_category_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cms` WRITE;
/*!40000 ALTER TABLE `ps_cms` DISABLE KEYS */;
INSERT INTO `ps_cms` VALUES (1,1,0,1),(2,1,1,1),(3,1,2,1),(4,1,3,1),(5,1,4,1);
/*!40000 ALTER TABLE `ps_cms` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cms_block` WRITE;
/*!40000 ALTER TABLE `ps_cms_block` DISABLE KEYS */;
INSERT INTO `ps_cms_block` VALUES (1,1,0,0,1);
/*!40000 ALTER TABLE `ps_cms_block` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cms_block_lang` WRITE;
/*!40000 ALTER TABLE `ps_cms_block_lang` DISABLE KEYS */;
INSERT INTO `ps_cms_block_lang` VALUES (1,1,'Information'),(1,2,'Information');
/*!40000 ALTER TABLE `ps_cms_block_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cms_block_page` WRITE;
/*!40000 ALTER TABLE `ps_cms_block_page` DISABLE KEYS */;
INSERT INTO `ps_cms_block_page` VALUES (1,1,1,0),(2,1,2,0),(3,1,3,0),(4,1,4,0),(5,1,5,0);
/*!40000 ALTER TABLE `ps_cms_block_page` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cms_block_shop` WRITE;
/*!40000 ALTER TABLE `ps_cms_block_shop` DISABLE KEYS */;
INSERT INTO `ps_cms_block_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5);
/*!40000 ALTER TABLE `ps_cms_block_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cms_category` WRITE;
/*!40000 ALTER TABLE `ps_cms_category` DISABLE KEYS */;
INSERT INTO `ps_cms_category` VALUES (1,0,1,1,'2013-06-18 03:23:28','2013-06-18 03:23:28',0);
/*!40000 ALTER TABLE `ps_cms_category` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cms_category_lang` WRITE;
/*!40000 ALTER TABLE `ps_cms_category_lang` DISABLE KEYS */;
INSERT INTO `ps_cms_category_lang` VALUES (1,1,'Home','','home','','',''),(1,2,'Home','','home','','','');
/*!40000 ALTER TABLE `ps_cms_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cms_lang` WRITE;
/*!40000 ALTER TABLE `ps_cms_lang` DISABLE KEYS */;
INSERT INTO `ps_cms_lang` VALUES (1,1,'Delivery','Our terms and conditions of delivery','conditions, delivery, delay, shipment, pack','<h2>Shipments and returns</h2><h3>Your pack shipment</h3><p>Packages are generally dispatched within 2 days after receipt of payment and are shipped via UPS with tracking and drop-off without signature. If you prefer delivery by UPS Extra with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make, we will provide you with a link to track your package online.</p><p>Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects.<br /><br />Boxes are amply sized and your items are well-protected.</p>','delivery'),(1,2,'Delivery','Our terms and conditions of delivery','conditions, delivery, delay, shipment, pack','<h2>Shipments and returns</h2><h3>Your pack shipment</h3><p>Packages are generally dispatched within 2 days after receipt of payment and are shipped via UPS with tracking and drop-off without signature. If you prefer delivery by UPS Extra with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make, we will provide you with a link to track your package online.</p><p>Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects.<br /><br />Boxes are amply sized and your items are well-protected.</p>','delivery'),(2,1,'Legal Notice','Legal notice','notice, legal, credits','<h2>Legal</h2><h3>Credits</h3><p>Concept and production:</p><p>This Web site was created using <a href=\"http://www.prestashop.com\">PrestaShop</a>&trade; open-source software.</p>','legal-notice'),(2,2,'Legal Notice','Legal notice','notice, legal, credits','<h2>Legal</h2><h3>Credits</h3><p>Concept and production:</p><p>This Web site was created using <a href=\"http://www.prestashop.com\">PrestaShop</a>&trade; open-source software.</p>','legal-notice'),(3,1,'Terms and conditions of use','Our terms and conditions of use','conditions, terms, use, sell','<h2>Your terms and conditions of use</h2><h3>Rule 1</h3><p>Here is the rule 1 content</p>\r\n<h3>Rule 2</h3><p>Here is the rule 2 content</p>\r\n<h3>Rule 3</h3><p>Here is the rule 3 content</p>','terms-and-conditions-of-use'),(3,2,'Terms and conditions of use','Our terms and conditions of use','conditions, terms, use, sell','<h2>Your terms and conditions of use</h2><h3>Rule 1</h3><p>Here is the rule 1 content</p>\r\n<h3>Rule 2</h3><p>Here is the rule 2 content</p>\r\n<h3>Rule 3</h3><p>Here is the rule 3 content</p>','terms-and-conditions-of-use'),(4,1,'About us','Learn more about us','about us, informations','<h2>About us</h2>\r\n<h3>Our company</h3><p>Our company</p>\r\n<h3>Our team</h3><p>Our team</p>\r\n<h3>Informations</h3><p>Informations</p>','about-us'),(4,2,'About us','Learn more about us','about us, informations','<h2>About us</h2>\r\n<h3>Our company</h3><p>Our company</p>\r\n<h3>Our team</h3><p>Our team</p>\r\n<h3>Informations</h3><p>Informations</p>','about-us'),(5,1,'Secure payment','Our secure payment mean','secure payment, ssl, visa, mastercard, paypal','<h2>Secure payment</h2>\r\n<h3>Our secure payment</h3><p>With SSL</p>\r\n<h3>Using Visa/Mastercard/Paypal</h3><p>About this services</p>','secure-payment'),(5,2,'Secure payment','Our secure payment mean','secure payment, ssl, visa, mastercard, paypal','<h2>Secure payment</h2>\r\n<h3>Our secure payment</h3><p>With SSL</p>\r\n<h3>Using Visa/Mastercard/Paypal</h3><p>About this services</p>','secure-payment');
/*!40000 ALTER TABLE `ps_cms_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cms_shop` WRITE;
/*!40000 ALTER TABLE `ps_cms_shop` DISABLE KEYS */;
INSERT INTO `ps_cms_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5);
/*!40000 ALTER TABLE `ps_cms_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_compare` WRITE;
/*!40000 ALTER TABLE `ps_compare` DISABLE KEYS */;
INSERT INTO `ps_compare` VALUES (14,3),(15,3),(16,3),(17,3),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0);
/*!40000 ALTER TABLE `ps_compare` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_compare_product` WRITE;
/*!40000 ALTER TABLE `ps_compare_product` DISABLE KEYS */;
INSERT INTO `ps_compare_product` VALUES (14,18,'2013-07-12 16:33:04','2013-07-12 16:33:04'),(14,19,'2013-07-12 11:45:48','2013-07-12 11:45:48'),(14,20,'2013-07-12 16:33:06','2013-07-12 16:33:06'),(14,21,'2013-07-12 16:33:08','2013-07-12 16:33:08'),(14,24,'2013-07-12 16:33:08','2013-07-12 16:33:08'),(15,18,'2013-07-12 11:45:50','2013-07-12 11:45:50'),(15,22,'2013-07-12 11:45:56','2013-07-12 11:45:56'),(15,23,'2013-07-12 11:45:55','2013-07-12 11:45:55'),(16,20,'2013-07-12 11:45:52','2013-07-12 11:45:52'),(17,21,'2013-07-12 11:45:53','2013-07-12 11:45:53'),(18,18,'2013-07-12 11:54:53','2013-07-12 11:54:53'),(18,21,'2013-07-12 11:54:57','2013-07-12 11:54:57'),(19,20,'2013-07-12 11:54:55','2013-07-12 11:54:55'),(19,23,'2013-07-12 11:54:59','2013-07-12 11:54:59'),(19,24,'2013-07-12 11:54:59','2013-07-12 11:54:59'),(20,18,'2013-07-16 16:13:32','2013-07-16 16:13:32'),(21,19,'2013-07-16 16:13:32','2013-07-16 16:13:32'),(21,30,'2013-07-16 16:13:37','2013-07-16 16:13:37'),(21,33,'2013-07-16 16:13:41','2013-07-16 16:13:41'),(22,18,'2013-07-16 16:13:54','2013-07-16 16:13:54'),(22,19,'2013-07-16 16:13:52','2013-07-16 16:13:52'),(22,20,'2013-07-16 16:13:35','2013-07-16 16:13:35'),(22,21,'2013-07-16 16:13:55','2013-07-16 16:13:55'),(22,31,'2013-07-16 16:13:39','2013-07-16 16:13:39'),(23,21,'2013-07-16 16:13:35','2013-07-16 16:13:35'),(23,32,'2013-07-16 16:13:40','2013-07-16 16:13:40');
/*!40000 ALTER TABLE `ps_compare_product` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_condition` WRITE;
/*!40000 ALTER TABLE `ps_condition` DISABLE KEYS */;
INSERT INTO `ps_condition` VALUES (1,19,'install','','>','0','1','time','1',1,'2013-06-18 03:25:46','2013-06-18 03:26:08'),(2,40,'install','','>=','730','','time','2',0,'2013-06-18 03:25:46','2013-06-16 03:25:46'),(3,1,'configuration','PS_REWRITING_SETTINGS','==','1','1','hook','actionAdminMetaControllerUpdate_optionsAfter',1,'2013-06-18 03:25:46','2013-07-22 05:36:40'),(4,2,'configuration','PS_SMARTY_FORCE_COMPILE','!=','2','1','hook','actionAdminPerformanceControllerSaveAfter',1,'2013-06-18 03:25:46','2013-06-18 03:26:04'),(5,3,'configuration','PS_CSS_THEME_CACHE','==','1','1','hook','actionAdminPerformanceControllerSaveAfter',1,'2013-06-18 03:25:46','2013-07-24 22:29:43'),(6,4,'configuration','PS_CIPHER_ALGORITHM','==','1','1','hook','actionAdminPerformanceControllerSaveAfter',1,'2013-06-18 03:25:46','2013-06-18 03:26:05'),(7,5,'configuration','PS_MEDIA_SERVERS','==','1','','hook','actionAdminPerformanceControllerSaveAfter',0,'2013-06-18 03:25:46','2013-07-25 06:23:11'),(8,6,'sql','SELECT COUNT(distinct m.id_module) FROM PREFIX_hook h LEFT JOIN PREFIX_hook_module hm ON h.id_hook = hm.id_hook LEFT JOIN PREFIX_module m ON hm.id_module = m.id_module\r\nWHERE (h.name = \"displayPayment\" OR h.name = \"payment\") AND m.name NOT IN (\"bankwire\", \"cheque\", \"cashondelivery\")','>','0','0','hook','actionModuleInstallAfter',0,'2013-06-18 03:25:46','2013-07-29 03:04:39'),(9,7,'sql','SELECT COUNT(distinct m.id_module) FROM PREFIX_hook h LEFT JOIN PREFIX_hook_module hm ON h.id_hook = hm.id_hook LEFT JOIN PREFIX_module m ON hm.id_module = m.id_module\r\nWHERE (h.name = \"displayPayment\" OR h.name = \"payment\") AND m.name NOT IN (\"bankwire\", \"cheque\", \"cashondelivery\")','>','1','0','hook','actionModuleInstallAfter',0,'2013-06-18 03:25:46','2013-06-18 03:26:06'),(10,8,'sql','SELECT COUNT(*) FROM PREFIX_carrier WHERE name NOT IN (\"0\", \"My carrier\")','>','0','0','hook','actionObjectCarrierAddAfter',0,'2013-06-18 03:25:46','2013-06-18 03:26:06'),(11,9,'sql','SELECT COUNT(*) FROM PREFIX_carrier WHERE name NOT IN (\"0\", \"My carrier\")','>','1','0','hook','actionObjectCarrierAddAfter',0,'2013-06-18 03:25:46','2013-06-18 03:26:06'),(12,10,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','0','1','hook','actionObjectProductAddAfter',1,'2013-06-18 03:25:47','2013-06-18 23:10:08'),(13,11,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','9','10','hook','actionObjectProductAddAfter',1,'2013-06-18 03:25:47','2013-06-18 23:27:50'),(14,16,'configuration','PS_SHOP_PHONE','!=','0','1','hook','actionAdminStoresControllerUpdate_optionsAfter',1,'2013-06-18 03:25:47','2013-06-18 03:37:44'),(15,17,'sql','SELECT COUNT(*) FROM PREFIX_contact','>','2','2','hook','actionObjectContactAddAfter',0,'2013-06-18 03:25:47','2013-06-18 03:26:06'),(16,18,'sql','SELECT COUNT(*) FROM PREFIX_contact','>','4','2','hook','actionObjectContactAddAfter',0,'2013-06-18 03:25:47','2013-06-18 03:26:07'),(17,12,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','99','28','hook','actionObjectProductAddAfter',0,'2013-06-18 03:25:48','2013-07-17 00:01:25'),(18,13,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','999','0','hook','actionObjectProductAddAfter',0,'2013-06-18 03:25:48','2013-06-18 03:26:07'),(19,14,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','9999','0','hook','actionObjectProductAddAfter',0,'2013-06-18 03:25:48','2013-06-18 03:26:07'),(20,15,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','99999','0','hook','actionObjectProductAddAfter',0,'2013-06-18 03:25:48','2013-06-18 03:26:07'),(21,20,'install','','>=','7','','time','1',0,'2013-06-18 03:25:48','2013-06-18 03:26:07'),(22,21,'configuration','PS_LOGO','!=','logo.jpg','','hook','actionAdminThemesControllerUpdate_optionsAfter',0,'2013-06-18 03:25:48','2013-07-17 00:26:20'),(23,22,'sql','SELECT COUNT(*) FROM PREFIX_theme WHERE directory != \"default\" AND directory != \"prestashop\"','>','0','0','hook','actionObjectThemeAddAfter',0,'2013-06-18 03:25:48','2013-06-18 03:26:07'),(24,23,'configuration','PS_LOGGED_ON_ADDONS','==','1','','time','1',0,'2013-06-18 03:25:48','2013-07-29 00:42:21'),(25,24,'configuration','PS_MULTISHOP_FEATURE_ACTIVE','==','1','1','hook','actionAdminPreferencesControllerUpdate_optionsAfter',1,'2013-06-18 03:25:48','2013-07-29 00:42:37'),(26,25,'sql','SELECT COUNT(*) FROM PREFIX_shop','>','1','2','hook','actionObjectShopAddAfter',1,'2013-06-18 03:25:48','2013-07-29 00:44:42'),(27,28,'sql','SELECT COUNT(*) FROM PREFIX_shop_group','>','1','','hook','actionObjectShopGroupAddAfter',0,'2013-06-18 03:25:49','2013-06-17 03:25:49'),(28,26,'sql','SELECT COUNT(*) FROM PREFIX_shop','>','4','','hook','actionObjectShopAddAfter',0,'2013-06-18 03:25:49','2013-06-17 03:25:49'),(29,27,'sql','SELECT COUNT(*) FROM PREFIX_shop_group','>','5','','hook','actionObjectShopGroupAddAfter 	',0,'2013-06-18 03:25:49','2013-06-17 03:25:49'),(30,30,'sql','SELECT COUNT(*) FROM PREFIX_carrier WHERE name NOT IN (\"0\", \"My carrier\")','>','2','','hook','actionObjectCarrierAddAfter',0,'2013-06-18 03:25:49','2013-06-17 03:25:49'),(31,29,'sql','SELECT COUNT(distinct m.id_module) FROM PREFIX_hook h LEFT JOIN PREFIX_hook_module hm ON h.id_hook = hm.id_hook LEFT JOIN PREFIX_module m ON hm.id_module = m.id_module\r\nWHERE (h.name = \"displayPayment\" OR h.name = \"payment\") AND m.name NOT IN (\"bankwire\", \"cheque\", \"cashondelivery\")','>','2','','hook','actionModuleInstallAfter',0,'2013-06-18 03:25:49','2013-06-17 03:25:49'),(32,31,'sql','SELECT SUM(total_paid_tax_excl / c.conversion_rate)\r\nFROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1 AND reference != \"XKBKNABJK\"','>=','200','0','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:49','2013-06-27 22:07:54'),(33,32,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1 AND reference != \"XKBKNABJK\"','>=','2000','','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:50','2013-06-17 03:25:50'),(34,33,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1 AND reference != \"XKBKNABJK\"','>=','20000','','time','1',0,'2013-06-18 03:25:50','2013-06-17 03:25:50'),(35,34,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1','>=','200000','','time','7',0,'2013-06-18 03:25:50','2013-06-11 03:25:50'),(36,35,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1','>=','2000000','','time','7',0,'2013-06-18 03:25:50','2013-06-11 03:25:50'),(37,36,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1','>=','20000000','','time','7',0,'2013-06-18 03:25:50','2013-06-11 03:25:50'),(38,37,'install','','>=','30','','time','1',0,'2013-06-18 03:25:50','2013-06-17 03:25:50'),(39,38,'install','','>=','182','','time','2',0,'2013-06-18 03:25:50','2013-06-16 03:25:50'),(40,39,'install','','>=','365','','time','2',0,'2013-06-18 03:25:50','2013-06-16 03:25:50'),(41,41,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','10','14','time','1',1,'2013-06-18 03:25:51','2013-06-25 21:37:44'),(42,42,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','100','','time','1',0,'2013-06-18 03:25:51','2013-06-17 03:25:51'),(43,43,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','1000','','time','1',0,'2013-06-18 03:25:51','2013-06-17 03:25:51'),(44,44,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','10000','','time','2',0,'2013-06-18 03:25:51','2013-06-16 03:25:51'),(45,45,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','100000','','time','3',0,'2013-06-18 03:25:51','2013-06-15 03:25:51'),(46,46,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','1000000','','time','4',0,'2013-06-18 03:25:51','2013-06-14 03:25:51'),(47,47,'sql','SELECT COUNT(*) FROM PREFIX_cart','>=','2','3','hook','actionObjectCartAddAfter',1,'2013-06-18 03:25:51','2013-06-26 04:39:35'),(48,48,'sql','SELECT COUNT(*) FROM PREFIX_cart','>=','10','10','hook','actionObjectCartAddAfter',1,'2013-06-18 03:25:51','2013-07-12 00:43:54'),(49,49,'sql','SELECT COUNT(*) FROM PREFIX_cart','>=','100','34','hook','actionObjectCartAddAfter',0,'2013-06-18 03:25:51','2013-07-25 04:53:35'),(50,50,'sql','SELECT COUNT(*) FROM PREFIX_cart','>=','1000','','time','1',0,'2013-06-18 03:25:52','2013-06-17 03:25:52'),(51,51,'sql','SELECT COUNT(*) FROM PREFIX_cart','>=','10000','','time','4',0,'2013-06-18 03:25:52','2013-06-14 03:25:52'),(52,52,'sql','SELECT COUNT(*) FROM PREFIX_cart','>=','100000','','time','8',0,'2013-06-18 03:25:52','2013-06-10 03:25:52'),(53,53,'sql','SELECT COUNT(*) FROM PREFIX_orders WHERE reference != \"XKBKNABJK\"','>=','1','1','hook','actionObjectOrderAddAfter',1,'2013-06-18 03:25:52','2013-06-27 22:07:54'),(54,54,'sql','SELECT COUNT(*) FROM PREFIX_orders WHERE reference != \"XKBKNABJK\"','>=','10','','hook','actionObjectOrderAddAfter',0,'2013-06-18 03:25:52','2013-06-17 03:25:52'),(55,55,'sql','SELECT COUNT(*) FROM PREFIX_orders WHERE reference != \"XKBKNABJK\"','>=','100','','hook','actionObjectOrderAddAfter',0,'2013-06-18 03:25:53','2013-06-17 03:25:53'),(56,56,'sql','SELECT COUNT(*) FROM PREFIX_orders WHERE reference != \"XKBKNABJK\"','>=','1000','','time','2',0,'2013-06-18 03:25:53','2013-06-16 03:25:53'),(57,57,'sql','SELECT COUNT(*) FROM PREFIX_orders WHERE reference != \"XKBKNABJK\"','>=','10000','','time','4',0,'2013-06-18 03:25:53','2013-06-14 03:25:53'),(58,58,'sql','SELECT COUNT(*) FROM PREFIX_orders WHERE reference != \"XKBKNABJK\"','>=','100000','','time','8',0,'2013-06-18 03:25:53','2013-06-10 03:25:53'),(59,65,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','1','','hook','actionObjectCustomerThreadAddAfter',0,'2013-06-18 03:25:53','2013-06-17 03:25:53'),(60,66,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','10','','hook','actionObjectCustomerThreadAddAfter',0,'2013-06-18 03:25:53','2013-06-17 03:25:53'),(61,67,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','100','','hook','actionObjectCustomerThreadAddAfter',0,'2013-06-18 03:25:53','2013-06-17 03:25:53'),(62,68,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','1000','','time','2',0,'2013-06-18 03:25:53','2013-06-16 03:25:53'),(63,69,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','10000','','time','4',0,'2013-06-18 03:25:53','2013-06-14 03:25:53'),(64,70,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','100000','','time','8',0,'2013-06-18 03:25:54','2013-06-10 03:25:54'),(65,59,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','1','2','hook','actionObjectCustomerAddAfter',1,'2013-06-18 03:25:54','2013-06-27 05:33:28'),(66,60,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','10','3','hook','actionObjectCustomerAddAfter',0,'2013-06-18 03:25:54','2013-07-12 05:34:06'),(67,61,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','100','','hook','actionObjectCustomerAddAfter',0,'2013-06-18 03:25:54','2013-06-17 03:25:54'),(68,62,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','1000','','time','1',0,'2013-06-18 03:25:54','2013-06-17 03:25:54'),(69,63,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','10000','','time','2',0,'2013-06-18 03:25:54','2013-06-16 03:25:54'),(70,64,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','100000','','time','4',0,'2013-06-18 03:25:54','2013-06-14 03:25:54'),(71,76,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"CA\",\r\n\"GL\",\r\n\"PM\",\r\n\"US\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:54','2013-06-27 22:07:54'),(72,79,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"UM\",\r\n\"AS\",\r\n\"AU\",\r\n\"CK\",\r\n\"FJ\",\r\n\"FM\",\r\n\"GU\",\r\n\"KI\",\r\n\"MH,\"\r\n\"MP\",\r\n\"NC\",\r\n\"NF\",\r\n\"NR\",\r\n\"NU\",\r\n\"NZ\",\r\n\"PF\",\r\n\"PG\",\r\n\"PN\",\r\n\"PW\",\r\n\"SB\",\r\n\"TK\",\r\n\"TO\",\r\n\"TV\",\r\n\"VU\",\r\n\"WF\",\r\n\"WS\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:54','2013-06-27 22:07:54'),(73,85,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"KG\",\r\n\"KZ\",\r\n\"TJ\",\r\n\"TM\",\r\n\"UZ\",\r\n\"AE\",\r\n\"AM\",\r\n\"AZ\",\r\n\"BH\",\r\n\"CY\",\r\n\"GE\",\r\n\"IL\",\r\n\"IQ\",\r\n\"IR\",\r\n\"JO\",\r\n\"KW\",\r\n\"LB\",\r\n\"OM\",\r\n\"QA\",\r\n\"SA\",\r\n\"SY\",\r\n\"TR\",\r\n\"YE\",\r\n\"AF\",\r\n\"BD\",\r\n\"BT\",\r\n\"IN\",\r\n\"IO\",\r\n\"LK\",\r\n\"MV\",\r\n\"NP\",\r\n\"PK\",\r\n\"CN\",\r\n\"HK\",\r\n\"JP\",\r\n\"KP\",\r\n\"KR\",\r\n\"MO\",\r\n\"TW\",\r\n\"MN\",\r\n\"BN\",\r\n\"CC\",\r\n\"CX\",\r\n\"ID\",\r\n\"KH\",\r\n\"LA\",\r\n\"MM\",\r\n\"MY\",\r\n\"PH\",\r\n\"SG\",\r\n\"TH\",\r\n\"TP\",\r\n\"VN\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:55','2013-06-27 22:07:54'),(74,86,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"BZ\",\r\n\"CR\",\r\n\"GT\",\r\n\"HN\",\r\n\"MX\",\r\n\"NI\",\r\n\"PA\",\r\n\"SV\",\r\n\"AG\",\r\n\"AI\",\r\n\"AN\",\r\n\"AW\",\r\n\"BB\",\r\n\"BM\",\r\n\"BS\",\r\n\"CU\",\r\n\"DM\",\r\n\"DO\",\r\n\"GD\",\r\n\"GP\",\r\n\"HT\",\r\n\"JM\",\r\n\"KN\",\r\n\"KY\",\r\n\"LC\",\r\n\"MQ\",\r\n\"MS\",\r\n\"PR\",\r\n\"TC\",\r\n\"TT\",\r\n\"VC\",\r\n\"VG\",\r\n\"VI\",\r\n\"AR\",\r\n\"BO\",\r\n\"BR\",\r\n\"CL\",\r\n\"CO\",\r\n\"EC\",\r\n\"FK\",\r\n\"GF\",\r\n\"GY\",\r\n\"PE\",\r\n\"PY\",\r\n\"SR\",\r\n\"UY\",\r\n\"VE\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:55','2013-06-27 22:07:54'),(75,87,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"BE\",\r\n\"DE\",\r\n\"FR\",\r\n\"FX\",\r\n\"GB\",\r\n\"IE\",\r\n\"LU\",\r\n\"MC\",\r\n\"NL\",\r\n\"IT\",\r\n\"MT\",\r\n\"SM\",\r\n\"VA\",\r\n\"AD\",\r\n\"ES\",\r\n\"GI\",\r\n\"PT\",\r\n\"BY\",\r\n\"EE\",\r\n\"LT\",\r\n\"LV\",\r\n\"MD\",\r\n\"PL\",\r\n\"UA\",\r\n\"AL\",\r\n\"BA\",\r\n\"BG\",\r\n\"GR\",\r\n\"HR\",\r\n\"MK\",\r\n\"RO\",\r\n\"SI\",\r\n\"YU\",\r\n\"RU\",\r\n\"AT\",\r\n\"CH\",\r\n\"CZ\",\r\n\"HU\",\r\n\"LI\",\r\n\"SK\",\r\n\"DK\",\r\n\"FI\",\r\n\"FO\",\r\n\"IS\",\r\n\"NO\",\r\n\"SE\",\r\n\"SJ\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:55','2013-06-27 22:07:54'),(76,88,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"BI\",\r\n\"CF\",\r\n\"CG\",\r\n\"RW\",\r\n\"TD\",\r\n\"ZR\",\r\n\"DJ\",\r\n\"ER\",\r\n\"ET\",\r\n\"KE\",\r\n\"SO\",\r\n\"TZ\",\r\n\"UG\",\r\n\"KM\",\r\n\"MG\",\r\n\"MU\",\r\n\"RE\",\r\n\"SC\",\r\n\"YT\",\r\n\"AO\",\r\n\"BW\",\r\n\"LS\",\r\n\"MW\",\r\n\"MZ\",\r\n\"NA\",\r\n\"SZ\",\r\n\"ZA\",\r\n\"ZM\",\r\n\"ZW\",\r\n\"BF\",\r\n\"BJ\",\r\n\"CI\",\r\n\"CM\",\r\n\"CV\",\r\n\"GA\",\r\n\"GH\",\r\n\"GM\",\r\n\"GN\",\r\n\"GQ\",\r\n\"GW\",\r\n\"LR\",\r\n\"ML\",\r\n\"MR\",\r\n\"NE\",\r\n\"NG\",\r\n\"SL\",\r\n\"SN\",\r\n\"ST\",\r\n\"TG\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:55','2013-06-27 22:07:54'),(77,89,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"DZ\",\r\n\"EG\",\r\n\"EH\",\r\n\"LY\",\r\n\"MA\",\r\n\"SD\",\r\n\"TN\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:55','2013-06-27 22:07:54'),(78,90,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','2','','hook','actionObjectEmployeeAddAfter',0,'2013-06-18 03:25:55','2013-06-17 03:25:55'),(79,91,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','3','','hook','actionObjectEmployeeAddAfter',0,'2013-06-18 03:25:56','2013-06-17 03:25:56'),(80,92,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','5','','hook','actionObjectEmployeeAddAfter',0,'2013-06-18 03:25:56','2013-06-17 03:25:56'),(81,93,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','10','','hook','actionObjectEmployeeAddAfter',0,'2013-06-18 03:25:56','2013-06-17 03:25:56'),(82,94,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','20','','hook','actionObjectEmployeeAddAfter',0,'2013-06-18 03:25:56','2013-06-17 03:25:56'),(83,95,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','40','','hook','actionObjectEmployeeAddAfter',0,'2013-06-18 03:25:56','2013-06-17 03:25:56'),(84,96,'sql','SELECT id_image FROM PREFIX_image WHERE id_image > 26','>','0','27','hook','actionObjectImageAddAfter',1,'2013-06-18 03:25:56','2013-06-26 05:17:33'),(85,97,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','50','139','hook','actionObjectImageAddAfter',1,'2013-06-18 03:25:56','2013-06-26 05:17:41'),(86,98,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','100','144','hook','actionObjectImageAddAfter',1,'2013-06-18 03:25:57','2013-06-26 05:17:49'),(87,99,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','1000','','time','2',0,'2013-06-18 03:25:57','2013-06-16 03:25:57'),(88,100,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','10000','','time','4',0,'2013-06-18 03:25:57','2013-06-14 03:25:57'),(89,101,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','50000','','time','8',0,'2013-06-18 03:25:57','2013-06-10 03:25:57'),(90,102,'sql','SELECT id_cms FROM PREFIX_cms WHERE id_cms > 5','>','0','','hook','actionObjectCMSAddAfter',0,'2013-06-18 03:25:57','2013-06-17 03:25:57'),(91,103,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','1','','hook','actionObjectCartRuleAddAfter 	',0,'2013-06-18 03:25:57','2013-06-17 03:25:57'),(92,104,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','10','','hook','actionObjectCartRuleAddAfter 	',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(93,105,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','100','','hook','actionObjectCartRuleAddAfter 	',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(94,107,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','500','','hook','actionObjectCartRuleAddAfter 	',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(95,106,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','1000','','hook','actionObjectCartRuleAddAfter 	',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(96,108,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','5000','','hook','actionObjectCartRuleAddAfter 	',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(97,109,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference != \"XKBKNABJK\" AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','1','','hook','newOrder',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(98,110,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference != \"XKBKNABJK\" AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','10','','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(99,111,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference != \"XKBKNABJK\" AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','100','','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(100,113,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference != \"XKBKNABJK\" AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','1000','','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(101,114,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference != \"XKBKNABJK\" AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','5000','','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:58','2013-06-17 03:25:58'),(102,112,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference != \"XKBKNABJK\" AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','10000','','hook','actionOrderStatusUpdate',0,'2013-06-18 03:25:58','2013-06-17 03:25:58');
/*!40000 ALTER TABLE `ps_condition` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_condition_advice` WRITE;
/*!40000 ALTER TABLE `ps_condition_advice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_condition_advice` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_condition_badge` WRITE;
/*!40000 ALTER TABLE `ps_condition_badge` DISABLE KEYS */;
INSERT INTO `ps_condition_badge` VALUES (1,17),(2,38),(3,1),(4,2),(5,2),(6,2),(7,3),(8,4),(9,5),(10,6),(11,7),(12,8),(13,9),(14,10),(15,11),(16,12),(17,13),(18,14),(19,15),(20,16),(21,18),(22,19),(23,20),(24,21),(25,22),(26,23),(27,24),(28,25),(29,26),(30,27),(31,28),(32,29),(33,30),(34,31),(35,32),(36,33),(37,34),(38,35),(39,36),(40,37),(41,39),(42,40),(43,41),(44,42),(45,43),(46,44),(47,45),(48,46),(49,47),(50,48),(51,49),(52,50),(53,51),(54,52),(55,53),(56,54),(57,55),(58,56),(59,57),(60,58),(61,59),(62,60),(63,61),(64,62),(65,63),(66,64),(67,65),(68,66),(69,67),(70,68),(71,69),(72,70),(73,71),(74,72),(75,73),(76,74),(77,75),(78,76),(79,77),(80,78),(81,79),(82,80),(83,81),(84,82),(85,83),(86,84),(87,85),(88,86),(89,87),(90,88),(91,89),(92,90),(93,91),(94,92),(95,93),(96,94),(97,95),(98,96),(99,97),(100,98),(101,99),(102,100);
/*!40000 ALTER TABLE `ps_condition_badge` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_configuration` WRITE;
/*!40000 ALTER TABLE `ps_configuration` DISABLE KEYS */;
INSERT INTO `ps_configuration` VALUES (1,NULL,NULL,'PS_LANG_DEFAULT','1','2013-06-18 03:23:17','2013-06-18 03:23:17'),(2,NULL,NULL,'PS_CARRIER_DEFAULT','1','2013-06-18 03:23:27','2013-06-18 03:23:27'),(3,NULL,NULL,'PS_GROUP_FEATURE_ACTIVE','1','2013-06-18 03:23:28','2013-06-18 03:23:28'),(4,NULL,NULL,'PS_SEARCH_INDEXATION','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,NULL,NULL,'PS_ONE_PHONE_AT_LEAST','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,NULL,NULL,'PS_CURRENCY_DEFAULT','1','0000-00-00 00:00:00','2013-06-18 03:24:11'),(7,NULL,NULL,'PS_COUNTRY_DEFAULT','21','0000-00-00 00:00:00','2013-06-18 03:23:37'),(8,NULL,NULL,'PS_REWRITING_SETTINGS','0','0000-00-00 00:00:00','2013-07-22 06:43:54'),(9,NULL,NULL,'PS_ORDER_OUT_OF_STOCK','1','0000-00-00 00:00:00','2013-07-25 04:50:15'),(10,NULL,NULL,'PS_LAST_QTIES','3','0000-00-00 00:00:00','2013-07-25 04:50:15'),(11,NULL,NULL,'PS_CART_REDIRECT','1','0000-00-00 00:00:00','2013-07-25 04:50:15'),(12,NULL,NULL,'PS_HELPBOX','1','0000-00-00 00:00:00','2013-06-21 04:01:01'),(13,NULL,NULL,'PS_CONDITIONS','1','0000-00-00 00:00:00','2013-07-24 07:13:50'),(14,NULL,NULL,'PS_RECYCLABLE_PACK','0','0000-00-00 00:00:00','2013-07-24 07:13:50'),(15,NULL,NULL,'PS_GIFT_WRAPPING','0','0000-00-00 00:00:00','2013-07-24 07:13:50'),(16,NULL,NULL,'PS_GIFT_WRAPPING_PRICE','0','0000-00-00 00:00:00','2013-07-24 07:13:50'),(17,NULL,NULL,'PS_STOCK_MANAGEMENT','1','0000-00-00 00:00:00','2013-07-25 04:50:15'),(18,NULL,NULL,'PS_NAVIGATION_PIPE','>','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,NULL,NULL,'PS_PRODUCTS_PER_PAGE','12','0000-00-00 00:00:00','2013-07-25 04:50:15'),(20,NULL,NULL,'PS_PURCHASE_MINIMUM','0','0000-00-00 00:00:00','2013-07-24 07:13:50'),(21,NULL,NULL,'PS_PRODUCTS_ORDER_WAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,NULL,NULL,'PS_PRODUCTS_ORDER_BY','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,NULL,NULL,'PS_DISPLAY_QTIES','1','0000-00-00 00:00:00','2013-07-25 04:50:15'),(24,NULL,NULL,'PS_SHIPPING_HANDLING','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,NULL,NULL,'PS_SHIPPING_FREE_PRICE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,NULL,NULL,'PS_SHIPPING_FREE_WEIGHT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,NULL,NULL,'PS_SHIPPING_METHOD','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,NULL,NULL,'PS_TAX','1','0000-00-00 00:00:00','2013-06-21 03:31:18'),(29,NULL,NULL,'PS_SHOP_ENABLE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,NULL,NULL,'PS_NB_DAYS_NEW_PRODUCT','200','0000-00-00 00:00:00','2013-07-25 04:50:15'),(31,NULL,NULL,'PS_SSL_ENABLED','0','0000-00-00 00:00:00','2013-07-29 03:25:55'),(32,NULL,NULL,'PS_WEIGHT_UNIT','lb','0000-00-00 00:00:00','2013-06-18 03:23:53'),(33,NULL,NULL,'PS_BLOCK_CART_AJAX','1','0000-00-00 00:00:00','2013-06-18 03:24:16'),(34,NULL,NULL,'PS_ORDER_RETURN','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,NULL,NULL,'PS_ORDER_RETURN_NB_DAYS','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,NULL,NULL,'PS_MAIL_TYPE','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,NULL,NULL,'PS_PRODUCT_PICTURE_MAX_SIZE','8388608','0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,NULL,NULL,'PS_PRODUCT_PICTURE_WIDTH','64','0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,NULL,NULL,'PS_PRODUCT_PICTURE_HEIGHT','64','0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,NULL,NULL,'PS_INVOICE_PREFIX','IN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,NULL,NULL,'PS_INVOICE_NUMBER','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,NULL,NULL,'PS_DELIVERY_PREFIX','DE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,NULL,NULL,'PS_DELIVERY_NUMBER','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,NULL,NULL,'PS_INVOICE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,NULL,NULL,'PS_PASSWD_TIME_BACK','360','0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,NULL,NULL,'PS_PASSWD_TIME_FRONT','360','0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,NULL,NULL,'PS_DISP_UNAVAILABLE_ATTR','1','0000-00-00 00:00:00','2013-07-25 04:50:15'),(48,NULL,NULL,'PS_SEARCH_MINWORDLEN','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,NULL,NULL,'PS_SEARCH_BLACKLIST','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,NULL,NULL,'PS_SEARCH_WEIGHT_PNAME','6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,NULL,NULL,'PS_SEARCH_WEIGHT_REF','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,NULL,NULL,'PS_SEARCH_WEIGHT_SHORTDESC','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,NULL,NULL,'PS_SEARCH_WEIGHT_DESC','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,NULL,NULL,'PS_SEARCH_WEIGHT_CNAME','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,NULL,NULL,'PS_SEARCH_WEIGHT_MNAME','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,NULL,NULL,'PS_SEARCH_WEIGHT_TAG','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,NULL,NULL,'PS_SEARCH_WEIGHT_ATTRIBUTE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,NULL,NULL,'PS_SEARCH_WEIGHT_FEATURE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,NULL,NULL,'PS_SEARCH_AJAX','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,NULL,NULL,'PS_TIMEZONE','US/Eastern','0000-00-00 00:00:00','2013-06-18 03:23:37'),(61,NULL,NULL,'PS_THEME_V11','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,NULL,NULL,'PRESTASTORE_LIVE','1','0000-00-00 00:00:00','2013-06-21 04:01:01'),(63,NULL,NULL,'PS_TIN_ACTIVE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,NULL,NULL,'PS_SHOW_ALL_MODULES','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,NULL,NULL,'PS_BACKUP_ALL','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,NULL,NULL,'PS_1_3_UPDATE_DATE','2011-12-27 10:20:42','0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,NULL,NULL,'PS_PRICE_ROUND_MODE','2','0000-00-00 00:00:00','2013-07-29 03:25:55'),(68,NULL,NULL,'PS_1_3_2_UPDATE_DATE','2011-12-27 10:20:42','0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,NULL,NULL,'PS_CONDITIONS_CMS_ID','3','0000-00-00 00:00:00','2013-07-24 07:13:50'),(70,NULL,NULL,'TRACKING_DIRECT_TRAFFIC','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,NULL,NULL,'PS_META_KEYWORDS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,NULL,NULL,'PS_DISPLAY_JQZOOM','1','0000-00-00 00:00:00','2013-07-25 04:50:15'),(73,NULL,NULL,'PS_VOLUME_UNIT','gal','0000-00-00 00:00:00','2013-06-18 03:23:53'),(74,NULL,NULL,'PS_CIPHER_ALGORITHM','1','0000-00-00 00:00:00','2013-06-18 03:23:37'),(75,NULL,NULL,'PS_ATTRIBUTE_CATEGORY_DISPLAY','1','0000-00-00 00:00:00','2013-07-25 04:50:15'),(76,NULL,NULL,'PS_CUSTOMER_SERVICE_FILE_UPLOAD','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,NULL,NULL,'PS_CUSTOMER_SERVICE_SIGNATURE','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,NULL,NULL,'PS_BLOCK_BESTSELLERS_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,NULL,NULL,'PS_BLOCK_NEWPRODUCTS_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,NULL,NULL,'PS_BLOCK_SPECIALS_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,NULL,NULL,'PS_STOCK_MVT_REASON_DEFAULT','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,NULL,NULL,'PS_COMPARATOR_MAX_ITEM','5','0000-00-00 00:00:00','2013-07-25 04:50:15'),(83,NULL,NULL,'PS_ORDER_PROCESS_TYPE','1','0000-00-00 00:00:00','2013-07-24 07:13:50'),(84,NULL,NULL,'PS_SPECIFIC_PRICE_PRIORITIES','id_shop;id_currency;id_country;id_group','0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,NULL,NULL,'PS_TAX_DISPLAY','1','0000-00-00 00:00:00','2013-06-21 03:31:18'),(86,NULL,NULL,'PS_SMARTY_FORCE_COMPILE','2','0000-00-00 00:00:00','2013-07-25 06:23:11'),(87,NULL,NULL,'PS_DISTANCE_UNIT','mi','0000-00-00 00:00:00','2013-06-18 03:23:53'),(88,NULL,NULL,'PS_STORES_DISPLAY_CMS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,NULL,NULL,'PS_STORES_DISPLAY_FOOTER','1','0000-00-00 00:00:00','2013-06-18 03:37:43'),(90,NULL,NULL,'PS_STORES_SIMPLIFIED','0','0000-00-00 00:00:00','2013-06-18 03:37:43'),(91,NULL,NULL,'SHOP_LOGO_WIDTH','183','0000-00-00 00:00:00','2013-07-24 23:22:10'),(92,NULL,NULL,'SHOP_LOGO_HEIGHT','50','0000-00-00 00:00:00','2013-07-24 23:22:10'),(93,NULL,NULL,'EDITORIAL_IMAGE_WIDTH','530','0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,NULL,NULL,'EDITORIAL_IMAGE_HEIGHT','228','0000-00-00 00:00:00','0000-00-00 00:00:00'),(95,NULL,NULL,'PS_STATSDATA_CUSTOMER_PAGESVIEWS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,NULL,NULL,'PS_STATSDATA_PAGESVIEWS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,NULL,NULL,'PS_STATSDATA_PLUGINS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(98,NULL,NULL,'PS_GEOLOCATION_ENABLED','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,NULL,NULL,'PS_ALLOWED_COUNTRIES','AF;ZA;AX;AL;DZ;DE;AD;AO;AI;AQ;AG;AN;SA;AR;AM;AW;AU;AT;AZ;BS;BH;BD;BB;BY;BE;BZ;BJ;BM;BT;BO;BA;BW;BV;BR;BN;BG;BF;MM;BI;KY;KH;CM;CA;CV;CF;CL;CN;CX;CY;CC;CO;KM;CG;CD;CK;KR;KP;CR;CI;HR;CU;DK;DJ;DM;EG;IE;SV;AE;EC;ER;ES;EE;ET;FK;FO;FJ;FI;FR;GA;GM;GE;GS;GH;GI;GR;GD;GL;GP;GU;GT;GG;GN;GQ;GW;GY;GF;HT;HM;HN;HK;HU;IM;MU;VG;VI;IN;ID;IR;IQ;IS;IL;IT;JM;JP;JE;JO;KZ;KE;KG;KI;KW;LA;LS;LV;LB;LR;LY;LI;LT;LU;MO;MK;MG;MY;MW;MV;ML;MT;MP;MA;MH;MQ;MR;YT;MX;FM;MD;MC;MN;ME;MS;MZ;NA;NR;NP;NI;NE;NG;NU;NF;NO;NC;NZ;IO;OM;UG;UZ;PK;PW;PS;PA;PG;PY;NL;PE;PH;PN;PL;PF;PR;PT;QA;DO;CZ;RE;RO;GB;RU;RW;EH;BL;KN;SM;MF;PM;VA;VC;LC;SB;WS;AS;ST;SN;RS;SC;SL;SG;SK;SI;SO;SD;LK;SE;CH;SR;SJ;SZ;SY;TJ;TW;TZ;TD;TF;TH;TL;TG;TK;TO;TT;TN;TM;TC;TR;TV;UA;UY;US;VU;VE;VN;WF;YE;ZM;ZW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,NULL,NULL,'PS_GEOLOCATION_BEHAVIOR','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,NULL,NULL,'PS_LOCALE_LANGUAGE','en','0000-00-00 00:00:00','2013-06-18 03:23:37'),(102,NULL,NULL,'PS_LOCALE_COUNTRY','us','0000-00-00 00:00:00','2013-06-18 03:23:37'),(103,NULL,NULL,'PS_ATTACHMENT_MAXIMUM_SIZE','8','0000-00-00 00:00:00','2013-06-21 04:01:01'),(104,NULL,NULL,'PS_SMARTY_CACHE','0','0000-00-00 00:00:00','2013-07-25 06:23:11'),(105,NULL,NULL,'PS_DIMENSION_UNIT','in','0000-00-00 00:00:00','2013-06-18 03:23:53'),(106,NULL,NULL,'PS_GUEST_CHECKOUT_ENABLED','0','0000-00-00 00:00:00','2013-07-24 07:13:50'),(107,NULL,NULL,'PS_DISPLAY_SUPPLIERS','1','0000-00-00 00:00:00','2013-07-29 03:25:55'),(108,NULL,NULL,'PS_CATALOG_MODE','0','0000-00-00 00:00:00','2013-07-25 04:50:15'),(109,NULL,NULL,'PS_GEOLOCATION_WHITELIST','127;209.185.108;209.185.253;209.85.238;209.85.238.11;209.85.238.4;216.239.33.96;216.239.33.97;216.239.33.98;216.239.33.99;216.239.37.98;216.239.37.99;216.239.39.98;216.239.39.99;216.239.41.96;216.239.41.97;216.239.41.98;216.239.41.99;216.239.45.4;216.239.46;216.239.51.96;216.239.51.97;216.239.51.98;216.239.51.99;216.239.53.98;216.239.53.99;216.239.57.96;216.239.57.97;216.239.57.98;216.239.57.99;216.239.59.98;216.239.59.99;216.33.229.163;64.233.173.193;64.233.173.194;64.233.173.195;64.233.173.196;64.233.173.197;64.233.173.198;64.233.173.199;64.233.173.200;64.233.173.201;64.233.173.202;64.233.173.203;64.233.173.204;64.233.173.205;64.233.173.206;64.233.173.207;64.233.173.208;64.233.173.209;64.233.173.210;64.233.173.211;64.233.173.212;64.233.173.213;64.233.173.214;64.233.173.215;64.233.173.216;64.233.173.217;64.233.173.218;64.233.173.219;64.233.173.220;64.233.173.221;64.233.173.222;64.233.173.223;64.233.173.224;64.233.173.225;64.233.173.226;64.233.173.227;64.233.173.228;64.233.173.229;64.233.173.230;64.233.173.231;64.233.173.232;64.233.173.233;64.233.173.234;64.233.173.235;64.233.173.236;64.233.173.237;64.233.173.238;64.233.173.239;64.233.173.240;64.233.173.241;64.233.173.242;64.233.173.243;64.233.173.244;64.233.173.245;64.233.173.246;64.233.173.247;64.233.173.248;64.233.173.249;64.233.173.250;64.233.173.251;64.233.173.252;64.233.173.253;64.233.173.254;64.233.173.255;64.68.80;64.68.81;64.68.82;64.68.83;64.68.84;64.68.85;64.68.86;64.68.87;64.68.88;64.68.89;64.68.90.1;64.68.90.10;64.68.90.11;64.68.90.12;64.68.90.129;64.68.90.13;64.68.90.130;64.68.90.131;64.68.90.132;64.68.90.133;64.68.90.134;64.68.90.135;64.68.90.136;64.68.90.137;64.68.90.138;64.68.90.139;64.68.90.14;64.68.90.140;64.68.90.141;64.68.90.142;64.68.90.143;64.68.90.144;64.68.90.145;64.68.90.146;64.68.90.147;64.68.90.148;64.68.90.149;64.68.90.15;64.68.90.150;64.68.90.151;64.68.90.152;64.68.90.153;64.68.90.154;64.68.90.155;64.68.90.156;64.68.90.157;64.68.90.158;64.68.90.159;64.68.90.16;64.68.90.160;64.68.90.161;64.68.90.162;64.68.90.163;64.68.90.164;64.68.90.165;64.68.90.166;64.68.90.167;64.68.90.168;64.68.90.169;64.68.90.17;64.68.90.170;64.68.90.171;64.68.90.172;64.68.90.173;64.68.90.174;64.68.90.175;64.68.90.176;64.68.90.177;64.68.90.178;64.68.90.179;64.68.90.18;64.68.90.180;64.68.90.181;64.68.90.182;64.68.90.183;64.68.90.184;64.68.90.185;64.68.90.186;64.68.90.187;64.68.90.188;64.68.90.189;64.68.90.19;64.68.90.190;64.68.90.191;64.68.90.192;64.68.90.193;64.68.90.194;64.68.90.195;64.68.90.196;64.68.90.197;64.68.90.198;64.68.90.199;64.68.90.2;64.68.90.20;64.68.90.200;64.68.90.201;64.68.90.202;64.68.90.203;64.68.90.204;64.68.90.205;64.68.90.206;64.68.90.207;64.68.90.208;64.68.90.21;64.68.90.22;64.68.90.23;64.68.90.24;64.68.90.25;64.68.90.26;64.68.90.27;64.68.90.28;64.68.90.29;64.68.90.3;64.68.90.30;64.68.90.31;64.68.90.32;64.68.90.33;64.68.90.34;64.68.90.35;64.68.90.36;64.68.90.37;64.68.90.38;64.68.90.39;64.68.90.4;64.68.90.40;64.68.90.41;64.68.90.42;64.68.90.43;64.68.90.44;64.68.90.45;64.68.90.46;64.68.90.47;64.68.90.48;64.68.90.49;64.68.90.5;64.68.90.50;64.68.90.51;64.68.90.52;64.68.90.53;64.68.90.54;64.68.90.55;64.68.90.56;64.68.90.57;64.68.90.58;64.68.90.59;64.68.90.6;64.68.90.60;64.68.90.61;64.68.90.62;64.68.90.63;64.68.90.64;64.68.90.65;64.68.90.66;64.68.90.67;64.68.90.68;64.68.90.69;64.68.90.7;64.68.90.70;64.68.90.71;64.68.90.72;64.68.90.73;64.68.90.74;64.68.90.75;64.68.90.76;64.68.90.77;64.68.90.78;64.68.90.79;64.68.90.8;64.68.90.80;64.68.90.9;64.68.91;64.68.92;66.249.64;66.249.65;66.249.66;66.249.67;66.249.68;66.249.69;66.249.70;66.249.71;66.249.72;66.249.73;66.249.78;66.249.79;72.14.199;8.6.48','0000-00-00 00:00:00','0000-00-00 00:00:00'),(110,NULL,NULL,'PS_LOGS_BY_EMAIL','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(111,NULL,NULL,'PS_COOKIE_CHECKIP','0','0000-00-00 00:00:00','2013-06-21 04:01:01'),(112,NULL,NULL,'PS_STORES_CENTER_LAT','25.948969','0000-00-00 00:00:00','2013-06-18 03:37:43'),(113,NULL,NULL,'PS_STORES_CENTER_LONG','-80.226439','0000-00-00 00:00:00','2013-06-18 03:37:44'),(114,NULL,NULL,'PS_USE_ECOTAX','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(115,NULL,NULL,'PS_CANONICAL_REDIRECT','1','0000-00-00 00:00:00','2013-07-22 06:43:54'),(116,NULL,NULL,'PS_IMG_UPDATE_TIME','1374722528','0000-00-00 00:00:00','2013-07-24 23:22:08'),(117,NULL,NULL,'PS_BACKUP_DROP_TABLE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,NULL,NULL,'PS_OS_CHEQUE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,NULL,NULL,'PS_OS_PAYMENT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,NULL,NULL,'PS_OS_PREPARATION','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,NULL,NULL,'PS_OS_SHIPPING','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(122,NULL,NULL,'PS_OS_DELIVERED','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(123,NULL,NULL,'PS_OS_CANCELED','6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(124,NULL,NULL,'PS_OS_REFUND','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,NULL,NULL,'PS_OS_ERROR','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,NULL,NULL,'PS_OS_OUTOFSTOCK','9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(127,NULL,NULL,'PS_OS_BANKWIRE','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(128,NULL,NULL,'PS_OS_PAYPAL','11','0000-00-00 00:00:00','0000-00-00 00:00:00'),(129,NULL,NULL,'PS_OS_WS_PAYMENT','12','0000-00-00 00:00:00','0000-00-00 00:00:00'),(130,NULL,NULL,'PS_LEGACY_IMAGES','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(131,NULL,NULL,'PS_IMAGE_QUALITY','png','0000-00-00 00:00:00','2013-06-26 03:19:55'),(132,NULL,NULL,'PS_PNG_QUALITY','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(133,NULL,NULL,'PS_JPEG_QUALITY','90','0000-00-00 00:00:00','0000-00-00 00:00:00'),(134,NULL,NULL,'PS_COOKIE_LIFETIME_FO','480','0000-00-00 00:00:00','2013-06-21 04:01:01'),(135,NULL,NULL,'PS_COOKIE_LIFETIME_BO','480','0000-00-00 00:00:00','2013-06-21 04:01:01'),(136,NULL,NULL,'PS_RESTRICT_DELIVERED_COUNTRIES','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(137,NULL,NULL,'PS_SHOW_NEW_ORDERS','1','0000-00-00 00:00:00','2013-06-21 04:01:01'),(138,NULL,NULL,'PS_SHOW_NEW_CUSTOMERS','1','0000-00-00 00:00:00','2013-06-21 04:01:01'),(139,NULL,NULL,'PS_SHOW_NEW_MESSAGES','1','0000-00-00 00:00:00','2013-06-21 04:01:01'),(140,NULL,NULL,'PS_FEATURE_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(141,NULL,NULL,'PS_COMBINATION_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(142,NULL,NULL,'PS_SPECIFIC_PRICE_FEATURE_ACTIVE','1','0000-00-00 00:00:00','2013-06-21 03:37:10'),(143,NULL,NULL,'PS_SCENE_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(144,NULL,NULL,'PS_VIRTUAL_PROD_FEATURE_ACTIVE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(145,NULL,NULL,'PS_CUSTOMIZATION_FEATURE_ACTIVE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(146,NULL,NULL,'PS_CART_RULE_FEATURE_ACTIVE','1','0000-00-00 00:00:00','2013-06-27 03:20:57'),(147,NULL,NULL,'PS_PACK_FEATURE_ACTIVE',NULL,'0000-00-00 00:00:00','2013-07-24 21:35:49'),(148,NULL,NULL,'PS_ALIAS_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(149,NULL,NULL,'PS_TAX_ADDRESS_TYPE','id_address_delivery','0000-00-00 00:00:00','0000-00-00 00:00:00'),(150,NULL,NULL,'PS_SHOP_DEFAULT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(151,NULL,NULL,'PS_CARRIER_DEFAULT_SORT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(152,NULL,NULL,'PS_STOCK_MVT_INC_REASON_DEFAULT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(153,NULL,NULL,'PS_STOCK_MVT_DEC_REASON_DEFAULT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(154,NULL,NULL,'PS_ADVANCED_STOCK_MANAGEMENT','0','0000-00-00 00:00:00','2013-07-25 04:50:15'),(155,NULL,NULL,'PS_ADMINREFRESH_NOTIFICATION','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(156,NULL,NULL,'PS_STOCK_MVT_TRANSFER_TO','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(157,NULL,NULL,'PS_STOCK_MVT_TRANSFER_FROM','6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(158,NULL,NULL,'PS_CARRIER_DEFAULT_ORDER','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(159,NULL,NULL,'PS_STOCK_MVT_SUPPLY_ORDER','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(160,NULL,NULL,'PS_STOCK_CUSTOMER_ORDER_REASON','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(161,NULL,NULL,'PS_UNIDENTIFIED_GROUP','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(162,NULL,NULL,'PS_GUEST_GROUP','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(163,NULL,NULL,'PS_CUSTOMER_GROUP','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(164,NULL,NULL,'PS_SMARTY_CONSOLE','1','0000-00-00 00:00:00','2013-07-24 22:23:04'),(165,NULL,NULL,'PS_INVOICE_MODEL','invoice','0000-00-00 00:00:00','0000-00-00 00:00:00'),(166,NULL,NULL,'PS_LIMIT_UPLOAD_IMAGE_VALUE','2','0000-00-00 00:00:00','2013-06-21 04:01:01'),(167,NULL,NULL,'PS_LIMIT_UPLOAD_FILE_VALUE','2','0000-00-00 00:00:00','2013-06-21 04:01:01'),(168,NULL,NULL,'MB_PAY_TO_EMAIL','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(169,NULL,NULL,'MB_SECRET_WORD','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(170,NULL,NULL,'MB_HIDE_LOGIN','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(171,NULL,NULL,'MB_ID_LOGO','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(172,NULL,NULL,'MB_ID_LOGO_WALLET','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(173,NULL,NULL,'MB_PARAMETERS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(174,NULL,NULL,'MB_PARAMETERS_2','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(175,NULL,NULL,'MB_DISPLAY_MODE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(176,NULL,NULL,'MB_CANCEL_URL','http://www.yoursite.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(177,NULL,NULL,'MB_LOCAL_METHODS','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(178,NULL,NULL,'MB_INTER_METHODS','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(179,NULL,NULL,'BANK_WIRE_CURRENCIES','2,1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(180,NULL,NULL,'CHEQUE_CURRENCIES','2,1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(181,NULL,NULL,'PRODUCTS_VIEWED_NBR','2','0000-00-00 00:00:00','2013-06-25 06:00:51'),(184,NULL,NULL,'MANUFACTURER_DISPLAY_FORM','1','0000-00-00 00:00:00','2013-06-18 03:24:22'),(185,NULL,NULL,'MANUFACTURER_DISPLAY_TEXT','1','0000-00-00 00:00:00','2013-06-18 03:24:22'),(186,NULL,NULL,'MANUFACTURER_DISPLAY_TEXT_NB','5','0000-00-00 00:00:00','2013-06-18 03:24:22'),(187,NULL,NULL,'NEW_PRODUCTS_NBR','5','0000-00-00 00:00:00','2013-06-18 03:24:23'),(188,NULL,NULL,'PS_TOKEN_ENABLE','1','0000-00-00 00:00:00','2013-07-29 03:25:55'),(189,NULL,NULL,'PS_STATS_RENDER','graphxmlswfcharts','0000-00-00 00:00:00','2013-06-18 03:24:27'),(190,NULL,NULL,'PS_STATS_OLD_CONNECT_AUTO_CLEAN','never','0000-00-00 00:00:00','0000-00-00 00:00:00'),(191,NULL,NULL,'PS_STATS_GRID_RENDER','gridhtml','0000-00-00 00:00:00','0000-00-00 00:00:00'),(192,NULL,NULL,'BLOCKTAGS_NBR','10','0000-00-00 00:00:00','2013-06-18 03:24:25'),(193,NULL,NULL,'CHECKUP_DESCRIPTIONS_LT','100','0000-00-00 00:00:00','0000-00-00 00:00:00'),(194,NULL,NULL,'CHECKUP_DESCRIPTIONS_GT','400','0000-00-00 00:00:00','0000-00-00 00:00:00'),(195,NULL,NULL,'CHECKUP_IMAGES_LT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(196,NULL,NULL,'CHECKUP_IMAGES_GT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(197,NULL,NULL,'CHECKUP_SALES_LT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(198,NULL,NULL,'CHECKUP_SALES_GT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(199,NULL,NULL,'CHECKUP_STOCK_LT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(200,NULL,NULL,'CHECKUP_STOCK_GT','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(201,NULL,NULL,'FOOTER_CMS','0_1|0_2|0_4|0_5','0000-00-00 00:00:00','2013-06-19 03:09:25'),(202,NULL,NULL,'FOOTER_BLOCK_ACTIVATION','1','0000-00-00 00:00:00','2013-06-19 03:09:25'),(203,NULL,NULL,'FOOTER_POWEREDBY','0','0000-00-00 00:00:00','2013-06-19 03:09:25'),(204,NULL,NULL,'BLOCKADVERT_LINK','http://www.prestashop.com','0000-00-00 00:00:00','2013-06-18 03:24:16'),(205,NULL,NULL,'BLOCKSTORE_IMG','store.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(206,NULL,NULL,'BLOCKADVERT_IMG_EXT','jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(207,NULL,NULL,'MOD_BLOCKTOPMENU_ITEMS','CAT6,CAT7,CAT8,CAT9,CAT10,CAT31','0000-00-00 00:00:00','2013-06-18 21:45:32'),(208,NULL,NULL,'MOD_BLOCKTOPMENU_SEARCH',NULL,'0000-00-00 00:00:00','2013-06-18 21:45:32'),(212,NULL,NULL,'blockcontactinfos_company','Presthemes GoMarket Prestashop Theme','0000-00-00 00:00:00','2013-06-19 03:17:59'),(213,NULL,NULL,'blockcontactinfos_address','Qui sque iaculis congue nulla sed sagittis. Sed congue bibendum lacus, id tempus mass porttitor vitae ispumes.\r\n42 avenue des Champs Elysées\r\n75000 Paris\r\nFrance','0000-00-00 00:00:00','2013-06-19 03:17:59'),(214,NULL,NULL,'blockcontactinfos_phone','0123-456-789','0000-00-00 00:00:00','2013-06-18 03:24:22'),(215,NULL,NULL,'blockcontactinfos_email','Gomarket@gmail.com','0000-00-00 00:00:00','2013-06-19 03:18:00'),(216,NULL,NULL,'blockcontact_telnumber','0123-456-789','0000-00-00 00:00:00','2013-06-18 03:24:21'),(217,NULL,NULL,'blockcontact_email','sales@yourcompany.com','0000-00-00 00:00:00','2013-06-18 03:24:21'),(218,NULL,NULL,'SUPPLIER_DISPLAY_TEXT','1','0000-00-00 00:00:00','2013-06-18 03:24:25'),(219,NULL,NULL,'SUPPLIER_DISPLAY_TEXT_NB','5','0000-00-00 00:00:00','2013-06-18 03:24:25'),(220,NULL,NULL,'SUPPLIER_DISPLAY_FORM','1','0000-00-00 00:00:00','2013-06-18 03:24:25'),(221,NULL,NULL,'BLOCK_CATEG_NBR_COLUMN_FOOTER','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(222,NULL,NULL,'UPGRADER_BACKUPDB_FILENAME','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(223,NULL,NULL,'UPGRADER_BACKUPFILES_FILENAME','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(229,NULL,NULL,'PS_VERSION_DB','1.5.4.1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(230,NULL,NULL,'PS_BASE_DISTANCE_UNIT','ft','0000-00-00 00:00:00','2013-06-18 03:23:53'),(231,NULL,NULL,'PS_SHOP_DOMAIN','192.168.1.91','0000-00-00 00:00:00','2013-06-18 03:23:37'),(232,NULL,NULL,'PS_SHOP_DOMAIN_SSL','192.168.1.91','0000-00-00 00:00:00','2013-06-18 03:23:37'),(233,NULL,NULL,'PS_INSTALL_VERSION','1.5.4.1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(234,NULL,NULL,'PS_SHOP_NAME','Presthemes GoMarket Prestashop Theme','0000-00-00 00:00:00','2013-06-18 03:37:44'),(235,NULL,NULL,'PS_SHOP_EMAIL','prestashop@codespot.vn','0000-00-00 00:00:00','2013-06-18 03:24:13'),(236,NULL,NULL,'PS_MAIL_METHOD','1','0000-00-00 00:00:00','2013-06-18 03:23:37'),(237,NULL,NULL,'PS_SHOP_ACTIVITY','3','0000-00-00 00:00:00','2013-07-29 03:25:56'),(238,NULL,NULL,'PS_LOGO','logo.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(239,NULL,NULL,'PS_FAVICON','favicon.ico','0000-00-00 00:00:00','2013-07-17 00:26:20'),(240,NULL,NULL,'PS_STORES_ICON','logo_stores.gif','0000-00-00 00:00:00','0000-00-00 00:00:00'),(241,NULL,NULL,'PS_ROOT_CATEGORY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(242,NULL,NULL,'PS_HOME_CATEGORY','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(243,NULL,NULL,'PS_CONFIGURATION_AGREMENT','1','0000-00-00 00:00:00','2013-06-18 03:23:37'),(244,NULL,NULL,'PS_MAIL_SERVER',NULL,'0000-00-00 00:00:00','2013-06-18 03:23:37'),(245,NULL,NULL,'PS_MAIL_USER','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(246,NULL,NULL,'PS_MAIL_PASSWD','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(247,NULL,NULL,'PS_MAIL_SMTP_ENCRYPTION',NULL,'0000-00-00 00:00:00','2013-06-18 03:23:37'),(248,NULL,NULL,'PS_MAIL_SMTP_PORT','0','0000-00-00 00:00:00','2013-06-18 03:23:37'),(249,NULL,NULL,'PS_MAIL_COLOR','#db3484','0000-00-00 00:00:00','0000-00-00 00:00:00'),(250,NULL,NULL,'NW_SALT','kEFggxNvBbGWNh2i','0000-00-00 00:00:00','2013-06-18 03:24:23'),(252,NULL,NULL,'HOME_FEATURED_NBR','8','0000-00-00 00:00:00','2013-06-18 03:24:28'),(253,NULL,NULL,'SEK_MIN_OCCURENCES','1','0000-00-00 00:00:00','2013-06-18 03:24:29'),(254,NULL,NULL,'SEK_FILTER_KW','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(255,NULL,NULL,'PS_ALLOW_MOBILE_DEVICE','0','0000-00-00 00:00:00','2013-07-17 00:26:20'),(256,NULL,NULL,'BLOCKADVERT_TITLE','PrestaShop','2013-06-18 03:24:16','2013-06-18 03:24:16'),(257,NULL,NULL,'CUSTPRIV_MESSAGE',NULL,'2013-06-18 03:24:22','2013-06-18 03:24:22'),(259,NULL,NULL,'GF_INSTALL_CALC','1','2013-06-18 03:24:41','2013-06-18 03:26:08'),(260,NULL,NULL,'GF_CURRENT_LEVEL','2','2013-06-18 03:24:41','2013-07-29 05:31:34'),(261,NULL,NULL,'GF_CURRENT_LEVEL_PERCENT','25','2013-06-18 03:24:41','2013-07-29 05:31:34'),(262,NULL,NULL,'GF_NOTIFICATION','16','2013-06-18 03:24:41','2013-07-29 05:31:34'),(263,NULL,NULL,'PS_LAST_VERSION','a:10:{s:4:\"name\";s:14:\"1.5.4.1 stable\";s:3:\"num\";s:7:\"1.5.4.1\";s:4:\"link\";s:37:\"http://www.prestashop.com/en/download\";s:3:\"md5\";s:32:\"85b5a16fcfae49f138dfa5582f973168\";s:11:\"autoupgrade\";i:1;s:18:\"autoupgrade_module\";i:1;s:24:\"autoupgrade_last_version\";s:6:\"1.0.16\";s:23:\"autoupgrade_module_link\";s:50:\"http://www.prestashop.com/download/autoupgrade.zip\";s:9:\"changelog\";s:0:\"\";s:4:\"desc\";s:0:\"\";}','2013-06-18 03:25:40','2013-06-18 03:25:40'),(264,NULL,NULL,'PS_LAST_VERSION_CHECK','1375072938','2013-06-18 03:25:40','2013-07-29 00:42:18'),(265,NULL,NULL,'PS_CSS_THEME_CACHE','0','2013-06-18 03:26:08','2013-07-25 06:23:11'),(266,NULL,NULL,'PS_JS_THEME_CACHE','0','2013-06-18 03:26:08','2013-07-25 06:23:11'),(267,NULL,NULL,'PS_HTML_THEME_COMPRESSION','0','2013-06-18 03:26:08','2013-07-25 06:23:11'),(268,NULL,NULL,'PS_JS_HTML_THEME_COMPRESSION','0','2013-06-18 03:26:08','2013-07-25 06:23:11'),(269,NULL,NULL,'PS_HTACCESS_CACHE_CONTROL','0','2013-06-18 03:26:08','2013-07-25 06:23:11'),(270,NULL,NULL,'GF_NOT_VIEWED_BADGE','23','2013-06-18 03:26:08','2013-07-29 00:44:55'),(271,NULL,NULL,'PS_STORES_DISPLAY_SITEMAP','0','2013-06-18 03:37:43','2013-06-18 03:37:43'),(272,NULL,NULL,'PS_SHOP_DETAILS',NULL,'2013-06-18 03:37:44','2013-06-18 03:37:44'),(273,NULL,NULL,'PS_SHOP_ADDR1',NULL,'2013-06-18 03:37:44','2013-06-18 03:37:44'),(274,NULL,NULL,'PS_SHOP_ADDR2',NULL,'2013-06-18 03:37:44','2013-06-18 03:37:44'),(275,NULL,NULL,'PS_SHOP_CODE',NULL,'2013-06-18 03:37:44','2013-06-18 03:37:44'),(276,NULL,NULL,'PS_SHOP_CITY',NULL,'2013-06-18 03:37:44','2013-06-18 03:37:44'),(277,NULL,NULL,'PS_SHOP_COUNTRY_ID','21','2013-06-18 03:37:44','2013-06-18 03:37:44'),(278,NULL,NULL,'PS_SHOP_COUNTRY','United States','2013-06-18 03:37:44','2013-06-18 03:37:44'),(279,NULL,NULL,'PS_SHOP_PHONE',NULL,'2013-06-18 03:37:44','2013-06-18 03:37:44'),(280,NULL,NULL,'PS_SHOP_FAX',NULL,'2013-06-18 03:37:44','2013-06-18 03:37:44'),(281,NULL,NULL,'PS_SHOW_CAT_MODULES_1','others','2013-06-18 03:56:48','2013-07-25 01:12:07'),(284,NULL,NULL,'CS_NEW_PRODUCTS_NBR','5','2013-06-18 05:57:09','2013-06-18 05:57:09'),(295,NULL,NULL,'PS_PRODUCT_SHORT_DESC_LIMIT','0','2013-06-18 06:27:06','2013-07-25 04:50:15'),(296,NULL,NULL,'PS_QTY_DISCOUNT_ON_COMBINATION','0','2013-06-18 06:27:06','2013-07-25 04:50:15'),(297,NULL,NULL,'PRODUCTSCATEGORY_DISPLAY_PRICE','1','2013-06-18 22:13:14','2013-06-18 22:13:25'),(298,NULL,NULL,'FOOTER_CMS_TEXT_1',NULL,'2013-06-19 03:07:23','2013-06-19 03:09:24'),(299,NULL,NULL,'FOOTER_CMS_TEXT_2',NULL,'2013-06-19 03:07:23','2013-06-19 03:09:24'),(300,1,1,'CS_COLOR_TEMPLATE','custom1','2013-06-20 02:45:06','2013-07-25 00:41:51'),(301,NULL,NULL,'PS_HIDE_OPTIMIZATION_TIPS','0','2013-06-21 04:01:01','2013-06-21 04:01:01'),(302,NULL,NULL,'CS_PS_BLOCK_SPECIALS_DISPLAY','1','2013-06-24 03:10:55','2013-06-24 03:10:55'),(313,NULL,NULL,'PS_SHOW_TYPE_MODULES_1','authorModules[codespot]','2013-06-25 06:41:49','2013-07-24 05:51:25'),(314,NULL,NULL,'PS_SHOW_COUNTRY_MODULES_1','0','2013-06-25 06:41:49','2013-06-25 06:41:49'),(315,NULL,NULL,'PS_SHOW_INSTALLED_MODULES_1','installedUninstalled','2013-06-25 06:41:49','2013-06-25 06:41:49'),(316,NULL,NULL,'PS_SHOW_ENABLED_MODULES_1','enabledDisabled','2013-06-25 06:41:49','2013-06-25 06:41:49'),(317,NULL,NULL,'CS_QUICKVIEW_ITEM_SELECT','ul li.ajax_block_product div.center_block a.product_img_link,ul li.ajax_block_product a.product_image','2013-06-26 04:37:25','2013-07-10 05:44:06'),(318,NULL,NULL,'CS_QUICKVIEW_RESIZE_TYPE','0','2013-06-26 04:37:27','2013-06-26 04:37:27'),(319,NULL,NULL,'CS_QUICKVIEW_RESIZE_WIDTH','75','2013-06-26 04:37:27','2013-07-24 23:09:01'),(320,NULL,NULL,'CS_QUICKVIEW_RESIZE_HEIGHT','92','2013-06-26 04:37:27','2013-07-24 23:09:01'),(321,NULL,NULL,'PRODUCT_COMMENTS_MINIMAL_TIME','30','2013-06-26 22:14:33','2013-06-26 22:14:40'),(322,NULL,NULL,'PRODUCT_COMMENTS_ALLOW_GUESTS','1','2013-06-26 22:14:33','2013-06-26 22:14:40'),(323,NULL,NULL,'PRODUCT_COMMENTS_MODERATE','0','2013-06-26 22:14:33','2013-06-26 22:14:40'),(324,NULL,NULL,'CS_ADD_TO_CART_CLASS','a.ajax_add_to_cart_button','2013-06-26 22:18:47','2013-06-26 22:18:47'),(325,NULL,NULL,'PS_ALLOW_MULTISHIPPING','0','2013-06-27 23:13:14','2013-07-24 07:13:50'),(326,NULL,NULL,'PS_SHIP_WHEN_AVAILABLE','0','2013-06-27 23:13:15','2013-07-24 07:13:50'),(327,NULL,NULL,'PS_GIFT_WRAPPING_TAX_RULES_GROUP','0','2013-06-27 23:13:15','2013-07-24 07:13:50'),(328,1,1,'SHOW_PANEL_FRONT_END','1','2013-07-01 04:57:47','2013-07-08 04:17:39'),(329,NULL,NULL,'PS_ALLOW_ACCENTED_CHARS_URL','0','2013-07-22 05:36:40','2013-07-22 06:43:54'),(330,NULL,NULL,'PS_HTACCESS_DISABLE_MULTIVIEWS','0','2013-07-22 05:36:40','2013-07-22 06:43:54'),(331,NULL,NULL,'PS_HTACCESS_DISABLE_MODSEC','0','2013-07-22 05:36:40','2013-07-22 06:43:54'),(332,NULL,NULL,'PS_ROUTE_product_rule',NULL,'2013-07-22 05:45:22','2013-07-22 06:43:54'),(333,NULL,NULL,'PS_ROUTE_category_rule',NULL,'2013-07-22 05:45:22','2013-07-22 06:43:54'),(334,NULL,NULL,'PS_ROUTE_layered_rule',NULL,'2013-07-22 05:45:22','2013-07-22 06:43:54'),(335,NULL,NULL,'PS_ROUTE_supplier_rule',NULL,'2013-07-22 05:45:22','2013-07-22 06:43:54'),(336,NULL,NULL,'PS_ROUTE_manufacturer_rule',NULL,'2013-07-22 05:45:22','2013-07-22 06:43:54'),(337,NULL,NULL,'PS_ROUTE_cms_rule',NULL,'2013-07-22 05:45:22','2013-07-22 06:43:54'),(338,NULL,NULL,'PS_ROUTE_cms_category_rule',NULL,'2013-07-22 05:45:22','2013-07-22 06:43:54'),(339,NULL,NULL,'PS_ROUTE_module','module/{module}{/:controller}','2013-07-22 05:45:22','2013-07-22 05:45:22'),(340,NULL,NULL,'PS_MULTISHOP_FEATURE_ACTIVE','1','2013-07-29 00:42:37','2013-07-29 03:25:55'),(341,1,2,'CS_COLOR_TEMPLATE','Blue','2013-07-29 00:47:25','2013-07-29 00:48:26'),(342,1,3,'CS_COLOR_TEMPLATE','Green','2013-07-29 00:47:30','2013-07-29 00:52:15'),(343,1,4,'CS_COLOR_TEMPLATE','custom4','2013-07-29 00:47:37','2013-07-29 00:53:23'),(344,1,2,'SHOW_PANEL_FRONT_END','1','2013-07-29 00:48:26','2013-07-29 00:48:48'),(345,1,3,'SHOW_PANEL_FRONT_END','1','2013-07-29 00:52:15','2013-07-29 00:52:15'),(346,1,4,'SHOW_PANEL_FRONT_END','1','2013-07-29 00:53:23','2013-07-29 00:53:23'),(356,NULL,NULL,'PS_LAYERED_HIDE_0_VALUES','1','2013-07-29 03:04:41','2013-07-29 03:04:41'),(357,NULL,NULL,'PS_LAYERED_SHOW_QTIES','1','2013-07-29 03:04:41','2013-07-29 03:04:41'),(358,NULL,NULL,'PS_LAYERED_FULL_TREE','1','2013-07-29 03:04:41','2013-07-29 03:04:41'),(359,NULL,NULL,'PS_LAYERED_FILTER_PRICE_USETAX','1','2013-07-29 03:04:41','2013-07-29 03:04:41'),(360,NULL,NULL,'PS_LAYERED_FILTER_CATEGORY_DEPTH','1','2013-07-29 03:04:41','2013-07-29 03:04:41'),(361,NULL,NULL,'PS_LAYERED_FILTER_INDEX_QTY','0','2013-07-29 03:04:41','2013-07-29 03:04:41'),(362,NULL,NULL,'PS_LAYERED_FILTER_INDEX_CDT','0','2013-07-29 03:04:41','2013-07-29 03:04:41'),(363,NULL,NULL,'PS_LAYERED_FILTER_INDEX_MNF','0','2013-07-29 03:04:41','2013-07-29 03:04:41'),(364,NULL,NULL,'PS_LAYERED_FILTER_INDEX_CAT','0','2013-07-29 03:04:41','2013-07-29 03:04:41'),(365,NULL,NULL,'PS_LAYERED_INDEXED','1','2013-07-29 03:04:51','2013-07-29 03:04:51'),(366,1,3,'PS_SHOW_TYPE_MODULES_1','allModules','2013-07-29 03:29:34','2013-07-29 03:29:34'),(367,1,5,'CS_COLOR_TEMPLATE','default','2013-07-29 04:02:05','2013-07-29 04:02:05'),(368,1,5,'SHOW_PANEL_FRONT_END','1','2013-07-29 04:39:35','2013-07-29 04:39:35');
/*!40000 ALTER TABLE `ps_configuration` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_configuration_lang` WRITE;
/*!40000 ALTER TABLE `ps_configuration_lang` DISABLE KEYS */;
INSERT INTO `ps_configuration_lang` VALUES (40,1,'IN',NULL),(42,1,'DE',NULL),(49,1,'a|the|of|on|in|and|to',NULL),(71,1,'0',NULL),(77,1,'Dear Customer,\r\n\r\nRegards,\r\nCustomer service',NULL),(257,1,'The personal data you provide is used to answer queries, process orders or allow access to specific information. You have the right to modify and delete all the personal information found in the &quot;My Account&quot; page. ','2013-06-18 03:24:22');
/*!40000 ALTER TABLE `ps_configuration_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_connections` WRITE;
/*!40000 ALTER TABLE `ps_connections` DISABLE KEYS */;
INSERT INTO `ps_connections` VALUES (1,1,1,1,1,2130706433,'2013-06-18 03:24:53','http://www.prestashop.com'),(2,1,1,2,1,-1062731429,'2013-06-18 03:25:18',''),(3,1,1,2,4,-1062731429,'2013-06-18 04:35:06',''),(4,1,1,2,1,-1062731429,'2013-06-18 05:48:18',''),(5,1,1,2,1,-1062731429,'2013-06-18 21:43:02',''),(6,1,1,2,5,-1062731429,'2013-06-18 22:19:23',''),(7,1,1,3,1,-1062731422,'2013-06-19 03:35:42',''),(8,1,1,2,1,-1062731429,'2013-06-19 04:01:57',''),(9,1,1,2,1,-1062731429,'2013-06-19 04:32:08',''),(10,1,1,2,1,-1062731429,'2013-06-19 05:06:58',''),(11,1,1,2,1,-1062731429,'2013-06-19 06:21:45',''),(12,1,1,2,1,-1062731429,'2013-06-19 21:43:38',''),(13,1,1,2,1,-1062731429,'2013-06-19 22:38:58',''),(14,1,1,3,1,-1062731422,'2013-06-19 22:58:52',''),(15,1,1,4,1,-1062731422,'2013-06-19 23:02:51',''),(16,1,1,2,1,-1062731429,'2013-06-19 23:13:40',''),(17,1,1,3,1,-1062731422,'2013-06-20 03:11:22',''),(18,1,1,2,1,-1062731429,'2013-06-20 21:50:39',''),(19,1,1,3,1,-1062731422,'2013-06-20 22:01:52',''),(20,1,1,2,1,-1062731429,'2013-06-20 22:24:43',''),(21,1,1,2,1,-1062731429,'2013-06-20 22:56:39',''),(22,1,1,3,1,-1062731422,'2013-06-20 22:57:52',''),(23,1,1,5,1,-1062731429,'2013-06-20 23:05:48',''),(24,1,1,3,1,-1062731422,'2013-06-21 00:22:10',''),(25,1,1,3,1,-1062731422,'2013-06-21 01:05:55',''),(26,1,1,3,1,-1062731422,'2013-06-21 03:12:55',''),(27,1,1,6,1,-1062731410,'2013-06-21 03:18:39',''),(28,1,1,3,1,-1062731422,'2013-06-21 03:43:58',''),(29,1,1,7,2,-1062731429,'2013-06-21 04:08:07',''),(30,1,1,3,1,-1062731422,'2013-06-21 04:14:45',''),(31,1,1,3,1,-1062731422,'2013-06-21 04:49:50',''),(32,1,1,3,1,-1062731422,'2013-06-21 05:20:36',''),(33,1,1,3,1,-1062731422,'2013-06-21 05:59:38',''),(34,1,1,7,1,-1062731429,'2013-06-23 21:57:13',''),(35,1,1,3,1,-1062731422,'2013-06-23 22:28:46',''),(36,1,1,3,1,-1062731422,'2013-06-23 22:59:33',''),(37,1,1,3,1,-1062731422,'2013-06-23 23:30:29',''),(38,1,1,3,1,-1062731422,'2013-06-24 00:03:27',''),(39,1,1,3,1,-1062731422,'2013-06-24 00:36:30',''),(40,1,1,3,1,-1062731422,'2013-06-24 01:07:59',''),(41,1,1,3,1,-1062731422,'2013-06-24 03:02:13',''),(42,1,1,7,1,-1062731429,'2013-06-24 03:16:31',''),(43,1,1,3,1,-1062731422,'2013-06-24 03:34:10',''),(44,1,1,3,1,-1062731422,'2013-06-24 04:09:25',''),(45,1,1,3,1,-1062731422,'2013-06-24 04:41:39',''),(46,1,1,7,1,-1062731429,'2013-06-24 04:47:19',''),(47,1,1,3,1,-1062731422,'2013-06-24 05:12:40',''),(48,1,1,7,1,-1062731429,'2013-06-24 05:27:03',''),(49,1,1,3,1,-1062731422,'2013-06-24 05:44:26',''),(50,1,1,7,1,-1062731429,'2013-06-24 05:58:24',''),(51,1,1,7,1,-1062731429,'2013-06-24 21:53:21',''),(52,1,1,8,1,-1062731429,'2013-06-24 21:54:57',''),(53,1,1,3,1,-1062731422,'2013-06-24 21:58:32',''),(54,1,1,3,1,-1062731422,'2013-06-24 22:30:01',''),(55,1,1,9,1,-1062731429,'2013-06-24 22:49:14',''),(56,1,1,3,1,-1062731422,'2013-06-24 23:02:34',''),(57,1,1,9,1,-1062731429,'2013-06-24 23:20:33',''),(58,1,1,3,1,-1062731422,'2013-06-24 23:33:06',''),(59,1,1,5,1,-1062731429,'2013-06-24 23:58:51',''),(60,1,1,9,1,-1062731429,'2013-06-25 00:08:01',''),(61,1,1,10,1,-1062731506,'2013-06-25 00:28:05',''),(62,1,1,9,1,-1062731429,'2013-06-25 00:39:05',''),(63,1,1,9,1,-1062731429,'2013-06-25 03:00:01',''),(64,1,1,11,1,-1062731428,'2013-06-25 03:28:17',''),(65,1,1,12,1,-1062731410,'2013-06-25 03:35:40',''),(66,1,1,9,1,-1062731429,'2013-06-25 04:08:00',''),(67,1,1,9,1,-1062731429,'2013-06-25 04:47:16',''),(68,1,1,13,13,-1062731429,'2013-06-25 05:05:16',''),(69,1,1,14,6,-1062731429,'2013-06-25 05:33:19',''),(70,1,1,5,6,-1062731429,'2013-06-25 05:45:40',''),(71,1,1,14,6,-1062731429,'2013-06-25 06:05:09',''),(72,1,1,12,1,-1062731410,'2013-06-25 06:35:35',''),(73,1,1,14,1,-1062731429,'2013-06-25 21:28:45',''),(74,1,1,14,1,-1062731429,'2013-06-25 22:05:56',''),(75,1,1,14,1,-1062731429,'2013-06-25 22:36:31',''),(76,1,1,14,1,-1062731429,'2013-06-25 23:07:37',''),(77,1,1,14,1,-1062731429,'2013-06-25 23:39:19',''),(78,1,1,14,1,-1062731429,'2013-06-26 00:15:53',''),(79,1,1,14,1,-1062731429,'2013-06-26 00:55:26',''),(80,1,1,14,6,-1062731429,'2013-06-26 03:02:29',''),(81,1,1,15,6,-1062731429,'2013-06-26 03:24:04',''),(82,1,1,16,29,-1062731429,'2013-06-26 03:31:15',''),(83,1,1,16,6,-1062731429,'2013-06-26 04:08:14',''),(84,1,1,16,6,-1062731429,'2013-06-26 04:39:20',''),(85,1,1,17,1,-1062731429,'2013-06-26 04:45:35',''),(86,1,1,18,6,-1062731429,'2013-06-26 05:00:40',''),(87,1,1,3,6,-1062731422,'2013-06-26 05:15:28',''),(88,1,1,17,6,-1062731429,'2013-06-26 05:16:53',''),(89,1,1,17,16,-1062731429,'2013-06-26 05:47:50',''),(90,1,1,3,16,-1062731422,'2013-06-26 05:48:21',''),(91,1,1,3,16,-1062731422,'2013-06-26 06:19:05',''),(92,1,1,17,6,-1062731429,'2013-06-26 06:19:15',''),(93,1,1,19,1,-1062731410,'2013-06-26 06:29:40',''),(94,1,1,17,1,-1062731429,'2013-06-26 21:42:07',''),(95,1,1,2,6,-1062731429,'2013-06-26 21:42:53',''),(96,1,1,3,24,-1062731422,'2013-06-26 22:16:07',''),(97,1,1,2,16,-1062731429,'2013-06-26 22:16:27',''),(98,1,1,3,24,-1062731422,'2013-06-26 22:47:02',''),(99,1,1,3,24,-1062731422,'2013-06-26 23:18:54',''),(100,1,1,2,16,-1062731429,'2013-06-27 03:14:01',''),(101,1,1,2,16,-1062731429,'2013-06-27 04:24:09',''),(102,1,1,3,2,-1062731422,'2013-06-27 04:58:20',''),(103,1,1,2,16,-1062731429,'2013-06-27 05:06:46',''),(104,1,1,3,2,-1062731422,'2013-06-27 05:29:08',''),(105,1,1,2,2,-1062731429,'2013-06-27 05:46:00',''),(106,1,1,2,1,-1062731429,'2013-06-27 21:51:39',''),(107,1,1,2,34,-1062731429,'2013-06-27 22:25:12',''),(108,1,1,3,1,-1062731422,'2013-06-27 23:13:20',''),(109,1,1,2,39,-1062731429,'2013-06-27 23:42:10',''),(110,1,1,3,1,-1062731422,'2013-06-27 23:55:14',''),(111,1,1,2,1,-1062731429,'2013-06-28 02:46:53',''),(112,1,1,2,1,-1062731429,'2013-06-28 03:25:12',''),(113,1,1,22,1,-1062731410,'2013-06-28 03:44:02',''),(114,1,1,2,16,-1062731429,'2013-06-28 04:01:35',''),(115,1,1,2,1,-1062731429,'2013-06-28 04:43:47',''),(116,1,1,2,1,-1062731429,'2013-06-28 06:06:47',''),(117,1,1,2,1,-1062731429,'2013-06-30 21:42:38',''),(118,1,1,2,1,-1062731429,'2013-06-30 22:25:27',''),(119,1,1,23,1,-1062731412,'2013-06-30 23:42:48',''),(120,1,1,2,1,-1062731429,'2013-06-30 23:54:23',''),(121,1,1,2,1,-1062731429,'2013-07-01 00:32:47',''),(122,1,1,2,1,-1062731429,'2013-07-01 01:03:05',''),(123,1,1,2,1,-1062731429,'2013-07-01 02:37:20',''),(124,1,1,23,1,-1062731412,'2013-07-01 03:00:02',''),(125,1,1,24,1,-1062731429,'2013-07-01 03:18:44',''),(126,1,1,24,1,-1062731429,'2013-07-01 03:54:54',''),(127,1,1,25,1,-1062731429,'2013-07-01 04:59:45',''),(128,1,1,26,1,-1062731429,'2013-07-01 22:01:21',''),(129,1,1,26,1,-1062731429,'2013-07-01 22:38:09',''),(130,1,1,26,1,-1062731429,'2013-07-02 00:31:21',''),(131,1,1,27,1,-1062731429,'2013-07-02 05:47:13',''),(132,1,1,27,1,-1062731429,'2013-07-02 21:59:34',''),(133,1,1,27,1,-1062731429,'2013-07-02 22:31:41',''),(134,1,1,27,1,-1062731429,'2013-07-03 00:43:51',''),(135,1,1,28,1,-1062731410,'2013-07-04 00:11:27',''),(136,1,1,27,1,-1062731429,'2013-07-04 00:16:20',''),(137,1,1,3,2,-1062731422,'2013-07-05 05:17:52',''),(138,1,1,29,1,-1062731429,'2013-07-07 22:56:03',''),(139,1,1,29,1,-1062731429,'2013-07-07 23:27:24',''),(140,1,1,29,1,-1062731429,'2013-07-08 05:55:17',''),(141,1,1,3,1,-1062731422,'2013-07-08 05:56:20',''),(142,1,1,3,6,-1062731422,'2013-07-08 06:09:03',''),(143,1,1,31,12,-1062731429,'2013-07-08 06:14:49',''),(144,1,1,29,24,-1062731429,'2013-07-08 06:49:23',''),(145,1,1,3,24,-1062731422,'2013-07-08 21:49:35',''),(146,1,1,32,1,-1062731429,'2013-07-08 21:54:44',''),(147,1,1,32,1,-1062731429,'2013-07-08 22:58:27',''),(148,1,1,3,1,-1062731422,'2013-07-08 23:07:35',''),(149,1,1,3,1,-1062731422,'2013-07-08 23:39:47',''),(150,1,1,3,24,-1062731422,'2013-07-08 23:55:50',''),(151,1,1,32,1,-1062731429,'2013-07-09 02:57:06',''),(152,1,1,33,1,-1062731424,'2013-07-09 02:57:14',''),(153,1,1,32,1,-1062731429,'2013-07-09 21:50:45',''),(154,1,1,32,1,-1062731429,'2013-07-10 05:30:02',''),(155,1,1,32,32,-1062731429,'2013-07-10 06:11:15',''),(156,1,1,34,1,-1062731428,'2013-07-10 06:19:06',''),(157,1,1,3,1,-1062731422,'2013-07-10 21:42:30',''),(158,1,1,35,1,-1062731428,'2013-07-10 21:49:39',''),(159,1,1,32,1,-1062731429,'2013-07-10 21:55:28',''),(160,1,1,36,1,-1062731410,'2013-07-10 21:59:25',''),(161,1,1,3,1,-1062731422,'2013-07-10 22:30:10',''),(162,1,1,32,1,-1062731429,'2013-07-10 23:16:53',''),(163,1,1,36,1,-1062731410,'2013-07-10 23:26:15',''),(164,1,1,37,1,-1062731422,'2013-07-11 00:54:23',''),(165,1,1,36,1,-1062731410,'2013-07-11 02:37:09',''),(166,1,1,3,1,-1062731422,'2013-07-11 03:19:50',''),(167,1,1,32,1,-1062731429,'2013-07-11 03:24:11',''),(168,1,1,3,1,-1062731422,'2013-07-11 04:06:48',''),(169,1,1,3,1,-1062731422,'2013-07-11 04:12:45',''),(170,1,1,32,1,-1062731429,'2013-07-11 04:26:45',''),(171,1,1,38,1,-1062731416,'2013-07-11 05:35:34',''),(172,1,1,32,1,-1062731429,'2013-07-11 05:52:06',''),(173,1,1,3,1,-1062731422,'2013-07-11 06:04:08',''),(174,1,1,32,1,-1062731429,'2013-07-11 06:25:29',''),(175,1,1,3,1,-1062731422,'2013-07-11 06:35:53',''),(176,1,1,3,1,-1062731422,'2013-07-11 21:47:11',''),(177,1,1,3,13,-1062731422,'2013-07-11 22:01:51',''),(178,1,1,3,13,-1062731422,'2013-07-11 22:18:48',''),(179,1,1,3,13,-1062731422,'2013-07-11 22:36:51',''),(180,1,1,3,13,-1062731422,'2013-07-11 22:49:24',''),(181,1,1,3,13,-1062731422,'2013-07-11 23:20:42',''),(182,1,1,32,1,-1062731429,'2013-07-11 23:42:26',''),(183,1,1,3,13,-1062731422,'2013-07-11 23:55:08',''),(184,1,1,32,1,-1062731429,'2013-07-12 00:54:37',''),(185,1,1,3,26,-1062731422,'2013-07-12 02:52:08',''),(186,1,1,3,26,-1062731422,'2013-07-12 03:08:31',''),(187,1,1,3,26,-1062731422,'2013-07-12 03:23:14',''),(188,1,1,3,48,-1062731422,'2013-07-12 04:02:12',''),(189,1,1,3,11,-1062731422,'2013-07-12 04:09:48',''),(190,1,1,32,1,-1062731429,'2013-07-12 04:37:42',''),(191,1,1,40,6,-1062731429,'2013-07-12 04:39:03',''),(192,1,1,3,6,-1062731422,'2013-07-12 04:44:00',''),(193,1,1,40,2,-1062731429,'2013-07-12 05:22:14',''),(194,1,1,3,12,-1062731422,'2013-07-12 05:42:00',''),(195,1,1,41,1,-1062731410,'2013-07-12 05:56:26',''),(196,1,1,32,1,-1062731429,'2013-07-14 21:47:37',''),(197,1,1,3,16,-1062731422,'2013-07-14 22:16:23',''),(198,1,1,32,1,-1062731429,'2013-07-14 23:48:07',''),(199,1,1,32,36,-1062731429,'2013-07-15 03:20:24',''),(200,1,1,5,25,-1062731429,'2013-07-15 03:21:37',''),(201,1,1,42,34,-1062731419,'2013-07-15 03:29:04',''),(202,1,1,3,36,-1062731422,'2013-07-15 03:29:40',''),(203,1,1,44,34,-1062731419,'2013-07-15 03:29:52',''),(204,1,1,45,36,-1062731425,'2013-07-15 03:33:14',''),(205,1,1,37,36,-1062731422,'2013-07-15 03:33:33',''),(206,1,1,46,34,-1062731429,'2013-07-15 03:33:57',''),(207,1,1,2,34,-1062731429,'2013-07-15 03:35:30',''),(208,1,1,3,6,-1062731422,'2013-07-15 05:45:38',''),(209,1,1,2,1,-1062731429,'2013-07-15 22:04:21',''),(210,1,1,2,1,-1062731429,'2013-07-15 22:56:25',''),(211,1,1,3,6,-1062731422,'2013-07-15 23:25:01',''),(212,1,1,3,6,-1062731422,'2013-07-16 00:48:27',''),(213,1,1,37,6,-1062731422,'2013-07-16 00:48:34',''),(214,1,1,3,6,-1062731422,'2013-07-16 02:51:06',''),(215,1,1,3,6,-1062731422,'2013-07-16 03:24:16',''),(216,1,1,48,1,-1062731413,'2013-07-16 03:51:03',''),(217,1,1,3,6,-1062731422,'2013-07-16 03:59:50',''),(218,1,1,3,60,-1062731422,'2013-07-16 04:05:16',''),(219,1,1,3,6,-1062731422,'2013-07-16 04:30:34',''),(220,1,1,2,1,-1062731429,'2013-07-16 05:43:23',''),(221,1,1,2,1,-1062731429,'2013-07-16 21:39:35',''),(222,1,1,49,1,-1062731514,'2013-07-16 22:34:07',''),(223,1,1,50,1,-1062731514,'2013-07-16 22:53:34',''),(224,1,1,2,1,-1062731429,'2013-07-16 22:53:57',''),(225,1,1,2,1,-1062731429,'2013-07-16 23:24:13',''),(226,1,1,3,6,-1062731422,'2013-07-16 23:25:02',''),(227,1,1,5,1,-1062731429,'2013-07-16 23:35:22',''),(228,1,1,51,1,-1062731514,'2013-07-16 23:43:55',''),(229,1,1,2,1,-1062731429,'2013-07-16 23:56:21',''),(230,1,1,52,1,-1062731514,'2013-07-17 00:15:56',''),(231,1,1,2,1,-1062731429,'2013-07-17 00:32:38',''),(232,1,1,49,26,-1062731514,'2013-07-17 03:01:23',''),(233,1,1,2,25,-1062731429,'2013-07-17 03:03:52',''),(234,1,1,3,28,-1062731422,'2013-07-17 03:05:37',''),(235,1,1,52,24,-1062731514,'2013-07-17 03:08:57',''),(236,1,1,2,25,-1062731429,'2013-07-17 03:34:01',''),(237,1,1,52,24,-1062731514,'2013-07-17 03:39:23',''),(238,1,1,3,23,-1062731422,'2013-07-17 03:41:02',''),(239,1,1,51,1,-1062731514,'2013-07-17 03:53:31',''),(240,1,1,2,1,-1062731429,'2013-07-17 04:42:41',''),(241,1,1,2,1,-1062731429,'2013-07-17 05:51:01',''),(242,1,1,2,1,-1062731429,'2013-07-17 21:45:48',''),(243,1,1,3,6,-1062731422,'2013-07-17 22:16:34',''),(244,1,1,3,6,-1062731422,'2013-07-17 22:53:00',''),(245,1,1,51,1,-1062731346,'2013-07-18 01:35:21',''),(246,1,1,3,6,-1062731422,'2013-07-18 03:35:10',''),(247,1,1,3,24,-1062731422,'2013-07-18 03:55:43',''),(248,1,1,3,1,-1062731422,'2013-07-18 04:22:21',''),(249,1,1,54,1,-1062731429,'2013-07-18 04:35:51',''),(250,1,1,2,1,-1062731429,'2013-07-18 05:09:40',''),(251,1,1,2,1,-1062731429,'2013-07-18 05:44:37',''),(252,1,1,2,1,-1062731429,'2013-07-18 06:20:08',''),(253,1,1,2,1,-1062731429,'2013-07-18 21:52:38',''),(254,1,1,3,24,-1062731422,'2013-07-18 23:01:38',''),(255,1,1,3,1,-1062731422,'2013-07-18 23:50:09',''),(256,1,1,55,1,-1062731410,'2013-07-19 00:03:38',''),(257,1,1,37,1,-1062731422,'2013-07-19 02:49:24',''),(258,1,1,3,1,-1062731422,'2013-07-19 03:30:24',''),(259,1,1,2,1,-1062731429,'2013-07-19 04:25:02',''),(260,1,1,3,6,-1062731422,'2013-07-19 05:48:18',''),(261,1,1,2,1,-1062731429,'2013-07-19 05:50:00',''),(262,1,1,49,11,-1062731361,'2013-07-19 06:14:14',''),(263,1,1,3,1,-1062731422,'2013-07-21 21:54:09',''),(264,1,1,2,1,-1062731429,'2013-07-21 21:57:13',''),(265,1,1,49,11,-1062731286,'2013-07-21 22:05:46',''),(266,1,1,56,1,-1062731422,'2013-07-21 22:06:24',''),(267,1,1,37,1,-1062731422,'2013-07-21 22:29:42',''),(268,1,1,2,1,-1062731429,'2013-07-21 22:31:05',''),(269,1,1,58,1,-1062731286,'2013-07-21 22:31:45',''),(270,1,1,59,1,-1062731466,'2013-07-21 22:35:00',''),(271,1,1,60,1,-1062731466,'2013-07-21 22:38:13',''),(272,1,1,61,1,-1062731466,'2013-07-21 22:57:58',''),(273,1,1,62,1,-1062731466,'2013-07-21 23:00:45',''),(274,1,1,2,1,-1062731429,'2013-07-21 23:02:13',''),(275,1,1,63,1,-1062731350,'2013-07-22 00:03:12',''),(276,1,1,2,1,-1062731429,'2013-07-22 00:04:51',''),(277,1,1,64,1,-1062731474,'2013-07-22 00:07:34',''),(278,1,1,65,1,-1062731474,'2013-07-22 00:12:01',''),(279,1,1,66,1,-1062731474,'2013-07-22 00:13:33',''),(280,1,1,62,9,-1062731466,'2013-07-22 00:32:04',''),(281,1,1,66,1,-1062731474,'2013-07-22 00:45:37',''),(282,1,1,66,1,-1062731474,'2013-07-22 02:47:57',''),(283,1,1,67,1,-1062731422,'2013-07-22 02:57:45',''),(284,1,1,37,1,-1062731422,'2013-07-22 03:16:35',''),(285,1,1,68,1,-1062731429,'2013-07-22 03:17:54',''),(286,1,1,66,1,-1062731474,'2013-07-22 03:37:59',''),(287,1,1,66,1,-1062731474,'2013-07-22 04:16:23',''),(288,1,1,68,1,-1062731429,'2013-07-22 05:35:55',''),(289,1,1,69,1,-1062731429,'2013-07-22 05:42:06',''),(290,1,1,58,1,-1062731286,'2013-07-22 06:13:14',''),(291,1,1,66,1,-1062731474,'2013-07-22 06:22:31',''),(292,1,1,69,9,-1062731429,'2013-07-22 06:44:02',''),(293,1,1,69,1,-1062731429,'2013-07-22 22:25:51',''),(294,1,1,49,1,-1062731463,'2013-07-22 22:31:42',''),(295,1,1,70,1,-1062731466,'2013-07-22 22:36:47',''),(296,1,1,71,1,-1062731463,'2013-07-22 23:27:34',''),(297,1,1,69,1,-1062731429,'2013-07-23 03:12:33',''),(298,1,1,72,1,-1062731466,'2013-07-23 03:30:13',''),(299,1,1,69,1,-1062731429,'2013-07-23 03:44:06',''),(300,1,1,58,29,-1062731286,'2013-07-23 04:04:25',''),(301,1,1,69,16,-1062731429,'2013-07-23 04:15:04',''),(302,1,1,69,16,-1062731429,'2013-07-23 04:48:00',''),(303,1,1,73,1,-1062731466,'2013-07-23 06:09:55',''),(304,1,1,2,16,-1062731429,'2013-07-23 06:10:49',''),(305,1,1,71,63,-1062731286,'2013-07-23 21:59:10',''),(306,1,1,56,1,-1062731422,'2013-07-23 21:59:58',''),(307,1,1,2,1,-1062731429,'2013-07-23 22:01:06',''),(308,1,1,56,25,-1062731422,'2013-07-23 22:51:26',''),(309,1,1,75,1,-1062731429,'2013-07-23 23:17:41',''),(310,1,1,75,16,-1062731429,'2013-07-24 05:26:05',''),(311,1,1,76,1,-1062731410,'2013-07-24 05:26:57',''),(312,1,1,37,1,-1062731422,'2013-07-24 05:35:08',''),(313,1,1,56,28,-1062731422,'2013-07-24 05:45:06',''),(314,1,1,77,1,-1062731463,'2013-07-24 06:00:15',''),(315,1,1,78,23,-1062731410,'2013-07-24 07:06:46',''),(316,1,1,79,11,-1062731410,'2013-07-24 07:10:04',''),(317,1,1,80,1,-1062731410,'2013-07-24 07:14:52',''),(318,1,1,75,16,-1062731429,'2013-07-24 21:21:19',''),(319,1,1,56,23,-1062731422,'2013-07-24 21:56:06',''),(320,1,1,78,1,-1062731410,'2013-07-24 21:59:28',''),(321,1,1,5,23,-1062731429,'2013-07-24 22:09:09',''),(322,1,1,75,1,-1062731429,'2013-07-24 22:23:25',''),(323,1,1,56,6,-1062731422,'2013-07-24 23:14:31',''),(324,1,1,56,1,-1062731422,'2013-07-25 00:46:38',''),(325,1,1,81,1,-1062731410,'2013-07-25 02:35:58',''),(326,1,1,82,13,-1062731410,'2013-07-25 04:07:52',''),(327,1,1,82,1,-1062731410,'2013-07-25 04:48:47',''),(328,1,1,75,1,-1062731429,'2013-07-25 05:46:28',''),(329,1,1,79,48,-1062731410,'2013-07-25 06:18:52',''),(330,1,1,75,1,-1062731429,'2013-07-25 06:39:35',''),(331,1,1,48,1,-1062731413,'2013-07-28 23:30:16',''),(332,1,1,75,1,-1062731429,'2013-07-29 00:27:15',''),(333,1,1,83,1,-1062731410,'2013-07-29 00:36:51',''),(334,1,2,84,1,-1062731429,'2013-07-29 00:47:26',''),(335,1,3,85,1,-1062731429,'2013-07-29 00:47:31',''),(336,1,4,86,1,-1062731429,'2013-07-29 00:47:38',''),(337,1,2,87,1,-1062731429,'2013-07-29 00:51:24',''),(338,1,1,88,1,-1062731429,'2013-07-29 00:51:26',''),(339,1,3,89,1,-1062731429,'2013-07-29 00:51:28',''),(340,1,4,90,1,-1062731429,'2013-07-29 00:52:21',''),(341,1,2,87,28,-1062731429,'2013-07-29 03:36:30',''),(342,1,1,88,1,-1062731429,'2013-07-29 03:36:42',''),(343,1,5,91,1,-1062731429,'2013-07-29 04:02:06',''),(344,1,5,92,1,-1062731410,'2013-07-29 04:07:57',''),(345,1,4,93,1,-1062731410,'2013-07-29 04:08:56',''),(346,1,3,94,1,-1062731410,'2013-07-29 04:08:58',''),(347,1,2,95,1,-1062731410,'2013-07-29 04:09:00',''),(348,1,1,96,1,-1062731410,'2013-07-29 04:09:02',''),(349,1,1,88,1,-1062731429,'2013-07-29 04:16:08',''),(350,1,5,91,1,-1062731429,'2013-07-29 04:51:40',''),(351,1,1,96,1,-1062731410,'2013-07-29 04:54:19',''),(352,1,1,88,16,-1062731429,'2013-07-29 05:14:12',''),(353,1,2,87,1,-1062731429,'2013-07-29 05:15:36',''),(354,1,3,89,1,-1062731429,'2013-07-29 05:31:48','');
/*!40000 ALTER TABLE `ps_connections` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_connections_page` WRITE;
/*!40000 ALTER TABLE `ps_connections_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_connections_page` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_connections_source` WRITE;
/*!40000 ALTER TABLE `ps_connections_source` DISABLE KEYS */;
INSERT INTO `ps_connections_source` VALUES (1,27,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-06-21 03:18:39'),(2,27,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-06-21 03:29:21'),(3,93,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-06-26 22:52:19'),(4,119,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-06-30 23:42:49'),(5,119,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-06-30 23:55:07'),(6,124,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-02 04:05:14'),(7,124,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-02 04:07:34'),(8,124,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-03 03:26:22'),(9,124,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-03 23:01:00'),(10,124,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-03 23:03:10'),(11,124,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-04 04:59:32'),(12,156,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-10 06:19:06'),(13,158,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-10 21:49:39'),(14,216,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-16 03:51:03'),(15,222,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-16 22:34:07'),(16,222,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-16 22:38:01'),(17,222,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-16 22:43:16'),(18,223,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-16 22:53:34'),(19,223,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-16 22:59:15'),(20,228,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-16 23:43:55'),(21,230,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-17 00:15:56'),(22,223,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-17 05:47:16'),(23,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-21 22:31:45'),(24,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-21 22:34:10'),(25,270,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-21 22:35:00'),(26,271,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-21 22:38:13'),(27,271,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-21 22:41:13'),(28,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-21 22:45:12'),(29,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-21 22:45:12'),(30,216,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-21 23:18:14'),(31,277,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 00:07:34'),(32,278,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 00:12:01'),(33,279,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 00:13:33'),(34,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 00:42:09'),(35,216,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 01:51:27'),(36,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 02:56:47'),(37,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 03:00:43'),(38,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 03:17:17'),(39,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 03:17:24'),(40,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 03:19:03'),(41,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/en/','','2013-07-22 06:08:59'),(42,269,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/en/','','2013-07-22 06:13:12'),(43,278,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 06:45:28'),(44,296,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 23:27:34'),(45,296,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-22 23:29:01'),(46,216,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-23 00:14:57'),(47,290,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-23 02:38:33'),(48,296,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-23 03:10:39'),(49,298,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-23 03:30:13'),(50,298,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-23 03:31:33'),(51,216,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-23 22:12:06'),(52,309,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-23 23:17:41'),(53,314,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-24 06:00:16'),(54,300,'http://192.168.1.91/03_gomarket/trunk/site/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-24 06:07:54'),(55,296,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/index.php','','2013-07-26 00:54:07'),(56,204,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 02:36:42'),(57,204,'http://192.168.1.91/03_GoMarket/trunk/','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 02:43:30'),(58,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 02:58:03'),(59,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 02:58:33'),(60,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 02:59:15'),(61,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:03:18'),(62,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:05:02'),(63,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:05:51'),(64,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:05:56'),(65,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:06:29'),(66,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:06:41'),(67,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:07:40'),(68,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:08:42'),(69,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:11:13'),(70,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:11:45'),(71,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:12:37'),(72,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:13:15'),(73,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:13:45'),(74,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:13:49'),(75,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:14:18'),(76,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:14:42'),(77,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:14:55'),(78,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&id_shop_group=1','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:15:56'),(79,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&id_shop=1&updateshop&token=ba54b993d806c56fd6d2cf18e90e5d71','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:16:01'),(80,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&id_shop=1&updateshop&token=ba54b993d806c56fd6d2cf18e90e5d71','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:16:07'),(81,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&id_shop_group=1','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:16:14'),(82,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&id_shop=2&updateshop&token=ba54b993d806c56fd6d2cf18e90e5d71','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:16:25'),(83,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9&id_shop=2','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:16:35'),(84,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9&id_shop=1','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:16:40'),(85,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&id_shop_url=1&updateshop_url&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:16:42'),(86,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:21:32'),(87,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:21:57'),(88,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:22:02'),(89,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:22:33'),(90,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:22:41'),(91,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:23:20'),(92,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:24:00'),(93,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopGroup&token=c07eec3a7e57fc236553a592c6227113','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:24:23'),(94,338,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9&id_shop=1','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:24:28'),(95,337,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/blue/index.php','','2013-07-29 03:32:35'),(96,340,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/box/index.php','','2013-07-29 03:32:41'),(97,337,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/blue/index.php','','2013-07-29 03:33:35'),(98,340,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/box/index.php','','2013-07-29 03:33:38'),(99,339,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/green/index.php','','2013-07-29 03:33:38'),(100,337,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/blue/index.php','','2013-07-29 03:34:31'),(101,339,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/green/index.php','','2013-07-29 03:34:38'),(102,340,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/box/index.php','','2013-07-29 03:34:39'),(103,340,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/box/index.php','','2013-07-29 03:34:41'),(104,337,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/blue/index.php','','2013-07-29 03:35:09'),(105,342,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:40:26'),(106,342,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&token=170ec41a53361345c069e2508b2202e4&configure=blocklayered&tab_module=front_office_features&module_name=blocklayered','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:40:54'),(107,342,'http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_category=7&controller=category&id_lang=1','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:42:00'),(108,342,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&id_shop_url=1&updateshop_url&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:46:13'),(109,342,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&id_shop_group=1','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:46:19'),(110,342,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&id_shop=1&updateshop&token=ba54b993d806c56fd6d2cf18e90e5d71','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:46:27'),(111,342,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&id_shop_url=1&updateshop_url&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9','192.168.1.91/03_GoMarket/trunk/site/default/index.php','','2013-07-29 03:46:49'),(112,342,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&id_shop_group=1','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 03:47:10'),(113,342,'http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&addshop&id_shop_group=1','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 03:47:12'),(114,342,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 04:01:33'),(115,341,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/blue/index.php','','2013-07-29 04:01:34'),(116,339,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/green/index.php','','2013-07-29 04:01:38'),(117,340,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/box/index.php','','2013-07-29 04:01:42'),(118,345,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/box/index.php','','2013-07-29 04:08:56'),(119,346,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/green/index.php','','2013-07-29 04:08:58'),(120,347,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/blue/index.php','','2013-07-29 04:09:00'),(121,348,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 04:09:02'),(122,343,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 04:14:51'),(123,341,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/blue/index.php','','2013-07-29 04:14:55'),(124,339,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/green/index.php','','2013-07-29 04:14:58'),(125,340,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/box/index.php','','2013-07-29 04:14:58'),(126,343,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 04:17:42'),(127,343,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 04:21:10'),(128,339,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/green/index.php','','2013-07-29 04:21:15'),(129,341,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/blue/index.php','','2013-07-29 04:21:16'),(130,340,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/box/index.php','','2013-07-29 04:21:20'),(131,343,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 04:29:00'),(132,343,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 04:30:51'),(133,343,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/orange/index.php','','2013-07-29 04:39:45'),(134,339,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/green/index.php','','2013-07-29 04:39:45'),(135,341,'http://192.168.1.91/03_GoMarket/trunk/site/demo.html','192.168.1.91/03_GoMarket/trunk/site/blue/index.php','','2013-07-29 04:39:48');
/*!40000 ALTER TABLE `ps_connections_source` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_contact` WRITE;
/*!40000 ALTER TABLE `ps_contact` DISABLE KEYS */;
INSERT INTO `ps_contact` VALUES (1,'prestashop@codespot.vn',1,0),(2,'prestashop@codespot.vn',1,0);
/*!40000 ALTER TABLE `ps_contact` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_contact_lang` WRITE;
/*!40000 ALTER TABLE `ps_contact_lang` DISABLE KEYS */;
INSERT INTO `ps_contact_lang` VALUES (1,1,'Webmaster','If a technical problem occurs on this website'),(1,2,'Webmaster','If a technical problem occurs on this website'),(2,1,'Customer service','For any question about a product, an order'),(2,2,'Customer service','For any question about a product, an order');
/*!40000 ALTER TABLE `ps_contact_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_contact_shop` WRITE;
/*!40000 ALTER TABLE `ps_contact_shop` DISABLE KEYS */;
INSERT INTO `ps_contact_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5);
/*!40000 ALTER TABLE `ps_contact_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_country` WRITE;
/*!40000 ALTER TABLE `ps_country` DISABLE KEYS */;
INSERT INTO `ps_country` VALUES (1,1,0,'DE',49,0,0,0,1,'NNNNN',1),(2,1,0,'AT',43,0,0,0,1,'NNNN',1),(3,1,0,'BE',32,0,0,0,1,'NNNN',1),(4,2,0,'CA',1,0,1,0,1,'LNL NLN',0),(5,3,0,'CN',86,0,0,0,1,'NNNNNN',1),(6,1,0,'ES',34,0,0,1,1,'NNNNN',1),(7,1,0,'FI',358,0,0,0,1,'NNNNN',1),(8,1,0,'FR',33,0,0,0,1,'NNNNN',1),(9,1,0,'GR',30,0,0,0,1,'NNNNN',1),(10,1,0,'IT',39,0,1,0,1,'NNNNN',1),(11,3,0,'JP',81,0,1,0,1,'NNN-NNNN',1),(12,1,0,'LU',352,0,0,0,1,'NNNN',1),(13,1,0,'NL',31,0,0,0,1,'NNNN LL',1),(14,1,0,'PL',48,0,0,0,1,'NN-NNN',1),(15,1,0,'PT',351,0,0,0,1,'NNNN NNN',1),(16,1,0,'CZ',420,0,0,0,1,'NNN NN',1),(17,1,0,'GB',44,0,0,0,1,'',1),(18,1,0,'SE',46,0,0,0,1,'NNN NN',1),(19,7,0,'CH',41,0,0,0,1,'NNNN',1),(20,1,0,'DK',45,0,0,0,1,'NNNN',1),(21,2,0,'US',1,1,1,0,1,'NNNNN',0),(22,3,0,'HK',852,0,0,0,0,'',1),(23,7,0,'NO',47,0,0,0,1,'NNNN',1),(24,5,0,'AU',61,0,0,0,1,'NNNN',1),(25,3,0,'SG',65,0,0,0,1,'NNNNNN',1),(26,1,0,'IE',353,0,0,0,1,'',1),(27,5,0,'NZ',64,0,0,0,1,'NNNN',1),(28,3,0,'KR',82,0,0,0,1,'NNN-NNN',1),(29,3,0,'IL',972,0,0,0,1,'NNNNN',1),(30,4,0,'ZA',27,0,0,0,1,'NNNN',1),(31,4,0,'NG',234,0,0,0,1,'',1),(32,4,0,'CI',225,0,0,0,1,'',1),(33,4,0,'TG',228,0,0,0,1,'',1),(34,6,0,'BO',591,0,0,0,1,'',1),(35,4,0,'MU',230,0,0,0,1,'',1),(36,1,0,'RO',40,0,0,0,1,'NNNNNN',1),(37,1,0,'SK',421,0,0,0,1,'NNN NN',1),(38,4,0,'DZ',213,0,0,0,1,'NNNNN',1),(39,2,0,'AS',0,0,0,0,1,'',1),(40,7,0,'AD',376,0,0,0,1,'CNNN',1),(41,4,0,'AO',244,0,0,0,0,'',1),(42,8,0,'AI',0,0,0,0,1,'',1),(43,2,0,'AG',0,0,0,0,1,'',1),(44,6,0,'AR',54,0,1,0,1,'LNNNN',1),(45,3,0,'AM',374,0,0,0,1,'NNNN',1),(46,8,0,'AW',297,0,0,0,1,'',1),(47,3,0,'AZ',994,0,0,0,1,'CNNNN',1),(48,2,0,'BS',0,0,0,0,1,'',1),(49,3,0,'BH',973,0,0,0,1,'',1),(50,3,0,'BD',880,0,0,0,1,'NNNN',1),(51,2,0,'BB',0,0,0,0,1,'CNNNNN',1),(52,7,0,'BY',0,0,0,0,1,'NNNNNN',1),(53,8,0,'BZ',501,0,0,0,0,'',1),(54,4,0,'BJ',229,0,0,0,0,'',1),(55,2,0,'BM',0,0,0,0,1,'',1),(56,3,0,'BT',975,0,0,0,1,'',1),(57,4,0,'BW',267,0,0,0,1,'',1),(58,6,0,'BR',55,0,0,0,1,'NNNNN-NNN',1),(59,3,0,'BN',673,0,0,0,1,'LLNNNN',1),(60,4,0,'BF',226,0,0,0,1,'',1),(61,3,0,'MM',95,0,0,0,1,'',1),(62,4,0,'BI',257,0,0,0,1,'',1),(63,3,0,'KH',855,0,0,0,1,'NNNNN',1),(64,4,0,'CM',237,0,0,0,1,'',1),(65,4,0,'CV',238,0,0,0,1,'NNNN',1),(66,4,0,'CF',236,0,0,0,1,'',1),(67,4,0,'TD',235,0,0,0,1,'',1),(68,6,0,'CL',56,0,0,0,1,'NNN-NNNN',1),(69,6,0,'CO',57,0,0,0,1,'NNNNNN',1),(70,4,0,'KM',269,0,0,0,1,'',1),(71,4,0,'CD',242,0,0,0,1,'',1),(72,4,0,'CG',243,0,0,0,1,'',1),(73,8,0,'CR',506,0,0,0,1,'NNNNN',1),(74,7,0,'HR',385,0,0,0,1,'NNNNN',1),(75,8,0,'CU',53,0,0,0,1,'',1),(76,1,0,'CY',357,0,0,0,1,'NNNN',1),(77,4,0,'DJ',253,0,0,0,1,'',1),(78,8,0,'DM',0,0,0,0,1,'',1),(79,8,0,'DO',0,0,0,0,1,'',1),(80,3,0,'TL',670,0,0,0,1,'',1),(81,6,0,'EC',593,0,0,0,1,'CNNNNNN',1),(82,4,0,'EG',20,0,0,0,0,'',1),(83,8,0,'SV',503,0,0,0,1,'',1),(84,4,0,'GQ',240,0,0,0,1,'',1),(85,4,0,'ER',291,0,0,0,1,'',1),(86,1,0,'EE',372,0,0,0,1,'NNNNN',1),(87,4,0,'ET',251,0,0,0,1,'',1),(88,8,0,'FK',0,0,0,0,1,'LLLL NLL',1),(89,7,0,'FO',298,0,0,0,1,'',1),(90,5,0,'FJ',679,0,0,0,1,'',1),(91,4,0,'GA',241,0,0,0,1,'',1),(92,4,0,'GM',220,0,0,0,1,'',1),(93,3,0,'GE',995,0,0,0,1,'NNNN',1),(94,4,0,'GH',233,0,0,0,1,'',1),(95,8,0,'GD',0,0,0,0,1,'',1),(96,7,0,'GL',299,0,0,0,1,'',1),(97,7,0,'GI',350,0,0,0,1,'',1),(98,8,0,'GP',590,0,0,0,1,'',1),(99,5,0,'GU',0,0,0,0,1,'',1),(100,8,0,'GT',502,0,0,0,1,'',1),(101,7,0,'GG',0,0,0,0,1,'LLN NLL',1),(102,4,0,'GN',224,0,0,0,1,'',1),(103,4,0,'GW',245,0,0,0,1,'',1),(104,6,0,'GY',592,0,0,0,1,'',1),(105,8,0,'HT',509,0,0,0,1,'',1),(106,5,0,'HM',0,0,0,0,1,'',1),(107,7,0,'VA',379,0,0,0,1,'NNNNN',1),(108,8,0,'HN',504,0,0,0,1,'',1),(109,7,0,'IS',354,0,0,0,1,'NNN',1),(110,3,0,'IN',91,0,0,0,1,'NNN NNN',1),(111,3,0,'ID',62,0,1,0,1,'NNNNN',1),(112,3,0,'IR',98,0,0,0,1,'NNNNN-NNNNN',1),(113,3,0,'IQ',964,0,0,0,1,'NNNNN',1),(114,7,0,'IM',0,0,0,0,1,'CN NLL',1),(115,8,0,'JM',0,0,0,0,1,'',1),(116,7,0,'JE',0,0,0,0,1,'CN NLL',1),(117,3,0,'JO',962,0,0,0,1,'',1),(118,3,0,'KZ',7,0,0,0,1,'NNNNNN',1),(119,4,0,'KE',254,0,0,0,1,'',1),(120,5,0,'KI',686,0,0,0,1,'',1),(121,3,0,'KP',850,0,0,0,1,'',1),(122,3,0,'KW',965,0,0,0,1,'',1),(123,3,0,'KG',996,0,0,0,1,'',1),(124,3,0,'LA',856,0,0,0,1,'',1),(125,1,0,'LV',371,0,0,0,1,'C-NNNN',1),(126,3,0,'LB',961,0,0,0,1,'',1),(127,4,0,'LS',266,0,0,0,1,'',1),(128,4,0,'LR',231,0,0,0,1,'',1),(129,4,0,'LY',218,0,0,0,1,'',1),(130,1,0,'LI',423,0,0,0,1,'NNNN',1),(131,1,0,'LT',370,0,0,0,1,'NNNNN',1),(132,3,0,'MO',853,0,0,0,0,'',1),(133,7,0,'MK',389,0,0,0,1,'',1),(134,4,0,'MG',261,0,0,0,1,'',1),(135,4,0,'MW',265,0,0,0,1,'',1),(136,3,0,'MY',60,0,0,0,1,'NNNNN',1),(137,3,0,'MV',960,0,0,0,1,'',1),(138,4,0,'ML',223,0,0,0,1,'',1),(139,1,0,'MT',356,0,0,0,1,'LLL NNNN',1),(140,5,0,'MH',692,0,0,0,1,'',1),(141,8,0,'MQ',596,0,0,0,1,'',1),(142,4,0,'MR',222,0,0,0,1,'',1),(143,1,0,'HU',36,0,0,0,1,'NNNN',1),(144,4,0,'YT',262,0,0,0,1,'',1),(145,2,0,'MX',52,0,1,1,1,'NNNNN',1),(146,5,0,'FM',691,0,0,0,1,'',1),(147,7,0,'MD',373,0,0,0,1,'C-NNNN',1),(148,7,0,'MC',377,0,0,0,1,'980NN',1),(149,3,0,'MN',976,0,0,0,1,'',1),(150,7,0,'ME',382,0,0,0,1,'NNNNN',1),(151,8,0,'MS',0,0,0,0,1,'',1),(152,4,0,'MA',212,0,0,0,1,'NNNNN',1),(153,4,0,'MZ',258,0,0,0,1,'',1),(154,4,0,'NA',264,0,0,0,1,'',1),(155,5,0,'NR',674,0,0,0,1,'',1),(156,3,0,'NP',977,0,0,0,1,'',1),(157,8,0,'AN',599,0,0,0,1,'',1),(158,5,0,'NC',687,0,0,0,1,'',1),(159,8,0,'NI',505,0,0,0,1,'NNNNNN',1),(160,4,0,'NE',227,0,0,0,1,'',1),(161,5,0,'NU',683,0,0,0,1,'',1),(162,5,0,'NF',0,0,0,0,1,'',1),(163,5,0,'MP',0,0,0,0,1,'',1),(164,3,0,'OM',968,0,0,0,1,'',1),(165,3,0,'PK',92,0,0,0,1,'',1),(166,5,0,'PW',680,0,0,0,1,'',1),(167,3,0,'PS',0,0,0,0,1,'',1),(168,8,0,'PA',507,0,0,0,1,'NNNNNN',1),(169,5,0,'PG',675,0,0,0,1,'',1),(170,6,0,'PY',595,0,0,0,1,'',1),(171,6,0,'PE',51,0,0,0,1,'',1),(172,3,0,'PH',63,0,0,0,1,'NNNN',1),(173,5,0,'PN',0,0,0,0,1,'LLLL NLL',1),(174,8,0,'PR',0,0,0,0,1,'NNNNN',1),(175,3,0,'QA',974,0,0,0,1,'',1),(176,4,0,'RE',262,0,0,0,1,'',1),(177,7,0,'RU',7,0,0,0,1,'NNNNNN',1),(178,4,0,'RW',250,0,0,0,1,'',1),(179,8,0,'BL',0,0,0,0,1,'',1),(180,8,0,'KN',0,0,0,0,1,'',1),(181,8,0,'LC',0,0,0,0,1,'',1),(182,8,0,'MF',0,0,0,0,1,'',1),(183,8,0,'PM',508,0,0,0,1,'',1),(184,8,0,'VC',0,0,0,0,1,'',1),(185,5,0,'WS',685,0,0,0,1,'',1),(186,7,0,'SM',378,0,0,0,1,'NNNNN',1),(187,4,0,'ST',239,0,0,0,1,'',1),(188,3,0,'SA',966,0,0,0,1,'',1),(189,4,0,'SN',221,0,0,0,1,'',1),(190,7,0,'RS',381,0,0,0,1,'NNNNN',1),(191,4,0,'SC',248,0,0,0,1,'',1),(192,4,0,'SL',232,0,0,0,1,'',1),(193,1,0,'SI',386,0,0,0,1,'C-NNNN',1),(194,5,0,'SB',677,0,0,0,1,'',1),(195,4,0,'SO',252,0,0,0,1,'',1),(196,8,0,'GS',0,0,0,0,1,'LLLL NLL',1),(197,3,0,'LK',94,0,0,0,1,'NNNNN',1),(198,4,0,'SD',249,0,0,0,1,'',1),(199,8,0,'SR',597,0,0,0,1,'',1),(200,7,0,'SJ',0,0,0,0,1,'',1),(201,4,0,'SZ',268,0,0,0,1,'',1),(202,3,0,'SY',963,0,0,0,1,'',1),(203,3,0,'TW',886,0,0,0,1,'NNNNN',1),(204,3,0,'TJ',992,0,0,0,1,'',1),(205,4,0,'TZ',255,0,0,0,1,'',1),(206,3,0,'TH',66,0,0,0,1,'NNNNN',1),(207,5,0,'TK',690,0,0,0,1,'',1),(208,5,0,'TO',676,0,0,0,1,'',1),(209,6,0,'TT',0,0,0,0,1,'',1),(210,4,0,'TN',216,0,0,0,1,'',1),(211,7,0,'TR',90,0,0,0,1,'NNNNN',1),(212,3,0,'TM',993,0,0,0,1,'',1),(213,8,0,'TC',0,0,0,0,1,'LLLL NLL',1),(214,5,0,'TV',688,0,0,0,1,'',1),(215,4,0,'UG',256,0,0,0,1,'',1),(216,1,0,'UA',380,0,0,0,1,'NNNNN',1),(217,3,0,'AE',971,0,0,0,1,'',1),(218,6,0,'UY',598,0,0,0,1,'',1),(219,3,0,'UZ',998,0,0,0,1,'',1),(220,5,0,'VU',678,0,0,0,1,'',1),(221,6,0,'VE',58,0,0,0,1,'',1),(222,3,0,'VN',84,0,0,0,1,'NNNNNN',1),(223,2,0,'VG',0,0,0,0,1,'CNNNN',1),(224,2,0,'VI',0,0,0,0,1,'',1),(225,5,0,'WF',681,0,0,0,1,'',1),(226,4,0,'EH',0,0,0,0,1,'',1),(227,3,0,'YE',967,0,0,0,1,'',1),(228,4,0,'ZM',260,0,0,0,1,'',1),(229,4,0,'ZW',263,0,0,0,1,'',1),(230,7,0,'AL',355,0,0,0,1,'NNNN',1),(231,3,0,'AF',93,0,0,0,0,'',1),(232,5,0,'AQ',0,0,0,0,1,'',1),(233,1,0,'BA',387,0,0,0,1,'',1),(234,5,0,'BV',0,0,0,0,1,'',1),(235,5,0,'IO',0,0,0,0,1,'LLLL NLL',1),(236,1,0,'BG',359,0,0,0,1,'NNNN',1),(237,8,0,'KY',0,0,0,0,1,'',1),(238,3,0,'CX',0,0,0,0,1,'',1),(239,3,0,'CC',0,0,0,0,1,'',1),(240,5,0,'CK',682,0,0,0,1,'',1),(241,6,0,'GF',594,0,0,0,1,'',1),(242,5,0,'PF',689,0,0,0,1,'',1),(243,5,0,'TF',0,0,0,0,1,'',1),(244,7,0,'AX',0,0,0,0,1,'NNNNN',1);
/*!40000 ALTER TABLE `ps_country` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_country_lang` WRITE;
/*!40000 ALTER TABLE `ps_country_lang` DISABLE KEYS */;
INSERT INTO `ps_country_lang` VALUES (1,1,'Germany'),(1,2,'Germany'),(2,1,'Austria'),(2,2,'Austria'),(3,1,'Belgium'),(3,2,'Belgium'),(4,1,'Canada'),(4,2,'Canada'),(5,1,'China'),(5,2,'China'),(6,1,'Spain'),(6,2,'Spain'),(7,1,'Finland'),(7,2,'Finland'),(8,1,'France'),(8,2,'France'),(9,1,'Greece'),(9,2,'Greece'),(10,1,'Italy'),(10,2,'Italy'),(11,1,'Japan'),(11,2,'Japan'),(12,1,'Luxemburg'),(12,2,'Luxemburg'),(13,1,'Netherlands'),(13,2,'Netherlands'),(14,1,'Poland'),(14,2,'Poland'),(15,1,'Portugal'),(15,2,'Portugal'),(16,1,'Czech Republic'),(16,2,'Czech Republic'),(17,1,'United Kingdom'),(17,2,'United Kingdom'),(18,1,'Sweden'),(18,2,'Sweden'),(19,1,'Switzerland'),(19,2,'Switzerland'),(20,1,'Denmark'),(20,2,'Denmark'),(21,1,'United States'),(21,2,'United States'),(22,1,'HongKong'),(22,2,'HongKong'),(23,1,'Norway'),(23,2,'Norway'),(24,1,'Australia'),(24,2,'Australia'),(25,1,'Singapore'),(25,2,'Singapore'),(26,1,'Ireland'),(26,2,'Ireland'),(27,1,'New Zealand'),(27,2,'New Zealand'),(28,1,'South Korea'),(28,2,'South Korea'),(29,1,'Israel'),(29,2,'Israel'),(30,1,'South Africa'),(30,2,'South Africa'),(31,1,'Nigeria'),(31,2,'Nigeria'),(32,1,'Ivory Coast'),(32,2,'Ivory Coast'),(33,1,'Togo'),(33,2,'Togo'),(34,1,'Bolivia'),(34,2,'Bolivia'),(35,1,'Mauritius'),(35,2,'Mauritius'),(36,1,'Romania'),(36,2,'Romania'),(37,1,'Slovakia'),(37,2,'Slovakia'),(38,1,'Algeria'),(38,2,'Algeria'),(39,1,'American Samoa'),(39,2,'American Samoa'),(40,1,'Andorra'),(40,2,'Andorra'),(41,1,'Angola'),(41,2,'Angola'),(42,1,'Anguilla'),(42,2,'Anguilla'),(43,1,'Antigua and Barbuda'),(43,2,'Antigua and Barbuda'),(44,1,'Argentina'),(44,2,'Argentina'),(45,1,'Armenia'),(45,2,'Armenia'),(46,1,'Aruba'),(46,2,'Aruba'),(47,1,'Azerbaijan'),(47,2,'Azerbaijan'),(48,1,'Bahamas'),(48,2,'Bahamas'),(49,1,'Bahrain'),(49,2,'Bahrain'),(50,1,'Bangladesh'),(50,2,'Bangladesh'),(51,1,'Barbados'),(51,2,'Barbados'),(52,1,'Belarus'),(52,2,'Belarus'),(53,1,'Belize'),(53,2,'Belize'),(54,1,'Benin'),(54,2,'Benin'),(55,1,'Bermuda'),(55,2,'Bermuda'),(56,1,'Bhutan'),(56,2,'Bhutan'),(57,1,'Botswana'),(57,2,'Botswana'),(58,1,'Brazil'),(58,2,'Brazil'),(59,1,'Brunei'),(59,2,'Brunei'),(60,1,'Burkina Faso'),(60,2,'Burkina Faso'),(61,1,'Burma (Myanmar)'),(61,2,'Burma (Myanmar)'),(62,1,'Burundi'),(62,2,'Burundi'),(63,1,'Cambodia'),(63,2,'Cambodia'),(64,1,'Cameroon'),(64,2,'Cameroon'),(65,1,'Cape Verde'),(65,2,'Cape Verde'),(66,1,'Central African Republic'),(66,2,'Central African Republic'),(67,1,'Chad'),(67,2,'Chad'),(68,1,'Chile'),(68,2,'Chile'),(69,1,'Colombia'),(69,2,'Colombia'),(70,1,'Comoros'),(70,2,'Comoros'),(71,1,'Congo, Dem. Republic'),(71,2,'Congo, Dem. Republic'),(72,1,'Congo, Republic'),(72,2,'Congo, Republic'),(73,1,'Costa Rica'),(73,2,'Costa Rica'),(74,1,'Croatia'),(74,2,'Croatia'),(75,1,'Cuba'),(75,2,'Cuba'),(76,1,'Cyprus'),(76,2,'Cyprus'),(77,1,'Djibouti'),(77,2,'Djibouti'),(78,1,'Dominica'),(78,2,'Dominica'),(79,1,'Dominican Republic'),(79,2,'Dominican Republic'),(80,1,'East Timor'),(80,2,'East Timor'),(81,1,'Ecuador'),(81,2,'Ecuador'),(82,1,'Egypt'),(82,2,'Egypt'),(83,1,'El Salvador'),(83,2,'El Salvador'),(84,1,'Equatorial Guinea'),(84,2,'Equatorial Guinea'),(85,1,'Eritrea'),(85,2,'Eritrea'),(86,1,'Estonia'),(86,2,'Estonia'),(87,1,'Ethiopia'),(87,2,'Ethiopia'),(88,1,'Falkland Islands'),(88,2,'Falkland Islands'),(89,1,'Faroe Islands'),(89,2,'Faroe Islands'),(90,1,'Fiji'),(90,2,'Fiji'),(91,1,'Gabon'),(91,2,'Gabon'),(92,1,'Gambia'),(92,2,'Gambia'),(93,1,'Georgia'),(93,2,'Georgia'),(94,1,'Ghana'),(94,2,'Ghana'),(95,1,'Grenada'),(95,2,'Grenada'),(96,1,'Greenland'),(96,2,'Greenland'),(97,1,'Gibraltar'),(97,2,'Gibraltar'),(98,1,'Guadeloupe'),(98,2,'Guadeloupe'),(99,1,'Guam'),(99,2,'Guam'),(100,1,'Guatemala'),(100,2,'Guatemala'),(101,1,'Guernsey'),(101,2,'Guernsey'),(102,1,'Guinea'),(102,2,'Guinea'),(103,1,'Guinea-Bissau'),(103,2,'Guinea-Bissau'),(104,1,'Guyana'),(104,2,'Guyana'),(105,1,'Haiti'),(105,2,'Haiti'),(106,1,'Heard Island and McDonald Islands'),(106,2,'Heard Island and McDonald Islands'),(107,1,'Vatican City State'),(107,2,'Vatican City State'),(108,1,'Honduras'),(108,2,'Honduras'),(109,1,'Iceland'),(109,2,'Iceland'),(110,1,'India'),(110,2,'India'),(111,1,'Indonesia'),(111,2,'Indonesia'),(112,1,'Iran'),(112,2,'Iran'),(113,1,'Iraq'),(113,2,'Iraq'),(114,1,'Man Island'),(114,2,'Man Island'),(115,1,'Jamaica'),(115,2,'Jamaica'),(116,1,'Jersey'),(116,2,'Jersey'),(117,1,'Jordan'),(117,2,'Jordan'),(118,1,'Kazakhstan'),(118,2,'Kazakhstan'),(119,1,'Kenya'),(119,2,'Kenya'),(120,1,'Kiribati'),(120,2,'Kiribati'),(121,1,'Korea, Dem. Republic of'),(121,2,'Korea, Dem. Republic of'),(122,1,'Kuwait'),(122,2,'Kuwait'),(123,1,'Kyrgyzstan'),(123,2,'Kyrgyzstan'),(124,1,'Laos'),(124,2,'Laos'),(125,1,'Latvia'),(125,2,'Latvia'),(126,1,'Lebanon'),(126,2,'Lebanon'),(127,1,'Lesotho'),(127,2,'Lesotho'),(128,1,'Liberia'),(128,2,'Liberia'),(129,1,'Libya'),(129,2,'Libya'),(130,1,'Liechtenstein'),(130,2,'Liechtenstein'),(131,1,'Lithuania'),(131,2,'Lithuania'),(132,1,'Macau'),(132,2,'Macau'),(133,1,'Macedonia'),(133,2,'Macedonia'),(134,1,'Madagascar'),(134,2,'Madagascar'),(135,1,'Malawi'),(135,2,'Malawi'),(136,1,'Malaysia'),(136,2,'Malaysia'),(137,1,'Maldives'),(137,2,'Maldives'),(138,1,'Mali'),(138,2,'Mali'),(139,1,'Malta'),(139,2,'Malta'),(140,1,'Marshall Islands'),(140,2,'Marshall Islands'),(141,1,'Martinique'),(141,2,'Martinique'),(142,1,'Mauritania'),(142,2,'Mauritania'),(143,1,'Hungary'),(143,2,'Hungary'),(144,1,'Mayotte'),(144,2,'Mayotte'),(145,1,'Mexico'),(145,2,'Mexico'),(146,1,'Micronesia'),(146,2,'Micronesia'),(147,1,'Moldova'),(147,2,'Moldova'),(148,1,'Monaco'),(148,2,'Monaco'),(149,1,'Mongolia'),(149,2,'Mongolia'),(150,1,'Montenegro'),(150,2,'Montenegro'),(151,1,'Montserrat'),(151,2,'Montserrat'),(152,1,'Morocco'),(152,2,'Morocco'),(153,1,'Mozambique'),(153,2,'Mozambique'),(154,1,'Namibia'),(154,2,'Namibia'),(155,1,'Nauru'),(155,2,'Nauru'),(156,1,'Nepal'),(156,2,'Nepal'),(157,1,'Netherlands Antilles'),(157,2,'Netherlands Antilles'),(158,1,'New Caledonia'),(158,2,'New Caledonia'),(159,1,'Nicaragua'),(159,2,'Nicaragua'),(160,1,'Niger'),(160,2,'Niger'),(161,1,'Niue'),(161,2,'Niue'),(162,1,'Norfolk Island'),(162,2,'Norfolk Island'),(163,1,'Northern Mariana Islands'),(163,2,'Northern Mariana Islands'),(164,1,'Oman'),(164,2,'Oman'),(165,1,'Pakistan'),(165,2,'Pakistan'),(166,1,'Palau'),(166,2,'Palau'),(167,1,'Palestinian Territories'),(167,2,'Palestinian Territories'),(168,1,'Panama'),(168,2,'Panama'),(169,1,'Papua New Guinea'),(169,2,'Papua New Guinea'),(170,1,'Paraguay'),(170,2,'Paraguay'),(171,1,'Peru'),(171,2,'Peru'),(172,1,'Philippines'),(172,2,'Philippines'),(173,1,'Pitcairn'),(173,2,'Pitcairn'),(174,1,'Puerto Rico'),(174,2,'Puerto Rico'),(175,1,'Qatar'),(175,2,'Qatar'),(176,1,'Reunion Island'),(176,2,'Reunion Island'),(177,1,'Russian Federation'),(177,2,'Russian Federation'),(178,1,'Rwanda'),(178,2,'Rwanda'),(179,1,'Saint Barthelemy'),(179,2,'Saint Barthelemy'),(180,1,'Saint Kitts and Nevis'),(180,2,'Saint Kitts and Nevis'),(181,1,'Saint Lucia'),(181,2,'Saint Lucia'),(182,1,'Saint Martin'),(182,2,'Saint Martin'),(183,1,'Saint Pierre and Miquelon'),(183,2,'Saint Pierre and Miquelon'),(184,1,'Saint Vincent and the Grenadines'),(184,2,'Saint Vincent and the Grenadines'),(185,1,'Samoa'),(185,2,'Samoa'),(186,1,'San Marino'),(186,2,'San Marino'),(187,1,'São Tomé and Príncipe'),(187,2,'São Tomé and Príncipe'),(188,1,'Saudi Arabia'),(188,2,'Saudi Arabia'),(189,1,'Senegal'),(189,2,'Senegal'),(190,1,'Serbia'),(190,2,'Serbia'),(191,1,'Seychelles'),(191,2,'Seychelles'),(192,1,'Sierra Leone'),(192,2,'Sierra Leone'),(193,1,'Slovenia'),(193,2,'Slovenia'),(194,1,'Solomon Islands'),(194,2,'Solomon Islands'),(195,1,'Somalia'),(195,2,'Somalia'),(196,1,'South Georgia and the South Sandwich Islands'),(196,2,'South Georgia and the South Sandwich Islands'),(197,1,'Sri Lanka'),(197,2,'Sri Lanka'),(198,1,'Sudan'),(198,2,'Sudan'),(199,1,'Suriname'),(199,2,'Suriname'),(200,1,'Svalbard and Jan Mayen'),(200,2,'Svalbard and Jan Mayen'),(201,1,'Swaziland'),(201,2,'Swaziland'),(202,1,'Syria'),(202,2,'Syria'),(203,1,'Taiwan'),(203,2,'Taiwan'),(204,1,'Tajikistan'),(204,2,'Tajikistan'),(205,1,'Tanzania'),(205,2,'Tanzania'),(206,1,'Thailand'),(206,2,'Thailand'),(207,1,'Tokelau'),(207,2,'Tokelau'),(208,1,'Tonga'),(208,2,'Tonga'),(209,1,'Trinidad and Tobago'),(209,2,'Trinidad and Tobago'),(210,1,'Tunisia'),(210,2,'Tunisia'),(211,1,'Turkey'),(211,2,'Turkey'),(212,1,'Turkmenistan'),(212,2,'Turkmenistan'),(213,1,'Turks and Caicos Islands'),(213,2,'Turks and Caicos Islands'),(214,1,'Tuvalu'),(214,2,'Tuvalu'),(215,1,'Uganda'),(215,2,'Uganda'),(216,1,'Ukraine'),(216,2,'Ukraine'),(217,1,'United Arab Emirates'),(217,2,'United Arab Emirates'),(218,1,'Uruguay'),(218,2,'Uruguay'),(219,1,'Uzbekistan'),(219,2,'Uzbekistan'),(220,1,'Vanuatu'),(220,2,'Vanuatu'),(221,1,'Venezuela'),(221,2,'Venezuela'),(222,1,'Vietnam'),(222,2,'Vietnam'),(223,1,'Virgin Islands (British)'),(223,2,'Virgin Islands (British)'),(224,1,'Virgin Islands (U.S.)'),(224,2,'Virgin Islands (U.S.)'),(225,1,'Wallis and Futuna'),(225,2,'Wallis and Futuna'),(226,1,'Western Sahara'),(226,2,'Western Sahara'),(227,1,'Yemen'),(227,2,'Yemen'),(228,1,'Zambia'),(228,2,'Zambia'),(229,1,'Zimbabwe'),(229,2,'Zimbabwe'),(230,1,'Albania'),(230,2,'Albania'),(231,1,'Afghanistan'),(231,2,'Afghanistan'),(232,1,'Antarctica'),(232,2,'Antarctica'),(233,1,'Bosnia and Herzegovina'),(233,2,'Bosnia and Herzegovina'),(234,1,'Bouvet Island'),(234,2,'Bouvet Island'),(235,1,'British Indian Ocean Territory'),(235,2,'British Indian Ocean Territory'),(236,1,'Bulgaria'),(236,2,'Bulgaria'),(237,1,'Cayman Islands'),(237,2,'Cayman Islands'),(238,1,'Christmas Island'),(238,2,'Christmas Island'),(239,1,'Cocos (Keeling) Islands'),(239,2,'Cocos (Keeling) Islands'),(240,1,'Cook Islands'),(240,2,'Cook Islands'),(241,1,'French Guiana'),(241,2,'French Guiana'),(242,1,'French Polynesia'),(242,2,'French Polynesia'),(243,1,'French Southern Territories'),(243,2,'French Southern Territories'),(244,1,'Åland Islands'),(244,2,'Åland Islands');
/*!40000 ALTER TABLE `ps_country_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_country_shop` WRITE;
/*!40000 ALTER TABLE `ps_country_shop` DISABLE KEYS */;
INSERT INTO `ps_country_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(7,1),(7,2),(7,3),(7,4),(7,5),(8,1),(8,2),(8,3),(8,4),(8,5),(9,1),(9,2),(9,3),(9,4),(9,5),(10,1),(10,2),(10,3),(10,4),(10,5),(11,1),(11,2),(11,3),(11,4),(11,5),(12,1),(12,2),(12,3),(12,4),(12,5),(13,1),(13,2),(13,3),(13,4),(13,5),(14,1),(14,2),(14,3),(14,4),(14,5),(15,1),(15,2),(15,3),(15,4),(15,5),(16,1),(16,2),(16,3),(16,4),(16,5),(17,1),(17,2),(17,3),(17,4),(17,5),(18,1),(18,2),(18,3),(18,4),(18,5),(19,1),(19,2),(19,3),(19,4),(19,5),(20,1),(20,2),(20,3),(20,4),(20,5),(21,1),(21,2),(21,3),(21,4),(21,5),(22,1),(22,2),(22,3),(22,4),(22,5),(23,1),(23,2),(23,3),(23,4),(23,5),(24,1),(24,2),(24,3),(24,4),(24,5),(25,1),(25,2),(25,3),(25,4),(25,5),(26,1),(26,2),(26,3),(26,4),(26,5),(27,1),(27,2),(27,3),(27,4),(27,5),(28,1),(28,2),(28,3),(28,4),(28,5),(29,1),(29,2),(29,3),(29,4),(29,5),(30,1),(30,2),(30,3),(30,4),(30,5),(31,1),(31,2),(31,3),(31,4),(31,5),(32,1),(32,2),(32,3),(32,4),(32,5),(33,1),(33,2),(33,3),(33,4),(33,5),(34,1),(34,2),(34,3),(34,4),(34,5),(35,1),(35,2),(35,3),(35,4),(35,5),(36,1),(36,2),(36,3),(36,4),(36,5),(37,1),(37,2),(37,3),(37,4),(37,5),(38,1),(38,2),(38,3),(38,4),(38,5),(39,1),(39,2),(39,3),(39,4),(39,5),(40,1),(40,2),(40,3),(40,4),(40,5),(41,1),(41,2),(41,3),(41,4),(41,5),(42,1),(42,2),(42,3),(42,4),(42,5),(43,1),(43,2),(43,3),(43,4),(43,5),(44,1),(44,2),(44,3),(44,4),(44,5),(45,1),(45,2),(45,3),(45,4),(45,5),(46,1),(46,2),(46,3),(46,4),(46,5),(47,1),(47,2),(47,3),(47,4),(47,5),(48,1),(48,2),(48,3),(48,4),(48,5),(49,1),(49,2),(49,3),(49,4),(49,5),(50,1),(50,2),(50,3),(50,4),(50,5),(51,1),(51,2),(51,3),(51,4),(51,5),(52,1),(52,2),(52,3),(52,4),(52,5),(53,1),(53,2),(53,3),(53,4),(53,5),(54,1),(54,2),(54,3),(54,4),(54,5),(55,1),(55,2),(55,3),(55,4),(55,5),(56,1),(56,2),(56,3),(56,4),(56,5),(57,1),(57,2),(57,3),(57,4),(57,5),(58,1),(58,2),(58,3),(58,4),(58,5),(59,1),(59,2),(59,3),(59,4),(59,5),(60,1),(60,2),(60,3),(60,4),(60,5),(61,1),(61,2),(61,3),(61,4),(61,5),(62,1),(62,2),(62,3),(62,4),(62,5),(63,1),(63,2),(63,3),(63,4),(63,5),(64,1),(64,2),(64,3),(64,4),(64,5),(65,1),(65,2),(65,3),(65,4),(65,5),(66,1),(66,2),(66,3),(66,4),(66,5),(67,1),(67,2),(67,3),(67,4),(67,5),(68,1),(68,2),(68,3),(68,4),(68,5),(69,1),(69,2),(69,3),(69,4),(69,5),(70,1),(70,2),(70,3),(70,4),(70,5),(71,1),(71,2),(71,3),(71,4),(71,5),(72,1),(72,2),(72,3),(72,4),(72,5),(73,1),(73,2),(73,3),(73,4),(73,5),(74,1),(74,2),(74,3),(74,4),(74,5),(75,1),(75,2),(75,3),(75,4),(75,5),(76,1),(76,2),(76,3),(76,4),(76,5),(77,1),(77,2),(77,3),(77,4),(77,5),(78,1),(78,2),(78,3),(78,4),(78,5),(79,1),(79,2),(79,3),(79,4),(79,5),(80,1),(80,2),(80,3),(80,4),(80,5),(81,1),(81,2),(81,3),(81,4),(81,5),(82,1),(82,2),(82,3),(82,4),(82,5),(83,1),(83,2),(83,3),(83,4),(83,5),(84,1),(84,2),(84,3),(84,4),(84,5),(85,1),(85,2),(85,3),(85,4),(85,5),(86,1),(86,2),(86,3),(86,4),(86,5),(87,1),(87,2),(87,3),(87,4),(87,5),(88,1),(88,2),(88,3),(88,4),(88,5),(89,1),(89,2),(89,3),(89,4),(89,5),(90,1),(90,2),(90,3),(90,4),(90,5),(91,1),(91,2),(91,3),(91,4),(91,5),(92,1),(92,2),(92,3),(92,4),(92,5),(93,1),(93,2),(93,3),(93,4),(93,5),(94,1),(94,2),(94,3),(94,4),(94,5),(95,1),(95,2),(95,3),(95,4),(95,5),(96,1),(96,2),(96,3),(96,4),(96,5),(97,1),(97,2),(97,3),(97,4),(97,5),(98,1),(98,2),(98,3),(98,4),(98,5),(99,1),(99,2),(99,3),(99,4),(99,5),(100,1),(100,2),(100,3),(100,4),(100,5),(101,1),(101,2),(101,3),(101,4),(101,5),(102,1),(102,2),(102,3),(102,4),(102,5),(103,1),(103,2),(103,3),(103,4),(103,5),(104,1),(104,2),(104,3),(104,4),(104,5),(105,1),(105,2),(105,3),(105,4),(105,5),(106,1),(106,2),(106,3),(106,4),(106,5),(107,1),(107,2),(107,3),(107,4),(107,5),(108,1),(108,2),(108,3),(108,4),(108,5),(109,1),(109,2),(109,3),(109,4),(109,5),(110,1),(110,2),(110,3),(110,4),(110,5),(111,1),(111,2),(111,3),(111,4),(111,5),(112,1),(112,2),(112,3),(112,4),(112,5),(113,1),(113,2),(113,3),(113,4),(113,5),(114,1),(114,2),(114,3),(114,4),(114,5),(115,1),(115,2),(115,3),(115,4),(115,5),(116,1),(116,2),(116,3),(116,4),(116,5),(117,1),(117,2),(117,3),(117,4),(117,5),(118,1),(118,2),(118,3),(118,4),(118,5),(119,1),(119,2),(119,3),(119,4),(119,5),(120,1),(120,2),(120,3),(120,4),(120,5),(121,1),(121,2),(121,3),(121,4),(121,5),(122,1),(122,2),(122,3),(122,4),(122,5),(123,1),(123,2),(123,3),(123,4),(123,5),(124,1),(124,2),(124,3),(124,4),(124,5),(125,1),(125,2),(125,3),(125,4),(125,5),(126,1),(126,2),(126,3),(126,4),(126,5),(127,1),(127,2),(127,3),(127,4),(127,5),(128,1),(128,2),(128,3),(128,4),(128,5),(129,1),(129,2),(129,3),(129,4),(129,5),(130,1),(130,2),(130,3),(130,4),(130,5),(131,1),(131,2),(131,3),(131,4),(131,5),(132,1),(132,2),(132,3),(132,4),(132,5),(133,1),(133,2),(133,3),(133,4),(133,5),(134,1),(134,2),(134,3),(134,4),(134,5),(135,1),(135,2),(135,3),(135,4),(135,5),(136,1),(136,2),(136,3),(136,4),(136,5),(137,1),(137,2),(137,3),(137,4),(137,5),(138,1),(138,2),(138,3),(138,4),(138,5),(139,1),(139,2),(139,3),(139,4),(139,5),(140,1),(140,2),(140,3),(140,4),(140,5),(141,1),(141,2),(141,3),(141,4),(141,5),(142,1),(142,2),(142,3),(142,4),(142,5),(143,1),(143,2),(143,3),(143,4),(143,5),(144,1),(144,2),(144,3),(144,4),(144,5),(145,1),(145,2),(145,3),(145,4),(145,5),(146,1),(146,2),(146,3),(146,4),(146,5),(147,1),(147,2),(147,3),(147,4),(147,5),(148,1),(148,2),(148,3),(148,4),(148,5),(149,1),(149,2),(149,3),(149,4),(149,5),(150,1),(150,2),(150,3),(150,4),(150,5),(151,1),(151,2),(151,3),(151,4),(151,5),(152,1),(152,2),(152,3),(152,4),(152,5),(153,1),(153,2),(153,3),(153,4),(153,5),(154,1),(154,2),(154,3),(154,4),(154,5),(155,1),(155,2),(155,3),(155,4),(155,5),(156,1),(156,2),(156,3),(156,4),(156,5),(157,1),(157,2),(157,3),(157,4),(157,5),(158,1),(158,2),(158,3),(158,4),(158,5),(159,1),(159,2),(159,3),(159,4),(159,5),(160,1),(160,2),(160,3),(160,4),(160,5),(161,1),(161,2),(161,3),(161,4),(161,5),(162,1),(162,2),(162,3),(162,4),(162,5),(163,1),(163,2),(163,3),(163,4),(163,5),(164,1),(164,2),(164,3),(164,4),(164,5),(165,1),(165,2),(165,3),(165,4),(165,5),(166,1),(166,2),(166,3),(166,4),(166,5),(167,1),(167,2),(167,3),(167,4),(167,5),(168,1),(168,2),(168,3),(168,4),(168,5),(169,1),(169,2),(169,3),(169,4),(169,5),(170,1),(170,2),(170,3),(170,4),(170,5),(171,1),(171,2),(171,3),(171,4),(171,5),(172,1),(172,2),(172,3),(172,4),(172,5),(173,1),(173,2),(173,3),(173,4),(173,5),(174,1),(174,2),(174,3),(174,4),(174,5),(175,1),(175,2),(175,3),(175,4),(175,5),(176,1),(176,2),(176,3),(176,4),(176,5),(177,1),(177,2),(177,3),(177,4),(177,5),(178,1),(178,2),(178,3),(178,4),(178,5),(179,1),(179,2),(179,3),(179,4),(179,5),(180,1),(180,2),(180,3),(180,4),(180,5),(181,1),(181,2),(181,3),(181,4),(181,5),(182,1),(182,2),(182,3),(182,4),(182,5),(183,1),(183,2),(183,3),(183,4),(183,5),(184,1),(184,2),(184,3),(184,4),(184,5),(185,1),(185,2),(185,3),(185,4),(185,5),(186,1),(186,2),(186,3),(186,4),(186,5),(187,1),(187,2),(187,3),(187,4),(187,5),(188,1),(188,2),(188,3),(188,4),(188,5),(189,1),(189,2),(189,3),(189,4),(189,5),(190,1),(190,2),(190,3),(190,4),(190,5),(191,1),(191,2),(191,3),(191,4),(191,5),(192,1),(192,2),(192,3),(192,4),(192,5),(193,1),(193,2),(193,3),(193,4),(193,5),(194,1),(194,2),(194,3),(194,4),(194,5),(195,1),(195,2),(195,3),(195,4),(195,5),(196,1),(196,2),(196,3),(196,4),(196,5),(197,1),(197,2),(197,3),(197,4),(197,5),(198,1),(198,2),(198,3),(198,4),(198,5),(199,1),(199,2),(199,3),(199,4),(199,5),(200,1),(200,2),(200,3),(200,4),(200,5),(201,1),(201,2),(201,3),(201,4),(201,5),(202,1),(202,2),(202,3),(202,4),(202,5),(203,1),(203,2),(203,3),(203,4),(203,5),(204,1),(204,2),(204,3),(204,4),(204,5),(205,1),(205,2),(205,3),(205,4),(205,5),(206,1),(206,2),(206,3),(206,4),(206,5),(207,1),(207,2),(207,3),(207,4),(207,5),(208,1),(208,2),(208,3),(208,4),(208,5),(209,1),(209,2),(209,3),(209,4),(209,5),(210,1),(210,2),(210,3),(210,4),(210,5),(211,1),(211,2),(211,3),(211,4),(211,5),(212,1),(212,2),(212,3),(212,4),(212,5),(213,1),(213,2),(213,3),(213,4),(213,5),(214,1),(214,2),(214,3),(214,4),(214,5),(215,1),(215,2),(215,3),(215,4),(215,5),(216,1),(216,2),(216,3),(216,4),(216,5),(217,1),(217,2),(217,3),(217,4),(217,5),(218,1),(218,2),(218,3),(218,4),(218,5),(219,1),(219,2),(219,3),(219,4),(219,5),(220,1),(220,2),(220,3),(220,4),(220,5),(221,1),(221,2),(221,3),(221,4),(221,5),(222,1),(222,2),(222,3),(222,4),(222,5),(223,1),(223,2),(223,3),(223,4),(223,5),(224,1),(224,2),(224,3),(224,4),(224,5),(225,1),(225,2),(225,3),(225,4),(225,5),(226,1),(226,2),(226,3),(226,4),(226,5),(227,1),(227,2),(227,3),(227,4),(227,5),(228,1),(228,2),(228,3),(228,4),(228,5),(229,1),(229,2),(229,3),(229,4),(229,5),(230,1),(230,2),(230,3),(230,4),(230,5),(231,1),(231,2),(231,3),(231,4),(231,5),(232,1),(232,2),(232,3),(232,4),(232,5),(233,1),(233,2),(233,3),(233,4),(233,5),(234,1),(234,2),(234,3),(234,4),(234,5),(235,1),(235,2),(235,3),(235,4),(235,5),(236,1),(236,2),(236,3),(236,4),(236,5),(237,1),(237,2),(237,3),(237,4),(237,5),(238,1),(238,2),(238,3),(238,4),(238,5),(239,1),(239,2),(239,3),(239,4),(239,5),(240,1),(240,2),(240,3),(240,4),(240,5),(241,1),(241,2),(241,3),(241,4),(241,5),(242,1),(242,2),(242,3),(242,4),(242,5),(243,1),(243,2),(243,3),(243,4),(243,5),(244,1),(244,2),(244,3),(244,4),(244,5);
/*!40000 ALTER TABLE `ps_country_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csfilterproductcenter` WRITE;
/*!40000 ALTER TABLE `ps_csfilterproductcenter` DISABLE KEYS */;
INSERT INTO `ps_csfilterproductcenter` VALUES (1,'choose_the_category_7',0,8,1),(2,'choose_the_category_6',0,8,1),(3,'choose_the_category_8',0,127,1);
/*!40000 ALTER TABLE `ps_csfilterproductcenter` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csfilterproductcenter_lang` WRITE;
/*!40000 ALTER TABLE `ps_csfilterproductcenter_lang` DISABLE KEYS */;
INSERT INTO `ps_csfilterproductcenter_lang` VALUES (1,1,1,'For women'),(1,1,2,'For women'),(1,1,3,'For women'),(1,1,4,'For women'),(1,1,5,'For women'),(1,2,1,'For women'),(1,2,2,'For women'),(1,2,3,'For women'),(1,2,4,'For women'),(1,2,5,'For women'),(2,1,1,'For men'),(2,1,2,'For men'),(2,1,3,'For men'),(2,1,4,'For men'),(2,1,5,'For men'),(2,2,1,'For men'),(2,2,2,'For men'),(2,2,3,'For men'),(2,2,4,'For men'),(2,2,5,'For men'),(3,1,1,'Smart phone'),(3,1,2,'Smart phone'),(3,1,3,'Smart phone'),(3,1,4,'Smart phone'),(3,1,5,'Smart phone'),(3,2,1,'Smart phone'),(3,2,2,'Smart phone'),(3,2,3,'Smart phone'),(3,2,4,'Smart phone'),(3,2,5,'Smart phone');
/*!40000 ALTER TABLE `ps_csfilterproductcenter_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csfilterproductcenter_shop` WRITE;
/*!40000 ALTER TABLE `ps_csfilterproductcenter_shop` DISABLE KEYS */;
INSERT INTO `ps_csfilterproductcenter_shop` VALUES (1,1,'choose_the_category_7',0,1),(1,2,'choose_the_category_7',0,1),(1,3,'choose_the_category_7',0,1),(1,4,'choose_the_category_7',0,1),(1,5,'choose_the_category_7',0,1),(2,1,'choose_the_category_6',2,1),(2,2,'choose_the_category_6',2,1),(2,3,'choose_the_category_6',2,1),(2,4,'choose_the_category_6',2,1),(2,5,'choose_the_category_6',2,1),(3,1,'choose_the_category_8',3,1),(3,2,'choose_the_category_8',3,1),(3,3,'choose_the_category_8',3,1),(3,4,'choose_the_category_8',3,1),(3,5,'choose_the_category_8',3,1);
/*!40000 ALTER TABLE `ps_csfilterproductcenter_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csfilterproductleft` WRITE;
/*!40000 ALTER TABLE `ps_csfilterproductleft` DISABLE KEYS */;
INSERT INTO `ps_csfilterproductleft` VALUES (1,'topseller_products',0,8,1),(2,'choose_the_category_6',0,8,1),(3,'choose_the_category_7',0,127,1);
/*!40000 ALTER TABLE `ps_csfilterproductleft` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csfilterproductleft_lang` WRITE;
/*!40000 ALTER TABLE `ps_csfilterproductleft_lang` DISABLE KEYS */;
INSERT INTO `ps_csfilterproductleft_lang` VALUES (1,1,1,'Best Sellers'),(1,1,2,'Best Sellers'),(1,1,3,'Best Sellers'),(1,1,4,'Best Sellers'),(1,1,5,'Best Sellers'),(1,2,1,'Meilleures'),(1,2,2,'Meilleures'),(1,2,3,'Meilleures'),(1,2,4,'Meilleures'),(1,2,5,'Meilleures'),(2,1,1,'Host Product'),(2,1,2,'Host Product'),(2,1,3,'Host Product'),(2,1,4,'Host Product'),(2,1,5,'Host Product'),(2,2,1,'Produit d\'accueil'),(2,2,2,'Produit d\'accueil'),(2,2,3,'Produit d\'accueil'),(2,2,4,'Produit d\'accueil'),(2,2,5,'Produit d\'accueil'),(3,1,1,'Most Popular'),(3,1,2,'Most Popular'),(3,1,3,'Most Popular'),(3,1,4,'Most Popular'),(3,1,5,'Most Popular'),(3,2,1,'Les plus'),(3,2,2,'Les plus'),(3,2,3,'Les plus'),(3,2,4,'Les plus'),(3,2,5,'Les plus');
/*!40000 ALTER TABLE `ps_csfilterproductleft_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csfilterproductleft_shop` WRITE;
/*!40000 ALTER TABLE `ps_csfilterproductleft_shop` DISABLE KEYS */;
INSERT INTO `ps_csfilterproductleft_shop` VALUES (1,1,'topseller_products',0,1),(1,2,'topseller_products',0,1),(1,3,'topseller_products',0,1),(1,4,'topseller_products',0,1),(1,5,'topseller_products',0,1),(2,1,'choose_the_category_6',0,1),(2,2,'choose_the_category_6',0,1),(2,3,'choose_the_category_6',0,1),(2,4,'choose_the_category_6',0,1),(2,5,'choose_the_category_6',0,1),(3,1,'choose_the_category_7',0,1),(3,2,'choose_the_category_7',0,1),(3,3,'choose_the_category_7',0,1),(3,4,'choose_the_category_7',0,1),(3,5,'choose_the_category_7',0,1);
/*!40000 ALTER TABLE `ps_csfilterproductleft_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csfilterproductright` WRITE;
/*!40000 ALTER TABLE `ps_csfilterproductright` DISABLE KEYS */;
INSERT INTO `ps_csfilterproductright` VALUES (1,'choose_the_category_9',0,8,1),(2,'choose_the_category_10',0,8,1),(3,'choose_the_category_9',0,127,1);
/*!40000 ALTER TABLE `ps_csfilterproductright` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csfilterproductright_lang` WRITE;
/*!40000 ALTER TABLE `ps_csfilterproductright_lang` DISABLE KEYS */;
INSERT INTO `ps_csfilterproductright_lang` VALUES (1,1,1,'For Baby'),(1,1,2,'For Baby'),(1,1,3,'For Baby'),(1,1,4,'For Baby'),(1,1,5,'For Baby'),(1,2,1,'For Baby'),(1,2,2,'For Baby'),(1,2,3,'For Baby'),(1,2,4,'For Baby'),(1,2,5,'For Baby'),(2,1,1,'shoes'),(2,1,2,'shoes'),(2,1,3,'shoes'),(2,1,4,'shoes'),(2,1,5,'shoes'),(2,2,1,'shoes'),(2,2,2,'shoes'),(2,2,3,'shoes'),(2,2,4,'shoes'),(2,2,5,'shoes'),(3,1,1,'Computer'),(3,1,2,'Computer'),(3,1,3,'Computer'),(3,1,4,'Computer'),(3,1,5,'Computer'),(3,2,1,'Computer'),(3,2,2,'Computer'),(3,2,3,'Computer'),(3,2,4,'Computer'),(3,2,5,'Computer');
/*!40000 ALTER TABLE `ps_csfilterproductright_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csfilterproductright_shop` WRITE;
/*!40000 ALTER TABLE `ps_csfilterproductright_shop` DISABLE KEYS */;
INSERT INTO `ps_csfilterproductright_shop` VALUES (1,1,'choose_the_category_9',1,1),(1,2,'choose_the_category_9',1,1),(1,3,'choose_the_category_9',1,1),(1,4,'choose_the_category_9',1,1),(1,5,'choose_the_category_9',1,1),(2,1,'choose_the_category_10',2,1),(2,2,'choose_the_category_10',2,1),(2,3,'choose_the_category_10',2,1),(2,4,'choose_the_category_10',2,1),(2,5,'choose_the_category_10',2,1),(3,1,'choose_the_category_9',0,1),(3,2,'choose_the_category_9',0,1),(3,3,'choose_the_category_9',0,1),(3,4,'choose_the_category_9',0,1),(3,5,'choose_the_category_9',0,1);
/*!40000 ALTER TABLE `ps_csfilterproductright_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cshometab` WRITE;
/*!40000 ALTER TABLE `ps_cshometab` DISABLE KEYS */;
INSERT INTO `ps_cshometab` VALUES (1,'choose_the_category_8',0,1),(2,'choose_the_category_9',0,1),(3,'choose_the_category_6',0,1),(4,'choose_the_category_10',0,1);
/*!40000 ALTER TABLE `ps_cshometab` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cshometab_lang` WRITE;
/*!40000 ALTER TABLE `ps_cshometab_lang` DISABLE KEYS */;
INSERT INTO `ps_cshometab_lang` VALUES (1,1,1,'Iphone & Ipad'),(1,1,2,'Iphone & Ipad'),(1,1,3,'Iphone & Ipad'),(1,1,4,'Iphone & Ipad'),(1,1,5,'Iphone & Ipad'),(1,2,1,'Iphone & Ipad'),(1,2,2,'Iphone & Ipad'),(1,2,3,'Iphone & Ipad'),(1,2,4,'Iphone & Ipad'),(1,2,5,'Iphone & Ipad'),(2,1,1,'Computer & Laptop'),(2,1,2,'Computer & Laptop'),(2,1,3,'Computer & Laptop'),(2,1,4,'Computer & Laptop'),(2,1,5,'Computer & Laptop'),(2,2,1,'Computer & Laptop'),(2,2,2,'Computer & Laptop'),(2,2,3,'Computer & Laptop'),(2,2,4,'Computer & Laptop'),(2,2,5,'Computer & Laptop'),(3,1,1,'Fashion'),(3,1,2,'Fashion'),(3,1,3,'Fashion'),(3,1,4,'Fashion'),(3,1,5,'Fashion'),(3,2,1,'Fashion'),(3,2,2,'Fashion'),(3,2,3,'Fashion'),(3,2,4,'Fashion'),(3,2,5,'Fashion'),(4,1,1,'Accessories'),(4,1,2,'Accessories'),(4,1,3,'Accessories'),(4,1,4,'Accessories'),(4,1,5,'Accessories'),(4,2,1,'Accessories'),(4,2,2,'Accessories'),(4,2,3,'Accessories'),(4,2,4,'Accessories'),(4,2,5,'Accessories');
/*!40000 ALTER TABLE `ps_cshometab_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_cshometab_shop` WRITE;
/*!40000 ALTER TABLE `ps_cshometab_shop` DISABLE KEYS */;
INSERT INTO `ps_cshometab_shop` VALUES (1,1,'choose_the_category_8',0,1),(1,2,'choose_the_category_8',0,1),(1,3,'choose_the_category_8',0,1),(1,4,'choose_the_category_8',0,1),(1,5,'choose_the_category_8',0,1),(2,1,'choose_the_category_9',2,1),(2,2,'choose_the_category_9',2,1),(2,3,'choose_the_category_9',2,1),(2,4,'choose_the_category_9',2,1),(2,5,'choose_the_category_9',2,1),(3,1,'choose_the_category_6',3,1),(3,2,'choose_the_category_6',3,1),(3,3,'choose_the_category_6',3,1),(3,4,'choose_the_category_6',3,1),(3,5,'choose_the_category_6',3,1),(4,1,'choose_the_category_10',4,1),(4,2,'choose_the_category_10',4,1),(4,3,'choose_the_category_10',4,1),(4,4,'choose_the_category_10',4,1),(4,5,'choose_the_category_10',4,1);
/*!40000 ALTER TABLE `ps_cshometab_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csmegamenu` WRITE;
/*!40000 ALTER TABLE `ps_csmegamenu` DISABLE KEYS */;
INSERT INTO `ps_csmegamenu` VALUES (1,2,322,'{megamenu_url}index.php?id_category=7&controller=category&id_lang=1','icon_1.jpg',1,1,'class_menu1',0),(2,1,200,'{megamenu_url}index.php?id_category=6&controller=category&id_lang=1','icon_2.jpg',1,1,'',1),(3,2,620,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1','icon_3.png',1,1,'block_product',2),(4,1,905,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1','icon_4.png',1,1,'menu_custom',3),(5,6,950,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1','icon_5.png',1,1,'',4),(6,1,500,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1','icon_6.png',1,1,NULL,0),(7,0,0,'{megamenu_url}index.php?id_category=11&controller=category&id_lang=1','icon_7.jpg',1,1,NULL,0),(8,0,0,'{megamenu_url}index.php?id_category=12&controller=category&id_lang=1','icon_8.jpg',1,1,NULL,0),(9,0,0,'{megamenu_url}index.php?id_category=14&controller=category&id_lang=1','icon_9.jpg',1,1,NULL,0);
/*!40000 ALTER TABLE `ps_csmegamenu` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csmegamenu_lang` WRITE;
/*!40000 ALTER TABLE `ps_csmegamenu_lang` DISABLE KEYS */;
INSERT INTO `ps_csmegamenu_lang` VALUES (1,1,1,'Fashion for women',''),(1,1,2,'Fashion for women',''),(1,1,3,'Fashion for women',''),(1,1,4,'Fashion for women',''),(1,1,5,'Fashion for women',''),(1,2,1,'Fashion for women',''),(1,2,2,'Fashion for women',''),(1,2,3,'Fashion for women',''),(1,2,4,'Fashion for women',''),(1,2,5,'Fashion for women',''),(2,1,1,'Fashion for men',''),(2,1,2,'Fashion for men',''),(2,1,3,'Fashion for men',''),(2,1,4,'Fashion for men',''),(2,1,5,'Fashion for men',''),(2,2,1,'Fashion for men',''),(2,2,2,'Fashion for men',''),(2,2,3,'Fashion for men',''),(2,2,4,'Fashion for men',''),(2,2,5,'Fashion for men',''),(3,1,1,'Gift / Toys',''),(3,1,2,'Gift / Toys',''),(3,1,3,'Gift / Toys',''),(3,1,4,'Gift / Toys',''),(3,1,5,'Gift / Toys',''),(3,2,1,'Gift / Toys',''),(3,2,2,'Gift / Toys',''),(3,2,3,'Gift / Toys',''),(3,2,4,'Gift / Toys',''),(3,2,5,'Gift / Toys',''),(4,1,1,'Laptop / Computer',''),(4,1,2,'Laptop / Computer',''),(4,1,3,'Laptop / Computer',''),(4,1,4,'Laptop / Computer',''),(4,1,5,'Laptop / Computer',''),(4,2,1,'Laptop / Computer',''),(4,2,2,'Laptop / Computer',''),(4,2,3,'Laptop / Computer',''),(4,2,4,'Laptop / Computer',''),(4,2,5,'Laptop / Computer',''),(5,1,1,'Camera / Camcorder',''),(5,1,2,'Camera / Camcorder',''),(5,1,3,'Camera / Camcorder',''),(5,1,4,'Camera / Camcorder',''),(5,1,5,'Camera / Camcorder',''),(5,2,1,'Camera / Camcorder',''),(5,2,2,'Camera / Camcorder',''),(5,2,3,'Camera / Camcorder',''),(5,2,4,'Camera / Camcorder',''),(5,2,5,'Camera / Camcorder',''),(6,1,1,'Iphone / Ipod / Ipad',''),(6,1,2,'Iphone / Ipod / Ipad',''),(6,1,3,'Iphone / Ipod / Ipad',''),(6,1,4,'Iphone / Ipod / Ipad',''),(6,1,5,'Iphone / Ipod / Ipad',''),(6,2,1,'Iphone / Ipod / Ipad',''),(6,2,2,'Iphone / Ipod / Ipad',''),(6,2,3,'Iphone / Ipod / Ipad',''),(6,2,4,'Iphone / Ipod / Ipad',''),(6,2,5,'Iphone / Ipod / Ipad',''),(7,1,1,'Mother & Baby',''),(7,1,2,'Mother & Baby',''),(7,1,3,'Mother & Baby',''),(7,1,4,'Mother & Baby',''),(7,1,5,'Mother & Baby',''),(7,2,1,'Mother & Baby',''),(7,2,2,'Mother & Baby',''),(7,2,3,'Mother & Baby',''),(7,2,4,'Mother & Baby',''),(7,2,5,'Mother & Baby',''),(8,1,1,'Watch',''),(8,1,2,'Watch',''),(8,1,3,'Watch',''),(8,1,4,'Watch',''),(8,1,5,'Watch',''),(8,2,1,'Watch',''),(8,2,2,'Watch',''),(8,2,3,'Watch',''),(8,2,4,'Watch',''),(8,2,5,'Watch',''),(9,1,1,'Cosmetics',''),(9,1,2,'Cosmetics',''),(9,1,3,'Cosmetics',''),(9,1,4,'Cosmetics',''),(9,1,5,'Cosmetics',''),(9,2,1,'Cosmetics',''),(9,2,2,'Cosmetics',''),(9,2,3,'Cosmetics',''),(9,2,4,'Cosmetics',''),(9,2,5,'Cosmetics','');
/*!40000 ALTER TABLE `ps_csmegamenu_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csmegamenu_option` WRITE;
/*!40000 ALTER TABLE `ps_csmegamenu_option` DISABLE KEYS */;
INSERT INTO `ps_csmegamenu_option` VALUES (2,1,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(3,1,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"13\"}'),(4,1,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(5,2,0,2,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"1\",\"opt_image_size_cate\":\"medium_default\",\"opt_show_sub_cat\":\"1\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(6,3,1,3,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"8-20-17-18-\",\"input_hidden_name\":\"Aenean fringilla venenatis nulla non auctor\\u00a4Quisque vitae nibh mauris\\u00a4Nam vitae orci nisi eu eleifend\\u00a4Cursus magna lacus antedios\\u00a4\",\"opt_fill_column\":\"2\"}'),(7,4,3,0,'{\"opt_show_image_manu\":\"1\",\"opt_image_size_manu\":\"medium_default\",\"opt_show_name_manu\":\"0\",\"opt_list_manu\":[\"1\",\"6\",\"3\",\"4\",\"8\",\"7\",\"9\",\"2\"],\"opt_fill_column\":\"1\"}'),(8,5,2,0,'{&quot;opt_content_static&quot;:{&quot;1&quot;:&quot;&lt;p&gt;Presthemes GoMarket has a simple-looking, neat, clean layout with blocks of featured products, featured categories and promotions are well-organized on a white background. But this design is highlighted with many new and useful features, becomes one of the most powerful Prestashop templates.&lt;\\/p&gt;&quot;,&quot;2&quot;:&quot;&lt;p&gt;Presthemes GoMarket a soign\\u00e9e, mise en page simple d\'aspect, propre avec des blocs de produits en vedette, vedette cat\\u00e9gories et promotions sont bien organis\\u00e9s sur un fond blanc. Mais cette conception est mise en \\u00e9vidence avec de nombreuses fonctionnalit\\u00e9s nouvelles et utiles, devient l\'un des plus puissants mod\\u00e8les les Prestashop.&lt;\\/p&gt;&quot;},&quot;opt_fill_column&quot;:&quot;1&quot;}'),(9,5,1,0,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"20-19-18-17-\",\"input_hidden_name\":\"Quisque vitae nibh mauris\\u00a4Hendrerit tincidunt cras\\u00a4Cursus magna lacus antedios\\u00a4Nam vitae orci nisi eu eleifend\\u00a4\",\"opt_fill_column\":\"2\"}'),(10,5,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(11,5,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(12,5,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(13,1,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"small_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}');
/*!40000 ALTER TABLE `ps_csmegamenu_option` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csmegamenu_option_shop` WRITE;
/*!40000 ALTER TABLE `ps_csmegamenu_option_shop` DISABLE KEYS */;
INSERT INTO `ps_csmegamenu_option_shop` VALUES (2,1,1,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(2,1,2,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(2,1,3,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(2,1,4,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(2,1,5,0,0,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(3,1,1,0,7,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"13\"}'),(3,1,2,0,7,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"13\"}'),(3,1,3,0,7,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"13\"}'),(3,1,4,0,7,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"13\"}'),(3,1,5,0,7,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"13\"}'),(4,1,1,0,9,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(4,1,2,0,9,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(4,1,3,0,9,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(4,1,4,0,9,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(4,1,5,0,9,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(5,2,1,0,5,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"1\",\"opt_image_size_cate\":\"medium_default\",\"opt_show_sub_cat\":\"1\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(5,2,2,0,5,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"1\",\"opt_image_size_cate\":\"medium_default\",\"opt_show_sub_cat\":\"1\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(5,2,3,0,5,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"1\",\"opt_image_size_cate\":\"medium_default\",\"opt_show_sub_cat\":\"1\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(5,2,4,0,5,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"1\",\"opt_image_size_cate\":\"medium_default\",\"opt_show_sub_cat\":\"1\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(5,2,5,0,5,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"1\",\"opt_image_size_cate\":\"medium_default\",\"opt_show_sub_cat\":\"1\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(6,3,1,1,8,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"8-20-17-18-\",\"input_hidden_name\":\"Aenean fringilla venenatis nulla non auctor\\u00a4Quisque vitae nibh mauris\\u00a4Nam vitae orci nisi eu eleifend\\u00a4Cursus magna lacus antedios\\u00a4\",\"opt_fill_column\":\"2\"}'),(6,3,2,1,8,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"8-20-17-18-\",\"input_hidden_name\":\"Aenean fringilla venenatis nulla non auctor\\u00a4Quisque vitae nibh mauris\\u00a4Nam vitae orci nisi eu eleifend\\u00a4Cursus magna lacus antedios\\u00a4\",\"opt_fill_column\":\"2\"}'),(6,3,3,1,8,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"8-20-17-18-\",\"input_hidden_name\":\"Aenean fringilla venenatis nulla non auctor\\u00a4Quisque vitae nibh mauris\\u00a4Nam vitae orci nisi eu eleifend\\u00a4Cursus magna lacus antedios\\u00a4\",\"opt_fill_column\":\"2\"}'),(6,3,4,1,8,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"8-20-17-18-\",\"input_hidden_name\":\"Aenean fringilla venenatis nulla non auctor\\u00a4Quisque vitae nibh mauris\\u00a4Nam vitae orci nisi eu eleifend\\u00a4Cursus magna lacus antedios\\u00a4\",\"opt_fill_column\":\"2\"}'),(6,3,5,1,8,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"8-20-17-18-\",\"input_hidden_name\":\"Aenean fringilla venenatis nulla non auctor\\u00a4Quisque vitae nibh mauris\\u00a4Nam vitae orci nisi eu eleifend\\u00a4Cursus magna lacus antedios\\u00a4\",\"opt_fill_column\":\"2\"}'),(7,4,1,3,2,'{\"opt_show_image_manu\":\"1\",\"opt_image_size_manu\":\"medium_default\",\"opt_show_name_manu\":\"0\",\"opt_list_manu\":[\"1\",\"6\",\"3\",\"4\",\"8\",\"7\",\"9\",\"2\"],\"opt_fill_column\":\"1\"}'),(7,4,2,3,2,'{\"opt_show_image_manu\":\"1\",\"opt_image_size_manu\":\"medium_default\",\"opt_show_name_manu\":\"0\",\"opt_list_manu\":[\"1\",\"6\",\"3\",\"4\",\"8\",\"7\",\"9\",\"2\"],\"opt_fill_column\":\"1\"}'),(7,4,3,3,2,'{\"opt_show_image_manu\":\"1\",\"opt_image_size_manu\":\"medium_default\",\"opt_show_name_manu\":\"0\",\"opt_list_manu\":[\"1\",\"6\",\"3\",\"4\",\"8\",\"7\",\"9\",\"2\"],\"opt_fill_column\":\"1\"}'),(7,4,4,3,2,'{\"opt_show_image_manu\":\"1\",\"opt_image_size_manu\":\"medium_default\",\"opt_show_name_manu\":\"0\",\"opt_list_manu\":[\"1\",\"6\",\"3\",\"4\",\"8\",\"7\",\"9\",\"2\"],\"opt_fill_column\":\"1\"}'),(7,4,5,3,2,'{\"opt_show_image_manu\":\"1\",\"opt_image_size_manu\":\"medium_default\",\"opt_show_name_manu\":\"0\",\"opt_list_manu\":[\"1\",\"6\",\"3\",\"4\",\"8\",\"7\",\"9\",\"2\"],\"opt_fill_column\":\"1\"}'),(8,5,1,2,0,'{&quot;opt_content_static&quot;:{&quot;1&quot;:&quot;&lt;p&gt;Presthemes GoMarket has a simple-looking, neat, clean layout with blocks of featured products, featured categories and promotions are well-organized on a white background. But this design is highlighted with many new and useful features, becomes one of the most powerful Prestashop templates.&lt;\\/p&gt;&quot;,&quot;2&quot;:&quot;&lt;p&gt;Presthemes GoMarket a soign\\u00e9e, mise en page simple d\'aspect, propre avec des blocs de produits en vedette, vedette cat\\u00e9gories et promotions sont bien organis\\u00e9s sur un fond blanc. Mais cette conception est mise en \\u00e9vidence avec de nombreuses fonctionnalit\\u00e9s nouvelles et utiles, devient l\'un des plus puissants mod\\u00e8les les Prestashop.&lt;\\/p&gt;&quot;},&quot;opt_fill_column&quot;:&quot;1&quot;}'),(8,5,2,2,0,'{&quot;opt_content_static&quot;:{&quot;1&quot;:&quot;&lt;p&gt;Presthemes GoMarket has a simple-looking, neat, clean layout with blocks of featured products, featured categories and promotions are well-organized on a white background. But this design is highlighted with many new and useful features, becomes one of the most powerful Prestashop templates.&lt;\\/p&gt;&quot;,&quot;2&quot;:&quot;&lt;p&gt;Presthemes GoMarket a soign\\u00e9e, mise en page simple d\'aspect, propre avec des blocs de produits en vedette, vedette cat\\u00e9gories et promotions sont bien organis\\u00e9s sur un fond blanc. Mais cette conception est mise en \\u00e9vidence avec de nombreuses fonctionnalit\\u00e9s nouvelles et utiles, devient l\'un des plus puissants mod\\u00e8les les Prestashop.&lt;\\/p&gt;&quot;},&quot;opt_fill_column&quot;:&quot;1&quot;}'),(8,5,3,2,0,'{&quot;opt_content_static&quot;:{&quot;1&quot;:&quot;&lt;p&gt;Presthemes GoMarket has a simple-looking, neat, clean layout with blocks of featured products, featured categories and promotions are well-organized on a white background. But this design is highlighted with many new and useful features, becomes one of the most powerful Prestashop templates.&lt;\\/p&gt;&quot;,&quot;2&quot;:&quot;&lt;p&gt;Presthemes GoMarket a soign\\u00e9e, mise en page simple d\'aspect, propre avec des blocs de produits en vedette, vedette cat\\u00e9gories et promotions sont bien organis\\u00e9s sur un fond blanc. Mais cette conception est mise en \\u00e9vidence avec de nombreuses fonctionnalit\\u00e9s nouvelles et utiles, devient l\'un des plus puissants mod\\u00e8les les Prestashop.&lt;\\/p&gt;&quot;},&quot;opt_fill_column&quot;:&quot;1&quot;}'),(8,5,4,2,0,'{&quot;opt_content_static&quot;:{&quot;1&quot;:&quot;&lt;p&gt;Presthemes GoMarket has a simple-looking, neat, clean layout with blocks of featured products, featured categories and promotions are well-organized on a white background. But this design is highlighted with many new and useful features, becomes one of the most powerful Prestashop templates.&lt;\\/p&gt;&quot;,&quot;2&quot;:&quot;&lt;p&gt;Presthemes GoMarket a soign\\u00e9e, mise en page simple d\'aspect, propre avec des blocs de produits en vedette, vedette cat\\u00e9gories et promotions sont bien organis\\u00e9s sur un fond blanc. Mais cette conception est mise en \\u00e9vidence avec de nombreuses fonctionnalit\\u00e9s nouvelles et utiles, devient l\'un des plus puissants mod\\u00e8les les Prestashop.&lt;\\/p&gt;&quot;},&quot;opt_fill_column&quot;:&quot;1&quot;}'),(8,5,5,2,0,'{&quot;opt_content_static&quot;:{&quot;1&quot;:&quot;&lt;p&gt;Presthemes GoMarket has a simple-looking, neat, clean layout with blocks of featured products, featured categories and promotions are well-organized on a white background. But this design is highlighted with many new and useful features, becomes one of the most powerful Prestashop templates.&lt;\\/p&gt;&quot;,&quot;2&quot;:&quot;&lt;p&gt;Presthemes GoMarket a soign\\u00e9e, mise en page simple d\'aspect, propre avec des blocs de produits en vedette, vedette cat\\u00e9gories et promotions sont bien organis\\u00e9s sur un fond blanc. Mais cette conception est mise en \\u00e9vidence avec de nombreuses fonctionnalit\\u00e9s nouvelles et utiles, devient l\'un des plus puissants mod\\u00e8les les Prestashop.&lt;\\/p&gt;&quot;},&quot;opt_fill_column&quot;:&quot;1&quot;}'),(9,5,1,1,1,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"20-19-18-17-\",\"input_hidden_name\":\"Quisque vitae nibh mauris\\u00a4Hendrerit tincidunt cras\\u00a4Cursus magna lacus antedios\\u00a4Nam vitae orci nisi eu eleifend\\u00a4\",\"opt_fill_column\":\"2\"}'),(9,5,2,1,1,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"20-19-18-17-\",\"input_hidden_name\":\"Quisque vitae nibh mauris\\u00a4Hendrerit tincidunt cras\\u00a4Cursus magna lacus antedios\\u00a4Nam vitae orci nisi eu eleifend\\u00a4\",\"opt_fill_column\":\"2\"}'),(9,5,3,1,1,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"20-19-18-17-\",\"input_hidden_name\":\"Quisque vitae nibh mauris\\u00a4Hendrerit tincidunt cras\\u00a4Cursus magna lacus antedios\\u00a4Nam vitae orci nisi eu eleifend\\u00a4\",\"opt_fill_column\":\"2\"}'),(9,5,4,1,1,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"20-19-18-17-\",\"input_hidden_name\":\"Quisque vitae nibh mauris\\u00a4Hendrerit tincidunt cras\\u00a4Cursus magna lacus antedios\\u00a4Nam vitae orci nisi eu eleifend\\u00a4\",\"opt_fill_column\":\"2\"}'),(9,5,5,1,1,'{\"opt_show_image_product\":\"1\",\"opt_image_size_product\":\"medium_default\",\"input_hidden_id\":\"20-19-18-17-\",\"input_hidden_name\":\"Quisque vitae nibh mauris\\u00a4Hendrerit tincidunt cras\\u00a4Cursus magna lacus antedios\\u00a4Nam vitae orci nisi eu eleifend\\u00a4\",\"opt_fill_column\":\"2\"}'),(10,5,1,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(10,5,2,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(10,5,3,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(10,5,4,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(10,5,5,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(11,5,1,0,3,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(11,5,2,0,3,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(11,5,3,0,3,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(11,5,4,0,3,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(11,5,5,0,3,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"12\"}'),(12,5,1,0,2,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(12,5,2,0,2,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(12,5,3,0,2,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(12,5,4,0,2,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(12,5,5,0,2,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"category_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"14\"}'),(13,1,1,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"small_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(13,1,2,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"small_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(13,1,3,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"small_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(13,1,4,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"small_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}'),(13,1,5,0,4,'{\"opt_fill_column\":\"1\",\"opt_show_image_cat\":\"0\",\"opt_image_size_cate\":\"small_default\",\"opt_show_sub_cat\":\"0\",\"opt_show_parent_cat\":\"1\",\"opt_id_parent_cat\":\"11\"}');
/*!40000 ALTER TABLE `ps_csmegamenu_option_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csmegamenu_shop` WRITE;
/*!40000 ALTER TABLE `ps_csmegamenu_shop` DISABLE KEYS */;
INSERT INTO `ps_csmegamenu_shop` VALUES (1,1,2,322,'{megamenu_url}index.php?id_category=7&controller=category&id_lang=1',1,0),(1,2,2,322,'{megamenu_url}index.php?id_category=7&controller=category&id_lang=1',1,0),(1,3,2,322,'{megamenu_url}index.php?id_category=7&controller=category&id_lang=1',1,0),(1,4,2,322,'{megamenu_url}index.php?id_category=7&controller=category&id_lang=1',1,0),(1,5,2,322,'{megamenu_url}index.php?id_category=7&controller=category&id_lang=1',1,0),(2,1,1,200,'{megamenu_url}index.php?id_category=6&controller=category&id_lang=1',1,1),(2,2,1,200,'{megamenu_url}index.php?id_category=6&controller=category&id_lang=1',1,1),(2,3,1,200,'{megamenu_url}index.php?id_category=6&controller=category&id_lang=1',1,1),(2,4,1,200,'{megamenu_url}index.php?id_category=6&controller=category&id_lang=1',1,1),(2,5,1,200,'{megamenu_url}index.php?id_category=6&controller=category&id_lang=1',1,1),(3,1,2,620,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,2),(3,2,2,620,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,2),(3,3,2,620,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,2),(3,4,2,620,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,2),(3,5,2,620,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,2),(4,1,1,905,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,3),(4,2,1,905,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,3),(4,3,1,905,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,3),(4,4,1,905,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,3),(4,5,1,905,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,3),(5,1,6,950,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,4),(5,2,6,950,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,4),(5,3,6,950,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,4),(5,4,6,950,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,4),(5,5,6,950,'{megamenu_url}index.php?id_category=8&controller=category&id_lang=1',1,4),(6,1,1,500,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,5),(6,2,1,500,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,5),(6,3,1,500,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,5),(6,4,1,500,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,5),(6,5,1,500,'{megamenu_url}index.php?id_category=9&controller=category&id_lang=1',1,5),(7,1,0,0,'{megamenu_url}index.php?id_category=11&controller=category&id_lang=1',1,6),(7,2,0,0,'{megamenu_url}index.php?id_category=11&controller=category&id_lang=1',1,6),(7,3,0,0,'{megamenu_url}index.php?id_category=11&controller=category&id_lang=1',1,6),(7,4,0,0,'{megamenu_url}index.php?id_category=11&controller=category&id_lang=1',1,6),(7,5,0,0,'{megamenu_url}index.php?id_category=11&controller=category&id_lang=1',1,6),(8,1,0,0,'{megamenu_url}index.php?id_category=12&controller=category&id_lang=1',1,7),(8,2,0,0,'{megamenu_url}index.php?id_category=12&controller=category&id_lang=1',1,7),(8,3,0,0,'{megamenu_url}index.php?id_category=12&controller=category&id_lang=1',1,7),(8,4,0,0,'{megamenu_url}index.php?id_category=12&controller=category&id_lang=1',1,7),(8,5,0,0,'{megamenu_url}index.php?id_category=12&controller=category&id_lang=1',1,7),(9,1,0,0,'{megamenu_url}index.php?id_category=14&controller=category&id_lang=1',1,8),(9,2,0,0,'{megamenu_url}index.php?id_category=14&controller=category&id_lang=1',1,8),(9,3,0,0,'{megamenu_url}index.php?id_category=14&controller=category&id_lang=1',1,8),(9,4,0,0,'{megamenu_url}index.php?id_category=14&controller=category&id_lang=1',1,8),(9,5,0,0,'{megamenu_url}index.php?id_category=14&controller=category&id_lang=1',1,8);
/*!40000 ALTER TABLE `ps_csmegamenu_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csslider` WRITE;
/*!40000 ALTER TABLE `ps_csslider` DISABLE KEYS */;
INSERT INTO `ps_csslider` VALUES (6,'#','{\"transitions\":\"slidehorizontal\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_1.jpg\"}',1,1),(7,'#','{\"transitions\":\"curtain-1\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9400\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_7.jpg\"}',2,1),(8,'#','{\"transitions\":\"slotslide-vertical\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_8.jpg\"}',3,1);
/*!40000 ALTER TABLE `ps_csslider` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csslider_caption` WRITE;
/*!40000 ALTER TABLE `ps_csslider_caption` DISABLE KEYS */;
INSERT INTO `ps_csslider_caption` VALUES (10,6,0,'{\"type_caption\":\"imagecaption\",\"datax\":\"415\",\"datay\":\"2\",\"class\":\"\",\"dataspeed\":\"900\",\"datastart\":\"500\",\"incomanimation\":\"lft\",\"outgoanimation\":\"ltb\",\"easing\":\"easeOutBack\",\"endeasing\":\"easeInQuad\",\"image_1\":\"1_1.png\",\"image_2\":\"1_1.png\"}'),(11,6,1,'{\"type_caption\":\"textcaption\",\"datax\":\"415\",\"datay\":\"75\",\"class\":\"big_white\",\"dataspeed\":\"300\",\"datastart\":\"700\",\"incomanimation\":\"sfr\",\"outgoanimation\":\"randomrotateout\",\"easing\":\"easeOutExpo\",\"endeasing\":\"easeInExpo\",\"text\":{\"1\":\"Responsive<br\\/> Design\",\"2\":\"Responsive<br\\/> Design\"}}'),(12,6,2,'{\"type_caption\":\"textcaption\",\"datax\":\"415\",\"datay\":\"145\",\"class\":\"\",\"dataspeed\":\"300\",\"datastart\":\"900\",\"incomanimation\":\"lfl\",\"outgoanimation\":\"randomrotateout\",\"easing\":\"easeOutQuart\",\"endeasing\":\"easeOutBack\",\"text\":{\"1\":\"Design is optimized for all<br\\/> the most popular screen resolutions.<br\\/> When screen is resized,<br\\/> design elements are transformed <br\\/>smoothly on each breakpoin.\",\"2\":\"Design is optimized for all<br\\/> the most popular screen resolutions.<br\\/> When screen is resized,<br\\/> design elements are transformed <br\\/>smoothly on each breakpoin.\"}}'),(13,6,3,'{\"type_caption\":\"imagecaption\",\"datax\":\"415\",\"datay\":\"230\",\"class\":\"\",\"dataspeed\":\"300\",\"datastart\":\"1100\",\"incomanimation\":\"sfl\",\"outgoanimation\":\"ltb\",\"easing\":\"easeInCirc\",\"endeasing\":\"easeInCirc\",\"image_1\":\"13_1.png\",\"image_2\":\"13_1.png\"}'),(14,7,4,'{\"type_caption\":\"imagecaption\",\"datax\":\"415\",\"datay\":\"2\",\"class\":\"\",\"dataspeed\":\"300\",\"datastart\":\"500\",\"incomanimation\":\"randomrotate\",\"outgoanimation\":\"str\",\"easing\":\"easeOutBack\",\"endeasing\":\"easeInBack\",\"image_1\":\"14_1.png\",\"image_2\":\"14_1.png\"}'),(15,7,5,'{\"type_caption\":\"textcaption\",\"datax\":\"415\",\"datay\":\"80\",\"class\":\"big_white\",\"dataspeed\":\"300\",\"datastart\":\"700\",\"incomanimation\":\"randomrotate\",\"outgoanimation\":\"ltr\",\"easing\":\"easeInSine\",\"endeasing\":\"easeOutSine\",\"text\":{\"1\":\"Mega Menu\",\"2\":\"Mega Menu\"}}'),(16,7,6,'{\"type_caption\":\"textcaption\",\"datax\":\"415\",\"datay\":\"130\",\"class\":\"\",\"dataspeed\":\"300\",\"datastart\":\"900\",\"incomanimation\":\"randomrotate\",\"outgoanimation\":\"ltr\",\"easing\":\"easeInQuart\",\"endeasing\":\"easeInElastic\",\"text\":{\"1\":\"Configure many types of flexible<br\\/> menu by combining options together<br\\/>\\r\\nConfigure width and columns <br\\/>of dropdown menu\\r\\nConfigure <br\\/>columns for each option\\r\\n\",\"2\":\"Configure many types of flexible<br\\/> menu by combining options together<br\\/>\\r\\nConfigure width and columns <br\\/>of dropdown menu\\r\\nConfigure <br\\/>columns for each option\\r\\n\"}}'),(17,7,7,'{\"type_caption\":\"imagecaption\",\"datax\":\"415\",\"datay\":\"220\",\"class\":\"\",\"dataspeed\":\"300\",\"datastart\":\"1100\",\"incomanimation\":\"sfr\",\"outgoanimation\":\"ltt\",\"easing\":\"easeInQuart\",\"endeasing\":\"easeInOutElastic\",\"image_1\":\"17_1.png\",\"image_2\":\"17_1.png\"}'),(18,8,8,'{\"type_caption\":\"imagecaption\",\"datax\":\"415\",\"datay\":\"2\",\"class\":\"\",\"dataspeed\":\"300\",\"datastart\":\"500\",\"incomanimation\":\"sft\",\"outgoanimation\":\"stt\",\"easing\":\"easeOutBack\",\"endeasing\":\"easeOutBack\",\"image_1\":\"18_1.png\",\"image_2\":\"18_1.png\"}'),(19,8,9,'{\"type_caption\":\"textcaption\",\"datax\":\"415\",\"datay\":\"80\",\"class\":\"big_white\",\"dataspeed\":\"300\",\"datastart\":\"700\",\"incomanimation\":\"sfl\",\"outgoanimation\":\"stt\",\"easing\":\"easeInCubic\",\"endeasing\":\"easeOutBack\",\"text\":{\"1\":\"Slideshow<br\\/>Revolution\",\"2\":\"Slideshow<br\\/>Revolution\"}}'),(20,8,10,'{\"type_caption\":\"textcaption\",\"datax\":\"415\",\"datay\":\"158\",\"class\":\"\",\"dataspeed\":\"300\",\"datastart\":\"900\",\"incomanimation\":\"lft\",\"outgoanimation\":\"fadeout\",\"easing\":\"easeOutSine\",\"endeasing\":\"easeInSine\",\"text\":{\"1\":\"On top of that, <br\\/>Slider Revolution is fully responsive <br\\/>and mobile optimized <br\\/>and can take on any dimensions.\",\"2\":\"On top of that, <br\\/>Slider Revolution is fully responsive <br\\/>and mobile optimized <br\\/>and can take on any dimensions.\"}}'),(21,8,11,'{\"type_caption\":\"imagecaption\",\"datax\":\"415\",\"datay\":\"230\",\"class\":\"\",\"dataspeed\":\"300\",\"datastart\":\"1100\",\"incomanimation\":\"sft\",\"outgoanimation\":\"stt\",\"easing\":\"easeOutBack\",\"endeasing\":\"easeOutBack\",\"image_1\":\"21_1.png\",\"image_2\":\"21_1.png\"}');
/*!40000 ALTER TABLE `ps_csslider_caption` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_csslider_shop` WRITE;
/*!40000 ALTER TABLE `ps_csslider_shop` DISABLE KEYS */;
INSERT INTO `ps_csslider_shop` VALUES (6,1,'#','{\"transitions\":\"slidehorizontal\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_1.jpg\"}',0,1),(6,2,'#','{\"transitions\":\"slidehorizontal\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_1.jpg\"}',0,1),(6,3,'#','{\"transitions\":\"slidehorizontal\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_1.jpg\"}',0,1),(6,4,'#','{\"transitions\":\"slidehorizontal\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_1.jpg\"}',0,1),(6,5,'#','{\"transitions\":\"slidehorizontal\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_1.jpg\"}',0,1),(7,1,'#','{\"transitions\":\"curtain-1\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9400\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_7.jpg\"}',1,1),(7,2,'#','{\"transitions\":\"curtain-1\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9400\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_7.jpg\"}',1,1),(7,3,'#','{\"transitions\":\"curtain-1\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9400\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_7.jpg\"}',1,1),(7,4,'#','{\"transitions\":\"curtain-1\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9400\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_7.jpg\"}',1,1),(7,5,'#','{\"transitions\":\"curtain-1\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9400\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_7.jpg\"}',1,1),(8,1,'#','{\"transitions\":\"slotslide-vertical\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_8.jpg\"}',2,1),(8,2,'#','{\"transitions\":\"slotslide-vertical\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_8.jpg\"}',2,1),(8,3,'#','{\"transitions\":\"slotslide-vertical\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_8.jpg\"}',2,1),(8,4,'#','{\"transitions\":\"slotslide-vertical\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_8.jpg\"}',2,1),(8,5,'#','{\"transitions\":\"slotslide-vertical\",\"slotamount\":\"7\",\"masterspeed\":\"300\",\"target\":\"_self\",\"delay\":\"9000\",\"enablelink\":\"1\",\"enablefullvideo\":\"1\"}','{\"type\":\"image\",\"value\":\"1_8.jpg\"}',2,1);
/*!40000 ALTER TABLE `ps_csslider_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_currency` WRITE;
/*!40000 ALTER TABLE `ps_currency` DISABLE KEYS */;
INSERT INTO `ps_currency` VALUES (1,'Dollar','USD','840','$',0,1,1,1.000000,0,1),(2,'Euro','EUR','978','€',1,2,1,0.794281,0,1);
/*!40000 ALTER TABLE `ps_currency` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_currency_shop` WRITE;
/*!40000 ALTER TABLE `ps_currency_shop` DISABLE KEYS */;
INSERT INTO `ps_currency_shop` VALUES (1,1,1.000000),(1,2,1.000000),(1,3,1.000000),(1,4,1.000000),(1,5,1.000000),(2,1,0.794281),(2,2,0.794281),(2,3,0.794281),(2,4,0.794281),(2,5,0.794281);
/*!40000 ALTER TABLE `ps_currency_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_customer` WRITE;
/*!40000 ALTER TABLE `ps_customer` DISABLE KEYS */;
INSERT INTO `ps_customer` VALUES (1,1,1,1,3,1,0,'','','','John','DOE','pub@prestashop.com','1b058b27502920eedd34397e1a6d9fd3','2013-06-17 14:24:45','1970-01-15',1,'','2013-06-18 03:24:45',1,'',0.000000,0,0,'356b5e1e6ff8ac596c77e5062d481d3a','',1,0,0,'2013-06-18 03:24:45','2013-06-18 03:24:45'),(2,1,1,0,3,2,0,NULL,NULL,NULL,'anh','nguyen','demo@gmail.com','c534006b24478f6cbd39cb8dba19630b','2013-06-20 15:00:42','0000-00-00',0,NULL,'0000-00-00 00:00:00',0,NULL,0.000000,0,0,'3535fcd47c048f9466e2372e7fac49b2',NULL,1,0,0,'2013-06-21 04:00:42','2013-07-21 22:16:53'),(3,1,1,3,3,1,0,NULL,NULL,NULL,'Duyen','Nguyen','duyennguyen@codespot.vn','1b058b27502920eedd34397e1a6d9fd3','2013-06-26 16:33:28','0000-00-00',0,NULL,'0000-00-00 00:00:00',0,NULL,0.000000,0,0,'42bf96bf3373fe56914f978e3087e1ea',NULL,1,0,0,'2013-06-27 05:33:28','2013-07-07 23:08:20'),(4,1,1,0,3,1,0,NULL,NULL,NULL,'anhn','nguyen','demo123@gmail.com','c534006b24478f6cbd39cb8dba19630b','2013-07-11 16:34:06','0000-00-00',0,NULL,'0000-00-00 00:00:00',0,NULL,0.000000,0,0,'d7b950100f28b1555b036b315a6764d9',NULL,1,0,0,'2013-07-12 05:34:06','2013-07-12 05:34:06');
/*!40000 ALTER TABLE `ps_customer` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_customer_group` WRITE;
/*!40000 ALTER TABLE `ps_customer_group` DISABLE KEYS */;
INSERT INTO `ps_customer_group` VALUES (1,3),(2,3),(3,3),(4,3);
/*!40000 ALTER TABLE `ps_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_customer_message` WRITE;
/*!40000 ALTER TABLE `ps_customer_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_customer_message` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_customer_message_sync_imap` WRITE;
/*!40000 ALTER TABLE `ps_customer_message_sync_imap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_customer_message_sync_imap` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_customer_thread` WRITE;
/*!40000 ALTER TABLE `ps_customer_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_customer_thread` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_customization` WRITE;
/*!40000 ALTER TABLE `ps_customization` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_customization` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_customization_field` WRITE;
/*!40000 ALTER TABLE `ps_customization_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_customization_field` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_customization_field_lang` WRITE;
/*!40000 ALTER TABLE `ps_customization_field_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_customization_field_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_customized_data` WRITE;
/*!40000 ALTER TABLE `ps_customized_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_customized_data` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_date_range` WRITE;
/*!40000 ALTER TABLE `ps_date_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_date_range` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_delivery` WRITE;
/*!40000 ALTER TABLE `ps_delivery` DISABLE KEYS */;
INSERT INTO `ps_delivery` VALUES (1,1,1,2,1,0,1,0.000000),(2,1,1,2,1,0,2,0.000000),(3,1,1,2,0,1,1,0.000000),(4,1,1,2,0,1,2,0.000000),(5,NULL,NULL,2,0,1,1,5.000000),(6,NULL,NULL,2,0,1,2,5.000000),(7,NULL,NULL,2,1,0,1,5.000000),(8,NULL,NULL,2,1,0,2,5.000000);
/*!40000 ALTER TABLE `ps_delivery` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_employee` WRITE;
/*!40000 ALTER TABLE `ps_employee` DISABLE KEYS */;
INSERT INTO `ps_employee` VALUES (1,1,1,'Nguyen','Anh','prestashop@codespot.vn','a104b8fa35cca8bc0ebedeb170844300','2013-06-17 14:24:13','2013-06-18','2013-06-18',NULL,'default',0,0,1,1,0,0,0);
/*!40000 ALTER TABLE `ps_employee` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_employee_shop` WRITE;
/*!40000 ALTER TABLE `ps_employee_shop` DISABLE KEYS */;
INSERT INTO `ps_employee_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5);
/*!40000 ALTER TABLE `ps_employee_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_favorite_product` WRITE;
/*!40000 ALTER TABLE `ps_favorite_product` DISABLE KEYS */;
INSERT INTO `ps_favorite_product` VALUES (1,18,3,1,'2013-07-15 02:47:17','2013-07-15 02:47:17');
/*!40000 ALTER TABLE `ps_favorite_product` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_feature` WRITE;
/*!40000 ALTER TABLE `ps_feature` DISABLE KEYS */;
INSERT INTO `ps_feature` VALUES (1,0),(2,1),(3,3),(4,2),(5,4);
/*!40000 ALTER TABLE `ps_feature` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_feature_lang` WRITE;
/*!40000 ALTER TABLE `ps_feature_lang` DISABLE KEYS */;
INSERT INTO `ps_feature_lang` VALUES (1,1,'Height'),(1,2,'Height'),(2,1,'Width'),(2,2,'Width'),(3,1,'Depth'),(3,2,'Depth'),(4,1,'Weight'),(4,2,'Weight'),(5,1,'Headphone'),(5,2,'Headphone');
/*!40000 ALTER TABLE `ps_feature_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_feature_product` WRITE;
/*!40000 ALTER TABLE `ps_feature_product` DISABLE KEYS */;
INSERT INTO `ps_feature_product` VALUES (1,8,15),(1,17,15),(1,18,15),(1,19,15),(1,20,15),(1,21,15),(1,22,15),(1,23,15),(1,24,15),(1,25,15),(1,26,15),(1,27,15),(1,28,15),(1,29,15),(1,30,15),(1,31,15),(1,32,15),(1,33,15),(1,34,15),(1,35,15),(1,36,15),(1,37,15),(1,38,15),(1,39,15),(1,40,15),(1,41,15),(1,42,15),(1,43,15),(2,8,16),(2,17,16),(2,18,16),(2,19,16),(2,20,16),(2,21,16),(2,22,16),(2,23,16),(2,24,16),(2,25,16),(2,26,16),(2,27,16),(2,28,16),(2,29,16),(2,30,16),(2,31,16),(2,32,16),(2,33,16),(2,34,16),(2,35,16),(2,36,16),(2,37,16),(2,38,16),(2,39,16),(2,40,16),(2,41,16),(2,42,16),(2,43,16),(3,8,18),(3,17,18),(3,18,18),(3,19,18),(3,20,18),(3,21,18),(3,22,18),(3,23,18),(3,24,18),(3,25,18),(3,26,18),(3,27,18),(3,28,18),(3,29,18),(3,30,18),(3,31,18),(3,32,18),(3,33,18),(3,34,18),(3,35,18),(3,36,18),(3,37,18),(3,38,18),(3,39,18),(3,40,18),(3,41,18),(3,42,18),(3,43,18),(4,8,17),(4,17,17),(4,18,17),(4,19,17),(4,20,17),(4,21,17),(4,22,17),(4,23,17),(4,24,17),(4,25,17),(4,26,17),(4,27,17),(4,28,17),(4,29,17),(4,30,17),(4,31,17),(4,32,17),(4,33,17),(4,34,17),(4,35,17),(4,36,17),(4,37,17),(4,38,17),(4,39,17),(4,40,17),(4,41,17),(4,42,17),(4,43,17),(5,8,1),(5,17,1),(5,18,1),(5,19,1),(5,20,1),(5,21,1),(5,22,1),(5,23,1),(5,24,1),(5,25,1),(5,26,1),(5,27,1),(5,28,1),(5,29,1),(5,30,1),(5,31,1),(5,32,1),(5,33,1),(5,34,1),(5,35,1),(5,36,1),(5,37,1),(5,38,1),(5,39,1),(5,40,1),(5,41,1),(5,42,1),(5,43,1);
/*!40000 ALTER TABLE `ps_feature_product` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_feature_shop` WRITE;
/*!40000 ALTER TABLE `ps_feature_shop` DISABLE KEYS */;
INSERT INTO `ps_feature_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5);
/*!40000 ALTER TABLE `ps_feature_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_feature_value` WRITE;
/*!40000 ALTER TABLE `ps_feature_value` DISABLE KEYS */;
INSERT INTO `ps_feature_value` VALUES (1,5,0),(2,5,0),(3,1,1),(4,2,1),(5,4,1),(6,3,1),(7,1,1),(8,2,1),(9,4,1),(10,3,1),(11,1,1),(12,2,1),(13,4,1),(14,3,1),(15,1,0),(16,2,0),(17,4,0),(18,3,0),(19,4,0);
/*!40000 ALTER TABLE `ps_feature_value` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_feature_value_lang` WRITE;
/*!40000 ALTER TABLE `ps_feature_value_lang` DISABLE KEYS */;
INSERT INTO `ps_feature_value_lang` VALUES (1,1,'Jack stereo'),(1,2,'Jack stereo'),(2,1,'Mini-jack stereo'),(2,2,'Mini-jack stereo'),(3,1,'2.75 in'),(3,2,'2.75 in'),(4,1,'2.06 in'),(4,2,'2.06 in'),(5,1,'49.2 g'),(5,2,'49.2 g'),(6,1,'0.26 in'),(6,2,'0.26 in'),(7,1,'1.07 in'),(7,2,'1.07 in'),(8,1,'1.62 in'),(8,2,'1.62 in'),(9,1,'15.5 g'),(9,2,'15.5 g'),(10,1,'0.41 in (clip included)'),(10,2,'0.41 in (clip included)'),(11,1,'4.33 in'),(11,2,'4.33 in'),(12,1,'2.76 in'),(12,2,'2.76 in'),(13,1,'120g'),(13,2,'120g'),(14,1,'0.31 in'),(14,2,'0.31 in'),(15,1,'Medium'),(15,2,'Medium'),(16,1,'Etiam eu tortor nisi id dignissim ligula. Mauris consectetur tempus enim et aliquam sem interdum sit amet.'),(16,2,'Etiam eu tortor nisi id dignissim ligula. Mauris consectetur tempus enim et aliquam sem interdum sit amet.'),(17,1,'lLcus vel convallis nisl sapien sit amet turpis.'),(17,2,'lLcus vel convallis nisl sapien sit amet turpis.'),(18,1,'consectetur tempus enim et aliquam sem interdum sit amet.'),(18,2,'consectetur tempus enim et aliquam sem interdum sit amet.'),(19,1,'Sed condimentum augue pharetra necous tincidunt nisl hendrerit.'),(19,2,'Sed condimentum augue pharetra necous tincidunt nisl hendrerit.');
/*!40000 ALTER TABLE `ps_feature_value_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_gender` WRITE;
/*!40000 ALTER TABLE `ps_gender` DISABLE KEYS */;
INSERT INTO `ps_gender` VALUES (1,0),(2,1),(3,1);
/*!40000 ALTER TABLE `ps_gender` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_gender_lang` WRITE;
/*!40000 ALTER TABLE `ps_gender_lang` DISABLE KEYS */;
INSERT INTO `ps_gender_lang` VALUES (1,1,'Mr.'),(1,2,'Mr.'),(2,1,'Ms.'),(2,2,'Ms.'),(3,1,'Miss'),(3,2,'Miss');
/*!40000 ALTER TABLE `ps_gender_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_group` WRITE;
/*!40000 ALTER TABLE `ps_group` DISABLE KEYS */;
INSERT INTO `ps_group` VALUES (1,0.00,1,1,'2013-06-18 03:23:27','2013-06-18 03:23:50'),(2,0.00,1,1,'2013-06-18 03:23:28','2013-06-18 03:23:50'),(3,0.00,1,1,'2013-06-18 03:23:28','2013-06-18 03:23:50');
/*!40000 ALTER TABLE `ps_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_group_lang` WRITE;
/*!40000 ALTER TABLE `ps_group_lang` DISABLE KEYS */;
INSERT INTO `ps_group_lang` VALUES (1,1,'Visitor'),(1,2,'Visitor'),(2,1,'Guest'),(2,2,'Guest'),(3,1,'Customer'),(3,2,'Customer');
/*!40000 ALTER TABLE `ps_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_group_reduction` WRITE;
/*!40000 ALTER TABLE `ps_group_reduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_group_reduction` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_group_shop` WRITE;
/*!40000 ALTER TABLE `ps_group_shop` DISABLE KEYS */;
INSERT INTO `ps_group_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5);
/*!40000 ALTER TABLE `ps_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_guest` WRITE;
/*!40000 ALTER TABLE `ps_guest` DISABLE KEYS */;
INSERT INTO `ps_guest` VALUES (1,0,0,1,1,1680,1050,32,1,1,0,1,1,0,'en-us',0),(2,3,10,2,0,0,0,0,0,0,0,0,0,0,'',0),(3,3,3,3,0,0,0,0,0,0,0,0,0,0,'',0),(4,3,6,0,0,0,0,0,0,0,0,0,0,0,'',0),(5,3,3,0,0,0,0,0,0,0,0,0,0,0,'',0),(6,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(7,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(8,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(9,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(10,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(11,3,3,0,0,0,0,0,0,0,0,0,0,0,'',0),(12,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(13,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(14,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(15,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(16,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(17,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(18,3,7,0,0,0,0,0,0,0,0,0,0,0,'',0),(19,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(22,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(23,3,3,0,0,0,0,0,0,0,0,0,0,0,'',0),(24,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(25,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(26,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(27,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(28,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(29,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(31,3,7,0,0,0,0,0,0,0,0,0,0,0,'',0),(32,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(33,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(34,3,3,0,0,0,0,0,0,0,0,0,0,0,'',0),(35,3,3,0,0,0,0,0,0,0,0,0,0,0,'',0),(36,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(37,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(38,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(40,3,7,4,0,0,0,0,0,0,0,0,0,0,'',0),(41,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(42,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(44,3,3,0,0,0,0,0,0,0,0,0,0,0,'',0),(45,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(46,3,7,0,0,0,0,0,0,0,0,0,0,0,'',0),(48,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(49,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(50,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(51,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(52,5,1,0,0,0,0,0,0,0,0,0,0,0,'',1),(54,3,7,0,0,0,0,0,0,0,0,0,0,0,'',0),(55,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(56,3,3,0,0,0,0,0,0,0,0,0,0,0,'',0),(58,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(59,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(60,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(61,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(62,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(63,3,3,0,0,0,0,0,0,0,0,0,0,0,'',0),(64,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(65,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(66,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(67,3,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(68,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(69,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(70,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(71,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(72,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(73,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(75,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(76,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(77,5,1,0,0,0,0,0,0,0,0,0,0,0,'',0),(78,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(79,3,9,0,0,0,0,0,0,0,0,0,0,0,'',0),(80,3,3,0,0,0,0,0,0,0,0,0,0,0,'',0),(81,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(82,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(83,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(84,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(85,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(86,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(87,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(88,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(89,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(90,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(91,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(92,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(93,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(94,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(95,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0),(96,3,10,0,0,0,0,0,0,0,0,0,0,0,'',0);
/*!40000 ALTER TABLE `ps_guest` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_help_access` WRITE;
/*!40000 ALTER TABLE `ps_help_access` DISABLE KEYS */;
INSERT INTO `ps_help_access` VALUES (1,'AdminModules','13051319');
/*!40000 ALTER TABLE `ps_help_access` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_hook` WRITE;
/*!40000 ALTER TABLE `ps_hook` DISABLE KEYS */;
INSERT INTO `ps_hook` VALUES (1,'displayPayment','Payment','This hook displays new elements on the payment page',1,1),(2,'actionValidateOrder','New orders','',1,0),(3,'actionPaymentConfirmation','Payment confirmation','This hook displays new elements after the payment is validated',1,0),(4,'displayPaymentReturn','Payment return','',1,0),(5,'actionUpdateQuantity','Quantity update','Quantity is updated only when a customer effectively places their order',1,0),(6,'displayRightColumn','Right column blocks','This hook displays new elements in the right-hand column',1,1),(7,'displayLeftColumn','Left column blocks','This hook displays new elements in the left-hand column',1,1),(8,'displayHome','Homepage content','This hook displays new elements on the homepage',1,1),(9,'displayHeader','Pages header','This hook displays additional elements in the header of your pages',1,0),(10,'actionCartSave','Cart creation and update','This hook is displayed when a product is added to the cart or if the cart\'s content is modified',1,0),(11,'actionAuthentication','Successful customer authentication','This hook is displayed after a customer successfully signs in',1,0),(12,'actionProductAdd','Product creation','This hook is displayed after a product is created',1,0),(13,'actionProductUpdate','Product update','This hook is displayed after a product has been updated',1,0),(14,'displayTop','Top of pages','This hook displays  additional elements at the top of your pages',1,0),(15,'displayRightColumnProduct','New elements on the product page (right column)','This hook displays new elements in the right-hand column of the product page',1,0),(16,'actionProductDelete','Product deletion','This hook is called when a product is deleted',1,0),(17,'displayFooterProduct','Product footer','This hook adds new blocks under the product\'s description',1,1),(18,'displayInvoice','Invoice','This hook displays new blocks on the invoice (order)',1,0),(19,'actionOrderStatusUpdate','Order status update - Event','This hook launches modules when the status of an order changes.',1,0),(20,'displayAdminOrder','Display new elements in the Back Office, tab AdminOrder','This hook launches modules when the AdminOrder\" tab is displayed in the Back Office\"',1,0),(21,'displayFooter','Footer','This hook displays new blocks in the footer',1,0),(22,'displayPDFInvoice','PDF Invoice','This hook allows you to display additional information on PDF invoices',1,0),(23,'displayAdminCustomers','Display new elements in the Back Office, tab AdminCustomers','This hook launches modules when the AdminCustomers\" tab is displayed in the Back Office\"',1,0),(24,'displayOrderConfirmation','Order confirmation page','This hook is called within an order\'s confirmation page',1,0),(25,'actionCustomerAccountAdd','Successful customer account creation','This hook is called when a new customer creates an account successfully',1,0),(26,'displayCustomerAccount','Customer account displayed in Front Office','This hook displays new elements on the customer account page',1,0),(27,'actionOrderSlipAdd','Order slip creation','This hook is called when a product\'s quantity is modified',1,0),(28,'displayProductTab','Tabs on product page','This hook is called on the product page\'s tab',1,0),(29,'displayProductTabContent','Tabs content on the product page','This hook is called on the product page\'s tab',1,0),(30,'displayShoppingCartFooter','Shopping cart footer','This hook displays some specific information on the shopping cart\'s page',1,0),(31,'displayCustomerAccountForm','Customer account creation form','This hook displays some information on the form to create a customer account',1,0),(32,'displayAdminStatsModules','Stats - Modules','',1,0),(33,'displayAdminStatsGraphEngine','Graph engines','',1,0),(34,'actionOrderReturn','Returned product','This hook is displayed when a customer returns a product ',1,0),(35,'displayProductButtons','Product page actions','This hook adds new action buttons on the product page',1,0),(36,'displayBackOfficeHome','Administration panel homepage','This hook is displayed on the admin panel\'s homepage',1,0),(37,'displayAdminStatsGridEngine','Grid engines','',1,0),(38,'actionWatermark','Watermark','',1,0),(39,'actionProductCancel','Product cancelled','This hook is called when you cancel a product in an order',1,0),(40,'displayLeftColumnProduct','New elements on the product page (left column)','This hook displays new elements in the left-hand column of the product page',1,0),(41,'actionProductOutOfStock','Out-of-stock product','This hook displays new action buttons if a product is out of stock',1,0),(42,'actionProductAttributeUpdate','Product attribute update','This hook is displayed when a product\'s attribute is updated',1,0),(43,'displayCarrierList','Extra carrier (module mode)','',1,0),(44,'displayShoppingCart','Shopping cart - Additional button','This hook displays new action buttons within the shopping cart',1,0),(45,'actionSearch','Search','',1,0),(46,'displayBeforePayment','Redirect during the order process','This hook redirects the user to the module instead of displaying payment modules',1,0),(47,'actionCarrierUpdate','Carrier Update','This hook is called when a carrier is updated',1,0),(48,'actionOrderStatusPostUpdate','Post update of order status','',1,0),(49,'displayCustomerAccountFormTop','Block above the form for create an account','This hook is displayed above the customer\'s account creation form',1,0),(50,'displayBackOfficeHeader','Administration panel header','This hook is displayed in the header of the admin panel',1,0),(51,'displayBackOfficeTop','Administration panel hover the tabs','This hook is displayed on the roll hover of the tabs within the admin panel',1,0),(52,'displayBackOfficeFooter','Administration panel footer','This hook is displayed within the admin panel\'s footer',1,0),(53,'actionProductAttributeDelete','Product attribute deletion','This hook is displayed when a product\'s attribute is deleted',1,0),(54,'actionCarrierProcess','Carrier process','',1,0),(55,'actionOrderDetail','Order detail','This hook is used to set the follow-up in Smarty when an order\'s detail is called',1,0),(56,'displayBeforeCarrier','Before carriers list','This hook is displayed before the carrier list in Front Office',1,0),(57,'displayOrderDetail','Order detail','This hook is displayed within the order\'s details in Front Office',1,0),(58,'actionPaymentCCAdd','Payment CC added','',1,0),(59,'displayProductComparison','Extra product comparison','',1,0),(60,'actionCategoryAdd','Category creation','This hook is displayed when a category is created',1,0),(61,'actionCategoryUpdate','Category modification','This hook is displayed when a category is modified',1,0),(62,'actionCategoryDelete','Category deletion','This hook is displayed when a category is deleted',1,0),(63,'actionBeforeAuthentication','Before authentication','This hook is displayed before the customer\'s authentication',1,0),(64,'displayPaymentTop','Top of payment page','This hook is displayed at the top of the payment page',1,0),(65,'actionHtaccessCreate','After htaccess creation','This hook is displayed after the htaccess creation',1,0),(66,'actionAdminMetaSave','After saving the configuration in AdminMeta','This hook is displayed after saving the configuration in AdminMeta',1,0),(67,'displayAttributeGroupForm','Add fields to the form \'attribute group\'','This hook adds fields to the form \'attribute group\'',1,0),(68,'actionAttributeGroupSave','Saving an attribute group','This hook is called while saving an attributes group',1,0),(69,'actionAttributeGroupDelete','Deleting attribute group','This hook is called while deleting an attributes  group',1,0),(70,'displayFeatureForm','Add fields to the form \'feature\'','This hook adds fields to the form \'feature\'',1,0),(71,'actionFeatureSave','Saving attributes\' features','This hook is called while saving an attributes features',1,0),(72,'actionFeatureDelete','Deleting attributes\' features','This hook is called while deleting an attributes features',1,0),(73,'actionProductSave','Saving products','This hook is called while saving products',1,0),(74,'actionProductListOverride','Assign a products list to a category','This hook assigns a products list to a category',1,0),(75,'displayAttributeGroupPostProcess','On post-process in admin attribute group','This hook is called on post-process in admin attribute group',1,0),(76,'displayFeaturePostProcess','On post-process in admin feature','This hook is called on post-process in admin feature',1,0),(77,'displayFeatureValueForm','Add fields to the form \'feature value\'','This hook adds fields to the form \'feature value\'',1,0),(78,'displayFeatureValuePostProcess','On post-process in admin feature value','This hook is called on post-process in admin feature value',1,0),(79,'actionFeatureValueDelete','Deleting attributes\' features\' values','This hook is called while deleting an attributes features value',1,0),(80,'actionFeatureValueSave','Saving an attributes features value','This hook is called while saving an attributes features value',1,0),(81,'displayAttributeForm','Add fields to the form \'attribute value\'','This hook adds fields to the form \'attribute value\'',1,0),(82,'actionAttributePostProcess','On post-process in admin feature value','This hook is called on post-process in admin feature value',1,0),(83,'actionAttributeDelete','Deleting an attributes features value','This hook is called while deleting an attributes features value',1,0),(84,'actionAttributeSave','Saving an attributes features value','This hook is called while saving an attributes features value',1,0),(85,'actionTaxManager','Tax Manager Factory','',1,0),(87,'actionModuleInstallBefore','actionModuleInstallBefore','',1,0),(88,'actionModuleInstallAfter','actionModuleInstallAfter','',1,0),(89,'actionAdminMetaControllerUpdate_optionsBefore','actionAdminMetaControllerUpdate_optionsBefore','',0,0),(90,'actionAdminLanguagesControllerStatusBefore','actionAdminLanguagesControllerStatusBefore','',0,0),(91,'actionShopDataDuplication','actionShopDataDuplication','',0,0),(92,'actionBeforeSubmitAccount','actionBeforeSubmitAccount','',0,0),(95,'displayMobileTopSiteMap','displayMobileTopSiteMap','',0,0),(96,'actionObjectCategoryUpdateAfter','actionObjectCategoryUpdateAfter','',0,0),(97,'actionObjectCategoryDeleteAfter','actionObjectCategoryDeleteAfter','',0,0),(98,'actionObjectCmsUpdateAfter','actionObjectCmsUpdateAfter','',0,0),(99,'actionObjectCmsDeleteAfter','actionObjectCmsDeleteAfter','',0,0),(100,'actionObjectSupplierUpdateAfter','actionObjectSupplierUpdateAfter','',0,0),(101,'actionObjectSupplierDeleteAfter','actionObjectSupplierDeleteAfter','',0,0),(102,'actionObjectManufacturerUpdateAfter','actionObjectManufacturerUpdateAfter','',0,0),(103,'actionObjectManufacturerDeleteAfter','actionObjectManufacturerDeleteAfter','',0,0),(104,'actionObjectProductUpdateAfter','actionObjectProductUpdateAfter','',0,0),(105,'actionObjectProductDeleteAfter','actionObjectProductDeleteAfter','',0,0),(106,'actionAdminMetaControllerUpdate_optionsAfter','actionAdminMetaControllerUpdate_optionsAfter','',0,0),(107,'actionAdminPerformanceControllerSaveAfter','actionAdminPerformanceControllerSaveAfter','',0,0),(108,'actionObjectCarrierAddAfter','actionObjectCarrierAddAfter','',0,0),(109,'actionObjectProductAddAfter','actionObjectProductAddAfter','',0,0),(110,'actionAdminStoresControllerUpdate_optionsAfter','actionAdminStoresControllerUpdate_optionsAfter','',0,0),(111,'actionObjectContactAddAfter','actionObjectContactAddAfter','',0,0),(112,'actionAdminThemesControllerUpdate_optionsAfter','actionAdminThemesControllerUpdate_optionsAfter','',0,0),(113,'actionObjectThemeAddAfter','actionObjectThemeAddAfter','',0,0),(114,'actionAdminPreferencesControllerUpdate_optionsAfter','actionAdminPreferencesControllerUpdate_optionsAfter','',0,0),(115,'actionObjectShopAddAfter','actionObjectShopAddAfter','',0,0),(116,'actionObjectShopGroupAddAfter','actionObjectShopGroupAddAfter','',0,0),(117,'actionObjectCartAddAfter','actionObjectCartAddAfter','',0,0),(118,'actionObjectOrderAddAfter','actionObjectOrderAddAfter','',0,0),(119,'actionObjectCustomerThreadAddAfter','actionObjectCustomerThreadAddAfter','',0,0),(120,'actionObjectCustomerAddAfter','actionObjectCustomerAddAfter','',0,0),(121,'actionObjectEmployeeAddAfter','actionObjectEmployeeAddAfter','',0,0),(122,'actionObjectImageAddAfter','actionObjectImageAddAfter','',0,0),(123,'actionObjectCMSAddAfter','actionObjectCMSAddAfter','',0,0),(124,'actionObjectCartRuleAddAfter','actionObjectCartRuleAddAfter','',0,0),(125,'csslideshow','csslideshow','',1,0),(126,'csmegamenu','csmegamenu','',0,0),(127,'homebottom','homebottom','',1,0),(128,'footertop','footertop','',1,0),(129,'footerbottom','footerbottom','',1,0);
/*!40000 ALTER TABLE `ps_hook` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_hook_alias` WRITE;
/*!40000 ALTER TABLE `ps_hook_alias` DISABLE KEYS */;
INSERT INTO `ps_hook_alias` VALUES (1,'payment','displayPayment'),(2,'newOrder','actionValidateOrder'),(3,'paymentConfirm','actionPaymentConfirmation'),(4,'paymentReturn','displayPaymentReturn'),(5,'updateQuantity','actionUpdateQuantity'),(6,'rightColumn','displayRightColumn'),(7,'leftColumn','displayLeftColumn'),(8,'home','displayHome'),(9,'header','displayHeader'),(10,'cart','actionCartSave'),(11,'authentication','actionAuthentication'),(12,'addproduct','actionProductAdd'),(13,'updateproduct','actionProductUpdate'),(14,'top','displayTop'),(15,'extraRight','displayRightColumnProduct'),(16,'deleteproduct','actionProductDelete'),(17,'productfooter','displayFooterProduct'),(18,'invoice','displayInvoice'),(19,'updateOrderStatus','actionOrderStatusUpdate'),(20,'adminOrder','displayAdminOrder'),(21,'footer','displayFooter'),(22,'PDFInvoice','displayPDFInvoice'),(23,'adminCustomers','displayAdminCustomers'),(24,'orderConfirmation','displayOrderConfirmation'),(25,'createAccount','actionCustomerAccountAdd'),(26,'customerAccount','displayCustomerAccount'),(27,'orderSlip','actionOrderSlipAdd'),(28,'productTab','displayProductTab'),(29,'productTabContent','displayProductTabContent'),(30,'shoppingCart','displayShoppingCartFooter'),(31,'createAccountForm','displayCustomerAccountForm'),(32,'AdminStatsModules','displayAdminStatsModules'),(33,'GraphEngine','displayAdminStatsGraphEngine'),(34,'orderReturn','actionOrderReturn'),(35,'productActions','displayProductButtons'),(36,'backOfficeHome','displayBackOfficeHome'),(37,'GridEngine','displayAdminStatsGridEngine'),(38,'watermark','actionWatermark'),(39,'cancelProduct','actionProductCancel'),(40,'extraLeft','displayLeftColumnProduct'),(41,'productOutOfStock','actionProductOutOfStock'),(42,'updateProductAttribute','actionProductAttributeUpdate'),(43,'extraCarrier','displayCarrierList'),(44,'shoppingCartExtra','displayShoppingCart'),(45,'search','actionSearch'),(46,'backBeforePayment','displayBeforePayment'),(47,'updateCarrier','actionCarrierUpdate'),(48,'postUpdateOrderStatus','actionOrderStatusPostUpdate'),(49,'createAccountTop','displayCustomerAccountFormTop'),(50,'backOfficeHeader','displayBackOfficeHeader'),(51,'backOfficeTop','displayBackOfficeTop'),(52,'backOfficeFooter','displayBackOfficeFooter'),(53,'deleteProductAttribute','actionProductAttributeDelete'),(54,'processCarrier','actionCarrierProcess'),(55,'orderDetail','actionOrderDetail'),(56,'beforeCarrier','displayBeforeCarrier'),(57,'orderDetailDisplayed','displayOrderDetail'),(58,'paymentCCAdded','actionPaymentCCAdd'),(59,'extraProductComparison','displayProductComparison'),(60,'categoryAddition','actionCategoryAdd'),(61,'categoryUpdate','actionCategoryUpdate'),(62,'categoryDeletion','actionCategoryDelete'),(63,'beforeAuthentication','actionBeforeAuthentication'),(64,'paymentTop','displayPaymentTop'),(65,'afterCreateHtaccess','actionHtaccessCreate'),(66,'afterSaveAdminMeta','actionAdminMetaSave'),(67,'attributeGroupForm','displayAttributeGroupForm'),(68,'afterSaveAttributeGroup','actionAttributeGroupSave'),(69,'afterDeleteAttributeGroup','actionAttributeGroupDelete'),(70,'featureForm','displayFeatureForm'),(71,'afterSaveFeature','actionFeatureSave'),(72,'afterDeleteFeature','actionFeatureDelete'),(73,'afterSaveProduct','actionProductSave'),(74,'productListAssign','actionProductListOverride'),(75,'postProcessAttributeGroup','displayAttributeGroupPostProcess'),(76,'postProcessFeature','displayFeaturePostProcess'),(77,'featureValueForm','displayFeatureValueForm'),(78,'postProcessFeatureValue','displayFeatureValuePostProcess'),(79,'afterDeleteFeatureValue','actionFeatureValueDelete'),(80,'afterSaveFeatureValue','actionFeatureValueSave'),(81,'attributeForm','displayAttributeForm'),(82,'postProcessAttribute','actionAttributePostProcess'),(83,'afterDeleteAttribute','actionAttributeDelete'),(84,'afterSaveAttribute','actionAttributeSave'),(85,'taxManager','actionTaxManager'),(86,'myAccountBlock','displayMyAccountBlock');
/*!40000 ALTER TABLE `ps_hook_alias` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_hook_module` WRITE;
/*!40000 ALTER TABLE `ps_hook_module` DISABLE KEYS */;
INSERT INTO `ps_hook_module` VALUES (1,1,9,1),(1,2,9,1),(1,3,9,1),(1,4,9,1),(1,5,9,1),(1,1,30,1),(1,2,30,1),(1,3,30,1),(1,4,30,1),(1,5,30,1),(3,1,7,4),(3,2,7,4),(3,3,7,4),(3,4,7,4),(3,5,7,4),(4,1,6,1),(4,2,6,1),(4,3,6,1),(4,4,6,1),(4,5,6,1),(4,1,8,5),(4,2,8,5),(4,3,8,5),(4,4,8,5),(4,5,8,5),(4,1,9,2),(4,2,9,2),(4,3,9,2),(4,4,9,2),(4,5,9,2),(4,1,19,1),(4,2,19,1),(4,3,19,1),(4,4,19,1),(4,5,19,1),(5,1,9,4),(5,2,9,4),(5,3,9,4),(5,4,9,4),(5,5,9,4),(5,1,14,7),(5,2,14,7),(5,3,14,7),(5,4,14,7),(5,5,14,7),(7,1,9,11),(7,2,9,11),(7,3,9,11),(7,4,9,11),(7,5,9,11),(7,1,21,3),(7,2,21,3),(7,3,21,3),(7,4,21,3),(7,5,21,3),(7,1,91,1),(7,2,91,1),(7,3,91,1),(7,4,91,1),(7,5,91,1),(8,1,6,3),(8,2,6,3),(8,3,6,3),(8,4,6,3),(8,5,6,3),(8,1,9,5),(8,2,9,5),(8,3,9,5),(8,4,9,5),(8,5,9,5),(9,1,9,15),(9,2,9,15),(9,3,9,15),(9,4,9,15),(9,5,9,15),(9,1,21,4),(9,2,21,4),(9,3,21,4),(9,4,21,4),(9,5,21,4),(10,1,9,8),(10,2,9,8),(10,3,9,8),(10,4,9,8),(10,5,9,8),(10,1,14,3),(10,2,14,3),(10,3,14,3),(10,4,14,3),(10,5,14,3),(11,1,9,6),(11,2,9,6),(11,3,9,6),(11,4,9,6),(11,5,9,6),(11,1,31,1),(11,2,31,1),(11,3,31,1),(11,4,31,1),(11,5,31,1),(11,1,92,1),(11,2,92,1),(11,3,92,1),(11,4,92,1),(11,5,92,1),(12,1,9,9),(12,2,9,9),(12,3,9,9),(12,4,9,9),(12,5,9,9),(12,1,14,4),(12,2,14,4),(12,3,14,4),(12,4,14,4),(12,5,14,4),(13,1,7,2),(13,2,7,2),(13,3,7,2),(13,4,7,2),(13,5,7,2),(13,1,9,10),(13,2,9,10),(13,3,9,10),(13,4,9,10),(13,5,9,10),(17,1,7,3),(17,2,7,3),(17,3,7,3),(17,4,7,3),(17,5,7,3),(17,1,9,18),(17,2,9,18),(17,3,9,18),(17,4,9,18),(17,5,9,18),(19,1,9,3),(19,2,9,3),(19,3,9,3),(19,4,9,3),(19,5,9,3),(19,1,14,2),(19,2,14,2),(19,3,14,2),(19,4,14,2),(19,5,14,2),(21,1,9,14),(21,2,9,14),(21,3,9,14),(21,4,9,14),(21,5,9,14),(21,1,14,5),(21,2,14,5),(21,3,14,5),(21,4,14,5),(21,5,14,5),(21,1,95,1),(21,2,95,1),(21,3,95,1),(21,4,95,1),(21,5,95,1),(22,1,40,1),(22,2,40,1),(22,3,40,1),(22,4,40,1),(22,5,40,1),(25,1,6,2),(25,2,6,2),(25,3,6,2),(25,4,6,2),(25,5,6,2),(25,1,9,13),(25,2,9,13),(25,3,9,13),(25,4,9,13),(25,5,9,13),(26,1,6,4),(26,2,6,4),(26,3,6,4),(26,4,6,4),(26,5,6,4),(26,1,9,19),(26,2,9,19),(26,3,9,19),(26,4,9,19),(26,5,9,19),(27,1,7,5),(27,2,7,5),(27,3,7,5),(27,4,7,5),(27,5,7,5),(27,1,9,12),(27,2,9,12),(27,3,9,12),(27,4,9,12),(27,5,9,12),(28,1,14,6),(28,2,14,6),(28,3,14,6),(28,4,14,6),(28,5,14,6),(28,1,61,1),(28,2,61,1),(28,3,61,1),(28,4,61,1),(28,5,61,1),(28,1,91,2),(28,2,91,2),(28,3,91,2),(28,4,91,2),(28,5,91,2),(28,1,96,1),(28,2,96,1),(28,3,96,1),(28,4,96,1),(28,5,96,1),(28,1,97,1),(28,2,97,1),(28,3,97,1),(28,4,97,1),(28,5,97,1),(28,1,98,1),(28,2,98,1),(28,3,98,1),(28,4,98,1),(28,5,98,1),(28,1,99,1),(28,2,99,1),(28,3,99,1),(28,4,99,1),(28,5,99,1),(28,1,100,1),(28,2,100,1),(28,3,100,1),(28,4,100,1),(28,5,100,1),(28,1,101,1),(28,2,101,1),(28,3,101,1),(28,4,101,1),(28,5,101,1),(28,1,102,1),(28,2,102,1),(28,3,102,1),(28,4,102,1),(28,5,102,1),(28,1,103,1),(28,2,103,1),(28,3,103,1),(28,4,103,1),(28,5,103,1),(28,1,104,1),(28,2,104,1),(28,3,104,1),(28,4,104,1),(28,5,104,1),(28,1,105,1),(28,2,105,1),(28,3,105,1),(28,4,105,1),(28,5,105,1),(29,1,9,7),(29,2,9,7),(29,3,9,7),(29,4,9,7),(29,5,9,7),(29,1,14,1),(29,2,14,1),(29,3,14,1),(29,4,14,1),(29,5,14,1),(32,1,9,16),(32,2,9,16),(32,3,9,16),(32,4,9,16),(32,5,9,16),(32,1,26,1),(32,2,26,1),(32,3,26,1),(32,4,26,1),(32,5,26,1),(32,1,40,2),(32,2,40,2),(32,3,40,2),(32,4,40,2),(32,5,40,2),(32,1,86,1),(32,2,86,1),(32,3,86,1),(32,4,86,1),(32,5,86,1),(33,1,9,20),(33,2,9,20),(33,3,9,20),(33,4,9,20),(33,5,9,20),(34,1,33,4),(34,2,33,4),(34,3,33,4),(34,4,33,4),(34,5,33,4),(35,1,33,3),(35,2,33,3),(35,3,33,3),(35,4,33,3),(35,5,33,3),(36,1,33,1),(36,2,33,1),(36,3,33,1),(36,4,33,1),(36,5,33,1),(37,1,33,2),(37,2,33,2),(37,3,33,2),(37,4,33,2),(37,5,33,2),(38,1,37,1),(38,2,37,1),(38,3,37,1),(38,4,37,1),(38,5,37,1),(39,1,8,2),(39,2,8,2),(39,3,8,2),(39,4,8,2),(39,5,8,2),(39,1,9,17),(39,2,9,17),(39,3,9,17),(39,4,9,17),(39,5,9,17),(41,1,14,9),(41,2,14,9),(41,3,14,9),(41,4,14,9),(41,5,14,9),(41,1,32,10),(41,2,32,10),(41,3,32,10),(41,4,32,10),(41,5,32,10),(42,1,14,8),(42,2,14,8),(42,3,14,8),(42,4,14,8),(42,5,14,8),(42,1,32,11),(42,2,32,11),(42,3,32,11),(42,4,32,11),(42,5,32,11),(43,1,32,15),(43,2,32,15),(43,3,32,15),(43,4,32,15),(43,5,32,15),(44,1,32,8),(44,2,32,8),(44,3,32,8),(44,4,32,8),(44,5,32,8),(45,1,32,13),(45,2,32,13),(45,3,32,13),(45,4,32,13),(45,5,32,13),(46,1,32,16),(46,2,32,16),(46,3,32,16),(46,4,32,16),(46,5,32,16),(47,1,32,7),(47,2,32,7),(47,3,32,7),(47,4,32,7),(47,5,32,7),(48,1,32,17),(48,2,32,17),(48,3,32,17),(48,4,32,17),(48,5,32,17),(49,1,32,7),(49,2,32,7),(49,3,32,7),(49,4,32,7),(49,5,32,7),(50,1,32,20),(50,2,32,20),(50,3,32,20),(50,4,32,20),(50,5,32,20),(51,1,11,1),(51,2,11,1),(51,3,11,1),(51,4,11,1),(51,5,11,1),(51,1,21,5),(51,2,21,5),(51,3,21,5),(51,4,21,5),(51,5,21,5),(51,1,25,1),(51,2,25,1),(51,3,25,1),(51,4,25,1),(51,5,25,1),(52,1,32,6),(52,2,32,6),(52,3,32,6),(52,4,32,6),(52,5,32,6),(53,1,32,22),(53,2,32,22),(53,3,32,22),(53,4,32,22),(53,5,32,22),(54,1,32,5),(54,2,32,5),(54,3,32,5),(54,4,32,5),(54,5,32,5),(55,1,32,18),(55,2,32,18),(55,3,32,18),(55,4,32,18),(55,5,32,18),(56,1,32,9),(56,2,32,9),(56,3,32,9),(56,4,32,9),(56,5,32,9),(57,1,32,4),(57,2,32,4),(57,3,32,4),(57,4,32,4),(57,5,32,4),(58,1,32,12),(58,2,32,12),(58,3,32,12),(58,4,32,12),(58,5,32,12),(59,1,32,3),(59,2,32,3),(59,3,32,3),(59,4,32,3),(59,5,32,3),(60,1,32,2),(60,2,32,2),(60,3,32,2),(60,4,32,2),(60,5,32,2),(61,1,32,19),(61,2,32,19),(61,3,32,19),(61,4,32,19),(61,5,32,19),(61,1,45,1),(61,2,45,1),(61,3,45,1),(61,4,45,1),(61,5,45,1),(62,1,32,21),(62,2,32,21),(62,3,32,21),(62,4,32,21),(62,5,32,21),(63,1,32,1),(63,2,32,1),(63,3,32,1),(63,4,32,1),(63,5,32,1),(65,1,2,1),(65,2,2,1),(65,3,2,1),(65,4,2,1),(65,5,2,1),(65,1,19,2),(65,2,19,2),(65,3,19,2),(65,4,19,2),(65,5,19,2),(65,1,50,1),(65,2,50,1),(65,3,50,1),(65,4,50,1),(65,5,50,1),(65,1,88,1),(65,2,88,1),(65,3,88,1),(65,4,88,1),(65,5,88,1),(65,1,106,1),(65,2,106,1),(65,3,106,1),(65,4,106,1),(65,5,106,1),(65,1,107,1),(65,2,107,1),(65,3,107,1),(65,4,107,1),(65,5,107,1),(65,1,108,1),(65,2,108,1),(65,3,108,1),(65,4,108,1),(65,5,108,1),(65,1,109,1),(65,2,109,1),(65,3,109,1),(65,4,109,1),(65,5,109,1),(65,1,110,1),(65,2,110,1),(65,3,110,1),(65,4,110,1),(65,5,110,1),(65,1,111,1),(65,2,111,1),(65,3,111,1),(65,4,111,1),(65,5,111,1),(65,1,112,1),(65,2,112,1),(65,3,112,1),(65,4,112,1),(65,5,112,1),(65,1,113,1),(65,2,113,1),(65,3,113,1),(65,4,113,1),(65,5,113,1),(65,1,114,1),(65,2,114,1),(65,3,114,1),(65,4,114,1),(65,5,114,1),(65,1,115,1),(65,2,115,1),(65,3,115,1),(65,4,115,1),(65,5,115,1),(65,1,116,1),(65,2,116,1),(65,3,116,1),(65,4,116,1),(65,5,116,1),(65,1,117,1),(65,2,117,1),(65,3,117,1),(65,4,117,1),(65,5,117,1),(65,1,118,1),(65,2,118,1),(65,3,118,1),(65,4,118,1),(65,5,118,1),(65,1,119,1),(65,2,119,1),(65,3,119,1),(65,4,119,1),(65,5,119,1),(65,1,120,1),(65,2,120,1),(65,3,120,1),(65,4,120,1),(65,5,120,1),(65,1,121,1),(65,2,121,1),(65,3,121,1),(65,4,121,1),(65,5,121,1),(65,1,122,1),(65,2,122,1),(65,3,122,1),(65,4,122,1),(65,5,122,1),(65,1,123,1),(65,2,123,1),(65,3,123,1),(65,4,123,1),(65,5,123,1),(65,1,124,1),(65,2,124,1),(65,3,124,1),(65,4,124,1),(65,5,124,1),(66,1,9,21),(66,2,9,21),(66,3,9,21),(66,4,9,21),(66,5,9,21),(66,1,125,1),(66,2,125,1),(66,3,125,1),(66,4,125,1),(66,5,125,1),(68,1,5,1),(68,2,5,1),(68,3,5,1),(68,4,5,1),(68,5,5,1),(68,1,8,3),(68,2,8,3),(68,3,8,3),(68,4,8,3),(68,5,8,3),(68,1,9,22),(68,2,9,22),(68,3,9,22),(68,4,9,22),(68,5,9,22),(68,1,104,2),(68,2,104,2),(68,3,104,2),(68,4,104,2),(68,5,104,2),(68,1,105,2),(68,2,105,2),(68,3,105,2),(68,4,105,2),(68,5,105,2),(69,1,125,2),(69,2,125,2),(69,3,125,2),(69,4,125,2),(69,5,125,2),(71,1,9,23),(71,2,9,23),(71,3,9,23),(71,4,9,23),(71,5,9,23),(71,1,17,1),(71,2,17,1),(71,3,17,1),(71,4,17,1),(71,5,17,1),(72,1,5,2),(72,2,5,2),(72,3,5,2),(72,4,5,2),(72,5,5,2),(72,1,9,24),(72,2,9,24),(72,3,9,24),(72,4,9,24),(72,5,9,24),(72,1,61,2),(72,2,61,2),(72,3,61,2),(72,4,61,2),(72,5,61,2),(72,1,96,2),(72,2,96,2),(72,3,96,2),(72,4,96,2),(72,5,96,2),(72,1,97,2),(72,2,97,2),(72,3,97,2),(72,4,97,2),(72,5,97,2),(72,1,98,2),(72,2,98,2),(72,3,98,2),(72,4,98,2),(72,5,98,2),(72,1,99,2),(72,2,99,2),(72,3,99,2),(72,4,99,2),(72,5,99,2),(72,1,102,2),(72,2,102,2),(72,3,102,2),(72,4,102,2),(72,5,102,2),(72,1,103,2),(72,2,103,2),(72,3,103,2),(72,4,103,2),(72,5,103,2),(72,1,104,3),(72,2,104,3),(72,3,104,3),(72,4,104,3),(72,5,104,3),(72,1,105,3),(72,2,105,3),(72,3,105,3),(72,4,105,3),(72,5,105,3),(72,1,126,1),(72,2,126,1),(72,3,126,1),(72,4,126,1),(72,5,126,1),(74,1,9,25),(74,2,9,25),(74,3,9,25),(74,4,9,25),(74,5,9,25),(74,1,21,1),(74,2,21,1),(74,3,21,1),(74,4,21,1),(74,5,21,1),(75,1,8,1),(75,2,8,1),(75,3,8,1),(75,4,8,1),(75,5,8,1),(75,1,9,26),(75,2,9,26),(75,3,9,26),(75,4,9,26),(75,5,9,26),(77,1,8,4),(77,2,8,4),(77,3,8,4),(77,4,8,4),(77,5,8,4),(77,1,9,27),(77,2,9,27),(77,3,9,27),(77,4,9,27),(77,5,9,27),(77,1,14,10),(77,2,14,10),(77,3,14,10),(77,4,14,10),(77,5,14,10),(77,1,21,2),(77,2,21,2),(77,3,21,2),(77,4,21,2),(77,5,21,2),(77,1,127,1),(77,2,127,1),(77,3,127,1),(77,4,127,1),(77,5,127,1),(77,1,128,1),(77,2,128,1),(77,3,128,1),(77,4,128,1),(77,5,128,1),(77,1,129,1),(77,2,129,1),(77,3,129,1),(77,4,129,1),(77,5,129,1),(84,1,9,28),(84,2,9,28),(84,3,9,28),(84,4,9,28),(84,5,9,28),(84,1,14,11),(84,2,14,11),(84,3,14,11),(84,4,14,11),(84,5,14,11),(88,1,7,6),(88,2,7,6),(88,3,7,6),(88,4,7,6),(88,5,7,6),(88,1,9,29),(88,2,9,29),(88,3,9,29),(88,4,9,29),(88,5,9,29),(89,1,9,30),(89,2,9,30),(89,3,9,30),(89,4,9,30),(89,5,9,30),(90,1,9,31),(90,2,9,31),(90,3,9,31),(90,4,9,31),(90,5,9,31),(90,1,28,1),(90,2,28,1),(90,3,28,1),(90,4,28,1),(90,5,28,1),(90,1,29,1),(90,2,29,1),(90,3,29,1),(90,4,29,1),(90,5,29,1),(90,1,41,1),(90,2,41,1),(90,3,41,1),(90,4,41,1),(90,5,41,1),(90,1,59,1),(90,2,59,1),(90,3,59,1),(90,4,59,1),(90,5,59,1),(91,1,9,32),(91,2,9,32),(91,3,9,32),(91,4,9,32),(91,5,9,32),(92,1,5,3),(92,2,5,3),(92,3,5,3),(92,4,5,3),(92,5,5,3),(92,1,8,6),(92,2,8,6),(92,3,8,6),(92,4,8,6),(92,5,8,6),(92,1,9,33),(92,2,9,33),(92,3,9,33),(92,4,9,33),(92,5,9,33),(92,1,104,4),(92,2,104,4),(92,3,104,4),(92,4,104,4),(92,5,104,4),(92,1,105,4),(92,2,105,4),(92,3,105,4),(92,4,105,4),(92,5,105,4),(92,1,127,2),(92,2,127,2),(92,3,127,2),(92,4,127,2),(92,5,127,2),(93,1,5,4),(93,2,5,4),(93,3,5,4),(93,4,5,4),(93,5,5,4),(93,1,8,7),(93,2,8,7),(93,3,8,7),(93,4,8,7),(93,5,8,7),(93,1,9,34),(93,2,9,34),(93,3,9,34),(93,4,9,34),(93,5,9,34),(93,1,104,5),(93,2,104,5),(93,3,104,5),(93,4,104,5),(93,5,104,5),(93,1,105,5),(93,2,105,5),(93,3,105,5),(93,4,105,5),(93,5,105,5),(93,1,127,3),(93,2,127,3),(93,3,127,3),(93,4,127,3),(93,5,127,3),(94,1,5,5),(94,2,5,5),(94,3,5,5),(94,4,5,5),(94,5,5,5),(94,1,8,8),(94,2,8,8),(94,3,8,8),(94,4,8,8),(94,5,8,8),(94,1,9,35),(94,2,9,35),(94,3,9,35),(94,4,9,35),(94,5,9,35),(94,1,104,6),(94,2,104,6),(94,3,104,6),(94,4,104,6),(94,5,104,6),(94,1,105,6),(94,2,105,6),(94,3,105,6),(94,4,105,6),(94,5,105,6),(94,1,127,4),(94,2,127,4),(94,3,127,4),(94,4,127,4),(94,5,127,4),(95,1,1,1),(95,2,1,1),(95,3,1,1),(95,4,1,1),(95,5,1,1),(95,1,4,1),(95,2,4,1),(95,3,4,1),(95,4,4,1),(95,5,4,1),(96,1,1,2),(96,2,1,2),(96,3,1,2),(96,4,1,2),(96,5,1,2),(96,1,4,2),(96,2,4,2),(96,3,4,2),(96,4,4,2),(96,5,4,2),(97,1,7,1),(97,2,7,1),(97,3,7,1),(97,4,7,1),(97,5,7,1),(97,1,9,36),(97,2,9,36),(97,3,9,36),(97,4,9,36),(97,5,9,36),(97,1,21,6),(97,2,21,6),(97,3,21,6),(97,4,21,6),(97,5,21,6),(97,1,60,1),(97,2,60,1),(97,3,60,1),(97,4,60,1),(97,5,60,1),(97,1,61,3),(97,2,61,3),(97,3,61,3),(97,4,61,3),(97,5,61,3),(97,1,62,1),(97,2,62,1),(97,3,62,1),(97,4,62,1),(97,5,62,1),(97,1,67,1),(97,2,67,1),(97,3,67,1),(97,4,67,1),(97,5,67,1),(97,1,68,1),(97,2,68,1),(97,3,68,1),(97,4,68,1),(97,5,68,1),(97,1,69,1),(97,2,69,1),(97,3,69,1),(97,4,69,1),(97,5,69,1),(97,1,70,1),(97,2,70,1),(97,3,70,1),(97,4,70,1),(97,5,70,1),(97,1,71,1),(97,2,71,1),(97,3,71,1),(97,4,71,1),(97,5,71,1),(97,1,72,1),(97,2,72,1),(97,3,72,1),(97,4,72,1),(97,5,72,1),(97,1,73,1),(97,2,73,1),(97,3,73,1),(97,4,73,1),(97,5,73,1),(97,1,74,1),(97,2,74,1),(97,3,74,1),(97,4,74,1),(97,5,74,1),(97,1,75,1),(97,2,75,1),(97,3,75,1),(97,4,75,1),(97,5,75,1),(97,1,76,1),(97,2,76,1),(97,3,76,1),(97,4,76,1),(97,5,76,1),(97,1,77,1),(97,2,77,1),(97,3,77,1),(97,4,77,1),(97,5,77,1),(97,1,78,1),(97,2,78,1),(97,3,78,1),(97,4,78,1),(97,5,78,1),(97,1,79,1),(97,2,79,1),(97,3,79,1),(97,4,79,1),(97,5,79,1),(97,1,80,1),(97,2,80,1),(97,3,80,1),(97,4,80,1),(97,5,80,1),(97,1,81,1),(97,2,81,1),(97,3,81,1),(97,4,81,1),(97,5,81,1),(97,1,82,1),(97,2,82,1),(97,3,82,1),(97,4,82,1),(97,5,82,1),(97,1,83,1),(97,2,83,1),(97,3,83,1),(97,4,83,1),(97,5,83,1),(97,1,84,1),(97,2,84,1),(97,3,84,1),(97,4,84,1),(97,5,84,1);
/*!40000 ALTER TABLE `ps_hook_module` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_hook_module_exceptions` WRITE;
/*!40000 ALTER TABLE `ps_hook_module_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_hook_module_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_image` WRITE;
/*!40000 ALTER TABLE `ps_image` DISABLE KEYS */;
INSERT INTO `ps_image` VALUES (27,8,1,0),(28,8,2,0),(29,8,3,0),(30,8,4,0),(31,8,5,0),(32,8,6,0),(33,8,7,0),(66,13,1,0),(67,13,3,0),(68,13,4,0),(69,17,1,0),(70,17,2,0),(71,17,3,0),(72,17,4,0),(73,17,5,0),(74,17,6,0),(75,17,7,0),(76,18,1,0),(77,18,2,0),(80,18,3,0),(81,18,4,0),(82,18,5,0),(83,19,1,0),(84,19,2,0),(85,19,3,0),(86,19,4,0),(87,19,5,0),(88,19,6,0),(89,19,7,0),(90,20,1,0),(91,20,2,0),(92,20,3,0),(93,20,4,0),(94,20,5,0),(95,20,6,1),(96,20,7,0),(97,21,1,0),(98,21,2,0),(99,21,3,0),(100,21,4,0),(101,21,5,0),(102,21,6,0),(103,21,7,1),(104,22,1,1),(105,22,2,0),(106,22,3,0),(107,22,4,0),(108,22,5,0),(109,22,6,0),(110,23,1,1),(111,23,2,0),(112,23,3,0),(113,23,4,0),(114,23,5,0),(115,24,1,1),(116,24,2,0),(117,24,3,0),(118,24,4,0),(119,24,5,0),(120,24,6,0),(121,25,1,1),(122,25,2,0),(123,25,3,0),(124,25,4,0),(125,25,5,0),(126,25,6,0),(127,26,1,1),(128,26,2,0),(129,26,3,0),(130,26,4,0),(131,26,5,0),(132,27,1,0),(133,27,2,0),(134,27,3,0),(135,27,4,0),(136,27,5,0),(137,28,1,1),(138,28,2,0),(139,28,3,0),(140,28,4,0),(141,28,5,0),(142,29,1,1),(143,29,2,0),(144,29,3,0),(145,29,4,0),(146,29,5,0),(147,29,6,0),(148,30,1,1),(149,30,2,0),(150,30,3,0),(151,30,4,0),(152,30,5,0),(153,31,1,1),(154,31,2,0),(155,31,3,0),(156,31,4,0),(157,31,5,0),(158,32,1,0),(159,32,2,0),(160,32,3,0),(161,32,4,0),(162,32,5,0),(163,32,6,0),(164,33,1,0),(165,33,2,1),(166,33,3,0),(167,33,4,0),(168,33,5,0),(169,33,6,0),(170,34,1,0),(171,34,2,0),(172,34,3,0),(173,34,4,0),(174,34,5,1),(175,34,6,0),(176,35,1,0),(177,35,2,0),(178,35,3,0),(179,35,4,0),(180,35,5,0),(181,36,1,0),(182,36,2,0),(183,36,3,0),(184,36,4,0),(185,36,5,1),(186,36,6,0),(187,37,1,0),(188,37,2,1),(189,37,3,0),(190,37,4,0),(191,37,5,0),(192,38,1,0),(193,38,2,0),(194,38,3,0),(195,38,4,0),(196,38,5,1),(197,39,1,0),(198,39,2,0),(199,39,3,1),(200,39,4,0),(201,39,5,0),(202,40,1,0),(203,40,2,0),(204,40,3,0),(205,40,4,1),(206,40,5,0),(207,40,6,0),(208,18,6,1),(209,19,8,1),(210,17,8,1),(211,8,8,1),(212,27,6,1),(213,32,7,1),(214,35,6,1),(215,41,1,1),(216,41,2,0),(217,41,3,0),(218,41,4,0),(219,41,5,0),(220,41,6,0),(221,42,1,0),(222,42,2,0),(223,42,3,0),(224,42,4,0),(225,42,5,0),(226,42,6,1),(227,43,1,0),(228,43,2,0),(229,43,3,0),(230,43,4,0),(231,43,5,0),(232,43,6,1);
/*!40000 ALTER TABLE `ps_image` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_image_lang` WRITE;
/*!40000 ALTER TABLE `ps_image_lang` DISABLE KEYS */;
INSERT INTO `ps_image_lang` VALUES (27,1,NULL),(27,2,NULL),(28,1,NULL),(28,2,NULL),(29,1,NULL),(29,2,NULL),(30,1,NULL),(30,2,NULL),(31,1,NULL),(31,2,NULL),(32,1,NULL),(32,2,NULL),(33,1,NULL),(33,2,NULL),(66,1,NULL),(66,2,NULL),(67,1,NULL),(67,2,NULL),(68,1,NULL),(68,2,NULL),(69,1,NULL),(69,2,NULL),(70,1,NULL),(70,2,NULL),(71,1,NULL),(71,2,NULL),(72,1,NULL),(72,2,NULL),(73,1,NULL),(73,2,NULL),(74,1,NULL),(74,2,NULL),(75,1,NULL),(75,2,NULL),(76,1,NULL),(76,2,NULL),(77,1,NULL),(77,2,NULL),(80,1,NULL),(80,2,NULL),(81,1,NULL),(81,2,NULL),(82,1,NULL),(82,2,NULL),(83,1,NULL),(83,2,NULL),(84,1,NULL),(84,2,NULL),(85,1,NULL),(85,2,NULL),(86,1,NULL),(86,2,NULL),(87,1,NULL),(87,2,NULL),(88,1,NULL),(88,2,NULL),(89,1,NULL),(89,2,NULL),(90,1,NULL),(90,2,NULL),(91,1,NULL),(91,2,NULL),(92,1,NULL),(92,2,NULL),(93,1,NULL),(93,2,NULL),(94,1,NULL),(94,2,NULL),(95,1,NULL),(95,2,NULL),(96,1,NULL),(96,2,NULL),(97,1,NULL),(97,2,NULL),(98,1,NULL),(98,2,NULL),(99,1,NULL),(99,2,NULL),(100,1,NULL),(100,2,NULL),(101,1,NULL),(101,2,NULL),(102,1,NULL),(102,2,NULL),(103,1,NULL),(103,2,NULL),(104,1,NULL),(104,2,NULL),(105,1,NULL),(105,2,NULL),(106,1,NULL),(106,2,NULL),(107,1,NULL),(107,2,NULL),(108,1,NULL),(108,2,NULL),(109,1,NULL),(109,2,NULL),(110,1,NULL),(110,2,NULL),(111,1,NULL),(111,2,NULL),(112,1,NULL),(112,2,NULL),(113,1,NULL),(113,2,NULL),(114,1,NULL),(114,2,NULL),(115,1,NULL),(115,2,NULL),(116,1,NULL),(116,2,NULL),(117,1,NULL),(117,2,NULL),(118,1,NULL),(118,2,NULL),(119,1,NULL),(119,2,NULL),(120,1,NULL),(120,2,NULL),(121,1,NULL),(121,2,NULL),(122,1,NULL),(122,2,NULL),(123,1,NULL),(123,2,NULL),(124,1,NULL),(124,2,NULL),(125,1,NULL),(125,2,NULL),(126,1,NULL),(126,2,NULL),(127,1,NULL),(127,2,NULL),(128,1,NULL),(128,2,NULL),(129,1,NULL),(129,2,NULL),(130,1,NULL),(130,2,NULL),(131,1,NULL),(131,2,NULL),(132,1,NULL),(132,2,NULL),(133,1,NULL),(133,2,NULL),(134,1,NULL),(134,2,NULL),(135,1,NULL),(135,2,NULL),(136,1,NULL),(136,2,NULL),(137,1,NULL),(137,2,NULL),(138,1,NULL),(138,2,NULL),(139,1,NULL),(139,2,NULL),(140,1,NULL),(140,2,NULL),(141,1,NULL),(141,2,NULL),(142,1,NULL),(142,2,NULL),(143,1,NULL),(143,2,NULL),(144,1,NULL),(144,2,NULL),(145,1,NULL),(145,2,NULL),(146,1,NULL),(146,2,NULL),(147,1,NULL),(147,2,NULL),(148,1,NULL),(148,2,NULL),(149,1,NULL),(149,2,NULL),(150,1,NULL),(150,2,NULL),(151,1,NULL),(151,2,NULL),(152,1,NULL),(152,2,NULL),(153,1,NULL),(153,2,NULL),(154,1,NULL),(154,2,NULL),(155,1,NULL),(155,2,NULL),(156,1,NULL),(156,2,NULL),(157,1,NULL),(157,2,NULL),(158,1,NULL),(158,2,NULL),(159,1,NULL),(159,2,NULL),(160,1,NULL),(160,2,NULL),(161,1,NULL),(161,2,NULL),(162,1,NULL),(162,2,NULL),(163,1,NULL),(163,2,NULL),(164,1,NULL),(164,2,NULL),(165,1,NULL),(165,2,NULL),(166,1,NULL),(166,2,NULL),(167,1,NULL),(167,2,NULL),(168,1,NULL),(168,2,NULL),(169,1,NULL),(169,2,NULL),(170,1,NULL),(170,2,NULL),(171,1,NULL),(171,2,NULL),(172,1,NULL),(172,2,NULL),(173,1,NULL),(173,2,NULL),(174,1,NULL),(174,2,NULL),(175,1,NULL),(175,2,NULL),(176,1,NULL),(176,2,NULL),(177,1,NULL),(177,2,NULL),(178,1,NULL),(178,2,NULL),(179,1,NULL),(179,2,NULL),(180,1,NULL),(180,2,NULL),(181,1,NULL),(181,2,NULL),(182,1,NULL),(182,2,NULL),(183,1,NULL),(183,2,NULL),(184,1,NULL),(184,2,NULL),(185,1,NULL),(185,2,NULL),(186,1,NULL),(186,2,NULL),(187,1,NULL),(187,2,NULL),(188,1,NULL),(188,2,NULL),(189,1,NULL),(189,2,NULL),(190,1,NULL),(190,2,NULL),(191,1,NULL),(191,2,NULL),(192,1,NULL),(192,2,NULL),(193,1,NULL),(193,2,NULL),(194,1,NULL),(194,2,NULL),(195,1,NULL),(195,2,NULL),(196,1,NULL),(196,2,NULL),(197,1,NULL),(197,2,NULL),(198,1,NULL),(198,2,NULL),(199,1,NULL),(199,2,NULL),(200,1,NULL),(200,2,NULL),(201,1,NULL),(201,2,NULL),(202,1,NULL),(202,2,NULL),(203,1,NULL),(203,2,NULL),(204,1,NULL),(204,2,NULL),(205,1,NULL),(205,2,NULL),(206,1,NULL),(206,2,NULL),(207,1,NULL),(207,2,NULL),(208,1,NULL),(208,2,NULL),(209,1,NULL),(209,2,NULL),(210,1,NULL),(210,2,NULL),(211,1,NULL),(211,2,NULL),(212,1,NULL),(212,2,NULL),(213,1,NULL),(213,2,NULL),(214,1,NULL),(214,2,NULL),(215,1,NULL),(215,2,NULL),(216,1,NULL),(216,2,NULL),(217,1,NULL),(217,2,NULL),(218,1,NULL),(218,2,NULL),(219,1,NULL),(219,2,NULL),(220,1,NULL),(220,2,NULL),(221,1,NULL),(221,2,NULL),(222,1,NULL),(222,2,NULL),(223,1,NULL),(223,2,NULL),(224,1,NULL),(224,2,NULL),(225,1,NULL),(225,2,NULL),(226,1,NULL),(226,2,NULL),(227,1,NULL),(227,2,NULL),(228,1,NULL),(228,2,NULL),(229,1,NULL),(229,2,NULL),(230,1,NULL),(230,2,NULL),(231,1,NULL),(231,2,NULL),(232,1,NULL),(232,2,NULL);
/*!40000 ALTER TABLE `ps_image_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_image_shop` WRITE;
/*!40000 ALTER TABLE `ps_image_shop` DISABLE KEYS */;
INSERT INTO `ps_image_shop` VALUES (27,1,0),(27,2,0),(27,3,0),(27,4,0),(27,5,0),(28,1,0),(28,2,0),(28,3,0),(28,4,0),(28,5,0),(29,1,0),(29,2,0),(29,3,0),(29,4,0),(29,5,0),(30,1,0),(30,2,0),(30,3,0),(30,4,0),(30,5,0),(31,1,0),(31,2,0),(31,3,0),(31,4,0),(31,5,0),(32,1,0),(32,2,0),(32,3,0),(32,4,0),(32,5,0),(33,1,0),(33,2,0),(33,3,0),(33,4,0),(33,5,0),(66,1,0),(66,2,0),(66,3,0),(66,4,0),(66,5,0),(67,1,0),(67,2,0),(67,3,0),(67,4,0),(67,5,0),(68,1,0),(68,2,0),(68,3,0),(68,4,0),(68,5,0),(69,1,0),(69,2,0),(69,3,0),(69,4,0),(69,5,0),(70,1,0),(70,2,0),(70,3,0),(70,4,0),(70,5,0),(71,1,0),(71,2,0),(71,3,0),(71,4,0),(71,5,0),(72,1,0),(72,2,0),(72,3,0),(72,4,0),(72,5,0),(73,1,0),(73,2,0),(73,3,0),(73,4,0),(73,5,0),(74,1,0),(74,2,0),(74,3,0),(74,4,0),(74,5,0),(75,1,0),(75,2,0),(75,3,0),(75,4,0),(75,5,0),(76,1,0),(76,2,0),(76,3,0),(76,4,0),(76,5,0),(77,1,0),(77,2,0),(77,3,0),(77,4,0),(77,5,0),(80,1,0),(80,2,0),(80,3,0),(80,4,0),(80,5,0),(81,1,0),(81,2,0),(81,3,0),(81,4,0),(81,5,0),(82,1,0),(82,2,0),(82,3,0),(82,4,0),(82,5,0),(83,1,0),(83,2,0),(83,3,0),(83,4,0),(83,5,0),(84,1,0),(84,2,0),(84,3,0),(84,4,0),(84,5,0),(85,1,0),(85,2,0),(85,3,0),(85,4,0),(85,5,0),(86,1,0),(86,2,0),(86,3,0),(86,4,0),(86,5,0),(87,1,0),(87,2,0),(87,3,0),(87,4,0),(87,5,0),(88,1,0),(88,2,0),(88,3,0),(88,4,0),(88,5,0),(89,1,0),(89,2,0),(89,3,0),(89,4,0),(89,5,0),(90,1,0),(90,2,0),(90,3,0),(90,4,0),(90,5,0),(91,1,0),(91,2,0),(91,3,0),(91,4,0),(91,5,0),(92,1,0),(92,2,0),(92,3,0),(92,4,0),(92,5,0),(93,1,0),(93,2,0),(93,3,0),(93,4,0),(93,5,0),(94,1,0),(94,2,0),(94,3,0),(94,4,0),(94,5,0),(95,1,1),(95,2,1),(95,3,1),(95,4,1),(95,5,1),(96,1,0),(96,2,0),(96,3,0),(96,4,0),(96,5,0),(97,1,0),(97,2,0),(97,3,0),(97,4,0),(97,5,0),(98,1,0),(98,2,0),(98,3,0),(98,4,0),(98,5,0),(99,1,0),(99,2,0),(99,3,0),(99,4,0),(99,5,0),(100,1,0),(100,2,0),(100,3,0),(100,4,0),(100,5,0),(101,1,0),(101,2,0),(101,3,0),(101,4,0),(101,5,0),(102,1,0),(102,2,0),(102,3,0),(102,4,0),(102,5,0),(103,1,1),(103,2,1),(103,3,1),(103,4,1),(103,5,1),(104,1,1),(104,2,1),(104,3,1),(104,4,1),(104,5,1),(105,1,0),(105,2,0),(105,3,0),(105,4,0),(105,5,0),(106,1,0),(106,2,0),(106,3,0),(106,4,0),(106,5,0),(107,1,0),(107,2,0),(107,3,0),(107,4,0),(107,5,0),(108,1,0),(108,2,0),(108,3,0),(108,4,0),(108,5,0),(109,1,0),(109,2,0),(109,3,0),(109,4,0),(109,5,0),(110,1,1),(110,2,1),(110,3,1),(110,4,1),(110,5,1),(111,1,0),(111,2,0),(111,3,0),(111,4,0),(111,5,0),(112,1,0),(112,2,0),(112,3,0),(112,4,0),(112,5,0),(113,1,0),(113,2,0),(113,3,0),(113,4,0),(113,5,0),(114,1,0),(114,2,0),(114,3,0),(114,4,0),(114,5,0),(115,1,1),(115,2,1),(115,3,1),(115,4,1),(115,5,1),(116,1,0),(116,2,0),(116,3,0),(116,4,0),(116,5,0),(117,1,0),(117,2,0),(117,3,0),(117,4,0),(117,5,0),(118,1,0),(118,2,0),(118,3,0),(118,4,0),(118,5,0),(119,1,0),(119,2,0),(119,3,0),(119,4,0),(119,5,0),(120,1,0),(120,2,0),(120,3,0),(120,4,0),(120,5,0),(121,1,1),(121,2,1),(121,3,1),(121,4,1),(121,5,1),(122,1,0),(122,2,0),(122,3,0),(122,4,0),(122,5,0),(123,1,0),(123,2,0),(123,3,0),(123,4,0),(123,5,0),(124,1,0),(124,2,0),(124,3,0),(124,4,0),(124,5,0),(125,1,0),(125,2,0),(125,3,0),(125,4,0),(125,5,0),(126,1,0),(126,2,0),(126,3,0),(126,4,0),(126,5,0),(127,1,1),(127,2,1),(127,3,1),(127,4,1),(127,5,1),(128,1,0),(128,2,0),(128,3,0),(128,4,0),(128,5,0),(129,1,0),(129,2,0),(129,3,0),(129,4,0),(129,5,0),(130,1,0),(130,2,0),(130,3,0),(130,4,0),(130,5,0),(131,1,0),(131,2,0),(131,3,0),(131,4,0),(131,5,0),(132,1,0),(132,2,0),(132,3,0),(132,4,0),(132,5,0),(133,1,0),(133,2,0),(133,3,0),(133,4,0),(133,5,0),(134,1,0),(134,2,0),(134,3,0),(134,4,0),(134,5,0),(135,1,0),(135,2,0),(135,3,0),(135,4,0),(135,5,0),(136,1,0),(136,2,0),(136,3,0),(136,4,0),(136,5,0),(137,1,1),(137,2,1),(137,3,1),(137,4,1),(137,5,1),(138,1,0),(138,2,0),(138,3,0),(138,4,0),(138,5,0),(139,1,0),(139,2,0),(139,3,0),(139,4,0),(139,5,0),(140,1,0),(140,2,0),(140,3,0),(140,4,0),(140,5,0),(141,1,0),(141,2,0),(141,3,0),(141,4,0),(141,5,0),(142,1,1),(142,2,1),(142,3,1),(142,4,1),(142,5,1),(143,1,0),(143,2,0),(143,3,0),(143,4,0),(143,5,0),(144,1,0),(144,2,0),(144,3,0),(144,4,0),(144,5,0),(145,1,0),(145,2,0),(145,3,0),(145,4,0),(145,5,0),(146,1,0),(146,2,0),(146,3,0),(146,4,0),(146,5,0),(147,1,0),(147,2,0),(147,3,0),(147,4,0),(147,5,0),(148,1,1),(148,2,1),(148,3,1),(148,4,1),(148,5,1),(149,1,0),(149,2,0),(149,3,0),(149,4,0),(149,5,0),(150,1,0),(150,2,0),(150,3,0),(150,4,0),(150,5,0),(151,1,0),(151,2,0),(151,3,0),(151,4,0),(151,5,0),(152,1,0),(152,2,0),(152,3,0),(152,4,0),(152,5,0),(153,1,1),(153,2,1),(153,3,1),(153,4,1),(153,5,1),(154,1,0),(154,2,0),(154,3,0),(154,4,0),(154,5,0),(155,1,0),(155,2,0),(155,3,0),(155,4,0),(155,5,0),(156,1,0),(156,2,0),(156,3,0),(156,4,0),(156,5,0),(157,1,0),(157,2,0),(157,3,0),(157,4,0),(157,5,0),(158,1,0),(158,2,0),(158,3,0),(158,4,0),(158,5,0),(159,1,0),(159,2,0),(159,3,0),(159,4,0),(159,5,0),(160,1,0),(160,2,0),(160,3,0),(160,4,0),(160,5,0),(161,1,0),(161,2,0),(161,3,0),(161,4,0),(161,5,0),(162,1,0),(162,2,0),(162,3,0),(162,4,0),(162,5,0),(163,1,0),(163,2,0),(163,3,0),(163,4,0),(163,5,0),(164,1,0),(164,2,0),(164,3,0),(164,4,0),(164,5,0),(165,1,1),(165,2,1),(165,3,1),(165,4,1),(165,5,1),(166,1,0),(166,2,0),(166,3,0),(166,4,0),(166,5,0),(167,1,0),(167,2,0),(167,3,0),(167,4,0),(167,5,0),(168,1,0),(168,2,0),(168,3,0),(168,4,0),(168,5,0),(169,1,0),(169,2,0),(169,3,0),(169,4,0),(169,5,0),(170,1,0),(170,2,0),(170,3,0),(170,4,0),(170,5,0),(171,1,0),(171,2,0),(171,3,0),(171,4,0),(171,5,0),(172,1,0),(172,2,0),(172,3,0),(172,4,0),(172,5,0),(173,1,0),(173,2,0),(173,3,0),(173,4,0),(173,5,0),(174,1,1),(174,2,1),(174,3,1),(174,4,1),(174,5,1),(175,1,0),(175,2,0),(175,3,0),(175,4,0),(175,5,0),(176,1,0),(176,2,0),(176,3,0),(176,4,0),(176,5,0),(177,1,0),(177,2,0),(177,3,0),(177,4,0),(177,5,0),(178,1,0),(178,2,0),(178,3,0),(178,4,0),(178,5,0),(179,1,0),(179,2,0),(179,3,0),(179,4,0),(179,5,0),(180,1,0),(180,2,0),(180,3,0),(180,4,0),(180,5,0),(181,1,0),(181,2,0),(181,3,0),(181,4,0),(181,5,0),(182,1,0),(182,2,0),(182,3,0),(182,4,0),(182,5,0),(183,1,0),(183,2,0),(183,3,0),(183,4,0),(183,5,0),(184,1,0),(184,2,0),(184,3,0),(184,4,0),(184,5,0),(185,1,1),(185,2,1),(185,3,1),(185,4,1),(185,5,1),(186,1,0),(186,2,0),(186,3,0),(186,4,0),(186,5,0),(187,1,0),(187,2,0),(187,3,0),(187,4,0),(187,5,0),(188,1,1),(188,2,1),(188,3,1),(188,4,1),(188,5,1),(189,1,0),(189,2,0),(189,3,0),(189,4,0),(189,5,0),(190,1,0),(190,2,0),(190,3,0),(190,4,0),(190,5,0),(191,1,0),(191,2,0),(191,3,0),(191,4,0),(191,5,0),(192,1,0),(192,2,0),(192,3,0),(192,4,0),(192,5,0),(193,1,0),(193,2,0),(193,3,0),(193,4,0),(193,5,0),(194,1,0),(194,2,0),(194,3,0),(194,4,0),(194,5,0),(195,1,0),(195,2,0),(195,3,0),(195,4,0),(195,5,0),(196,1,1),(196,2,1),(196,3,1),(196,4,1),(196,5,1),(197,1,0),(197,2,0),(197,3,0),(197,4,0),(197,5,0),(198,1,0),(198,2,0),(198,3,0),(198,4,0),(198,5,0),(199,1,1),(199,2,1),(199,3,1),(199,4,1),(199,5,1),(200,1,0),(200,2,0),(200,3,0),(200,4,0),(200,5,0),(201,1,0),(201,2,0),(201,3,0),(201,4,0),(201,5,0),(202,1,0),(202,2,0),(202,3,0),(202,4,0),(202,5,0),(203,1,0),(203,2,0),(203,3,0),(203,4,0),(203,5,0),(204,1,0),(204,2,0),(204,3,0),(204,4,0),(204,5,0),(205,1,1),(205,2,1),(205,3,1),(205,4,1),(205,5,1),(206,1,0),(206,2,0),(206,3,0),(206,4,0),(206,5,0),(207,1,0),(207,2,0),(207,3,0),(207,4,0),(207,5,0),(208,1,1),(208,2,1),(208,3,1),(208,4,1),(208,5,1),(209,1,1),(209,2,1),(209,3,1),(209,4,1),(209,5,1),(210,1,1),(210,2,1),(210,3,1),(210,4,1),(210,5,1),(211,1,1),(211,2,1),(211,3,1),(211,4,1),(211,5,1),(212,1,1),(212,2,1),(212,3,1),(212,4,1),(212,5,1),(213,1,1),(213,2,1),(213,3,1),(213,4,1),(213,5,1),(214,1,1),(214,2,1),(214,3,1),(214,4,1),(214,5,1),(215,1,1),(215,2,1),(215,3,1),(215,4,1),(215,5,1),(216,1,0),(216,2,0),(216,3,0),(216,4,0),(216,5,0),(217,1,0),(217,2,0),(217,3,0),(217,4,0),(217,5,0),(218,1,0),(218,2,0),(218,3,0),(218,4,0),(218,5,0),(219,1,0),(219,2,0),(219,3,0),(219,4,0),(219,5,0),(220,1,0),(220,2,0),(220,3,0),(220,4,0),(220,5,0),(221,1,0),(221,2,0),(221,3,0),(221,4,0),(221,5,0),(222,1,0),(222,2,0),(222,3,0),(222,4,0),(222,5,0),(223,1,0),(223,2,0),(223,3,0),(223,4,0),(223,5,0),(224,1,0),(224,2,0),(224,3,0),(224,4,0),(224,5,0),(225,1,0),(225,2,0),(225,3,0),(225,4,0),(225,5,0),(226,1,1),(226,2,1),(226,3,1),(226,4,1),(226,5,1),(227,1,0),(227,2,0),(227,3,0),(227,4,0),(227,5,0),(228,1,0),(228,2,0),(228,3,0),(228,4,0),(228,5,0),(229,1,0),(229,2,0),(229,3,0),(229,4,0),(229,5,0),(230,1,0),(230,2,0),(230,3,0),(230,4,0),(230,5,0),(231,1,0),(231,2,0),(231,3,0),(231,4,0),(231,5,0),(232,1,1),(232,2,1),(232,3,1),(232,4,1),(232,5,1);
/*!40000 ALTER TABLE `ps_image_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_image_type` WRITE;
/*!40000 ALTER TABLE `ps_image_type` DISABLE KEYS */;
INSERT INTO `ps_image_type` VALUES (1,'small_default',65,65,1,1,1,1,0,0),(2,'medium_default',90,90,1,1,1,1,0,1),(3,'large_default',370,370,1,1,1,1,0,0),(4,'thickbox_default',600,600,1,0,0,0,0,0),(5,'category_default',580,308,0,1,0,0,0,0),(6,'home_default',150,160,1,0,0,0,0,0),(7,'scene_default',520,189,0,0,0,0,1,0),(8,'m_scene_default',161,58,0,0,0,0,1,0);
/*!40000 ALTER TABLE `ps_image_type` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_import_match` WRITE;
/*!40000 ALTER TABLE `ps_import_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_import_match` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_lang` WRITE;
/*!40000 ALTER TABLE `ps_lang` DISABLE KEYS */;
INSERT INTO `ps_lang` VALUES (1,'English (United States)',1,'en','en','Y-m-d','Y-m-d H:i:s',0),(2,'Français (French)',1,'fr','fr','Y-m-d','Y-m-d H:i:s',0);
/*!40000 ALTER TABLE `ps_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_lang_shop` WRITE;
/*!40000 ALTER TABLE `ps_lang_shop` DISABLE KEYS */;
INSERT INTO `ps_lang_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5);
/*!40000 ALTER TABLE `ps_lang_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_category` WRITE;
/*!40000 ALTER TABLE `ps_layered_category` DISABLE KEYS */;
INSERT INTO `ps_layered_category` VALUES (1,2,1,NULL,'category',1,0,0),(2,4,1,NULL,'category',1,0,0),(3,3,1,NULL,'category',1,0,0),(4,5,1,NULL,'category',1,0,0),(5,1,1,NULL,'category',1,0,0),(6,2,1,NULL,'condition',2,0,0),(7,4,1,NULL,'condition',2,0,0),(8,3,1,NULL,'condition',2,0,0),(9,5,1,NULL,'condition',2,0,0),(10,1,1,NULL,'condition',2,0,0),(11,2,1,NULL,'manufacturer',3,0,0),(12,4,1,NULL,'manufacturer',3,0,0),(13,3,1,NULL,'manufacturer',3,0,0),(14,5,1,NULL,'manufacturer',3,0,0),(15,1,1,NULL,'manufacturer',3,0,0),(16,2,1,NULL,'price',4,0,0),(17,4,1,NULL,'price',4,0,0),(18,3,1,NULL,'price',4,0,0),(19,5,1,NULL,'price',4,0,0),(20,1,1,NULL,'price',4,0,0),(21,2,1,2,'id_attribute_group',5,0,0),(22,4,1,2,'id_attribute_group',5,0,0),(23,3,1,2,'id_attribute_group',5,0,0),(24,5,1,2,'id_attribute_group',5,0,0),(25,1,1,2,'id_attribute_group',5,0,0),(26,2,1,1,'id_feature',6,0,0),(27,4,1,1,'id_feature',6,0,0),(28,3,1,1,'id_feature',6,0,0),(29,5,1,1,'id_feature',6,0,0),(30,1,1,1,'id_feature',6,0,0),(31,2,1,2,'id_feature',7,0,0),(32,4,1,2,'id_feature',7,0,0),(33,3,1,2,'id_feature',7,0,0),(34,5,1,2,'id_feature',7,0,0),(35,1,1,2,'id_feature',7,0,0),(36,2,2,NULL,'category',1,0,0),(37,4,2,NULL,'category',1,0,0),(38,3,2,NULL,'category',1,0,0),(39,5,2,NULL,'category',1,0,0),(40,1,2,NULL,'category',1,0,0),(41,2,2,NULL,'condition',2,0,0),(42,4,2,NULL,'condition',2,0,0),(43,3,2,NULL,'condition',2,0,0),(44,5,2,NULL,'condition',2,0,0),(45,1,2,NULL,'condition',2,0,0),(46,2,2,NULL,'manufacturer',3,0,0),(47,4,2,NULL,'manufacturer',3,0,0),(48,3,2,NULL,'manufacturer',3,0,0),(49,5,2,NULL,'manufacturer',3,0,0),(50,1,2,NULL,'manufacturer',3,0,0),(51,2,2,NULL,'price',4,0,0),(52,4,2,NULL,'price',4,0,0),(53,3,2,NULL,'price',4,0,0),(54,5,2,NULL,'price',4,0,0),(55,1,2,NULL,'price',4,0,0),(56,2,2,2,'id_attribute_group',5,0,0),(57,4,2,2,'id_attribute_group',5,0,0),(58,3,2,2,'id_attribute_group',5,0,0),(59,5,2,2,'id_attribute_group',5,0,0),(60,1,2,2,'id_attribute_group',5,0,0),(61,2,2,1,'id_feature',6,0,0),(62,4,2,1,'id_feature',6,0,0),(63,3,2,1,'id_feature',6,0,0),(64,5,2,1,'id_feature',6,0,0),(65,1,2,1,'id_feature',6,0,0),(66,2,2,2,'id_feature',7,0,0),(67,4,2,2,'id_feature',7,0,0),(68,3,2,2,'id_feature',7,0,0),(69,5,2,2,'id_feature',7,0,0),(70,1,2,2,'id_feature',7,0,0),(71,2,6,NULL,'category',1,0,0),(72,4,6,NULL,'category',1,0,0),(73,3,6,NULL,'category',1,0,0),(74,5,6,NULL,'category',1,0,0),(75,1,6,NULL,'category',1,0,0),(76,2,6,NULL,'condition',2,0,0),(77,4,6,NULL,'condition',2,0,0),(78,3,6,NULL,'condition',2,0,0),(79,5,6,NULL,'condition',2,0,0),(80,1,6,NULL,'condition',2,0,0),(81,2,6,NULL,'manufacturer',3,0,0),(82,4,6,NULL,'manufacturer',3,0,0),(83,3,6,NULL,'manufacturer',3,0,0),(84,5,6,NULL,'manufacturer',3,0,0),(85,1,6,NULL,'manufacturer',3,0,0),(86,2,6,NULL,'price',4,0,0),(87,4,6,NULL,'price',4,0,0),(88,3,6,NULL,'price',4,0,0),(89,5,6,NULL,'price',4,0,0),(90,1,6,NULL,'price',4,0,0),(91,2,6,2,'id_attribute_group',5,0,0),(92,4,6,2,'id_attribute_group',5,0,0),(93,3,6,2,'id_attribute_group',5,0,0),(94,5,6,2,'id_attribute_group',5,0,0),(95,1,6,2,'id_attribute_group',5,0,0),(96,2,6,1,'id_feature',6,0,0),(97,4,6,1,'id_feature',6,0,0),(98,3,6,1,'id_feature',6,0,0),(99,5,6,1,'id_feature',6,0,0),(100,1,6,1,'id_feature',6,0,0),(101,2,6,2,'id_feature',7,0,0),(102,4,6,2,'id_feature',7,0,0),(103,3,6,2,'id_feature',7,0,0),(104,5,6,2,'id_feature',7,0,0),(105,1,6,2,'id_feature',7,0,0),(106,2,7,NULL,'category',1,0,0),(107,4,7,NULL,'category',1,0,0),(108,3,7,NULL,'category',1,0,0),(109,5,7,NULL,'category',1,0,0),(110,1,7,NULL,'category',1,0,0),(111,2,7,NULL,'condition',2,0,0),(112,4,7,NULL,'condition',2,0,0),(113,3,7,NULL,'condition',2,0,0),(114,5,7,NULL,'condition',2,0,0),(115,1,7,NULL,'condition',2,0,0),(116,2,7,NULL,'manufacturer',3,0,0),(117,4,7,NULL,'manufacturer',3,0,0),(118,3,7,NULL,'manufacturer',3,0,0),(119,5,7,NULL,'manufacturer',3,0,0),(120,1,7,NULL,'manufacturer',3,0,0),(121,2,7,NULL,'price',4,0,0),(122,4,7,NULL,'price',4,0,0),(123,3,7,NULL,'price',4,0,0),(124,5,7,NULL,'price',4,0,0),(125,1,7,NULL,'price',4,0,0),(126,2,7,2,'id_attribute_group',5,0,0),(127,4,7,2,'id_attribute_group',5,0,0),(128,3,7,2,'id_attribute_group',5,0,0),(129,5,7,2,'id_attribute_group',5,0,0),(130,1,7,2,'id_attribute_group',5,0,0),(131,2,7,1,'id_feature',6,0,0),(132,4,7,1,'id_feature',6,0,0),(133,3,7,1,'id_feature',6,0,0),(134,5,7,1,'id_feature',6,0,0),(135,1,7,1,'id_feature',6,0,0),(136,2,7,2,'id_feature',7,0,0),(137,4,7,2,'id_feature',7,0,0),(138,3,7,2,'id_feature',7,0,0),(139,5,7,2,'id_feature',7,0,0),(140,1,7,2,'id_feature',7,0,0),(141,2,8,NULL,'category',1,0,0),(142,4,8,NULL,'category',1,0,0),(143,3,8,NULL,'category',1,0,0),(144,5,8,NULL,'category',1,0,0),(145,1,8,NULL,'category',1,0,0),(146,2,8,NULL,'condition',2,0,0),(147,4,8,NULL,'condition',2,0,0),(148,3,8,NULL,'condition',2,0,0),(149,5,8,NULL,'condition',2,0,0),(150,1,8,NULL,'condition',2,0,0),(151,2,8,NULL,'manufacturer',3,0,0),(152,4,8,NULL,'manufacturer',3,0,0),(153,3,8,NULL,'manufacturer',3,0,0),(154,5,8,NULL,'manufacturer',3,0,0),(155,1,8,NULL,'manufacturer',3,0,0),(156,2,8,NULL,'price',4,0,0),(157,4,8,NULL,'price',4,0,0),(158,3,8,NULL,'price',4,0,0),(159,5,8,NULL,'price',4,0,0),(160,1,8,NULL,'price',4,0,0),(161,2,8,2,'id_attribute_group',5,0,0),(162,4,8,2,'id_attribute_group',5,0,0),(163,3,8,2,'id_attribute_group',5,0,0),(164,5,8,2,'id_attribute_group',5,0,0),(165,1,8,2,'id_attribute_group',5,0,0),(166,2,8,1,'id_feature',6,0,0),(167,4,8,1,'id_feature',6,0,0),(168,3,8,1,'id_feature',6,0,0),(169,5,8,1,'id_feature',6,0,0),(170,1,8,1,'id_feature',6,0,0),(171,2,8,2,'id_feature',7,0,0),(172,4,8,2,'id_feature',7,0,0),(173,3,8,2,'id_feature',7,0,0),(174,5,8,2,'id_feature',7,0,0),(175,1,8,2,'id_feature',7,0,0),(176,2,9,NULL,'category',1,0,0),(177,4,9,NULL,'category',1,0,0),(178,3,9,NULL,'category',1,0,0),(179,5,9,NULL,'category',1,0,0),(180,1,9,NULL,'category',1,0,0),(181,2,9,NULL,'condition',2,0,0),(182,4,9,NULL,'condition',2,0,0),(183,3,9,NULL,'condition',2,0,0),(184,5,9,NULL,'condition',2,0,0),(185,1,9,NULL,'condition',2,0,0),(186,2,9,NULL,'manufacturer',3,0,0),(187,4,9,NULL,'manufacturer',3,0,0),(188,3,9,NULL,'manufacturer',3,0,0),(189,5,9,NULL,'manufacturer',3,0,0),(190,1,9,NULL,'manufacturer',3,0,0),(191,2,9,NULL,'price',4,0,0),(192,4,9,NULL,'price',4,0,0),(193,3,9,NULL,'price',4,0,0),(194,5,9,NULL,'price',4,0,0),(195,1,9,NULL,'price',4,0,0),(196,2,9,2,'id_attribute_group',5,0,0),(197,4,9,2,'id_attribute_group',5,0,0),(198,3,9,2,'id_attribute_group',5,0,0),(199,5,9,2,'id_attribute_group',5,0,0),(200,1,9,2,'id_attribute_group',5,0,0),(201,2,9,1,'id_feature',6,0,0),(202,4,9,1,'id_feature',6,0,0),(203,3,9,1,'id_feature',6,0,0),(204,5,9,1,'id_feature',6,0,0),(205,1,9,1,'id_feature',6,0,0),(206,2,9,2,'id_feature',7,0,0),(207,4,9,2,'id_feature',7,0,0),(208,3,9,2,'id_feature',7,0,0),(209,5,9,2,'id_feature',7,0,0),(210,1,9,2,'id_feature',7,0,0),(211,2,10,NULL,'category',1,0,0),(212,4,10,NULL,'category',1,0,0),(213,3,10,NULL,'category',1,0,0),(214,5,10,NULL,'category',1,0,0),(215,1,10,NULL,'category',1,0,0),(216,2,10,NULL,'condition',2,0,0),(217,4,10,NULL,'condition',2,0,0),(218,3,10,NULL,'condition',2,0,0),(219,5,10,NULL,'condition',2,0,0),(220,1,10,NULL,'condition',2,0,0),(221,2,10,NULL,'manufacturer',3,0,0),(222,4,10,NULL,'manufacturer',3,0,0),(223,3,10,NULL,'manufacturer',3,0,0),(224,5,10,NULL,'manufacturer',3,0,0),(225,1,10,NULL,'manufacturer',3,0,0),(226,2,10,NULL,'price',4,0,0),(227,4,10,NULL,'price',4,0,0),(228,3,10,NULL,'price',4,0,0),(229,5,10,NULL,'price',4,0,0),(230,1,10,NULL,'price',4,0,0),(231,2,10,2,'id_attribute_group',5,0,0),(232,4,10,2,'id_attribute_group',5,0,0),(233,3,10,2,'id_attribute_group',5,0,0),(234,5,10,2,'id_attribute_group',5,0,0),(235,1,10,2,'id_attribute_group',5,0,0),(236,2,10,1,'id_feature',6,0,0),(237,4,10,1,'id_feature',6,0,0),(238,3,10,1,'id_feature',6,0,0),(239,5,10,1,'id_feature',6,0,0),(240,1,10,1,'id_feature',6,0,0),(241,2,10,2,'id_feature',7,0,0),(242,4,10,2,'id_feature',7,0,0),(243,3,10,2,'id_feature',7,0,0),(244,5,10,2,'id_feature',7,0,0),(245,1,10,2,'id_feature',7,0,0),(246,2,31,NULL,'category',1,0,0),(247,4,31,NULL,'category',1,0,0),(248,3,31,NULL,'category',1,0,0),(249,5,31,NULL,'category',1,0,0),(250,1,31,NULL,'category',1,0,0),(251,2,31,NULL,'condition',2,0,0),(252,4,31,NULL,'condition',2,0,0),(253,3,31,NULL,'condition',2,0,0),(254,5,31,NULL,'condition',2,0,0),(255,1,31,NULL,'condition',2,0,0),(256,2,31,NULL,'manufacturer',3,0,0),(257,4,31,NULL,'manufacturer',3,0,0),(258,3,31,NULL,'manufacturer',3,0,0),(259,5,31,NULL,'manufacturer',3,0,0),(260,1,31,NULL,'manufacturer',3,0,0),(261,2,31,NULL,'price',4,0,0),(262,4,31,NULL,'price',4,0,0),(263,3,31,NULL,'price',4,0,0),(264,5,31,NULL,'price',4,0,0),(265,1,31,NULL,'price',4,0,0),(266,2,31,2,'id_attribute_group',5,0,0),(267,4,31,2,'id_attribute_group',5,0,0),(268,3,31,2,'id_attribute_group',5,0,0),(269,5,31,2,'id_attribute_group',5,0,0),(270,1,31,2,'id_attribute_group',5,0,0),(271,2,31,1,'id_feature',6,0,0),(272,4,31,1,'id_feature',6,0,0),(273,3,31,1,'id_feature',6,0,0),(274,5,31,1,'id_feature',6,0,0),(275,1,31,1,'id_feature',6,0,0),(276,2,31,2,'id_feature',7,0,0),(277,4,31,2,'id_feature',7,0,0),(278,3,31,2,'id_feature',7,0,0),(279,5,31,2,'id_feature',7,0,0),(280,1,31,2,'id_feature',7,0,0),(281,2,11,NULL,'category',1,0,0),(282,4,11,NULL,'category',1,0,0),(283,3,11,NULL,'category',1,0,0),(284,5,11,NULL,'category',1,0,0),(285,1,11,NULL,'category',1,0,0),(286,2,11,NULL,'condition',2,0,0),(287,4,11,NULL,'condition',2,0,0),(288,3,11,NULL,'condition',2,0,0),(289,5,11,NULL,'condition',2,0,0),(290,1,11,NULL,'condition',2,0,0),(291,2,11,NULL,'manufacturer',3,0,0),(292,4,11,NULL,'manufacturer',3,0,0),(293,3,11,NULL,'manufacturer',3,0,0),(294,5,11,NULL,'manufacturer',3,0,0),(295,1,11,NULL,'manufacturer',3,0,0),(296,2,11,NULL,'price',4,0,0),(297,4,11,NULL,'price',4,0,0),(298,3,11,NULL,'price',4,0,0),(299,5,11,NULL,'price',4,0,0),(300,1,11,NULL,'price',4,0,0),(301,2,11,2,'id_attribute_group',5,0,0),(302,4,11,2,'id_attribute_group',5,0,0),(303,3,11,2,'id_attribute_group',5,0,0),(304,5,11,2,'id_attribute_group',5,0,0),(305,1,11,2,'id_attribute_group',5,0,0),(306,2,11,1,'id_feature',6,0,0),(307,4,11,1,'id_feature',6,0,0),(308,3,11,1,'id_feature',6,0,0),(309,5,11,1,'id_feature',6,0,0),(310,1,11,1,'id_feature',6,0,0),(311,2,11,2,'id_feature',7,0,0),(312,4,11,2,'id_feature',7,0,0),(313,3,11,2,'id_feature',7,0,0),(314,5,11,2,'id_feature',7,0,0),(315,1,11,2,'id_feature',7,0,0),(316,2,12,NULL,'category',1,0,0),(317,4,12,NULL,'category',1,0,0),(318,3,12,NULL,'category',1,0,0),(319,5,12,NULL,'category',1,0,0),(320,1,12,NULL,'category',1,0,0),(321,2,12,NULL,'condition',2,0,0),(322,4,12,NULL,'condition',2,0,0),(323,3,12,NULL,'condition',2,0,0),(324,5,12,NULL,'condition',2,0,0),(325,1,12,NULL,'condition',2,0,0),(326,2,12,NULL,'manufacturer',3,0,0),(327,4,12,NULL,'manufacturer',3,0,0),(328,3,12,NULL,'manufacturer',3,0,0),(329,5,12,NULL,'manufacturer',3,0,0),(330,1,12,NULL,'manufacturer',3,0,0),(331,2,12,NULL,'price',4,0,0),(332,4,12,NULL,'price',4,0,0),(333,3,12,NULL,'price',4,0,0),(334,5,12,NULL,'price',4,0,0),(335,1,12,NULL,'price',4,0,0),(336,2,12,2,'id_attribute_group',5,0,0),(337,4,12,2,'id_attribute_group',5,0,0),(338,3,12,2,'id_attribute_group',5,0,0),(339,5,12,2,'id_attribute_group',5,0,0),(340,1,12,2,'id_attribute_group',5,0,0),(341,2,12,1,'id_feature',6,0,0),(342,4,12,1,'id_feature',6,0,0),(343,3,12,1,'id_feature',6,0,0),(344,5,12,1,'id_feature',6,0,0),(345,1,12,1,'id_feature',6,0,0),(346,2,12,2,'id_feature',7,0,0),(347,4,12,2,'id_feature',7,0,0),(348,3,12,2,'id_feature',7,0,0),(349,5,12,2,'id_feature',7,0,0),(350,1,12,2,'id_feature',7,0,0),(351,2,13,NULL,'category',1,0,0),(352,4,13,NULL,'category',1,0,0),(353,3,13,NULL,'category',1,0,0),(354,5,13,NULL,'category',1,0,0),(355,1,13,NULL,'category',1,0,0),(356,2,13,NULL,'condition',2,0,0),(357,4,13,NULL,'condition',2,0,0),(358,3,13,NULL,'condition',2,0,0),(359,5,13,NULL,'condition',2,0,0),(360,1,13,NULL,'condition',2,0,0),(361,2,13,NULL,'manufacturer',3,0,0),(362,4,13,NULL,'manufacturer',3,0,0),(363,3,13,NULL,'manufacturer',3,0,0),(364,5,13,NULL,'manufacturer',3,0,0),(365,1,13,NULL,'manufacturer',3,0,0),(366,2,13,NULL,'price',4,0,0),(367,4,13,NULL,'price',4,0,0),(368,3,13,NULL,'price',4,0,0),(369,5,13,NULL,'price',4,0,0),(370,1,13,NULL,'price',4,0,0),(371,2,13,2,'id_attribute_group',5,0,0),(372,4,13,2,'id_attribute_group',5,0,0),(373,3,13,2,'id_attribute_group',5,0,0),(374,5,13,2,'id_attribute_group',5,0,0),(375,1,13,2,'id_attribute_group',5,0,0),(376,2,13,1,'id_feature',6,0,0),(377,4,13,1,'id_feature',6,0,0),(378,3,13,1,'id_feature',6,0,0),(379,5,13,1,'id_feature',6,0,0),(380,1,13,1,'id_feature',6,0,0),(381,2,13,2,'id_feature',7,0,0),(382,4,13,2,'id_feature',7,0,0),(383,3,13,2,'id_feature',7,0,0),(384,5,13,2,'id_feature',7,0,0),(385,1,13,2,'id_feature',7,0,0),(386,2,14,NULL,'category',1,0,0),(387,4,14,NULL,'category',1,0,0),(388,3,14,NULL,'category',1,0,0),(389,5,14,NULL,'category',1,0,0),(390,1,14,NULL,'category',1,0,0),(391,2,14,NULL,'condition',2,0,0),(392,4,14,NULL,'condition',2,0,0),(393,3,14,NULL,'condition',2,0,0),(394,5,14,NULL,'condition',2,0,0),(395,1,14,NULL,'condition',2,0,0),(396,2,14,NULL,'manufacturer',3,0,0),(397,4,14,NULL,'manufacturer',3,0,0),(398,3,14,NULL,'manufacturer',3,0,0),(399,5,14,NULL,'manufacturer',3,0,0),(400,1,14,NULL,'manufacturer',3,0,0),(401,2,14,NULL,'price',4,0,0),(402,4,14,NULL,'price',4,0,0),(403,3,14,NULL,'price',4,0,0),(404,5,14,NULL,'price',4,0,0),(405,1,14,NULL,'price',4,0,0),(406,2,14,2,'id_attribute_group',5,0,0),(407,4,14,2,'id_attribute_group',5,0,0),(408,3,14,2,'id_attribute_group',5,0,0),(409,5,14,2,'id_attribute_group',5,0,0),(410,1,14,2,'id_attribute_group',5,0,0),(411,2,14,1,'id_feature',6,0,0),(412,4,14,1,'id_feature',6,0,0),(413,3,14,1,'id_feature',6,0,0),(414,5,14,1,'id_feature',6,0,0),(415,1,14,1,'id_feature',6,0,0),(416,2,14,2,'id_feature',7,0,0),(417,4,14,2,'id_feature',7,0,0),(418,3,14,2,'id_feature',7,0,0),(419,5,14,2,'id_feature',7,0,0),(420,1,14,2,'id_feature',7,0,0),(421,2,32,NULL,'category',1,0,0),(422,4,32,NULL,'category',1,0,0),(423,3,32,NULL,'category',1,0,0),(424,5,32,NULL,'category',1,0,0),(425,1,32,NULL,'category',1,0,0),(426,2,32,NULL,'condition',2,0,0),(427,4,32,NULL,'condition',2,0,0),(428,3,32,NULL,'condition',2,0,0),(429,5,32,NULL,'condition',2,0,0),(430,1,32,NULL,'condition',2,0,0),(431,2,32,NULL,'manufacturer',3,0,0),(432,4,32,NULL,'manufacturer',3,0,0),(433,3,32,NULL,'manufacturer',3,0,0),(434,5,32,NULL,'manufacturer',3,0,0),(435,1,32,NULL,'manufacturer',3,0,0),(436,2,32,NULL,'price',4,0,0),(437,4,32,NULL,'price',4,0,0),(438,3,32,NULL,'price',4,0,0),(439,5,32,NULL,'price',4,0,0),(440,1,32,NULL,'price',4,0,0),(441,2,32,2,'id_attribute_group',5,0,0),(442,4,32,2,'id_attribute_group',5,0,0),(443,3,32,2,'id_attribute_group',5,0,0),(444,5,32,2,'id_attribute_group',5,0,0),(445,1,32,2,'id_attribute_group',5,0,0),(446,2,32,1,'id_feature',6,0,0),(447,4,32,1,'id_feature',6,0,0),(448,3,32,1,'id_feature',6,0,0),(449,5,32,1,'id_feature',6,0,0),(450,1,32,1,'id_feature',6,0,0),(451,2,32,2,'id_feature',7,0,0),(452,4,32,2,'id_feature',7,0,0),(453,3,32,2,'id_feature',7,0,0),(454,5,32,2,'id_feature',7,0,0),(455,1,32,2,'id_feature',7,0,0),(456,2,33,NULL,'category',1,0,0),(457,4,33,NULL,'category',1,0,0),(458,3,33,NULL,'category',1,0,0),(459,5,33,NULL,'category',1,0,0),(460,1,33,NULL,'category',1,0,0),(461,2,33,NULL,'condition',2,0,0),(462,4,33,NULL,'condition',2,0,0),(463,3,33,NULL,'condition',2,0,0),(464,5,33,NULL,'condition',2,0,0),(465,1,33,NULL,'condition',2,0,0),(466,2,33,NULL,'manufacturer',3,0,0),(467,4,33,NULL,'manufacturer',3,0,0),(468,3,33,NULL,'manufacturer',3,0,0),(469,5,33,NULL,'manufacturer',3,0,0),(470,1,33,NULL,'manufacturer',3,0,0),(471,2,33,NULL,'price',4,0,0),(472,4,33,NULL,'price',4,0,0),(473,3,33,NULL,'price',4,0,0),(474,5,33,NULL,'price',4,0,0),(475,1,33,NULL,'price',4,0,0),(476,2,33,2,'id_attribute_group',5,0,0),(477,4,33,2,'id_attribute_group',5,0,0),(478,3,33,2,'id_attribute_group',5,0,0),(479,5,33,2,'id_attribute_group',5,0,0),(480,1,33,2,'id_attribute_group',5,0,0),(481,2,33,1,'id_feature',6,0,0),(482,4,33,1,'id_feature',6,0,0),(483,3,33,1,'id_feature',6,0,0),(484,5,33,1,'id_feature',6,0,0),(485,1,33,1,'id_feature',6,0,0),(486,2,33,2,'id_feature',7,0,0),(487,4,33,2,'id_feature',7,0,0),(488,3,33,2,'id_feature',7,0,0),(489,5,33,2,'id_feature',7,0,0),(490,1,33,2,'id_feature',7,0,0),(491,2,34,NULL,'category',1,0,0),(492,4,34,NULL,'category',1,0,0),(493,3,34,NULL,'category',1,0,0),(494,5,34,NULL,'category',1,0,0),(495,1,34,NULL,'category',1,0,0),(496,2,34,NULL,'condition',2,0,0),(497,4,34,NULL,'condition',2,0,0),(498,3,34,NULL,'condition',2,0,0),(499,5,34,NULL,'condition',2,0,0),(500,1,34,NULL,'condition',2,0,0),(501,2,34,NULL,'manufacturer',3,0,0),(502,4,34,NULL,'manufacturer',3,0,0),(503,3,34,NULL,'manufacturer',3,0,0),(504,5,34,NULL,'manufacturer',3,0,0),(505,1,34,NULL,'manufacturer',3,0,0),(506,2,34,NULL,'price',4,0,0),(507,4,34,NULL,'price',4,0,0),(508,3,34,NULL,'price',4,0,0),(509,5,34,NULL,'price',4,0,0),(510,1,34,NULL,'price',4,0,0),(511,2,34,2,'id_attribute_group',5,0,0),(512,4,34,2,'id_attribute_group',5,0,0),(513,3,34,2,'id_attribute_group',5,0,0),(514,5,34,2,'id_attribute_group',5,0,0),(515,1,34,2,'id_attribute_group',5,0,0),(516,2,34,1,'id_feature',6,0,0),(517,4,34,1,'id_feature',6,0,0),(518,3,34,1,'id_feature',6,0,0),(519,5,34,1,'id_feature',6,0,0),(520,1,34,1,'id_feature',6,0,0),(521,2,34,2,'id_feature',7,0,0),(522,4,34,2,'id_feature',7,0,0),(523,3,34,2,'id_feature',7,0,0),(524,5,34,2,'id_feature',7,0,0),(525,1,34,2,'id_feature',7,0,0),(526,2,35,NULL,'category',1,0,0),(527,4,35,NULL,'category',1,0,0),(528,3,35,NULL,'category',1,0,0),(529,5,35,NULL,'category',1,0,0),(530,1,35,NULL,'category',1,0,0),(531,2,35,NULL,'condition',2,0,0),(532,4,35,NULL,'condition',2,0,0),(533,3,35,NULL,'condition',2,0,0),(534,5,35,NULL,'condition',2,0,0),(535,1,35,NULL,'condition',2,0,0),(536,2,35,NULL,'manufacturer',3,0,0),(537,4,35,NULL,'manufacturer',3,0,0),(538,3,35,NULL,'manufacturer',3,0,0),(539,5,35,NULL,'manufacturer',3,0,0),(540,1,35,NULL,'manufacturer',3,0,0),(541,2,35,NULL,'price',4,0,0),(542,4,35,NULL,'price',4,0,0),(543,3,35,NULL,'price',4,0,0),(544,5,35,NULL,'price',4,0,0),(545,1,35,NULL,'price',4,0,0),(546,2,35,2,'id_attribute_group',5,0,0),(547,4,35,2,'id_attribute_group',5,0,0),(548,3,35,2,'id_attribute_group',5,0,0),(549,5,35,2,'id_attribute_group',5,0,0),(550,1,35,2,'id_attribute_group',5,0,0),(551,2,35,1,'id_feature',6,0,0),(552,4,35,1,'id_feature',6,0,0),(553,3,35,1,'id_feature',6,0,0),(554,5,35,1,'id_feature',6,0,0),(555,1,35,1,'id_feature',6,0,0),(556,2,35,2,'id_feature',7,0,0),(557,4,35,2,'id_feature',7,0,0),(558,3,35,2,'id_feature',7,0,0),(559,5,35,2,'id_feature',7,0,0),(560,1,35,2,'id_feature',7,0,0),(561,2,15,NULL,'category',1,0,0),(562,4,15,NULL,'category',1,0,0),(563,3,15,NULL,'category',1,0,0),(564,5,15,NULL,'category',1,0,0),(565,1,15,NULL,'category',1,0,0),(566,2,15,NULL,'condition',2,0,0),(567,4,15,NULL,'condition',2,0,0),(568,3,15,NULL,'condition',2,0,0),(569,5,15,NULL,'condition',2,0,0),(570,1,15,NULL,'condition',2,0,0),(571,2,15,NULL,'manufacturer',3,0,0),(572,4,15,NULL,'manufacturer',3,0,0),(573,3,15,NULL,'manufacturer',3,0,0),(574,5,15,NULL,'manufacturer',3,0,0),(575,1,15,NULL,'manufacturer',3,0,0),(576,2,15,NULL,'price',4,0,0),(577,4,15,NULL,'price',4,0,0),(578,3,15,NULL,'price',4,0,0),(579,5,15,NULL,'price',4,0,0),(580,1,15,NULL,'price',4,0,0),(581,2,15,2,'id_attribute_group',5,0,0),(582,4,15,2,'id_attribute_group',5,0,0),(583,3,15,2,'id_attribute_group',5,0,0),(584,5,15,2,'id_attribute_group',5,0,0),(585,1,15,2,'id_attribute_group',5,0,0),(586,2,15,1,'id_feature',6,0,0),(587,4,15,1,'id_feature',6,0,0),(588,3,15,1,'id_feature',6,0,0),(589,5,15,1,'id_feature',6,0,0),(590,1,15,1,'id_feature',6,0,0),(591,2,15,2,'id_feature',7,0,0),(592,4,15,2,'id_feature',7,0,0),(593,3,15,2,'id_feature',7,0,0),(594,5,15,2,'id_feature',7,0,0),(595,1,15,2,'id_feature',7,0,0),(596,2,16,NULL,'category',1,0,0),(597,4,16,NULL,'category',1,0,0),(598,3,16,NULL,'category',1,0,0),(599,5,16,NULL,'category',1,0,0),(600,1,16,NULL,'category',1,0,0),(601,2,16,NULL,'condition',2,0,0),(602,4,16,NULL,'condition',2,0,0),(603,3,16,NULL,'condition',2,0,0),(604,5,16,NULL,'condition',2,0,0),(605,1,16,NULL,'condition',2,0,0),(606,2,16,NULL,'manufacturer',3,0,0),(607,4,16,NULL,'manufacturer',3,0,0),(608,3,16,NULL,'manufacturer',3,0,0),(609,5,16,NULL,'manufacturer',3,0,0),(610,1,16,NULL,'manufacturer',3,0,0),(611,2,16,NULL,'price',4,0,0),(612,4,16,NULL,'price',4,0,0),(613,3,16,NULL,'price',4,0,0),(614,5,16,NULL,'price',4,0,0),(615,1,16,NULL,'price',4,0,0),(616,2,16,2,'id_attribute_group',5,0,0),(617,4,16,2,'id_attribute_group',5,0,0),(618,3,16,2,'id_attribute_group',5,0,0),(619,5,16,2,'id_attribute_group',5,0,0),(620,1,16,2,'id_attribute_group',5,0,0),(621,2,16,1,'id_feature',6,0,0),(622,4,16,1,'id_feature',6,0,0),(623,3,16,1,'id_feature',6,0,0),(624,5,16,1,'id_feature',6,0,0),(625,1,16,1,'id_feature',6,0,0),(626,2,16,2,'id_feature',7,0,0),(627,4,16,2,'id_feature',7,0,0),(628,3,16,2,'id_feature',7,0,0),(629,5,16,2,'id_feature',7,0,0),(630,1,16,2,'id_feature',7,0,0),(631,2,17,NULL,'category',1,0,0),(632,4,17,NULL,'category',1,0,0),(633,3,17,NULL,'category',1,0,0),(634,5,17,NULL,'category',1,0,0),(635,1,17,NULL,'category',1,0,0),(636,2,17,NULL,'condition',2,0,0),(637,4,17,NULL,'condition',2,0,0),(638,3,17,NULL,'condition',2,0,0),(639,5,17,NULL,'condition',2,0,0),(640,1,17,NULL,'condition',2,0,0),(641,2,17,NULL,'manufacturer',3,0,0),(642,4,17,NULL,'manufacturer',3,0,0),(643,3,17,NULL,'manufacturer',3,0,0),(644,5,17,NULL,'manufacturer',3,0,0),(645,1,17,NULL,'manufacturer',3,0,0),(646,2,17,NULL,'price',4,0,0),(647,4,17,NULL,'price',4,0,0),(648,3,17,NULL,'price',4,0,0),(649,5,17,NULL,'price',4,0,0),(650,1,17,NULL,'price',4,0,0),(651,2,17,2,'id_attribute_group',5,0,0),(652,4,17,2,'id_attribute_group',5,0,0),(653,3,17,2,'id_attribute_group',5,0,0),(654,5,17,2,'id_attribute_group',5,0,0),(655,1,17,2,'id_attribute_group',5,0,0),(656,2,17,1,'id_feature',6,0,0),(657,4,17,1,'id_feature',6,0,0),(658,3,17,1,'id_feature',6,0,0),(659,5,17,1,'id_feature',6,0,0),(660,1,17,1,'id_feature',6,0,0),(661,2,17,2,'id_feature',7,0,0),(662,4,17,2,'id_feature',7,0,0),(663,3,17,2,'id_feature',7,0,0),(664,5,17,2,'id_feature',7,0,0),(665,1,17,2,'id_feature',7,0,0),(666,2,18,NULL,'category',1,0,0),(667,4,18,NULL,'category',1,0,0),(668,3,18,NULL,'category',1,0,0),(669,5,18,NULL,'category',1,0,0),(670,1,18,NULL,'category',1,0,0),(671,2,18,NULL,'condition',2,0,0),(672,4,18,NULL,'condition',2,0,0),(673,3,18,NULL,'condition',2,0,0),(674,5,18,NULL,'condition',2,0,0),(675,1,18,NULL,'condition',2,0,0),(676,2,18,NULL,'manufacturer',3,0,0),(677,4,18,NULL,'manufacturer',3,0,0),(678,3,18,NULL,'manufacturer',3,0,0),(679,5,18,NULL,'manufacturer',3,0,0),(680,1,18,NULL,'manufacturer',3,0,0),(681,2,18,NULL,'price',4,0,0),(682,4,18,NULL,'price',4,0,0),(683,3,18,NULL,'price',4,0,0),(684,5,18,NULL,'price',4,0,0),(685,1,18,NULL,'price',4,0,0),(686,2,18,2,'id_attribute_group',5,0,0),(687,4,18,2,'id_attribute_group',5,0,0),(688,3,18,2,'id_attribute_group',5,0,0),(689,5,18,2,'id_attribute_group',5,0,0),(690,1,18,2,'id_attribute_group',5,0,0),(691,2,18,1,'id_feature',6,0,0),(692,4,18,1,'id_feature',6,0,0),(693,3,18,1,'id_feature',6,0,0),(694,5,18,1,'id_feature',6,0,0),(695,1,18,1,'id_feature',6,0,0),(696,2,18,2,'id_feature',7,0,0),(697,4,18,2,'id_feature',7,0,0),(698,3,18,2,'id_feature',7,0,0),(699,5,18,2,'id_feature',7,0,0),(700,1,18,2,'id_feature',7,0,0),(701,2,19,NULL,'category',1,0,0),(702,4,19,NULL,'category',1,0,0),(703,3,19,NULL,'category',1,0,0),(704,5,19,NULL,'category',1,0,0),(705,1,19,NULL,'category',1,0,0),(706,2,19,NULL,'condition',2,0,0),(707,4,19,NULL,'condition',2,0,0),(708,3,19,NULL,'condition',2,0,0),(709,5,19,NULL,'condition',2,0,0),(710,1,19,NULL,'condition',2,0,0),(711,2,19,NULL,'manufacturer',3,0,0),(712,4,19,NULL,'manufacturer',3,0,0),(713,3,19,NULL,'manufacturer',3,0,0),(714,5,19,NULL,'manufacturer',3,0,0),(715,1,19,NULL,'manufacturer',3,0,0),(716,2,19,NULL,'price',4,0,0),(717,4,19,NULL,'price',4,0,0),(718,3,19,NULL,'price',4,0,0),(719,5,19,NULL,'price',4,0,0),(720,1,19,NULL,'price',4,0,0),(721,2,19,2,'id_attribute_group',5,0,0),(722,4,19,2,'id_attribute_group',5,0,0),(723,3,19,2,'id_attribute_group',5,0,0),(724,5,19,2,'id_attribute_group',5,0,0),(725,1,19,2,'id_attribute_group',5,0,0),(726,2,19,1,'id_feature',6,0,0),(727,4,19,1,'id_feature',6,0,0),(728,3,19,1,'id_feature',6,0,0),(729,5,19,1,'id_feature',6,0,0),(730,1,19,1,'id_feature',6,0,0),(731,2,19,2,'id_feature',7,0,0),(732,4,19,2,'id_feature',7,0,0),(733,3,19,2,'id_feature',7,0,0),(734,5,19,2,'id_feature',7,0,0),(735,1,19,2,'id_feature',7,0,0),(736,2,20,NULL,'category',1,0,0),(737,4,20,NULL,'category',1,0,0),(738,3,20,NULL,'category',1,0,0),(739,5,20,NULL,'category',1,0,0),(740,1,20,NULL,'category',1,0,0),(741,2,20,NULL,'condition',2,0,0),(742,4,20,NULL,'condition',2,0,0),(743,3,20,NULL,'condition',2,0,0),(744,5,20,NULL,'condition',2,0,0),(745,1,20,NULL,'condition',2,0,0),(746,2,20,NULL,'manufacturer',3,0,0),(747,4,20,NULL,'manufacturer',3,0,0),(748,3,20,NULL,'manufacturer',3,0,0),(749,5,20,NULL,'manufacturer',3,0,0),(750,1,20,NULL,'manufacturer',3,0,0),(751,2,20,NULL,'price',4,0,0),(752,4,20,NULL,'price',4,0,0),(753,3,20,NULL,'price',4,0,0),(754,5,20,NULL,'price',4,0,0),(755,1,20,NULL,'price',4,0,0),(756,2,20,2,'id_attribute_group',5,0,0),(757,4,20,2,'id_attribute_group',5,0,0),(758,3,20,2,'id_attribute_group',5,0,0),(759,5,20,2,'id_attribute_group',5,0,0),(760,1,20,2,'id_attribute_group',5,0,0),(761,2,20,1,'id_feature',6,0,0),(762,4,20,1,'id_feature',6,0,0),(763,3,20,1,'id_feature',6,0,0),(764,5,20,1,'id_feature',6,0,0),(765,1,20,1,'id_feature',6,0,0),(766,2,20,2,'id_feature',7,0,0),(767,4,20,2,'id_feature',7,0,0),(768,3,20,2,'id_feature',7,0,0),(769,5,20,2,'id_feature',7,0,0),(770,1,20,2,'id_feature',7,0,0),(771,2,21,NULL,'category',1,0,0),(772,4,21,NULL,'category',1,0,0),(773,3,21,NULL,'category',1,0,0),(774,5,21,NULL,'category',1,0,0),(775,1,21,NULL,'category',1,0,0),(776,2,21,NULL,'condition',2,0,0),(777,4,21,NULL,'condition',2,0,0),(778,3,21,NULL,'condition',2,0,0),(779,5,21,NULL,'condition',2,0,0),(780,1,21,NULL,'condition',2,0,0),(781,2,21,NULL,'manufacturer',3,0,0),(782,4,21,NULL,'manufacturer',3,0,0),(783,3,21,NULL,'manufacturer',3,0,0),(784,5,21,NULL,'manufacturer',3,0,0),(785,1,21,NULL,'manufacturer',3,0,0),(786,2,21,NULL,'price',4,0,0),(787,4,21,NULL,'price',4,0,0),(788,3,21,NULL,'price',4,0,0),(789,5,21,NULL,'price',4,0,0),(790,1,21,NULL,'price',4,0,0),(791,2,21,2,'id_attribute_group',5,0,0),(792,4,21,2,'id_attribute_group',5,0,0),(793,3,21,2,'id_attribute_group',5,0,0),(794,5,21,2,'id_attribute_group',5,0,0),(795,1,21,2,'id_attribute_group',5,0,0),(796,2,21,1,'id_feature',6,0,0),(797,4,21,1,'id_feature',6,0,0),(798,3,21,1,'id_feature',6,0,0),(799,5,21,1,'id_feature',6,0,0),(800,1,21,1,'id_feature',6,0,0),(801,2,21,2,'id_feature',7,0,0),(802,4,21,2,'id_feature',7,0,0),(803,3,21,2,'id_feature',7,0,0),(804,5,21,2,'id_feature',7,0,0),(805,1,21,2,'id_feature',7,0,0),(806,2,22,NULL,'category',1,0,0),(807,4,22,NULL,'category',1,0,0),(808,3,22,NULL,'category',1,0,0),(809,5,22,NULL,'category',1,0,0),(810,1,22,NULL,'category',1,0,0),(811,2,22,NULL,'condition',2,0,0),(812,4,22,NULL,'condition',2,0,0),(813,3,22,NULL,'condition',2,0,0),(814,5,22,NULL,'condition',2,0,0),(815,1,22,NULL,'condition',2,0,0),(816,2,22,NULL,'manufacturer',3,0,0),(817,4,22,NULL,'manufacturer',3,0,0),(818,3,22,NULL,'manufacturer',3,0,0),(819,5,22,NULL,'manufacturer',3,0,0),(820,1,22,NULL,'manufacturer',3,0,0),(821,2,22,NULL,'price',4,0,0),(822,4,22,NULL,'price',4,0,0),(823,3,22,NULL,'price',4,0,0),(824,5,22,NULL,'price',4,0,0),(825,1,22,NULL,'price',4,0,0),(826,2,22,2,'id_attribute_group',5,0,0),(827,4,22,2,'id_attribute_group',5,0,0),(828,3,22,2,'id_attribute_group',5,0,0),(829,5,22,2,'id_attribute_group',5,0,0),(830,1,22,2,'id_attribute_group',5,0,0),(831,2,22,1,'id_feature',6,0,0),(832,4,22,1,'id_feature',6,0,0),(833,3,22,1,'id_feature',6,0,0),(834,5,22,1,'id_feature',6,0,0),(835,1,22,1,'id_feature',6,0,0),(836,2,22,2,'id_feature',7,0,0),(837,4,22,2,'id_feature',7,0,0),(838,3,22,2,'id_feature',7,0,0),(839,5,22,2,'id_feature',7,0,0),(840,1,22,2,'id_feature',7,0,0),(841,2,23,NULL,'category',1,0,0),(842,4,23,NULL,'category',1,0,0),(843,3,23,NULL,'category',1,0,0),(844,5,23,NULL,'category',1,0,0),(845,1,23,NULL,'category',1,0,0),(846,2,23,NULL,'condition',2,0,0),(847,4,23,NULL,'condition',2,0,0),(848,3,23,NULL,'condition',2,0,0),(849,5,23,NULL,'condition',2,0,0),(850,1,23,NULL,'condition',2,0,0),(851,2,23,NULL,'manufacturer',3,0,0),(852,4,23,NULL,'manufacturer',3,0,0),(853,3,23,NULL,'manufacturer',3,0,0),(854,5,23,NULL,'manufacturer',3,0,0),(855,1,23,NULL,'manufacturer',3,0,0),(856,2,23,NULL,'price',4,0,0),(857,4,23,NULL,'price',4,0,0),(858,3,23,NULL,'price',4,0,0),(859,5,23,NULL,'price',4,0,0),(860,1,23,NULL,'price',4,0,0),(861,2,23,2,'id_attribute_group',5,0,0),(862,4,23,2,'id_attribute_group',5,0,0),(863,3,23,2,'id_attribute_group',5,0,0),(864,5,23,2,'id_attribute_group',5,0,0),(865,1,23,2,'id_attribute_group',5,0,0),(866,2,23,1,'id_feature',6,0,0),(867,4,23,1,'id_feature',6,0,0),(868,3,23,1,'id_feature',6,0,0),(869,5,23,1,'id_feature',6,0,0),(870,1,23,1,'id_feature',6,0,0),(871,2,23,2,'id_feature',7,0,0),(872,4,23,2,'id_feature',7,0,0),(873,3,23,2,'id_feature',7,0,0),(874,5,23,2,'id_feature',7,0,0),(875,1,23,2,'id_feature',7,0,0),(876,2,24,NULL,'category',1,0,0),(877,4,24,NULL,'category',1,0,0),(878,3,24,NULL,'category',1,0,0),(879,5,24,NULL,'category',1,0,0),(880,1,24,NULL,'category',1,0,0),(881,2,24,NULL,'condition',2,0,0),(882,4,24,NULL,'condition',2,0,0),(883,3,24,NULL,'condition',2,0,0),(884,5,24,NULL,'condition',2,0,0),(885,1,24,NULL,'condition',2,0,0),(886,2,24,NULL,'manufacturer',3,0,0),(887,4,24,NULL,'manufacturer',3,0,0),(888,3,24,NULL,'manufacturer',3,0,0),(889,5,24,NULL,'manufacturer',3,0,0),(890,1,24,NULL,'manufacturer',3,0,0),(891,2,24,NULL,'price',4,0,0),(892,4,24,NULL,'price',4,0,0),(893,3,24,NULL,'price',4,0,0),(894,5,24,NULL,'price',4,0,0),(895,1,24,NULL,'price',4,0,0),(896,2,24,2,'id_attribute_group',5,0,0),(897,4,24,2,'id_attribute_group',5,0,0),(898,3,24,2,'id_attribute_group',5,0,0),(899,5,24,2,'id_attribute_group',5,0,0),(900,1,24,2,'id_attribute_group',5,0,0),(901,2,24,1,'id_feature',6,0,0),(902,4,24,1,'id_feature',6,0,0),(903,3,24,1,'id_feature',6,0,0),(904,5,24,1,'id_feature',6,0,0),(905,1,24,1,'id_feature',6,0,0),(906,2,24,2,'id_feature',7,0,0),(907,4,24,2,'id_feature',7,0,0),(908,3,24,2,'id_feature',7,0,0),(909,5,24,2,'id_feature',7,0,0),(910,1,24,2,'id_feature',7,0,0),(911,2,25,NULL,'category',1,0,0),(912,4,25,NULL,'category',1,0,0),(913,3,25,NULL,'category',1,0,0),(914,5,25,NULL,'category',1,0,0),(915,1,25,NULL,'category',1,0,0),(916,2,25,NULL,'condition',2,0,0),(917,4,25,NULL,'condition',2,0,0),(918,3,25,NULL,'condition',2,0,0),(919,5,25,NULL,'condition',2,0,0),(920,1,25,NULL,'condition',2,0,0),(921,2,25,NULL,'manufacturer',3,0,0),(922,4,25,NULL,'manufacturer',3,0,0),(923,3,25,NULL,'manufacturer',3,0,0),(924,5,25,NULL,'manufacturer',3,0,0),(925,1,25,NULL,'manufacturer',3,0,0),(926,2,25,NULL,'price',4,0,0),(927,4,25,NULL,'price',4,0,0),(928,3,25,NULL,'price',4,0,0),(929,5,25,NULL,'price',4,0,0),(930,1,25,NULL,'price',4,0,0),(931,2,25,2,'id_attribute_group',5,0,0),(932,4,25,2,'id_attribute_group',5,0,0),(933,3,25,2,'id_attribute_group',5,0,0),(934,5,25,2,'id_attribute_group',5,0,0),(935,1,25,2,'id_attribute_group',5,0,0),(936,2,25,1,'id_feature',6,0,0),(937,4,25,1,'id_feature',6,0,0),(938,3,25,1,'id_feature',6,0,0),(939,5,25,1,'id_feature',6,0,0),(940,1,25,1,'id_feature',6,0,0),(941,2,25,2,'id_feature',7,0,0),(942,4,25,2,'id_feature',7,0,0),(943,3,25,2,'id_feature',7,0,0),(944,5,25,2,'id_feature',7,0,0),(945,1,25,2,'id_feature',7,0,0),(946,2,26,NULL,'category',1,0,0),(947,4,26,NULL,'category',1,0,0),(948,3,26,NULL,'category',1,0,0),(949,5,26,NULL,'category',1,0,0),(950,1,26,NULL,'category',1,0,0),(951,2,26,NULL,'condition',2,0,0),(952,4,26,NULL,'condition',2,0,0),(953,3,26,NULL,'condition',2,0,0),(954,5,26,NULL,'condition',2,0,0),(955,1,26,NULL,'condition',2,0,0),(956,2,26,NULL,'manufacturer',3,0,0),(957,4,26,NULL,'manufacturer',3,0,0),(958,3,26,NULL,'manufacturer',3,0,0),(959,5,26,NULL,'manufacturer',3,0,0),(960,1,26,NULL,'manufacturer',3,0,0),(961,2,26,NULL,'price',4,0,0),(962,4,26,NULL,'price',4,0,0),(963,3,26,NULL,'price',4,0,0),(964,5,26,NULL,'price',4,0,0),(965,1,26,NULL,'price',4,0,0),(966,2,26,2,'id_attribute_group',5,0,0),(967,4,26,2,'id_attribute_group',5,0,0),(968,3,26,2,'id_attribute_group',5,0,0),(969,5,26,2,'id_attribute_group',5,0,0),(970,1,26,2,'id_attribute_group',5,0,0),(971,2,26,1,'id_feature',6,0,0),(972,4,26,1,'id_feature',6,0,0),(973,3,26,1,'id_feature',6,0,0),(974,5,26,1,'id_feature',6,0,0),(975,1,26,1,'id_feature',6,0,0),(976,2,26,2,'id_feature',7,0,0),(977,4,26,2,'id_feature',7,0,0),(978,3,26,2,'id_feature',7,0,0),(979,5,26,2,'id_feature',7,0,0),(980,1,26,2,'id_feature',7,0,0),(981,2,27,NULL,'category',1,0,0),(982,4,27,NULL,'category',1,0,0),(983,3,27,NULL,'category',1,0,0),(984,5,27,NULL,'category',1,0,0),(985,1,27,NULL,'category',1,0,0),(986,2,27,NULL,'condition',2,0,0),(987,4,27,NULL,'condition',2,0,0),(988,3,27,NULL,'condition',2,0,0),(989,5,27,NULL,'condition',2,0,0),(990,1,27,NULL,'condition',2,0,0),(991,2,27,NULL,'manufacturer',3,0,0),(992,4,27,NULL,'manufacturer',3,0,0),(993,3,27,NULL,'manufacturer',3,0,0),(994,5,27,NULL,'manufacturer',3,0,0),(995,1,27,NULL,'manufacturer',3,0,0),(996,2,27,NULL,'price',4,0,0),(997,4,27,NULL,'price',4,0,0),(998,3,27,NULL,'price',4,0,0),(999,5,27,NULL,'price',4,0,0),(1000,1,27,NULL,'price',4,0,0),(1001,2,27,2,'id_attribute_group',5,0,0),(1002,4,27,2,'id_attribute_group',5,0,0),(1003,3,27,2,'id_attribute_group',5,0,0),(1004,5,27,2,'id_attribute_group',5,0,0),(1005,1,27,2,'id_attribute_group',5,0,0),(1006,2,27,1,'id_feature',6,0,0),(1007,4,27,1,'id_feature',6,0,0),(1008,3,27,1,'id_feature',6,0,0),(1009,5,27,1,'id_feature',6,0,0),(1010,1,27,1,'id_feature',6,0,0),(1011,2,27,2,'id_feature',7,0,0),(1012,4,27,2,'id_feature',7,0,0),(1013,3,27,2,'id_feature',7,0,0),(1014,5,27,2,'id_feature',7,0,0),(1015,1,27,2,'id_feature',7,0,0),(1016,2,28,NULL,'category',1,0,0),(1017,4,28,NULL,'category',1,0,0),(1018,3,28,NULL,'category',1,0,0),(1019,5,28,NULL,'category',1,0,0),(1020,1,28,NULL,'category',1,0,0),(1021,2,28,NULL,'condition',2,0,0),(1022,4,28,NULL,'condition',2,0,0),(1023,3,28,NULL,'condition',2,0,0),(1024,5,28,NULL,'condition',2,0,0),(1025,1,28,NULL,'condition',2,0,0),(1026,2,28,NULL,'manufacturer',3,0,0),(1027,4,28,NULL,'manufacturer',3,0,0),(1028,3,28,NULL,'manufacturer',3,0,0),(1029,5,28,NULL,'manufacturer',3,0,0),(1030,1,28,NULL,'manufacturer',3,0,0),(1031,2,28,NULL,'price',4,0,0),(1032,4,28,NULL,'price',4,0,0),(1033,3,28,NULL,'price',4,0,0),(1034,5,28,NULL,'price',4,0,0),(1035,1,28,NULL,'price',4,0,0),(1036,2,28,2,'id_attribute_group',5,0,0),(1037,4,28,2,'id_attribute_group',5,0,0),(1038,3,28,2,'id_attribute_group',5,0,0),(1039,5,28,2,'id_attribute_group',5,0,0),(1040,1,28,2,'id_attribute_group',5,0,0),(1041,2,28,1,'id_feature',6,0,0),(1042,4,28,1,'id_feature',6,0,0),(1043,3,28,1,'id_feature',6,0,0),(1044,5,28,1,'id_feature',6,0,0),(1045,1,28,1,'id_feature',6,0,0),(1046,2,28,2,'id_feature',7,0,0),(1047,4,28,2,'id_feature',7,0,0),(1048,3,28,2,'id_feature',7,0,0),(1049,5,28,2,'id_feature',7,0,0),(1050,1,28,2,'id_feature',7,0,0),(1051,2,29,NULL,'category',1,0,0),(1052,4,29,NULL,'category',1,0,0),(1053,3,29,NULL,'category',1,0,0),(1054,5,29,NULL,'category',1,0,0),(1055,1,29,NULL,'category',1,0,0),(1056,2,29,NULL,'condition',2,0,0),(1057,4,29,NULL,'condition',2,0,0),(1058,3,29,NULL,'condition',2,0,0),(1059,5,29,NULL,'condition',2,0,0),(1060,1,29,NULL,'condition',2,0,0),(1061,2,29,NULL,'manufacturer',3,0,0),(1062,4,29,NULL,'manufacturer',3,0,0),(1063,3,29,NULL,'manufacturer',3,0,0),(1064,5,29,NULL,'manufacturer',3,0,0),(1065,1,29,NULL,'manufacturer',3,0,0),(1066,2,29,NULL,'price',4,0,0),(1067,4,29,NULL,'price',4,0,0),(1068,3,29,NULL,'price',4,0,0),(1069,5,29,NULL,'price',4,0,0),(1070,1,29,NULL,'price',4,0,0),(1071,2,29,2,'id_attribute_group',5,0,0),(1072,4,29,2,'id_attribute_group',5,0,0),(1073,3,29,2,'id_attribute_group',5,0,0),(1074,5,29,2,'id_attribute_group',5,0,0),(1075,1,29,2,'id_attribute_group',5,0,0),(1076,2,29,1,'id_feature',6,0,0),(1077,4,29,1,'id_feature',6,0,0),(1078,3,29,1,'id_feature',6,0,0),(1079,5,29,1,'id_feature',6,0,0),(1080,1,29,1,'id_feature',6,0,0),(1081,2,29,2,'id_feature',7,0,0),(1082,4,29,2,'id_feature',7,0,0),(1083,3,29,2,'id_feature',7,0,0),(1084,5,29,2,'id_feature',7,0,0),(1085,1,29,2,'id_feature',7,0,0),(1086,2,30,NULL,'category',1,0,0),(1087,4,30,NULL,'category',1,0,0),(1088,3,30,NULL,'category',1,0,0),(1089,5,30,NULL,'category',1,0,0),(1090,1,30,NULL,'category',1,0,0),(1091,2,30,NULL,'condition',2,0,0),(1092,4,30,NULL,'condition',2,0,0),(1093,3,30,NULL,'condition',2,0,0),(1094,5,30,NULL,'condition',2,0,0),(1095,1,30,NULL,'condition',2,0,0),(1096,2,30,NULL,'manufacturer',3,0,0),(1097,4,30,NULL,'manufacturer',3,0,0),(1098,3,30,NULL,'manufacturer',3,0,0),(1099,5,30,NULL,'manufacturer',3,0,0),(1100,1,30,NULL,'manufacturer',3,0,0),(1101,2,30,NULL,'price',4,0,0),(1102,4,30,NULL,'price',4,0,0),(1103,3,30,NULL,'price',4,0,0),(1104,5,30,NULL,'price',4,0,0),(1105,1,30,NULL,'price',4,0,0),(1106,2,30,2,'id_attribute_group',5,0,0),(1107,4,30,2,'id_attribute_group',5,0,0),(1108,3,30,2,'id_attribute_group',5,0,0),(1109,5,30,2,'id_attribute_group',5,0,0),(1110,1,30,2,'id_attribute_group',5,0,0),(1111,2,30,1,'id_feature',6,0,0),(1112,4,30,1,'id_feature',6,0,0),(1113,3,30,1,'id_feature',6,0,0),(1114,5,30,1,'id_feature',6,0,0),(1115,1,30,1,'id_feature',6,0,0),(1116,2,30,2,'id_feature',7,0,0),(1117,4,30,2,'id_feature',7,0,0),(1118,3,30,2,'id_feature',7,0,0),(1119,5,30,2,'id_feature',7,0,0),(1120,1,30,2,'id_feature',7,0,0),(1121,2,36,NULL,'category',1,0,0),(1122,4,36,NULL,'category',1,0,0),(1123,3,36,NULL,'category',1,0,0),(1124,5,36,NULL,'category',1,0,0),(1125,1,36,NULL,'category',1,0,0),(1126,2,36,NULL,'condition',2,0,0),(1127,4,36,NULL,'condition',2,0,0),(1128,3,36,NULL,'condition',2,0,0),(1129,5,36,NULL,'condition',2,0,0),(1130,1,36,NULL,'condition',2,0,0),(1131,2,36,NULL,'manufacturer',3,0,0),(1132,4,36,NULL,'manufacturer',3,0,0),(1133,3,36,NULL,'manufacturer',3,0,0),(1134,5,36,NULL,'manufacturer',3,0,0),(1135,1,36,NULL,'manufacturer',3,0,0),(1136,2,36,NULL,'price',4,0,0),(1137,4,36,NULL,'price',4,0,0),(1138,3,36,NULL,'price',4,0,0),(1139,5,36,NULL,'price',4,0,0),(1140,1,36,NULL,'price',4,0,0),(1141,2,36,2,'id_attribute_group',5,0,0),(1142,4,36,2,'id_attribute_group',5,0,0),(1143,3,36,2,'id_attribute_group',5,0,0),(1144,5,36,2,'id_attribute_group',5,0,0),(1145,1,36,2,'id_attribute_group',5,0,0),(1146,2,36,1,'id_feature',6,0,0),(1147,4,36,1,'id_feature',6,0,0),(1148,3,36,1,'id_feature',6,0,0),(1149,5,36,1,'id_feature',6,0,0),(1150,1,36,1,'id_feature',6,0,0),(1151,2,36,2,'id_feature',7,0,0),(1152,4,36,2,'id_feature',7,0,0),(1153,3,36,2,'id_feature',7,0,0),(1154,5,36,2,'id_feature',7,0,0),(1155,1,36,2,'id_feature',7,0,0),(1156,2,37,NULL,'category',1,0,0),(1157,4,37,NULL,'category',1,0,0),(1158,3,37,NULL,'category',1,0,0),(1159,5,37,NULL,'category',1,0,0),(1160,1,37,NULL,'category',1,0,0),(1161,2,37,NULL,'condition',2,0,0),(1162,4,37,NULL,'condition',2,0,0),(1163,3,37,NULL,'condition',2,0,0),(1164,5,37,NULL,'condition',2,0,0),(1165,1,37,NULL,'condition',2,0,0),(1166,2,37,NULL,'manufacturer',3,0,0),(1167,4,37,NULL,'manufacturer',3,0,0),(1168,3,37,NULL,'manufacturer',3,0,0),(1169,5,37,NULL,'manufacturer',3,0,0),(1170,1,37,NULL,'manufacturer',3,0,0),(1171,2,37,NULL,'price',4,0,0),(1172,4,37,NULL,'price',4,0,0),(1173,3,37,NULL,'price',4,0,0),(1174,5,37,NULL,'price',4,0,0),(1175,1,37,NULL,'price',4,0,0),(1176,2,37,2,'id_attribute_group',5,0,0),(1177,4,37,2,'id_attribute_group',5,0,0),(1178,3,37,2,'id_attribute_group',5,0,0),(1179,5,37,2,'id_attribute_group',5,0,0),(1180,1,37,2,'id_attribute_group',5,0,0),(1181,2,37,1,'id_feature',6,0,0),(1182,4,37,1,'id_feature',6,0,0),(1183,3,37,1,'id_feature',6,0,0),(1184,5,37,1,'id_feature',6,0,0),(1185,1,37,1,'id_feature',6,0,0),(1186,2,37,2,'id_feature',7,0,0),(1187,4,37,2,'id_feature',7,0,0),(1188,3,37,2,'id_feature',7,0,0),(1189,5,37,2,'id_feature',7,0,0),(1190,1,37,2,'id_feature',7,0,0),(1191,2,38,NULL,'category',1,0,0),(1192,4,38,NULL,'category',1,0,0),(1193,3,38,NULL,'category',1,0,0),(1194,5,38,NULL,'category',1,0,0),(1195,1,38,NULL,'category',1,0,0),(1196,2,38,NULL,'condition',2,0,0),(1197,4,38,NULL,'condition',2,0,0),(1198,3,38,NULL,'condition',2,0,0),(1199,5,38,NULL,'condition',2,0,0),(1200,1,38,NULL,'condition',2,0,0),(1201,2,38,NULL,'manufacturer',3,0,0),(1202,4,38,NULL,'manufacturer',3,0,0),(1203,3,38,NULL,'manufacturer',3,0,0),(1204,5,38,NULL,'manufacturer',3,0,0),(1205,1,38,NULL,'manufacturer',3,0,0),(1206,2,38,NULL,'price',4,0,0),(1207,4,38,NULL,'price',4,0,0),(1208,3,38,NULL,'price',4,0,0),(1209,5,38,NULL,'price',4,0,0),(1210,1,38,NULL,'price',4,0,0),(1211,2,38,2,'id_attribute_group',5,0,0),(1212,4,38,2,'id_attribute_group',5,0,0),(1213,3,38,2,'id_attribute_group',5,0,0),(1214,5,38,2,'id_attribute_group',5,0,0),(1215,1,38,2,'id_attribute_group',5,0,0),(1216,2,38,1,'id_feature',6,0,0),(1217,4,38,1,'id_feature',6,0,0),(1218,3,38,1,'id_feature',6,0,0),(1219,5,38,1,'id_feature',6,0,0),(1220,1,38,1,'id_feature',6,0,0),(1221,2,38,2,'id_feature',7,0,0),(1222,4,38,2,'id_feature',7,0,0),(1223,3,38,2,'id_feature',7,0,0),(1224,5,38,2,'id_feature',7,0,0),(1225,1,38,2,'id_feature',7,0,0),(1226,2,39,NULL,'category',1,0,0),(1227,4,39,NULL,'category',1,0,0),(1228,3,39,NULL,'category',1,0,0),(1229,5,39,NULL,'category',1,0,0),(1230,1,39,NULL,'category',1,0,0),(1231,2,39,NULL,'condition',2,0,0),(1232,4,39,NULL,'condition',2,0,0),(1233,3,39,NULL,'condition',2,0,0),(1234,5,39,NULL,'condition',2,0,0),(1235,1,39,NULL,'condition',2,0,0),(1236,2,39,NULL,'manufacturer',3,0,0),(1237,4,39,NULL,'manufacturer',3,0,0),(1238,3,39,NULL,'manufacturer',3,0,0),(1239,5,39,NULL,'manufacturer',3,0,0),(1240,1,39,NULL,'manufacturer',3,0,0),(1241,2,39,NULL,'price',4,0,0),(1242,4,39,NULL,'price',4,0,0),(1243,3,39,NULL,'price',4,0,0),(1244,5,39,NULL,'price',4,0,0),(1245,1,39,NULL,'price',4,0,0),(1246,2,39,2,'id_attribute_group',5,0,0),(1247,4,39,2,'id_attribute_group',5,0,0),(1248,3,39,2,'id_attribute_group',5,0,0),(1249,5,39,2,'id_attribute_group',5,0,0),(1250,1,39,2,'id_attribute_group',5,0,0),(1251,2,39,1,'id_feature',6,0,0),(1252,4,39,1,'id_feature',6,0,0),(1253,3,39,1,'id_feature',6,0,0),(1254,5,39,1,'id_feature',6,0,0),(1255,1,39,1,'id_feature',6,0,0),(1256,2,39,2,'id_feature',7,0,0),(1257,4,39,2,'id_feature',7,0,0),(1258,3,39,2,'id_feature',7,0,0),(1259,5,39,2,'id_feature',7,0,0),(1260,1,39,2,'id_feature',7,0,0),(1261,2,40,NULL,'category',1,0,0),(1262,4,40,NULL,'category',1,0,0),(1263,3,40,NULL,'category',1,0,0),(1264,5,40,NULL,'category',1,0,0),(1265,1,40,NULL,'category',1,0,0),(1266,2,40,NULL,'condition',2,0,0),(1267,4,40,NULL,'condition',2,0,0),(1268,3,40,NULL,'condition',2,0,0),(1269,5,40,NULL,'condition',2,0,0),(1270,1,40,NULL,'condition',2,0,0),(1271,2,40,NULL,'manufacturer',3,0,0),(1272,4,40,NULL,'manufacturer',3,0,0),(1273,3,40,NULL,'manufacturer',3,0,0),(1274,5,40,NULL,'manufacturer',3,0,0),(1275,1,40,NULL,'manufacturer',3,0,0),(1276,2,40,NULL,'price',4,0,0),(1277,4,40,NULL,'price',4,0,0),(1278,3,40,NULL,'price',4,0,0),(1279,5,40,NULL,'price',4,0,0),(1280,1,40,NULL,'price',4,0,0),(1281,2,40,2,'id_attribute_group',5,0,0),(1282,4,40,2,'id_attribute_group',5,0,0),(1283,3,40,2,'id_attribute_group',5,0,0),(1284,5,40,2,'id_attribute_group',5,0,0),(1285,1,40,2,'id_attribute_group',5,0,0),(1286,2,40,1,'id_feature',6,0,0),(1287,4,40,1,'id_feature',6,0,0),(1288,3,40,1,'id_feature',6,0,0),(1289,5,40,1,'id_feature',6,0,0),(1290,1,40,1,'id_feature',6,0,0),(1291,2,40,2,'id_feature',7,0,0),(1292,4,40,2,'id_feature',7,0,0),(1293,3,40,2,'id_feature',7,0,0),(1294,5,40,2,'id_feature',7,0,0),(1295,1,40,2,'id_feature',7,0,0);
/*!40000 ALTER TABLE `ps_layered_category` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_filter` WRITE;
/*!40000 ALTER TABLE `ps_layered_filter` DISABLE KEYS */;
INSERT INTO `ps_layered_filter` VALUES (1,'My template 2013-07-29','a:9:{s:10:\"categories\";a:37:{i:0;i:1;i:1;i:2;i:2;i:6;i:3;i:7;i:4;i:8;i:5;i:9;i:6;i:10;i:7;i:31;i:8;i:11;i:9;i:12;i:10;i:13;i:11;i:14;i:12;i:32;i:13;i:33;i:14;i:34;i:15;i:35;i:16;i:15;i:17;i:16;i:18;i:17;i:19;i:18;i:20;i:19;i:21;i:20;i:22;i:21;i:23;i:22;i:24;i:23;i:25;i:24;i:26;i:25;i:27;i:26;i:28;i:27;i:29;i:28;i:30;i:29;i:31;i:30;i:32;i:36;i:33;i:37;i:34;i:38;i:35;i:39;i:36;i:40;}s:9:\"shop_list\";a:5:{i:0;i:2;i:1;i:4;i:2;i:3;i:3;i:5;i:4;i:1;}s:31:\"layered_selection_subcategories\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:27:\"layered_selection_condition\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:30:\"layered_selection_manufacturer\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:30:\"layered_selection_price_slider\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:22:\"layered_selection_ag_2\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:24:\"layered_selection_feat_1\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:24:\"layered_selection_feat_2\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}}',37,'2013-07-29 04:25:39');
/*!40000 ALTER TABLE `ps_layered_filter` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_filter_shop` WRITE;
/*!40000 ALTER TABLE `ps_layered_filter_shop` DISABLE KEYS */;
INSERT INTO `ps_layered_filter_shop` VALUES (0,1),(0,2),(0,3),(0,4),(0,5);
/*!40000 ALTER TABLE `ps_layered_filter_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_friendly_url` WRITE;
/*!40000 ALTER TABLE `ps_layered_friendly_url` DISABLE KEYS */;
INSERT INTO `ps_layered_friendly_url` VALUES (1,'3f1005f8be7881795fc5feddfdba756f','a:1:{s:8:\"category\";a:1:{i:1;s:1:\"1\";}}',1),(2,'e22ad4e9f8f445df1283ec3383c55ed8','a:1:{s:8:\"category\";a:1:{i:2;s:1:\"2\";}}',1),(3,'b39357e81d4fca5bb114dfb5034272b9','a:1:{s:8:\"category\";a:1:{i:6;s:1:\"6\";}}',1),(4,'57288585581135f0cf4b7aabea17a4be','a:1:{s:8:\"category\";a:1:{i:7;s:1:\"7\";}}',1),(5,'3ec271aa434ea79a00b7a81430132345','a:1:{s:8:\"category\";a:1:{i:8;s:1:\"8\";}}',1),(6,'df53e8cf39c5e3a906bf0bea9ab63fd3','a:1:{s:8:\"category\";a:1:{i:9;s:1:\"9\";}}',1),(7,'d4f75ab2bce80fbfb63583549b76a550','a:1:{s:8:\"category\";a:1:{i:10;s:2:\"10\";}}',1),(8,'c3835fb980bff0465e3493828a27ce66','a:1:{s:8:\"category\";a:1:{i:31;s:2:\"31\";}}',1),(9,'29d0881a59a58d858bfdd7874a00d701','a:1:{s:8:\"category\";a:1:{i:11;s:2:\"11\";}}',1),(10,'043514ef301b9a568832ee998c370221','a:1:{s:8:\"category\";a:1:{i:32;s:2:\"32\";}}',1),(11,'0b9ef4a7e94a117485ab47f3935fb962','a:1:{s:8:\"category\";a:1:{i:33;s:2:\"33\";}}',1),(12,'16594c06f13545ba472448a8b2845eaf','a:1:{s:8:\"category\";a:1:{i:34;s:2:\"34\";}}',1),(13,'843419df2e1511fa8469e22ab25a67d1','a:1:{s:8:\"category\";a:1:{i:35;s:2:\"35\";}}',1),(14,'669fc02939b8b4cda87ad8c4f7a7b7c2','a:1:{s:8:\"category\";a:1:{i:15;s:2:\"15\";}}',1),(15,'063238ea482b2e71c122d2c4c152a97c','a:1:{s:8:\"category\";a:1:{i:16;s:2:\"16\";}}',1),(16,'5924a3fe2c590f7d180d3d543af5a27c','a:1:{s:8:\"category\";a:1:{i:19;s:2:\"19\";}}',1),(17,'9a0dfdadb3a0b3964006918fecdaed4d','a:1:{s:8:\"category\";a:1:{i:20;s:2:\"20\";}}',1),(18,'7392f1e38f1f8051ce0f03b87581448e','a:1:{s:8:\"category\";a:1:{i:36;s:2:\"36\";}}',1),(19,'c30bcb5b62c1d5b35db393af51a92033','a:1:{s:8:\"category\";a:1:{i:37;s:2:\"37\";}}',1),(20,'3ee3ceb4e50554b0069a13a17afa930e','a:1:{s:8:\"category\";a:1:{i:40;s:2:\"40\";}}',1),(21,'4cb8589af2e17a81b2cfeb9d5f5954be','a:1:{s:10:\"id_feature\";a:1:{i:3;s:3:\"1_3\";}}',1),(22,'df3647b8824d09a4af747c66508ceffe','a:1:{s:10:\"id_feature\";a:1:{i:7;s:3:\"1_7\";}}',1),(23,'f9d8814f37fff0eab31726a99bc6763c','a:1:{s:10:\"id_feature\";a:1:{i:11;s:4:\"1_11\";}}',1),(24,'668c055da8427b87d7de957c1e103aa3','a:1:{s:10:\"id_feature\";a:1:{i:15;s:4:\"1_15\";}}',1),(25,'ad8ba2d6747a084a2abb96065c4391d0','a:1:{s:10:\"id_feature\";a:1:{i:4;s:3:\"2_4\";}}',1),(26,'7cd4129e86edadfb7a7e7d25d46d352c','a:1:{s:10:\"id_feature\";a:1:{i:8;s:3:\"2_8\";}}',1),(27,'52dc63c6df508e9d389064bebbd5ceab','a:1:{s:10:\"id_feature\";a:1:{i:12;s:4:\"2_12\";}}',1),(28,'b6569078bcbb8777db2df61eec928219','a:1:{s:10:\"id_feature\";a:1:{i:16;s:4:\"2_16\";}}',1),(29,'f744f9033afb7b5f09a22dff6158015f','a:1:{s:10:\"id_feature\";a:1:{i:6;s:3:\"3_6\";}}',1),(30,'8d32f1bbca20b5e2c993040a7d5fc869','a:1:{s:10:\"id_feature\";a:1:{i:10;s:4:\"3_10\";}}',1),(31,'8017be7ec2d1a37f735ea6c68faabd0c','a:1:{s:10:\"id_feature\";a:1:{i:14;s:4:\"3_14\";}}',1),(32,'1671e6d190e65a8edb5051d5290ff6d5','a:1:{s:10:\"id_feature\";a:1:{i:18;s:4:\"3_18\";}}',1),(33,'624664aa81757a76007b61b771bea190','a:1:{s:10:\"id_feature\";a:1:{i:5;s:3:\"4_5\";}}',1),(34,'4cfb6301dfe178c1ae73245a1d6c294a','a:1:{s:10:\"id_feature\";a:1:{i:9;s:3:\"4_9\";}}',1),(35,'f7c7cf0ec8530a4764496259fe1ec990','a:1:{s:10:\"id_feature\";a:1:{i:13;s:4:\"4_13\";}}',1),(36,'793c991ff4e3090cdfa0810deb2fa5c5','a:1:{s:10:\"id_feature\";a:1:{i:17;s:4:\"4_17\";}}',1),(37,'b1d7c6c4fc07e0acde227176c3dbdbaf','a:1:{s:10:\"id_feature\";a:1:{i:19;s:4:\"4_19\";}}',1),(38,'c8365f14deefd18247aab4944bfa284a','a:1:{s:10:\"id_feature\";a:1:{i:1;s:3:\"5_1\";}}',1),(39,'f3d43ea4a13710178f6c15a60cb50135','a:1:{s:10:\"id_feature\";a:1:{i:2;s:3:\"5_2\";}}',1),(40,'3aa5510a383d8390bcf30b4dfaa95de6','a:1:{s:18:\"id_attribute_group\";a:1:{i:1;s:3:\"1_1\";}}',1),(41,'4cb41b37e2d8ea8e2f80842da001c842','a:1:{s:18:\"id_attribute_group\";a:1:{i:2;s:3:\"1_2\";}}',1),(42,'018491853c6ad8ae0503264dd698f2f1','a:1:{s:18:\"id_attribute_group\";a:1:{i:8;s:3:\"1_8\";}}',1),(43,'d85e4d95e7043942e5a8ccdb45273117','a:1:{s:18:\"id_attribute_group\";a:1:{i:9;s:3:\"1_9\";}}',1),(44,'0d2e2c3af0857bf14f485863c89e28b8','a:1:{s:18:\"id_attribute_group\";a:1:{i:12;s:4:\"1_12\";}}',1),(45,'b745040632c64a0eb29281bde3e6e5a4','a:1:{s:18:\"id_attribute_group\";a:1:{i:13;s:4:\"1_13\";}}',1),(46,'51c85316502fb09931e5025d1b0dbab5','a:1:{s:18:\"id_attribute_group\";a:1:{i:15;s:4:\"1_15\";}}',1),(47,'41451c0b1df8dc8a0483947c62ea6b22','a:1:{s:18:\"id_attribute_group\";a:1:{i:16;s:4:\"1_16\";}}',1),(48,'8bd2d66546f55743782f1870d2f30d43','a:1:{s:18:\"id_attribute_group\";a:1:{i:17;s:4:\"1_17\";}}',1),(49,'9528e9f3b5ba366ba594d2868fd38ed4','a:1:{s:18:\"id_attribute_group\";a:1:{i:3;s:3:\"2_3\";}}',1),(50,'54dd539ce8bbf02b44485941f2d8d80b','a:1:{s:18:\"id_attribute_group\";a:1:{i:4;s:3:\"2_4\";}}',1),(51,'ab223cc0ca7ebf34af71e067556ee2aa','a:1:{s:18:\"id_attribute_group\";a:1:{i:5;s:3:\"2_5\";}}',1),(52,'73b845a28e9ced9709fa414f9b97dae9','a:1:{s:18:\"id_attribute_group\";a:1:{i:6;s:3:\"2_6\";}}',1),(53,'4b4bb79b20455e8047c972f9ca69cd72','a:1:{s:18:\"id_attribute_group\";a:1:{i:7;s:3:\"2_7\";}}',1),(54,'0a68b3ba0819d7126935f51335ef9503','a:1:{s:18:\"id_attribute_group\";a:1:{i:14;s:4:\"2_14\";}}',1),(55,'d3b86fde480f97ac1ae07576857c8971','a:1:{s:18:\"id_attribute_group\";a:1:{i:18;s:4:\"2_18\";}}',1),(56,'be50cfae4c360fdb124af017a4e80905','a:1:{s:18:\"id_attribute_group\";a:1:{i:19;s:4:\"2_19\";}}',1),(57,'601a4dd13077730810f102b18680b537','a:1:{s:18:\"id_attribute_group\";a:1:{i:20;s:4:\"2_20\";}}',1),(58,'a30eb82a29b489938809bef882364015','a:1:{s:18:\"id_attribute_group\";a:1:{i:10;s:4:\"3_10\";}}',1),(59,'67e46d0ddce8ffc3edd49fb01471b91c','a:1:{s:18:\"id_attribute_group\";a:1:{i:11;s:4:\"3_11\";}}',1),(60,'14ef3952eddf958ec1f628065f6c7689','a:1:{s:8:\"quantity\";a:1:{i:0;i:0;}}',1),(61,'19e5bdea58716c8f3ff52345d1b5a442','a:1:{s:8:\"quantity\";a:1:{i:0;i:1;}}',1),(62,'11c2881845b925423888cd329d0c4953','a:1:{s:9:\"condition\";a:1:{s:3:\"new\";s:3:\"new\";}}',1),(63,'074755ccbf623ca666bd866203d0dec7','a:1:{s:9:\"condition\";a:1:{s:4:\"used\";s:4:\"used\";}}',1),(64,'70b63b881a45f66c86ea78ace4cfb6a7','a:1:{s:9:\"condition\";a:1:{s:11:\"refurbished\";s:11:\"refurbished\";}}',1),(65,'f80401907167f9dc1855827ce504cd97','a:1:{s:12:\"manufacturer\";a:1:{i:1;s:1:\"1\";}}',1),(66,'48c2cea86ea94aed50e6f76d6b2fa003','a:1:{s:12:\"manufacturer\";a:1:{i:2;s:1:\"2\";}}',1),(67,'d686c3f7252eac8912bde6b7b3b21d84','a:1:{s:12:\"manufacturer\";a:1:{i:3;s:1:\"3\";}}',1),(68,'6ddc4b31c89e72dd8edd520c0456a4db','a:1:{s:12:\"manufacturer\";a:1:{i:4;s:1:\"4\";}}',1),(69,'56dc063448aa20d6fbd2622a3ccbf221','a:1:{s:12:\"manufacturer\";a:1:{i:5;s:1:\"5\";}}',1),(70,'68a20e4c90e83eedafe7329e1d525052','a:1:{s:12:\"manufacturer\";a:1:{i:6;s:1:\"6\";}}',1),(71,'f9fc1bd1e68d16e9a6b5df254fe2e00d','a:1:{s:12:\"manufacturer\";a:1:{i:7;s:1:\"7\";}}',1),(72,'67510c5e3975962c041d89cc69c4032f','a:1:{s:12:\"manufacturer\";a:1:{i:8;s:1:\"8\";}}',1),(73,'27d9c4cca71d29651f9788ba32657f3b','a:1:{s:12:\"manufacturer\";a:1:{i:9;s:1:\"9\";}}',1),(74,'3f1005f8be7881795fc5feddfdba756f','a:1:{s:8:\"category\";a:1:{i:1;s:1:\"1\";}}',2),(75,'e22ad4e9f8f445df1283ec3383c55ed8','a:1:{s:8:\"category\";a:1:{i:2;s:1:\"2\";}}',2),(76,'b39357e81d4fca5bb114dfb5034272b9','a:1:{s:8:\"category\";a:1:{i:6;s:1:\"6\";}}',2),(77,'57288585581135f0cf4b7aabea17a4be','a:1:{s:8:\"category\";a:1:{i:7;s:1:\"7\";}}',2),(78,'3ec271aa434ea79a00b7a81430132345','a:1:{s:8:\"category\";a:1:{i:8;s:1:\"8\";}}',2),(79,'df53e8cf39c5e3a906bf0bea9ab63fd3','a:1:{s:8:\"category\";a:1:{i:9;s:1:\"9\";}}',2),(80,'d4f75ab2bce80fbfb63583549b76a550','a:1:{s:8:\"category\";a:1:{i:10;s:2:\"10\";}}',2),(81,'c3835fb980bff0465e3493828a27ce66','a:1:{s:8:\"category\";a:1:{i:31;s:2:\"31\";}}',2),(82,'29d0881a59a58d858bfdd7874a00d701','a:1:{s:8:\"category\";a:1:{i:11;s:2:\"11\";}}',2),(83,'043514ef301b9a568832ee998c370221','a:1:{s:8:\"category\";a:1:{i:32;s:2:\"32\";}}',2),(84,'0b9ef4a7e94a117485ab47f3935fb962','a:1:{s:8:\"category\";a:1:{i:33;s:2:\"33\";}}',2),(85,'16594c06f13545ba472448a8b2845eaf','a:1:{s:8:\"category\";a:1:{i:34;s:2:\"34\";}}',2),(86,'843419df2e1511fa8469e22ab25a67d1','a:1:{s:8:\"category\";a:1:{i:35;s:2:\"35\";}}',2),(87,'669fc02939b8b4cda87ad8c4f7a7b7c2','a:1:{s:8:\"category\";a:1:{i:15;s:2:\"15\";}}',2),(88,'063238ea482b2e71c122d2c4c152a97c','a:1:{s:8:\"category\";a:1:{i:16;s:2:\"16\";}}',2),(89,'5924a3fe2c590f7d180d3d543af5a27c','a:1:{s:8:\"category\";a:1:{i:19;s:2:\"19\";}}',2),(90,'9a0dfdadb3a0b3964006918fecdaed4d','a:1:{s:8:\"category\";a:1:{i:20;s:2:\"20\";}}',2),(91,'7392f1e38f1f8051ce0f03b87581448e','a:1:{s:8:\"category\";a:1:{i:36;s:2:\"36\";}}',2),(92,'c30bcb5b62c1d5b35db393af51a92033','a:1:{s:8:\"category\";a:1:{i:37;s:2:\"37\";}}',2),(93,'3ee3ceb4e50554b0069a13a17afa930e','a:1:{s:8:\"category\";a:1:{i:40;s:2:\"40\";}}',2),(94,'4cb8589af2e17a81b2cfeb9d5f5954be','a:1:{s:10:\"id_feature\";a:1:{i:3;s:3:\"1_3\";}}',2),(95,'df3647b8824d09a4af747c66508ceffe','a:1:{s:10:\"id_feature\";a:1:{i:7;s:3:\"1_7\";}}',2),(96,'f9d8814f37fff0eab31726a99bc6763c','a:1:{s:10:\"id_feature\";a:1:{i:11;s:4:\"1_11\";}}',2),(97,'668c055da8427b87d7de957c1e103aa3','a:1:{s:10:\"id_feature\";a:1:{i:15;s:4:\"1_15\";}}',2),(98,'ad8ba2d6747a084a2abb96065c4391d0','a:1:{s:10:\"id_feature\";a:1:{i:4;s:3:\"2_4\";}}',2),(99,'7cd4129e86edadfb7a7e7d25d46d352c','a:1:{s:10:\"id_feature\";a:1:{i:8;s:3:\"2_8\";}}',2),(100,'52dc63c6df508e9d389064bebbd5ceab','a:1:{s:10:\"id_feature\";a:1:{i:12;s:4:\"2_12\";}}',2),(101,'b6569078bcbb8777db2df61eec928219','a:1:{s:10:\"id_feature\";a:1:{i:16;s:4:\"2_16\";}}',2),(102,'f744f9033afb7b5f09a22dff6158015f','a:1:{s:10:\"id_feature\";a:1:{i:6;s:3:\"3_6\";}}',2),(103,'8d32f1bbca20b5e2c993040a7d5fc869','a:1:{s:10:\"id_feature\";a:1:{i:10;s:4:\"3_10\";}}',2),(104,'8017be7ec2d1a37f735ea6c68faabd0c','a:1:{s:10:\"id_feature\";a:1:{i:14;s:4:\"3_14\";}}',2),(105,'1671e6d190e65a8edb5051d5290ff6d5','a:1:{s:10:\"id_feature\";a:1:{i:18;s:4:\"3_18\";}}',2),(106,'624664aa81757a76007b61b771bea190','a:1:{s:10:\"id_feature\";a:1:{i:5;s:3:\"4_5\";}}',2),(107,'4cfb6301dfe178c1ae73245a1d6c294a','a:1:{s:10:\"id_feature\";a:1:{i:9;s:3:\"4_9\";}}',2),(108,'f7c7cf0ec8530a4764496259fe1ec990','a:1:{s:10:\"id_feature\";a:1:{i:13;s:4:\"4_13\";}}',2),(109,'793c991ff4e3090cdfa0810deb2fa5c5','a:1:{s:10:\"id_feature\";a:1:{i:17;s:4:\"4_17\";}}',2),(110,'b1d7c6c4fc07e0acde227176c3dbdbaf','a:1:{s:10:\"id_feature\";a:1:{i:19;s:4:\"4_19\";}}',2),(111,'c8365f14deefd18247aab4944bfa284a','a:1:{s:10:\"id_feature\";a:1:{i:1;s:3:\"5_1\";}}',2),(112,'f3d43ea4a13710178f6c15a60cb50135','a:1:{s:10:\"id_feature\";a:1:{i:2;s:3:\"5_2\";}}',2),(113,'3aa5510a383d8390bcf30b4dfaa95de6','a:1:{s:18:\"id_attribute_group\";a:1:{i:1;s:3:\"1_1\";}}',2),(114,'4cb41b37e2d8ea8e2f80842da001c842','a:1:{s:18:\"id_attribute_group\";a:1:{i:2;s:3:\"1_2\";}}',2),(115,'018491853c6ad8ae0503264dd698f2f1','a:1:{s:18:\"id_attribute_group\";a:1:{i:8;s:3:\"1_8\";}}',2),(116,'d85e4d95e7043942e5a8ccdb45273117','a:1:{s:18:\"id_attribute_group\";a:1:{i:9;s:3:\"1_9\";}}',2),(117,'0d2e2c3af0857bf14f485863c89e28b8','a:1:{s:18:\"id_attribute_group\";a:1:{i:12;s:4:\"1_12\";}}',2),(118,'b745040632c64a0eb29281bde3e6e5a4','a:1:{s:18:\"id_attribute_group\";a:1:{i:13;s:4:\"1_13\";}}',2),(119,'51c85316502fb09931e5025d1b0dbab5','a:1:{s:18:\"id_attribute_group\";a:1:{i:15;s:4:\"1_15\";}}',2),(120,'41451c0b1df8dc8a0483947c62ea6b22','a:1:{s:18:\"id_attribute_group\";a:1:{i:16;s:4:\"1_16\";}}',2),(121,'8bd2d66546f55743782f1870d2f30d43','a:1:{s:18:\"id_attribute_group\";a:1:{i:17;s:4:\"1_17\";}}',2),(122,'9528e9f3b5ba366ba594d2868fd38ed4','a:1:{s:18:\"id_attribute_group\";a:1:{i:3;s:3:\"2_3\";}}',2),(123,'54dd539ce8bbf02b44485941f2d8d80b','a:1:{s:18:\"id_attribute_group\";a:1:{i:4;s:3:\"2_4\";}}',2),(124,'ab223cc0ca7ebf34af71e067556ee2aa','a:1:{s:18:\"id_attribute_group\";a:1:{i:5;s:3:\"2_5\";}}',2),(125,'73b845a28e9ced9709fa414f9b97dae9','a:1:{s:18:\"id_attribute_group\";a:1:{i:6;s:3:\"2_6\";}}',2),(126,'4b4bb79b20455e8047c972f9ca69cd72','a:1:{s:18:\"id_attribute_group\";a:1:{i:7;s:3:\"2_7\";}}',2),(127,'0a68b3ba0819d7126935f51335ef9503','a:1:{s:18:\"id_attribute_group\";a:1:{i:14;s:4:\"2_14\";}}',2),(128,'d3b86fde480f97ac1ae07576857c8971','a:1:{s:18:\"id_attribute_group\";a:1:{i:18;s:4:\"2_18\";}}',2),(129,'be50cfae4c360fdb124af017a4e80905','a:1:{s:18:\"id_attribute_group\";a:1:{i:19;s:4:\"2_19\";}}',2),(130,'601a4dd13077730810f102b18680b537','a:1:{s:18:\"id_attribute_group\";a:1:{i:20;s:4:\"2_20\";}}',2),(131,'a30eb82a29b489938809bef882364015','a:1:{s:18:\"id_attribute_group\";a:1:{i:10;s:4:\"3_10\";}}',2),(132,'67e46d0ddce8ffc3edd49fb01471b91c','a:1:{s:18:\"id_attribute_group\";a:1:{i:11;s:4:\"3_11\";}}',2),(133,'14ef3952eddf958ec1f628065f6c7689','a:1:{s:8:\"quantity\";a:1:{i:0;i:0;}}',2),(134,'19e5bdea58716c8f3ff52345d1b5a442','a:1:{s:8:\"quantity\";a:1:{i:0;i:1;}}',2),(135,'11c2881845b925423888cd329d0c4953','a:1:{s:9:\"condition\";a:1:{s:3:\"new\";s:3:\"new\";}}',2),(136,'074755ccbf623ca666bd866203d0dec7','a:1:{s:9:\"condition\";a:1:{s:4:\"used\";s:4:\"used\";}}',2),(137,'70b63b881a45f66c86ea78ace4cfb6a7','a:1:{s:9:\"condition\";a:1:{s:11:\"refurbished\";s:11:\"refurbished\";}}',2),(138,'f80401907167f9dc1855827ce504cd97','a:1:{s:12:\"manufacturer\";a:1:{i:1;s:1:\"1\";}}',2),(139,'48c2cea86ea94aed50e6f76d6b2fa003','a:1:{s:12:\"manufacturer\";a:1:{i:2;s:1:\"2\";}}',2),(140,'d686c3f7252eac8912bde6b7b3b21d84','a:1:{s:12:\"manufacturer\";a:1:{i:3;s:1:\"3\";}}',2),(141,'6ddc4b31c89e72dd8edd520c0456a4db','a:1:{s:12:\"manufacturer\";a:1:{i:4;s:1:\"4\";}}',2),(142,'56dc063448aa20d6fbd2622a3ccbf221','a:1:{s:12:\"manufacturer\";a:1:{i:5;s:1:\"5\";}}',2),(143,'68a20e4c90e83eedafe7329e1d525052','a:1:{s:12:\"manufacturer\";a:1:{i:6;s:1:\"6\";}}',2),(144,'f9fc1bd1e68d16e9a6b5df254fe2e00d','a:1:{s:12:\"manufacturer\";a:1:{i:7;s:1:\"7\";}}',2),(145,'67510c5e3975962c041d89cc69c4032f','a:1:{s:12:\"manufacturer\";a:1:{i:8;s:1:\"8\";}}',2),(146,'27d9c4cca71d29651f9788ba32657f3b','a:1:{s:12:\"manufacturer\";a:1:{i:9;s:1:\"9\";}}',2);
/*!40000 ALTER TABLE `ps_layered_friendly_url` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_indexable_attribute_group` WRITE;
/*!40000 ALTER TABLE `ps_layered_indexable_attribute_group` DISABLE KEYS */;
INSERT INTO `ps_layered_indexable_attribute_group` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `ps_layered_indexable_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_indexable_attribute_group_lang_value` WRITE;
/*!40000 ALTER TABLE `ps_layered_indexable_attribute_group_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_layered_indexable_attribute_group_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_indexable_attribute_lang_value` WRITE;
/*!40000 ALTER TABLE `ps_layered_indexable_attribute_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_layered_indexable_attribute_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_indexable_feature` WRITE;
/*!40000 ALTER TABLE `ps_layered_indexable_feature` DISABLE KEYS */;
INSERT INTO `ps_layered_indexable_feature` VALUES (1,1),(2,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `ps_layered_indexable_feature` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_indexable_feature_lang_value` WRITE;
/*!40000 ALTER TABLE `ps_layered_indexable_feature_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_layered_indexable_feature_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_indexable_feature_value_lang_value` WRITE;
/*!40000 ALTER TABLE `ps_layered_indexable_feature_value_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_layered_indexable_feature_value_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_price_index` WRITE;
/*!40000 ALTER TABLE `ps_layered_price_index` DISABLE KEYS */;
INSERT INTO `ps_layered_price_index` VALUES (8,1,1,590,607),(8,1,2,590,607),(8,1,3,590,607),(8,1,4,590,607),(8,2,1,468,482),(8,2,2,468,482),(8,2,3,468,482),(8,2,4,468,482),(17,1,1,123,123),(17,1,2,123,123),(17,1,3,123,123),(17,1,4,123,123),(17,2,1,97,98),(17,2,2,97,98),(17,2,3,97,98),(17,2,4,97,98),(18,1,1,687,687),(18,1,2,687,687),(18,1,3,687,687),(18,1,4,687,687),(18,2,1,545,546),(18,2,2,545,546),(18,2,3,545,546),(18,2,4,545,546),(19,1,1,666,666),(19,1,2,666,666),(19,1,3,666,666),(19,1,4,666,666),(19,2,1,528,529),(19,2,2,528,529),(19,2,3,528,529),(19,2,4,528,529),(20,1,1,360,360),(20,1,2,360,360),(20,1,3,360,360),(20,1,4,360,360),(20,2,1,285,286),(20,2,2,285,286),(20,2,3,285,286),(20,2,4,285,286),(21,1,1,590,590),(21,1,2,590,590),(21,1,3,590,590),(21,1,4,590,590),(21,2,1,468,469),(21,2,2,468,469),(21,2,3,468,469),(21,2,4,468,469),(22,1,1,590,590),(22,1,2,590,590),(22,1,3,590,590),(22,1,4,590,590),(22,2,1,468,469),(22,2,2,468,469),(22,2,3,468,469),(22,2,4,468,469),(23,1,1,590,590),(23,1,2,590,590),(23,1,3,590,590),(23,1,4,590,590),(23,2,1,468,469),(23,2,2,468,469),(23,2,3,468,469),(23,2,4,468,469),(24,1,1,590,590),(24,1,2,590,590),(24,1,3,590,590),(24,1,4,590,590),(24,2,1,468,469),(24,2,2,468,469),(24,2,3,468,469),(24,2,4,468,469),(25,1,1,590,590),(25,1,2,590,590),(25,1,3,590,590),(25,1,4,590,590),(25,2,1,468,469),(25,2,2,468,469),(25,2,3,468,469),(25,2,4,468,469),(26,1,1,590,590),(26,1,2,590,590),(26,1,3,590,590),(26,1,4,590,590),(26,2,1,468,469),(26,2,2,468,469),(26,2,3,468,469),(26,2,4,468,469),(27,1,1,590,590),(27,1,2,590,590),(27,1,3,590,590),(27,1,4,590,590),(27,2,1,468,469),(27,2,2,468,469),(27,2,3,468,469),(27,2,4,468,469),(28,1,1,590,590),(28,1,2,590,590),(28,1,3,590,590),(28,1,4,590,590),(28,2,1,468,469),(28,2,2,468,469),(28,2,3,468,469),(28,2,4,468,469),(29,1,1,590,590),(29,1,2,590,590),(29,1,3,590,590),(29,1,4,590,590),(29,2,1,468,469),(29,2,2,468,469),(29,2,3,468,469),(29,2,4,468,469),(30,1,1,590,590),(30,1,2,590,590),(30,1,3,590,590),(30,1,4,590,590),(30,2,1,468,469),(30,2,2,468,469),(30,2,3,468,469),(30,2,4,468,469),(31,1,1,590,590),(31,1,2,590,590),(31,1,3,590,590),(31,1,4,590,590),(31,2,1,468,469),(31,2,2,468,469),(31,2,3,468,469),(31,2,4,468,469),(32,1,1,590,590),(32,1,2,590,590),(32,1,3,590,590),(32,1,4,590,590),(32,2,1,468,469),(32,2,2,468,469),(32,2,3,468,469),(32,2,4,468,469),(33,1,1,590,590),(33,1,2,590,590),(33,1,3,590,590),(33,1,4,590,590),(33,2,1,468,469),(33,2,2,468,469),(33,2,3,468,469),(33,2,4,468,469),(34,1,1,590,590),(34,1,2,590,590),(34,1,3,590,590),(34,1,4,590,590),(34,2,1,468,469),(34,2,2,468,469),(34,2,3,468,469),(34,2,4,468,469),(35,1,1,590,590),(35,1,2,590,590),(35,1,3,590,590),(35,1,4,590,590),(35,2,1,468,469),(35,2,2,468,469),(35,2,3,468,469),(35,2,4,468,469),(36,1,1,590,590),(36,1,2,590,590),(36,1,3,590,590),(36,1,4,590,590),(36,2,1,468,469),(36,2,2,468,469),(36,2,3,468,469),(36,2,4,468,469),(37,1,1,590,590),(37,1,2,590,590),(37,1,3,590,590),(37,1,4,590,590),(37,2,1,468,469),(37,2,2,468,469),(37,2,3,468,469),(37,2,4,468,469),(38,1,1,590,590),(38,1,2,590,590),(38,1,3,590,590),(38,1,4,590,590),(38,2,1,468,469),(38,2,2,468,469),(38,2,3,468,469),(38,2,4,468,469),(39,1,1,590,590),(39,1,2,590,590),(39,1,3,590,590),(39,1,4,590,590),(39,2,1,468,469),(39,2,2,468,469),(39,2,3,468,469),(39,2,4,468,469),(40,1,1,590,590),(40,1,2,590,590),(40,1,3,590,590),(40,1,4,590,590),(40,2,1,468,469),(40,2,2,468,469),(40,2,3,468,469),(40,2,4,468,469),(41,1,1,590,590),(41,1,2,590,590),(41,1,3,590,590),(41,1,4,590,590),(41,2,1,468,469),(41,2,2,468,469),(41,2,3,468,469),(41,2,4,468,469),(42,1,1,687,687),(42,1,2,687,687),(42,1,3,687,687),(42,1,4,687,687),(42,2,1,545,546),(42,2,2,545,546),(42,2,3,545,546),(42,2,4,545,546),(43,1,1,590,590),(43,1,2,590,590),(43,1,3,590,590),(43,1,4,590,590),(43,2,1,468,469),(43,2,2,468,469),(43,2,3,468,469),(43,2,4,468,469);
/*!40000 ALTER TABLE `ps_layered_price_index` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_layered_product_attribute` WRITE;
/*!40000 ALTER TABLE `ps_layered_product_attribute` DISABLE KEYS */;
INSERT INTO `ps_layered_product_attribute` VALUES (3,8,2,1),(3,8,2,2),(3,8,2,3),(3,8,2,4),(3,17,2,1),(3,17,2,2),(3,17,2,3),(3,17,2,4),(3,18,2,1),(3,18,2,2),(3,18,2,3),(3,18,2,4),(3,19,2,1),(3,19,2,2),(3,19,2,3),(3,19,2,4),(3,20,2,1),(3,20,2,2),(3,20,2,3),(3,20,2,4),(3,21,2,1),(3,21,2,2),(3,21,2,3),(3,21,2,4),(3,22,2,1),(3,22,2,2),(3,22,2,3),(3,22,2,4),(3,23,2,1),(3,23,2,2),(3,23,2,3),(3,23,2,4),(3,24,2,1),(3,24,2,2),(3,24,2,3),(3,24,2,4),(3,25,2,1),(3,25,2,2),(3,25,2,3),(3,25,2,4),(3,26,2,1),(3,26,2,2),(3,26,2,3),(3,26,2,4),(3,27,2,1),(3,27,2,2),(3,27,2,3),(3,27,2,4),(3,28,2,1),(3,28,2,2),(3,28,2,3),(3,28,2,4),(3,29,2,1),(3,29,2,2),(3,29,2,3),(3,29,2,4),(3,30,2,1),(3,30,2,2),(3,30,2,3),(3,30,2,4),(3,31,2,1),(3,31,2,2),(3,31,2,3),(3,31,2,4),(3,32,2,1),(3,32,2,2),(3,32,2,3),(3,32,2,4),(3,33,2,1),(3,33,2,2),(3,33,2,3),(3,33,2,4),(3,34,2,1),(3,34,2,2),(3,34,2,3),(3,34,2,4),(3,35,2,1),(3,35,2,2),(3,35,2,3),(3,35,2,4),(3,36,2,1),(3,36,2,2),(3,36,2,3),(3,36,2,4),(3,37,2,1),(3,37,2,2),(3,37,2,3),(3,37,2,4),(3,38,2,1),(3,38,2,2),(3,38,2,3),(3,38,2,4),(3,39,2,1),(3,39,2,2),(3,39,2,3),(3,39,2,4),(3,40,2,1),(3,40,2,2),(3,40,2,3),(3,40,2,4),(3,41,2,1),(3,41,2,2),(3,41,2,3),(3,41,2,4),(3,42,2,1),(3,42,2,2),(3,42,2,3),(3,42,2,4),(3,43,2,1),(3,43,2,2),(3,43,2,3),(3,43,2,4),(9,8,1,1),(9,8,1,2),(9,8,1,3),(9,8,1,4),(9,17,1,1),(9,17,1,2),(9,17,1,3),(9,17,1,4),(9,18,1,1),(9,18,1,2),(9,18,1,3),(9,18,1,4),(9,19,1,1),(9,19,1,2),(9,19,1,3),(9,19,1,4),(9,20,1,1),(9,20,1,2),(9,20,1,3),(9,20,1,4),(9,21,1,1),(9,21,1,2),(9,21,1,3),(9,21,1,4),(9,22,1,1),(9,22,1,2),(9,22,1,3),(9,22,1,4),(9,23,1,1),(9,23,1,2),(9,23,1,3),(9,23,1,4),(9,24,1,1),(9,24,1,2),(9,24,1,3),(9,24,1,4),(9,25,1,1),(9,25,1,2),(9,25,1,3),(9,25,1,4),(9,26,1,1),(9,26,1,2),(9,26,1,3),(9,26,1,4),(9,27,1,1),(9,27,1,2),(9,27,1,3),(9,27,1,4),(9,28,1,1),(9,28,1,2),(9,28,1,3),(9,28,1,4),(9,29,1,1),(9,29,1,2),(9,29,1,3),(9,29,1,4),(9,30,1,1),(9,30,1,2),(9,30,1,3),(9,30,1,4),(9,31,1,1),(9,31,1,2),(9,31,1,3),(9,31,1,4),(9,32,1,1),(9,32,1,2),(9,32,1,3),(9,32,1,4),(9,33,1,1),(9,33,1,2),(9,33,1,3),(9,33,1,4),(9,34,1,1),(9,34,1,2),(9,34,1,3),(9,34,1,4),(9,35,1,1),(9,35,1,2),(9,35,1,3),(9,35,1,4),(9,36,1,1),(9,36,1,2),(9,36,1,3),(9,36,1,4),(9,37,1,1),(9,37,1,2),(9,37,1,3),(9,37,1,4),(9,38,1,1),(9,38,1,2),(9,38,1,3),(9,38,1,4),(9,39,1,1),(9,39,1,2),(9,39,1,3),(9,39,1,4),(9,40,1,1),(9,40,1,2),(9,40,1,3),(9,40,1,4),(9,41,1,1),(9,41,1,2),(9,41,1,3),(9,41,1,4),(9,42,1,1),(9,42,1,2),(9,42,1,3),(9,42,1,4),(9,43,1,1),(9,43,1,2),(9,43,1,3),(9,43,1,4),(11,8,3,1),(11,8,3,2),(11,8,3,3),(11,8,3,4),(11,17,3,1),(11,17,3,2),(11,17,3,3),(11,17,3,4),(11,18,3,1),(11,18,3,2),(11,18,3,3),(11,18,3,4),(11,19,3,1),(11,19,3,2),(11,19,3,3),(11,19,3,4),(11,20,3,1),(11,20,3,2),(11,20,3,3),(11,20,3,4),(11,21,3,1),(11,21,3,2),(11,21,3,3),(11,21,3,4),(11,22,3,1),(11,22,3,2),(11,22,3,3),(11,22,3,4),(11,23,3,1),(11,23,3,2),(11,23,3,3),(11,23,3,4),(11,24,3,1),(11,24,3,2),(11,24,3,3),(11,24,3,4),(11,25,3,1),(11,25,3,2),(11,25,3,3),(11,25,3,4),(11,26,3,1),(11,26,3,2),(11,26,3,3),(11,26,3,4),(11,27,3,1),(11,27,3,2),(11,27,3,3),(11,27,3,4),(11,28,3,1),(11,28,3,2),(11,28,3,3),(11,28,3,4),(11,29,3,1),(11,29,3,2),(11,29,3,3),(11,29,3,4),(11,30,3,1),(11,30,3,2),(11,30,3,3),(11,30,3,4),(11,31,3,1),(11,31,3,2),(11,31,3,3),(11,31,3,4),(11,32,3,1),(11,32,3,2),(11,32,3,3),(11,32,3,4),(11,33,3,1),(11,33,3,2),(11,33,3,3),(11,33,3,4),(11,34,3,1),(11,34,3,2),(11,34,3,3),(11,34,3,4),(11,35,3,1),(11,35,3,2),(11,35,3,3),(11,35,3,4),(11,36,3,1),(11,36,3,2),(11,36,3,3),(11,36,3,4),(11,37,3,1),(11,37,3,2),(11,37,3,3),(11,37,3,4),(11,38,3,1),(11,38,3,2),(11,38,3,3),(11,38,3,4),(11,39,3,1),(11,39,3,2),(11,39,3,3),(11,39,3,4),(11,40,3,1),(11,40,3,2),(11,40,3,3),(11,40,3,4),(11,41,3,1),(11,41,3,2),(11,41,3,3),(11,41,3,4),(11,42,3,1),(11,42,3,2),(11,42,3,3),(11,42,3,4),(11,43,3,1),(11,43,3,2),(11,43,3,3),(11,43,3,4),(13,8,1,1),(13,8,1,2),(13,8,1,3),(13,8,1,4),(13,17,1,1),(13,17,1,2),(13,17,1,3),(13,17,1,4),(13,18,1,1),(13,18,1,2),(13,18,1,3),(13,18,1,4),(13,19,1,1),(13,19,1,2),(13,19,1,3),(13,19,1,4),(13,20,1,1),(13,20,1,2),(13,20,1,3),(13,20,1,4),(13,21,1,1),(13,21,1,2),(13,21,1,3),(13,21,1,4),(13,22,1,1),(13,22,1,2),(13,22,1,3),(13,22,1,4),(13,23,1,1),(13,23,1,2),(13,23,1,3),(13,23,1,4),(13,24,1,1),(13,24,1,2),(13,24,1,3),(13,24,1,4),(13,25,1,1),(13,25,1,2),(13,25,1,3),(13,25,1,4),(13,26,1,1),(13,26,1,2),(13,26,1,3),(13,26,1,4),(13,27,1,1),(13,27,1,2),(13,27,1,3),(13,27,1,4),(13,28,1,1),(13,28,1,2),(13,28,1,3),(13,28,1,4),(13,29,1,1),(13,29,1,2),(13,29,1,3),(13,29,1,4),(13,30,1,1),(13,30,1,2),(13,30,1,3),(13,30,1,4),(13,31,1,1),(13,31,1,2),(13,31,1,3),(13,31,1,4),(13,32,1,1),(13,32,1,2),(13,32,1,3),(13,32,1,4),(13,33,1,1),(13,33,1,2),(13,33,1,3),(13,33,1,4),(13,34,1,1),(13,34,1,2),(13,34,1,3),(13,34,1,4),(13,35,1,1),(13,35,1,2),(13,35,1,3),(13,35,1,4),(13,36,1,1),(13,36,1,2),(13,36,1,3),(13,36,1,4),(13,37,1,1),(13,37,1,2),(13,37,1,3),(13,37,1,4),(13,38,1,1),(13,38,1,2),(13,38,1,3),(13,38,1,4),(13,39,1,1),(13,39,1,2),(13,39,1,3),(13,39,1,4),(13,40,1,1),(13,40,1,2),(13,40,1,3),(13,40,1,4),(13,41,1,1),(13,41,1,2),(13,41,1,3),(13,41,1,4),(13,42,1,1),(13,42,1,2),(13,42,1,3),(13,42,1,4),(13,43,1,1),(13,43,1,2),(13,43,1,3),(13,43,1,4),(14,8,2,1),(14,8,2,2),(14,8,2,3),(14,8,2,4),(14,17,2,1),(14,17,2,2),(14,17,2,3),(14,17,2,4),(14,18,2,1),(14,18,2,2),(14,18,2,3),(14,18,2,4),(14,19,2,1),(14,19,2,2),(14,19,2,3),(14,19,2,4),(14,20,2,1),(14,20,2,2),(14,20,2,3),(14,20,2,4),(14,21,2,1),(14,21,2,2),(14,21,2,3),(14,21,2,4),(14,22,2,1),(14,22,2,2),(14,22,2,3),(14,22,2,4),(14,23,2,1),(14,23,2,2),(14,23,2,3),(14,23,2,4),(14,24,2,1),(14,24,2,2),(14,24,2,3),(14,24,2,4),(14,25,2,1),(14,25,2,2),(14,25,2,3),(14,25,2,4),(14,26,2,1),(14,26,2,2),(14,26,2,3),(14,26,2,4),(14,27,2,1),(14,27,2,2),(14,27,2,3),(14,27,2,4),(14,28,2,1),(14,28,2,2),(14,28,2,3),(14,28,2,4),(14,29,2,1),(14,29,2,2),(14,29,2,3),(14,29,2,4),(14,30,2,1),(14,30,2,2),(14,30,2,3),(14,30,2,4),(14,31,2,1),(14,31,2,2),(14,31,2,3),(14,31,2,4),(14,32,2,1),(14,32,2,2),(14,32,2,3),(14,32,2,4),(14,33,2,1),(14,33,2,2),(14,33,2,3),(14,33,2,4),(14,34,2,1),(14,34,2,2),(14,34,2,3),(14,34,2,4),(14,35,2,1),(14,35,2,2),(14,35,2,3),(14,35,2,4),(14,36,2,1),(14,36,2,2),(14,36,2,3),(14,36,2,4),(14,37,2,1),(14,37,2,2),(14,37,2,3),(14,37,2,4),(14,38,2,1),(14,38,2,2),(14,38,2,3),(14,38,2,4),(14,39,2,1),(14,39,2,2),(14,39,2,3),(14,39,2,4),(14,40,2,1),(14,40,2,2),(14,40,2,3),(14,40,2,4),(14,41,2,1),(14,41,2,2),(14,41,2,3),(14,41,2,4),(14,42,2,1),(14,42,2,2),(14,42,2,3),(14,42,2,4),(14,43,2,1),(14,43,2,2),(14,43,2,3),(14,43,2,4);
/*!40000 ALTER TABLE `ps_layered_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_linksmenutop` WRITE;
/*!40000 ALTER TABLE `ps_linksmenutop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_linksmenutop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_linksmenutop_lang` WRITE;
/*!40000 ALTER TABLE `ps_linksmenutop_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_linksmenutop_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_log` WRITE;
/*!40000 ALTER TABLE `ps_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_log` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_manufacturer` WRITE;
/*!40000 ALTER TABLE `ps_manufacturer` DISABLE KEYS */;
INSERT INTO `ps_manufacturer` VALUES (1,'Apple Computer, Inc','2013-06-18 03:24:45','2013-07-29 05:29:52',1),(2,'Shure Incorporated','2013-06-18 03:24:45','2013-07-29 05:30:27',1),(3,'Canon','2013-06-18 22:33:35','2013-07-29 05:30:31',1),(4,'HTC','2013-06-18 22:33:46','2013-07-29 05:30:34',1),(5,'Toshiba','2013-06-18 22:33:57','2013-07-29 05:30:38',1),(6,'Asus','2013-06-18 22:34:52','2013-07-29 05:30:41',1),(7,'Nikon','2013-06-18 22:35:01','2013-07-29 05:30:45',1),(8,'New HTC','2013-06-18 22:35:17','2013-07-29 05:30:48',1),(9,'Samsung','2013-06-18 22:35:32','2013-07-29 05:30:52',1);
/*!40000 ALTER TABLE `ps_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_manufacturer_lang` WRITE;
/*!40000 ALTER TABLE `ps_manufacturer_lang` DISABLE KEYS */;
INSERT INTO `ps_manufacturer_lang` VALUES (1,1,'','','','',''),(1,2,'','','','',''),(2,1,'','','','',''),(2,2,'','','','',''),(3,1,'','','','',''),(3,2,'','','','',''),(4,1,'','','','',''),(4,2,'','','','',''),(5,1,'','','','',''),(5,2,'','','','',''),(6,1,'','','','',''),(6,2,'','','','',''),(7,1,'','','','',''),(7,2,'','','','',''),(8,1,'','','','',''),(8,2,'','','','',''),(9,1,'','','','',''),(9,2,'','','','','');
/*!40000 ALTER TABLE `ps_manufacturer_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_manufacturer_shop` WRITE;
/*!40000 ALTER TABLE `ps_manufacturer_shop` DISABLE KEYS */;
INSERT INTO `ps_manufacturer_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(7,1),(7,2),(7,3),(7,4),(7,5),(8,1),(8,2),(8,3),(8,4),(8,5),(9,1),(9,2),(9,3),(9,4),(9,5);
/*!40000 ALTER TABLE `ps_manufacturer_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_memcached_servers` WRITE;
/*!40000 ALTER TABLE `ps_memcached_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_memcached_servers` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_message` WRITE;
/*!40000 ALTER TABLE `ps_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_message` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_message_readed` WRITE;
/*!40000 ALTER TABLE `ps_message_readed` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_message_readed` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_meta` WRITE;
/*!40000 ALTER TABLE `ps_meta` DISABLE KEYS */;
INSERT INTO `ps_meta` VALUES (1,'404'),(2,'best-sales'),(3,'contact'),(4,'index'),(5,'manufacturer'),(6,'new-products'),(7,'password'),(8,'prices-drop'),(9,'sitemap'),(10,'supplier'),(11,'address'),(12,'addresses'),(13,'authentication'),(14,'cart'),(15,'discount'),(16,'history'),(17,'identity'),(18,'my-account'),(19,'order-follow'),(20,'order-slip'),(21,'order'),(22,'search'),(23,'stores'),(24,'order-opc'),(25,'guest-tracking'),(26,'order-confirmation');
/*!40000 ALTER TABLE `ps_meta` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_meta_lang` WRITE;
/*!40000 ALTER TABLE `ps_meta_lang` DISABLE KEYS */;
INSERT INTO `ps_meta_lang` VALUES (1,1,1,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(1,1,2,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(1,2,1,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(1,2,2,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(1,3,1,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(1,3,2,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(1,4,1,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(1,4,2,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(1,5,1,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(1,5,2,'404 error','This page cannot be found','error, 404, not found','page-not-found'),(2,1,1,'Best sales','Our best sales','best sales','best-sales'),(2,1,2,'Best sales','Our best sales','best sales','best-sales'),(2,2,1,'Best sales','Our best sales','best sales','best-sales'),(2,2,2,'Best sales','Our best sales','best sales','best-sales'),(2,3,1,'Best sales','Our best sales','best sales','best-sales'),(2,3,2,'Best sales','Our best sales','best sales','best-sales'),(2,4,1,'Best sales','Our best sales','best sales','best-sales'),(2,4,2,'Best sales','Our best sales','best sales','best-sales'),(2,5,1,'Best sales','Our best sales','best sales','best-sales'),(2,5,2,'Best sales','Our best sales','best sales','best-sales'),(3,1,1,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(3,1,2,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(3,2,1,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(3,2,2,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(3,3,1,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(3,3,2,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(3,4,1,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(3,4,2,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(3,5,1,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(3,5,2,'Contact us','Use our form to contact us','contact, form, e-mail','contact-us'),(4,1,1,'','Shop powered by PrestaShop','shop, prestashop',''),(4,1,2,'','Shop powered by PrestaShop','shop, prestashop',''),(4,2,1,'','Shop powered by PrestaShop','shop, prestashop',''),(4,2,2,'','Shop powered by PrestaShop','shop, prestashop',''),(4,3,1,'','Shop powered by PrestaShop','shop, prestashop',''),(4,3,2,'','Shop powered by PrestaShop','shop, prestashop',''),(4,4,1,'','Shop powered by PrestaShop','shop, prestashop',''),(4,4,2,'','Shop powered by PrestaShop','shop, prestashop',''),(4,5,1,'','Shop powered by PrestaShop','shop, prestashop',''),(4,5,2,'','Shop powered by PrestaShop','shop, prestashop',''),(5,1,1,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(5,1,2,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(5,2,1,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(5,2,2,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(5,3,1,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(5,3,2,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(5,4,1,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(5,4,2,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(5,5,1,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(5,5,2,'Manufacturers','Manufacturers list','manufacturer','manufacturers'),(6,1,1,'New products','Our new products','new, products','new-products'),(6,1,2,'New products','Our new products','new, products','new-products'),(6,2,1,'New products','Our new products','new, products','new-products'),(6,2,2,'New products','Our new products','new, products','new-products'),(6,3,1,'New products','Our new products','new, products','new-products'),(6,3,2,'New products','Our new products','new, products','new-products'),(6,4,1,'New products','Our new products','new, products','new-products'),(6,4,2,'New products','Our new products','new, products','new-products'),(6,5,1,'New products','Our new products','new, products','new-products'),(6,5,2,'New products','Our new products','new, products','new-products'),(7,1,1,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(7,1,2,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(7,2,1,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(7,2,2,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(7,3,1,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(7,3,2,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(7,4,1,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(7,4,2,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(7,5,1,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(7,5,2,'Forgot your password','Enter your e-mail address used to register in goal to get e-mail with your new password','forgot, password, e-mail, new, reset','password-recovery'),(8,1,1,'Prices drop','Our special products','special, prices drop','prices-drop'),(8,1,2,'Prices drop','Our special products','special, prices drop','prices-drop'),(8,2,1,'Prices drop','Our special products','special, prices drop','prices-drop'),(8,2,2,'Prices drop','Our special products','special, prices drop','prices-drop'),(8,3,1,'Prices drop','Our special products','special, prices drop','prices-drop'),(8,3,2,'Prices drop','Our special products','special, prices drop','prices-drop'),(8,4,1,'Prices drop','Our special products','special, prices drop','prices-drop'),(8,4,2,'Prices drop','Our special products','special, prices drop','prices-drop'),(8,5,1,'Prices drop','Our special products','special, prices drop','prices-drop'),(8,5,2,'Prices drop','Our special products','special, prices drop','prices-drop'),(9,1,1,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(9,1,2,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(9,2,1,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(9,2,2,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(9,3,1,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(9,3,2,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(9,4,1,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(9,4,2,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(9,5,1,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(9,5,2,'Sitemap','Lost ? Find what your are looking for','sitemap','sitemap'),(10,1,1,'Suppliers','Suppliers list','supplier','supplier'),(10,1,2,'Suppliers','Suppliers list','supplier','supplier'),(10,2,1,'Suppliers','Suppliers list','supplier','supplier'),(10,2,2,'Suppliers','Suppliers list','supplier','supplier'),(10,3,1,'Suppliers','Suppliers list','supplier','supplier'),(10,3,2,'Suppliers','Suppliers list','supplier','supplier'),(10,4,1,'Suppliers','Suppliers list','supplier','supplier'),(10,4,2,'Suppliers','Suppliers list','supplier','supplier'),(10,5,1,'Suppliers','Suppliers list','supplier','supplier'),(10,5,2,'Suppliers','Suppliers list','supplier','supplier'),(11,1,1,'Address','','','address'),(11,1,2,'Address','','','address'),(11,2,1,'Address','','','address'),(11,2,2,'Address','','','address'),(11,3,1,'Address','','','address'),(11,3,2,'Address','','','address'),(11,4,1,'Address','','','address'),(11,4,2,'Address','','','address'),(11,5,1,'Address','','','address'),(11,5,2,'Address','','','address'),(12,1,1,'Addresses','','','addresses'),(12,1,2,'Addresses','','','addresses'),(12,2,1,'Addresses','','','addresses'),(12,2,2,'Addresses','','','addresses'),(12,3,1,'Addresses','','','addresses'),(12,3,2,'Addresses','','','addresses'),(12,4,1,'Addresses','','','addresses'),(12,4,2,'Addresses','','','addresses'),(12,5,1,'Addresses','','','addresses'),(12,5,2,'Addresses','','','addresses'),(13,1,1,'Authentication','','','authentication'),(13,1,2,'Authentication','','','authentication'),(13,2,1,'Authentication','','','authentication'),(13,2,2,'Authentication','','','authentication'),(13,3,1,'Authentication','','','authentication'),(13,3,2,'Authentication','','','authentication'),(13,4,1,'Authentication','','','authentication'),(13,4,2,'Authentication','','','authentication'),(13,5,1,'Authentication','','','authentication'),(13,5,2,'Authentication','','','authentication'),(14,1,1,'Cart','','','cart'),(14,1,2,'Cart','','','cart'),(14,2,1,'Cart','','','cart'),(14,2,2,'Cart','','','cart'),(14,3,1,'Cart','','','cart'),(14,3,2,'Cart','','','cart'),(14,4,1,'Cart','','','cart'),(14,4,2,'Cart','','','cart'),(14,5,1,'Cart','','','cart'),(14,5,2,'Cart','','','cart'),(15,1,1,'Discount','','','discount'),(15,1,2,'Discount','','','discount'),(15,2,1,'Discount','','','discount'),(15,2,2,'Discount','','','discount'),(15,3,1,'Discount','','','discount'),(15,3,2,'Discount','','','discount'),(15,4,1,'Discount','','','discount'),(15,4,2,'Discount','','','discount'),(15,5,1,'Discount','','','discount'),(15,5,2,'Discount','','','discount'),(16,1,1,'Order history','','','order-history'),(16,1,2,'Order history','','','order-history'),(16,2,1,'Order history','','','order-history'),(16,2,2,'Order history','','','order-history'),(16,3,1,'Order history','','','order-history'),(16,3,2,'Order history','','','order-history'),(16,4,1,'Order history','','','order-history'),(16,4,2,'Order history','','','order-history'),(16,5,1,'Order history','','','order-history'),(16,5,2,'Order history','','','order-history'),(17,1,1,'Identity','','','identity'),(17,1,2,'Identity','','','identity'),(17,2,1,'Identity','','','identity'),(17,2,2,'Identity','','','identity'),(17,3,1,'Identity','','','identity'),(17,3,2,'Identity','','','identity'),(17,4,1,'Identity','','','identity'),(17,4,2,'Identity','','','identity'),(17,5,1,'Identity','','','identity'),(17,5,2,'Identity','','','identity'),(18,1,1,'My account','','','my-account'),(18,1,2,'My account','','','my-account'),(18,2,1,'My account','','','my-account'),(18,2,2,'My account','','','my-account'),(18,3,1,'My account','','','my-account'),(18,3,2,'My account','','','my-account'),(18,4,1,'My account','','','my-account'),(18,4,2,'My account','','','my-account'),(18,5,1,'My account','','','my-account'),(18,5,2,'My account','','','my-account'),(19,1,1,'Order follow','','','order-follow'),(19,1,2,'Order follow','','','order-follow'),(19,2,1,'Order follow','','','order-follow'),(19,2,2,'Order follow','','','order-follow'),(19,3,1,'Order follow','','','order-follow'),(19,3,2,'Order follow','','','order-follow'),(19,4,1,'Order follow','','','order-follow'),(19,4,2,'Order follow','','','order-follow'),(19,5,1,'Order follow','','','order-follow'),(19,5,2,'Order follow','','','order-follow'),(20,1,1,'Order slip','','','order-slip'),(20,1,2,'Order slip','','','order-slip'),(20,2,1,'Order slip','','','order-slip'),(20,2,2,'Order slip','','','order-slip'),(20,3,1,'Order slip','','','order-slip'),(20,3,2,'Order slip','','','order-slip'),(20,4,1,'Order slip','','','order-slip'),(20,4,2,'Order slip','','','order-slip'),(20,5,1,'Order slip','','','order-slip'),(20,5,2,'Order slip','','','order-slip'),(21,1,1,'Order','','','order'),(21,1,2,'Order','','','order'),(21,2,1,'Order','','','order'),(21,2,2,'Order','','','order'),(21,3,1,'Order','','','order'),(21,3,2,'Order','','','order'),(21,4,1,'Order','','','order'),(21,4,2,'Order','','','order'),(21,5,1,'Order','','','order'),(21,5,2,'Order','','','order'),(22,1,1,'Search','','','search'),(22,1,2,'Search','','','search'),(22,2,1,'Search','','','search'),(22,2,2,'Search','','','search'),(22,3,1,'Search','','','search'),(22,3,2,'Search','','','search'),(22,4,1,'Search','','','search'),(22,4,2,'Search','','','search'),(22,5,1,'Search','','','search'),(22,5,2,'Search','','','search'),(23,1,1,'Stores','','','stores'),(23,1,2,'Stores','','','stores'),(23,2,1,'Stores','','','stores'),(23,2,2,'Stores','','','stores'),(23,3,1,'Stores','','','stores'),(23,3,2,'Stores','','','stores'),(23,4,1,'Stores','','','stores'),(23,4,2,'Stores','','','stores'),(23,5,1,'Stores','','','stores'),(23,5,2,'Stores','','','stores'),(24,1,1,'Order','','','quick-order'),(24,1,2,'Order','','','quick-order'),(24,2,1,'Order','','','quick-order'),(24,2,2,'Order','','','quick-order'),(24,3,1,'Order','','','quick-order'),(24,3,2,'Order','','','quick-order'),(24,4,1,'Order','','','quick-order'),(24,4,2,'Order','','','quick-order'),(24,5,1,'Order','','','quick-order'),(24,5,2,'Order','','','quick-order'),(25,1,1,'Guest tracking','','','guest-tracking'),(25,1,2,'Guest tracking','','','guest-tracking'),(25,2,1,'Guest tracking','','','guest-tracking'),(25,2,2,'Guest tracking','','','guest-tracking'),(25,3,1,'Guest tracking','','','guest-tracking'),(25,3,2,'Guest tracking','','','guest-tracking'),(25,4,1,'Guest tracking','','','guest-tracking'),(25,4,2,'Guest tracking','','','guest-tracking'),(25,5,1,'Guest tracking','','','guest-tracking'),(25,5,2,'Guest tracking','','','guest-tracking'),(26,1,1,'Order confirmation','','','order-confirmation'),(26,1,2,'Order confirmation','','','order-confirmation'),(26,2,1,'Order confirmation','','','order-confirmation'),(26,2,2,'Order confirmation','','','order-confirmation'),(26,3,1,'Order confirmation','','','order-confirmation'),(26,3,2,'Order confirmation','','','order-confirmation'),(26,4,1,'Order confirmation','','','order-confirmation'),(26,4,2,'Order confirmation','','','order-confirmation'),(26,5,1,'Order confirmation','','','order-confirmation'),(26,5,2,'Order confirmation','','','order-confirmation');
/*!40000 ALTER TABLE `ps_meta_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_module` WRITE;
/*!40000 ALTER TABLE `ps_module` DISABLE KEYS */;
INSERT INTO `ps_module` VALUES (1,'carriercompare',1,'1.2'),(3,'blockadvertising',1,'0.5'),(4,'blockbestsellers',1,'1.1'),(5,'blockcart',1,'1.2'),(7,'blockcms',1,'1.1.1'),(8,'blockcontact',1,'1.0'),(9,'blockcontactinfos',1,'1.0'),(10,'blockcurrencies',1,'0.1'),(11,'blockcustomerprivacy',1,'1.0'),(12,'blocklanguages',1,'1.1'),(13,'blockmanufacturer',1,'1'),(17,'blocknewsletter',1,'1.4'),(19,'blockpermanentlinks',1,'0.1'),(21,'blocksearch',1,'1.2'),(22,'blocksharefb',1,'1.0'),(25,'blockstore',1,'1'),(26,'blocksupplier',1,'1'),(27,'blocktags',1,'1.1'),(28,'blocktopmenu',1,'1.5'),(29,'blockuserinfo',1,'0.1'),(32,'favoriteproducts',1,'1'),(33,'feeder',1,'0.3'),(34,'graphartichow',1,'1'),(35,'graphgooglechart',1,'1'),(36,'graphvisifire',1,'1'),(37,'graphxmlswfcharts',1,'1'),(38,'gridhtml',1,'1'),(39,'homefeatured',1,'0.9'),(41,'pagesnotfound',1,'1.1'),(42,'sekeywords',1,'1'),(43,'statsbestcategories',1,'1'),(44,'statsbestcustomers',1,'1'),(45,'statsbestproducts',1,'1'),(46,'statsbestsuppliers',1,'1'),(47,'statsbestvouchers',1,'1'),(48,'statscarrier',1,'1'),(49,'statscatalog',1,'1'),(50,'statscheckup',1,'1'),(51,'statsdata',1,'1'),(52,'statsequipment',1,'1'),(53,'statsforecast',1,'1'),(54,'statslive',1,'1'),(55,'statsnewsletter',1,'1'),(56,'statsorigin',1,'1'),(57,'statspersonalinfos',1,'1'),(58,'statsproduct',1,'1'),(59,'statsregistrations',1,'1'),(60,'statssales',1,'1'),(61,'statssearch',1,'1'),(62,'statsstock',1,'1'),(63,'statsvisits',1,'1'),(64,'themeinstallator',1,'2.4'),(65,'gamification',1,'1.4.5'),(66,'csslider',1,'1.0'),(68,'cshometab',1,'1.0'),(69,'csblocknewproducts',1,'0.1'),(71,'productscategory',1,'1.3'),(72,'csmegamenu',1,'1.0'),(74,'csmanufacturer',1,'1.0'),(75,'csblockspecials',1,'1.0'),(77,'csstaticblocks',1,'1.0'),(84,'csthemeeditor',1,'1'),(88,'csblockviewed',1,'0.9'),(89,'csquickview',1,'1'),(90,'productcomments',1,'2.3'),(91,'csaddtocartextend',1,'1'),(92,'csfilterproductleft',1,'1.0'),(93,'csfilterproductcenter',1,'1.0'),(94,'csfilterproductright',1,'1.0'),(95,'bankwire',1,'0.5'),(96,'cheque',1,'2.3'),(97,'blocklayered',1,'1.8.9');
/*!40000 ALTER TABLE `ps_module` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_module_access` WRITE;
/*!40000 ALTER TABLE `ps_module_access` DISABLE KEYS */;
INSERT INTO `ps_module_access` VALUES (2,1,1,0),(2,3,1,0),(2,4,1,0),(2,5,1,0),(2,7,1,0),(2,8,1,0),(2,9,1,0),(2,10,1,0),(2,11,1,0),(2,12,1,0),(2,13,1,0),(2,17,1,0),(2,19,1,0),(2,21,1,0),(2,22,1,0),(2,25,1,0),(2,26,1,0),(2,27,1,0),(2,28,1,0),(2,29,1,0),(2,32,1,0),(2,33,1,0),(2,34,1,0),(2,35,1,0),(2,36,1,0),(2,37,1,0),(2,38,1,0),(2,39,1,0),(2,41,1,0),(2,42,1,0),(2,43,1,0),(2,44,1,0),(2,45,1,0),(2,46,1,0),(2,47,1,0),(2,48,1,0),(2,49,1,0),(2,50,1,0),(2,51,1,0),(2,52,1,0),(2,53,1,0),(2,54,1,0),(2,55,1,0),(2,56,1,0),(2,57,1,0),(2,58,1,0),(2,59,1,0),(2,60,1,0),(2,61,1,0),(2,62,1,0),(2,63,1,0),(2,64,1,0),(2,65,1,0),(2,66,1,1),(2,68,1,1),(2,69,1,1),(2,71,1,1),(2,72,1,1),(2,74,1,1),(2,75,1,1),(2,77,1,1),(2,84,1,1),(2,88,1,1),(2,89,1,1),(2,90,1,1),(2,91,1,1),(2,92,1,1),(2,93,1,1),(2,94,1,1),(2,95,1,1),(2,96,1,1),(2,97,1,1),(3,1,1,0),(3,3,1,0),(3,4,1,0),(3,5,1,0),(3,7,1,0),(3,8,1,0),(3,9,1,0),(3,10,1,0),(3,11,1,0),(3,12,1,0),(3,13,1,0),(3,17,1,0),(3,19,1,0),(3,21,1,0),(3,22,1,0),(3,25,1,0),(3,26,1,0),(3,27,1,0),(3,28,1,0),(3,29,1,0),(3,32,1,0),(3,33,1,0),(3,34,1,0),(3,35,1,0),(3,36,1,0),(3,37,1,0),(3,38,1,0),(3,39,1,0),(3,41,1,0),(3,42,1,0),(3,43,1,0),(3,44,1,0),(3,45,1,0),(3,46,1,0),(3,47,1,0),(3,48,1,0),(3,49,1,0),(3,50,1,0),(3,51,1,0),(3,52,1,0),(3,53,1,0),(3,54,1,0),(3,55,1,0),(3,56,1,0),(3,57,1,0),(3,58,1,0),(3,59,1,0),(3,60,1,0),(3,61,1,0),(3,62,1,0),(3,63,1,0),(3,64,1,0),(3,65,1,0),(3,66,1,1),(3,68,1,1),(3,69,1,1),(3,71,1,1),(3,72,1,1),(3,74,1,1),(3,75,1,1),(3,77,1,1),(3,84,1,1),(3,88,1,1),(3,89,1,1),(3,90,1,1),(3,91,1,1),(3,92,1,1),(3,93,1,1),(3,94,1,1),(3,95,1,1),(3,96,1,1),(3,97,1,1),(4,1,1,0),(4,3,1,0),(4,4,1,0),(4,5,1,0),(4,7,1,0),(4,8,1,0),(4,9,1,0),(4,10,1,0),(4,11,1,0),(4,12,1,0),(4,13,1,0),(4,17,1,0),(4,19,1,0),(4,21,1,0),(4,22,1,0),(4,25,1,0),(4,26,1,0),(4,27,1,0),(4,28,1,0),(4,29,1,0),(4,32,1,0),(4,33,1,0),(4,34,1,0),(4,35,1,0),(4,36,1,0),(4,37,1,0),(4,38,1,0),(4,39,1,0),(4,41,1,0),(4,42,1,0),(4,43,1,0),(4,44,1,0),(4,45,1,0),(4,46,1,0),(4,47,1,0),(4,48,1,0),(4,49,1,0),(4,50,1,0),(4,51,1,0),(4,52,1,0),(4,53,1,0),(4,54,1,0),(4,55,1,0),(4,56,1,0),(4,57,1,0),(4,58,1,0),(4,59,1,0),(4,60,1,0),(4,61,1,0),(4,62,1,0),(4,63,1,0),(4,64,1,0),(4,65,1,0),(4,66,1,0),(4,68,1,0),(4,69,1,0),(4,71,1,0),(4,72,1,0),(4,74,1,0),(4,75,1,0),(4,77,1,0),(4,84,1,0),(4,88,1,0),(4,89,1,0),(4,90,1,0),(4,91,1,0),(4,92,1,0),(4,93,1,0),(4,94,1,0),(4,95,1,0),(4,96,1,0),(4,97,1,0),(5,1,1,0),(5,3,1,0),(5,4,1,0),(5,5,1,0),(5,7,1,0),(5,8,1,0),(5,9,1,0),(5,10,1,0),(5,11,1,0),(5,12,1,0),(5,13,1,0),(5,17,1,0),(5,19,1,0),(5,21,1,0),(5,22,1,0),(5,25,1,0),(5,26,1,0),(5,27,1,0),(5,28,1,0),(5,29,1,0),(5,32,1,0),(5,33,1,0),(5,34,1,0),(5,35,1,0),(5,36,1,0),(5,37,1,0),(5,38,1,0),(5,39,1,0),(5,41,1,0),(5,42,1,0),(5,43,1,0),(5,44,1,0),(5,45,1,0),(5,46,1,0),(5,47,1,0),(5,48,1,0),(5,49,1,0),(5,50,1,0),(5,51,1,0),(5,52,1,0),(5,53,1,0),(5,54,1,0),(5,55,1,0),(5,56,1,0),(5,57,1,0),(5,58,1,0),(5,59,1,0),(5,60,1,0),(5,61,1,0),(5,62,1,0),(5,63,1,0),(5,64,1,0),(5,65,1,0),(5,66,1,1),(5,68,1,1),(5,69,1,1),(5,71,1,1),(5,72,1,1),(5,74,1,1),(5,75,1,1),(5,77,1,1),(5,84,1,1),(5,88,1,1),(5,89,1,1),(5,90,1,1),(5,91,1,1),(5,92,1,1),(5,93,1,1),(5,94,1,1),(5,95,1,1),(5,96,1,1),(5,97,1,1);
/*!40000 ALTER TABLE `ps_module_access` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_module_country` WRITE;
/*!40000 ALTER TABLE `ps_module_country` DISABLE KEYS */;
INSERT INTO `ps_module_country` VALUES (95,1,21),(95,2,21),(95,3,21),(95,4,21),(95,5,21),(96,1,21),(96,2,21),(96,3,21),(96,4,21),(96,5,21);
/*!40000 ALTER TABLE `ps_module_country` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_module_currency` WRITE;
/*!40000 ALTER TABLE `ps_module_currency` DISABLE KEYS */;
INSERT INTO `ps_module_currency` VALUES (95,1,1),(95,1,2),(95,2,1),(95,2,2),(95,3,1),(95,3,2),(95,4,1),(95,4,2),(95,5,1),(95,5,2),(96,1,1),(96,1,2),(96,2,1),(96,2,2),(96,3,1),(96,3,2),(96,4,1),(96,4,2),(96,5,1),(96,5,2);
/*!40000 ALTER TABLE `ps_module_currency` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_module_group` WRITE;
/*!40000 ALTER TABLE `ps_module_group` DISABLE KEYS */;
INSERT INTO `ps_module_group` VALUES (1,1,1),(1,1,2),(1,1,3),(1,2,1),(1,2,2),(1,2,3),(1,3,1),(1,3,2),(1,3,3),(1,4,1),(1,4,2),(1,4,3),(1,5,1),(1,5,2),(1,5,3),(3,1,1),(3,1,2),(3,1,3),(3,2,1),(3,2,2),(3,2,3),(3,3,1),(3,3,2),(3,3,3),(3,4,1),(3,4,2),(3,4,3),(3,5,1),(3,5,2),(3,5,3),(4,1,1),(4,1,2),(4,1,3),(4,2,1),(4,2,2),(4,2,3),(4,3,1),(4,3,2),(4,3,3),(4,4,1),(4,4,2),(4,4,3),(4,5,1),(4,5,2),(4,5,3),(5,1,1),(5,1,2),(5,1,3),(5,2,1),(5,2,2),(5,2,3),(5,3,1),(5,3,2),(5,3,3),(5,4,1),(5,4,2),(5,4,3),(5,5,1),(5,5,2),(5,5,3),(7,1,1),(7,1,2),(7,1,3),(7,2,1),(7,2,2),(7,2,3),(7,3,1),(7,3,2),(7,3,3),(7,4,1),(7,4,2),(7,4,3),(7,5,1),(7,5,2),(7,5,3),(8,1,1),(8,1,2),(8,1,3),(8,2,1),(8,2,2),(8,2,3),(8,3,1),(8,3,2),(8,3,3),(8,4,1),(8,4,2),(8,4,3),(8,5,1),(8,5,2),(8,5,3),(9,1,1),(9,1,2),(9,1,3),(9,2,1),(9,2,2),(9,2,3),(9,3,1),(9,3,2),(9,3,3),(9,4,1),(9,4,2),(9,4,3),(9,5,1),(9,5,2),(9,5,3),(10,1,1),(10,1,2),(10,1,3),(10,2,1),(10,2,2),(10,2,3),(10,3,1),(10,3,2),(10,3,3),(10,4,1),(10,4,2),(10,4,3),(10,5,1),(10,5,2),(10,5,3),(11,1,1),(11,1,2),(11,1,3),(11,2,1),(11,2,2),(11,2,3),(11,3,1),(11,3,2),(11,3,3),(11,4,1),(11,4,2),(11,4,3),(11,5,1),(11,5,2),(11,5,3),(12,1,1),(12,1,2),(12,1,3),(12,2,1),(12,2,2),(12,2,3),(12,3,1),(12,3,2),(12,3,3),(12,4,1),(12,4,2),(12,4,3),(12,5,1),(12,5,2),(12,5,3),(13,1,1),(13,1,2),(13,1,3),(13,2,1),(13,2,2),(13,2,3),(13,3,1),(13,3,2),(13,3,3),(13,4,1),(13,4,2),(13,4,3),(13,5,1),(13,5,2),(13,5,3),(17,1,1),(17,1,2),(17,1,3),(17,2,1),(17,2,2),(17,2,3),(17,3,1),(17,3,2),(17,3,3),(17,4,1),(17,4,2),(17,4,3),(17,5,1),(17,5,2),(17,5,3),(19,1,1),(19,1,2),(19,1,3),(19,2,1),(19,2,2),(19,2,3),(19,3,1),(19,3,2),(19,3,3),(19,4,1),(19,4,2),(19,4,3),(19,5,1),(19,5,2),(19,5,3),(21,1,1),(21,1,2),(21,1,3),(21,2,1),(21,2,2),(21,2,3),(21,3,1),(21,3,2),(21,3,3),(21,4,1),(21,4,2),(21,4,3),(21,5,1),(21,5,2),(21,5,3),(22,1,1),(22,1,2),(22,1,3),(22,2,1),(22,2,2),(22,2,3),(22,3,1),(22,3,2),(22,3,3),(22,4,1),(22,4,2),(22,4,3),(22,5,1),(22,5,2),(22,5,3),(25,1,1),(25,1,2),(25,1,3),(25,2,1),(25,2,2),(25,2,3),(25,3,1),(25,3,2),(25,3,3),(25,4,1),(25,4,2),(25,4,3),(25,5,1),(25,5,2),(25,5,3),(26,1,1),(26,1,2),(26,1,3),(26,2,1),(26,2,2),(26,2,3),(26,3,1),(26,3,2),(26,3,3),(26,4,1),(26,4,2),(26,4,3),(26,5,1),(26,5,2),(26,5,3),(27,1,1),(27,1,2),(27,1,3),(27,2,1),(27,2,2),(27,2,3),(27,3,1),(27,3,2),(27,3,3),(27,4,1),(27,4,2),(27,4,3),(27,5,1),(27,5,2),(27,5,3),(28,1,1),(28,1,2),(28,1,3),(28,2,1),(28,2,2),(28,2,3),(28,3,1),(28,3,2),(28,3,3),(28,4,1),(28,4,2),(28,4,3),(28,5,1),(28,5,2),(28,5,3),(29,1,1),(29,1,2),(29,1,3),(29,2,1),(29,2,2),(29,2,3),(29,3,1),(29,3,2),(29,3,3),(29,4,1),(29,4,2),(29,4,3),(29,5,1),(29,5,2),(29,5,3),(32,1,1),(32,1,2),(32,1,3),(32,2,1),(32,2,2),(32,2,3),(32,3,1),(32,3,2),(32,3,3),(32,4,1),(32,4,2),(32,4,3),(32,5,1),(32,5,2),(32,5,3),(33,1,1),(33,1,2),(33,1,3),(33,2,1),(33,2,2),(33,2,3),(33,3,1),(33,3,2),(33,3,3),(33,4,1),(33,4,2),(33,4,3),(33,5,1),(33,5,2),(33,5,3),(34,1,1),(34,1,2),(34,1,3),(34,2,1),(34,2,2),(34,2,3),(34,3,1),(34,3,2),(34,3,3),(34,4,1),(34,4,2),(34,4,3),(34,5,1),(34,5,2),(34,5,3),(35,1,1),(35,1,2),(35,1,3),(35,2,1),(35,2,2),(35,2,3),(35,3,1),(35,3,2),(35,3,3),(35,4,1),(35,4,2),(35,4,3),(35,5,1),(35,5,2),(35,5,3),(36,1,1),(36,1,2),(36,1,3),(36,2,1),(36,2,2),(36,2,3),(36,3,1),(36,3,2),(36,3,3),(36,4,1),(36,4,2),(36,4,3),(36,5,1),(36,5,2),(36,5,3),(37,1,1),(37,1,2),(37,1,3),(37,2,1),(37,2,2),(37,2,3),(37,3,1),(37,3,2),(37,3,3),(37,4,1),(37,4,2),(37,4,3),(37,5,1),(37,5,2),(37,5,3),(38,1,1),(38,1,2),(38,1,3),(38,2,1),(38,2,2),(38,2,3),(38,3,1),(38,3,2),(38,3,3),(38,4,1),(38,4,2),(38,4,3),(38,5,1),(38,5,2),(38,5,3),(39,1,1),(39,1,2),(39,1,3),(39,2,1),(39,2,2),(39,2,3),(39,3,1),(39,3,2),(39,3,3),(39,4,1),(39,4,2),(39,4,3),(39,5,1),(39,5,2),(39,5,3),(41,1,1),(41,1,2),(41,1,3),(41,2,1),(41,2,2),(41,2,3),(41,3,1),(41,3,2),(41,3,3),(41,4,1),(41,4,2),(41,4,3),(41,5,1),(41,5,2),(41,5,3),(42,1,1),(42,1,2),(42,1,3),(42,2,1),(42,2,2),(42,2,3),(42,3,1),(42,3,2),(42,3,3),(42,4,1),(42,4,2),(42,4,3),(42,5,1),(42,5,2),(42,5,3),(43,1,1),(43,1,2),(43,1,3),(43,2,1),(43,2,2),(43,2,3),(43,3,1),(43,3,2),(43,3,3),(43,4,1),(43,4,2),(43,4,3),(43,5,1),(43,5,2),(43,5,3),(44,1,1),(44,1,2),(44,1,3),(44,2,1),(44,2,2),(44,2,3),(44,3,1),(44,3,2),(44,3,3),(44,4,1),(44,4,2),(44,4,3),(44,5,1),(44,5,2),(44,5,3),(45,1,1),(45,1,2),(45,1,3),(45,2,1),(45,2,2),(45,2,3),(45,3,1),(45,3,2),(45,3,3),(45,4,1),(45,4,2),(45,4,3),(45,5,1),(45,5,2),(45,5,3),(46,1,1),(46,1,2),(46,1,3),(46,2,1),(46,2,2),(46,2,3),(46,3,1),(46,3,2),(46,3,3),(46,4,1),(46,4,2),(46,4,3),(46,5,1),(46,5,2),(46,5,3),(47,1,1),(47,1,2),(47,1,3),(47,2,1),(47,2,2),(47,2,3),(47,3,1),(47,3,2),(47,3,3),(47,4,1),(47,4,2),(47,4,3),(47,5,1),(47,5,2),(47,5,3),(48,1,1),(48,1,2),(48,1,3),(48,2,1),(48,2,2),(48,2,3),(48,3,1),(48,3,2),(48,3,3),(48,4,1),(48,4,2),(48,4,3),(48,5,1),(48,5,2),(48,5,3),(49,1,1),(49,1,2),(49,1,3),(49,2,1),(49,2,2),(49,2,3),(49,3,1),(49,3,2),(49,3,3),(49,4,1),(49,4,2),(49,4,3),(49,5,1),(49,5,2),(49,5,3),(50,1,1),(50,1,2),(50,1,3),(50,2,1),(50,2,2),(50,2,3),(50,3,1),(50,3,2),(50,3,3),(50,4,1),(50,4,2),(50,4,3),(50,5,1),(50,5,2),(50,5,3),(51,1,1),(51,1,2),(51,1,3),(51,2,1),(51,2,2),(51,2,3),(51,3,1),(51,3,2),(51,3,3),(51,4,1),(51,4,2),(51,4,3),(51,5,1),(51,5,2),(51,5,3),(52,1,1),(52,1,2),(52,1,3),(52,2,1),(52,2,2),(52,2,3),(52,3,1),(52,3,2),(52,3,3),(52,4,1),(52,4,2),(52,4,3),(52,5,1),(52,5,2),(52,5,3),(53,1,1),(53,1,2),(53,1,3),(53,2,1),(53,2,2),(53,2,3),(53,3,1),(53,3,2),(53,3,3),(53,4,1),(53,4,2),(53,4,3),(53,5,1),(53,5,2),(53,5,3),(54,1,1),(54,1,2),(54,1,3),(54,2,1),(54,2,2),(54,2,3),(54,3,1),(54,3,2),(54,3,3),(54,4,1),(54,4,2),(54,4,3),(54,5,1),(54,5,2),(54,5,3),(55,1,1),(55,1,2),(55,1,3),(55,2,1),(55,2,2),(55,2,3),(55,3,1),(55,3,2),(55,3,3),(55,4,1),(55,4,2),(55,4,3),(55,5,1),(55,5,2),(55,5,3),(56,1,1),(56,1,2),(56,1,3),(56,2,1),(56,2,2),(56,2,3),(56,3,1),(56,3,2),(56,3,3),(56,4,1),(56,4,2),(56,4,3),(56,5,1),(56,5,2),(56,5,3),(57,1,1),(57,1,2),(57,1,3),(57,2,1),(57,2,2),(57,2,3),(57,3,1),(57,3,2),(57,3,3),(57,4,1),(57,4,2),(57,4,3),(57,5,1),(57,5,2),(57,5,3),(58,1,1),(58,1,2),(58,1,3),(58,2,1),(58,2,2),(58,2,3),(58,3,1),(58,3,2),(58,3,3),(58,4,1),(58,4,2),(58,4,3),(58,5,1),(58,5,2),(58,5,3),(59,1,1),(59,1,2),(59,1,3),(59,2,1),(59,2,2),(59,2,3),(59,3,1),(59,3,2),(59,3,3),(59,4,1),(59,4,2),(59,4,3),(59,5,1),(59,5,2),(59,5,3),(60,1,1),(60,1,2),(60,1,3),(60,2,1),(60,2,2),(60,2,3),(60,3,1),(60,3,2),(60,3,3),(60,4,1),(60,4,2),(60,4,3),(60,5,1),(60,5,2),(60,5,3),(61,1,1),(61,1,2),(61,1,3),(61,2,1),(61,2,2),(61,2,3),(61,3,1),(61,3,2),(61,3,3),(61,4,1),(61,4,2),(61,4,3),(61,5,1),(61,5,2),(61,5,3),(62,1,1),(62,1,2),(62,1,3),(62,2,1),(62,2,2),(62,2,3),(62,3,1),(62,3,2),(62,3,3),(62,4,1),(62,4,2),(62,4,3),(62,5,1),(62,5,2),(62,5,3),(63,1,1),(63,1,2),(63,1,3),(63,2,1),(63,2,2),(63,2,3),(63,3,1),(63,3,2),(63,3,3),(63,4,1),(63,4,2),(63,4,3),(63,5,1),(63,5,2),(63,5,3),(64,1,1),(64,1,2),(64,1,3),(64,2,1),(64,2,2),(64,2,3),(64,3,1),(64,3,2),(64,3,3),(64,4,1),(64,4,2),(64,4,3),(64,5,1),(64,5,2),(64,5,3),(65,1,1),(65,1,2),(65,1,3),(65,2,1),(65,2,2),(65,2,3),(65,3,1),(65,3,2),(65,3,3),(65,4,1),(65,4,2),(65,4,3),(65,5,1),(65,5,2),(65,5,3),(66,1,1),(66,1,2),(66,1,3),(66,2,1),(66,2,2),(66,2,3),(66,3,1),(66,3,2),(66,3,3),(66,4,1),(66,4,2),(66,4,3),(66,5,1),(66,5,2),(66,5,3),(68,1,1),(68,1,2),(68,1,3),(68,2,1),(68,2,2),(68,2,3),(68,3,1),(68,3,2),(68,3,3),(68,4,1),(68,4,2),(68,4,3),(68,5,1),(68,5,2),(68,5,3),(69,1,1),(69,1,2),(69,1,3),(69,2,1),(69,2,2),(69,2,3),(69,3,1),(69,3,2),(69,3,3),(69,4,1),(69,4,2),(69,4,3),(69,5,1),(69,5,2),(69,5,3),(71,1,1),(71,1,2),(71,1,3),(71,2,1),(71,2,2),(71,2,3),(71,3,1),(71,3,2),(71,3,3),(71,4,1),(71,4,2),(71,4,3),(71,5,1),(71,5,2),(71,5,3),(72,1,1),(72,1,2),(72,1,3),(72,2,1),(72,2,2),(72,2,3),(72,3,1),(72,3,2),(72,3,3),(72,4,1),(72,4,2),(72,4,3),(72,5,1),(72,5,2),(72,5,3),(74,1,1),(74,1,2),(74,1,3),(74,2,1),(74,2,2),(74,2,3),(74,3,1),(74,3,2),(74,3,3),(74,4,1),(74,4,2),(74,4,3),(74,5,1),(74,5,2),(74,5,3),(75,1,1),(75,1,2),(75,1,3),(75,2,1),(75,2,2),(75,2,3),(75,3,1),(75,3,2),(75,3,3),(75,4,1),(75,4,2),(75,4,3),(75,5,1),(75,5,2),(75,5,3),(77,1,1),(77,1,2),(77,1,3),(77,2,1),(77,2,2),(77,2,3),(77,3,1),(77,3,2),(77,3,3),(77,4,1),(77,4,2),(77,4,3),(77,5,1),(77,5,2),(77,5,3),(84,1,1),(84,1,2),(84,1,3),(84,2,1),(84,2,2),(84,2,3),(84,3,1),(84,3,2),(84,3,3),(84,4,1),(84,4,2),(84,4,3),(84,5,1),(84,5,2),(84,5,3),(88,1,1),(88,1,2),(88,1,3),(88,2,1),(88,2,2),(88,2,3),(88,3,1),(88,3,2),(88,3,3),(88,4,1),(88,4,2),(88,4,3),(88,5,1),(88,5,2),(88,5,3),(89,1,1),(89,1,2),(89,1,3),(89,2,1),(89,2,2),(89,2,3),(89,3,1),(89,3,2),(89,3,3),(89,4,1),(89,4,2),(89,4,3),(89,5,1),(89,5,2),(89,5,3),(90,1,1),(90,1,2),(90,1,3),(90,2,1),(90,2,2),(90,2,3),(90,3,1),(90,3,2),(90,3,3),(90,4,1),(90,4,2),(90,4,3),(90,5,1),(90,5,2),(90,5,3),(91,1,1),(91,1,2),(91,1,3),(91,2,1),(91,2,2),(91,2,3),(91,3,1),(91,3,2),(91,3,3),(91,4,1),(91,4,2),(91,4,3),(91,5,1),(91,5,2),(91,5,3),(92,1,1),(92,1,2),(92,1,3),(92,2,1),(92,2,2),(92,2,3),(92,3,1),(92,3,2),(92,3,3),(92,4,1),(92,4,2),(92,4,3),(92,5,1),(92,5,2),(92,5,3),(93,1,1),(93,1,2),(93,1,3),(93,2,1),(93,2,2),(93,2,3),(93,3,1),(93,3,2),(93,3,3),(93,4,1),(93,4,2),(93,4,3),(93,5,1),(93,5,2),(93,5,3),(94,1,1),(94,1,2),(94,1,3),(94,2,1),(94,2,2),(94,2,3),(94,3,1),(94,3,2),(94,3,3),(94,4,1),(94,4,2),(94,4,3),(94,5,1),(94,5,2),(94,5,3),(95,1,1),(95,1,2),(95,1,3),(95,2,1),(95,2,2),(95,2,3),(95,3,1),(95,3,2),(95,3,3),(95,4,1),(95,4,2),(95,4,3),(95,5,1),(95,5,2),(95,5,3),(96,1,1),(96,1,2),(96,1,3),(96,2,1),(96,2,2),(96,2,3),(96,3,1),(96,3,2),(96,3,3),(96,4,1),(96,4,2),(96,4,3),(96,5,1),(96,5,2),(96,5,3),(97,1,1),(97,1,2),(97,1,3),(97,2,1),(97,2,2),(97,2,3),(97,3,1),(97,3,2),(97,3,3),(97,4,1),(97,4,2),(97,4,3),(97,5,1),(97,5,2),(97,5,3);
/*!40000 ALTER TABLE `ps_module_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_module_preference` WRITE;
/*!40000 ALTER TABLE `ps_module_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_module_preference` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_module_shop` WRITE;
/*!40000 ALTER TABLE `ps_module_shop` DISABLE KEYS */;
INSERT INTO `ps_module_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(3,1),(3,2),(3,3),(3,4),(3,5),(5,1),(5,2),(5,3),(5,4),(5,5),(7,1),(7,2),(7,3),(7,4),(7,5),(8,1),(8,2),(8,3),(8,4),(8,5),(9,1),(9,2),(9,3),(9,4),(9,5),(10,1),(10,2),(10,3),(10,4),(10,5),(11,1),(11,2),(11,3),(11,4),(11,5),(12,1),(12,2),(12,3),(12,4),(12,5),(13,1),(13,2),(13,3),(13,4),(13,5),(17,1),(17,2),(17,3),(17,4),(17,5),(19,1),(19,2),(19,3),(19,4),(19,5),(21,1),(21,2),(21,3),(21,4),(21,5),(22,1),(22,2),(22,3),(22,4),(22,5),(25,1),(25,2),(25,3),(25,4),(25,5),(27,1),(27,2),(27,3),(27,4),(27,5),(28,1),(28,2),(28,3),(28,4),(28,5),(29,1),(29,2),(29,3),(29,4),(29,5),(32,1),(32,2),(32,3),(32,4),(32,5),(33,1),(33,2),(33,3),(33,4),(33,5),(34,1),(34,2),(34,3),(34,4),(34,5),(35,1),(35,2),(35,3),(35,4),(35,5),(36,1),(36,2),(36,3),(36,4),(36,5),(37,1),(37,2),(37,3),(37,4),(37,5),(38,1),(38,2),(38,3),(38,4),(38,5),(39,1),(39,2),(39,3),(39,4),(39,5),(41,1),(41,2),(41,3),(41,4),(41,5),(42,1),(42,2),(42,3),(42,4),(42,5),(43,1),(43,2),(43,3),(43,4),(43,5),(44,1),(44,2),(44,3),(44,4),(44,5),(45,1),(45,2),(45,3),(45,4),(45,5),(46,1),(46,2),(46,3),(46,4),(46,5),(47,1),(47,2),(47,3),(47,4),(47,5),(48,1),(48,2),(48,3),(48,4),(48,5),(49,1),(49,2),(49,3),(49,4),(49,5),(50,1),(50,2),(50,3),(50,4),(50,5),(51,1),(51,2),(51,3),(51,4),(51,5),(52,1),(52,2),(52,3),(52,4),(52,5),(53,1),(53,2),(53,3),(53,4),(53,5),(54,1),(54,2),(54,3),(54,4),(54,5),(55,1),(55,2),(55,3),(55,4),(55,5),(56,1),(56,2),(56,3),(56,4),(56,5),(57,1),(57,2),(57,3),(57,4),(57,5),(58,1),(58,2),(58,3),(58,4),(58,5),(59,1),(59,2),(59,3),(59,4),(59,5),(60,1),(60,2),(60,3),(60,4),(60,5),(61,1),(61,2),(61,3),(61,4),(61,5),(62,1),(62,2),(62,3),(62,4),(62,5),(63,1),(63,2),(63,3),(63,4),(63,5),(64,1),(64,2),(64,3),(64,4),(64,5),(65,1),(65,2),(65,3),(65,4),(65,5),(66,1),(66,2),(66,3),(66,4),(66,5),(68,1),(68,2),(68,3),(68,4),(68,5),(69,1),(69,2),(69,3),(69,4),(69,5),(71,1),(71,2),(71,3),(71,4),(71,5),(72,1),(72,2),(72,3),(72,4),(72,5),(74,1),(74,2),(74,3),(74,4),(74,5),(75,1),(75,2),(75,3),(75,4),(75,5),(77,1),(77,2),(77,3),(77,4),(77,5),(84,1),(84,2),(84,3),(84,4),(84,5),(88,1),(88,2),(88,3),(88,4),(88,5),(89,1),(89,2),(89,3),(89,4),(89,5),(90,1),(90,2),(90,3),(90,4),(90,5),(91,1),(91,2),(91,3),(91,4),(91,5),(92,1),(92,2),(92,3),(92,4),(92,5),(93,1),(93,2),(93,3),(93,4),(93,5),(94,1),(94,2),(94,3),(94,4),(94,5),(95,1),(95,2),(95,3),(95,4),(95,5),(96,1),(96,2),(96,3),(96,4),(96,5),(97,1),(97,2),(97,3),(97,4),(97,5);
/*!40000 ALTER TABLE `ps_module_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_newsletter` WRITE;
/*!40000 ALTER TABLE `ps_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_operating_system` WRITE;
/*!40000 ALTER TABLE `ps_operating_system` DISABLE KEYS */;
INSERT INTO `ps_operating_system` VALUES (1,'Windows XP'),(2,'Windows Vista'),(3,'Windows 7'),(4,'Windows 8'),(5,'MacOsX'),(6,'Linux'),(7,'Android');
/*!40000 ALTER TABLE `ps_operating_system` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_carrier` WRITE;
/*!40000 ALTER TABLE `ps_order_carrier` DISABLE KEYS */;
INSERT INTO `ps_order_carrier` VALUES (1,1,2,0,0.000000,0.000000,0.000000,'','2013-06-18 03:25:00'),(2,2,2,0,0.000000,2.000000,2.000000,'','2013-06-27 22:07:54');
/*!40000 ALTER TABLE `ps_order_carrier` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_cart_rule` WRITE;
/*!40000 ALTER TABLE `ps_order_cart_rule` DISABLE KEYS */;
INSERT INTO `ps_order_cart_rule` VALUES (1,2,1,0,'gift',172.56,172.56,0);
/*!40000 ALTER TABLE `ps_order_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_detail` WRITE;
/*!40000 ALTER TABLE `ps_order_detail` DISABLE KEYS */;
INSERT INTO `ps_order_detail` VALUES (1,1,0,0,1,5,11,'iPod touch - Capacité: 32Go',1,0,0,0,0,392.140500,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','',0.000000,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',469.000000,392.140000,469.000000,392.140468,0.000000,0.000000,0.000000,0.000000),(2,1,0,0,1,7,0,'Écouteurs à isolation sonore Shure SE210',1,0,0,0,0,124.581900,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','',0.000000,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',149.000000,124.580000,149.000000,124.581940,0.000000,0.000000,0.000000,0.000000),(3,2,0,0,1,18,32,'Cursus magna lacus antedios - Color : Metal, Disk space : 80GB Parallel ATA Drive @ 4200 rpm, Processor : 1.80GHz Intel Core 2 Duo',1,1,0,0,0,687.000000,12.00,0.000000,0.000000,0.000000,0.00,605.560000,'','','','',0.000000,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',604.560000,604.560000,604.560000,604.560000,0.000000,0.000000,0.000000,687.000000),(4,2,0,0,1,21,38,'Aenean fringilla venenatis nulla non auctor - Color : Metal, Disk space : 80GB Parallel ATA Drive @ 4200 rpm, Processor : 1.80GHz Intel Core 2 Duo',1,1,0,0,0,590.000000,10.00,0.000000,0.000000,0.000000,0.00,532.000000,'','','','',0.000000,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',531.000000,531.000000,531.000000,531.000000,0.000000,0.000000,0.000000,590.000000),(5,2,0,0,1,29,54,'Aenean fringilla venenatis nulla non auctor - Color : Metal, Disk space : 80GB Parallel ATA Drive @ 4200 rpm, Processor : 1.80GHz Intel Core 2 Duo',1,1,0,0,0,590.000000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','',0.000000,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',590.000000,590.000000,590.000000,590.000000,0.000000,0.000000,0.000000,590.000000);
/*!40000 ALTER TABLE `ps_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_detail_tax` WRITE;
/*!40000 ALTER TABLE `ps_order_detail_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_order_detail_tax` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_history` WRITE;
/*!40000 ALTER TABLE `ps_order_history` DISABLE KEYS */;
INSERT INTO `ps_order_history` VALUES (1,0,1,1,'2013-06-18 03:25:00'),(2,0,2,10,'2013-06-27 22:07:54');
/*!40000 ALTER TABLE `ps_order_history` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_invoice` WRITE;
/*!40000 ALTER TABLE `ps_order_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_order_invoice` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_invoice_payment` WRITE;
/*!40000 ALTER TABLE `ps_order_invoice_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_order_invoice_payment` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_invoice_tax` WRITE;
/*!40000 ALTER TABLE `ps_order_invoice_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_order_invoice_tax` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_message` WRITE;
/*!40000 ALTER TABLE `ps_order_message` DISABLE KEYS */;
INSERT INTO `ps_order_message` VALUES (1,'2013-06-18 03:25:00');
/*!40000 ALTER TABLE `ps_order_message` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_message_lang` WRITE;
/*!40000 ALTER TABLE `ps_order_message_lang` DISABLE KEYS */;
INSERT INTO `ps_order_message_lang` VALUES (1,1,'Delay','Hi,\n\nUnfortunately, an item on your order is currently out of stock. This may cause a slight delay in delivery.\nPlease accept our apologies and rest assured that we are working hard to rectify this.\n\nBest regards,'),(1,2,'Delay','Hi,\n\nUnfortunately, an item on your order is currently out of stock. This may cause a slight delay in delivery.\nPlease accept our apologies and rest assured that we are working hard to rectify this.\n\nBest regards,');
/*!40000 ALTER TABLE `ps_order_message_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_payment` WRITE;
/*!40000 ALTER TABLE `ps_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_return` WRITE;
/*!40000 ALTER TABLE `ps_order_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_order_return` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_return_detail` WRITE;
/*!40000 ALTER TABLE `ps_order_return_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_order_return_detail` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_return_state` WRITE;
/*!40000 ALTER TABLE `ps_order_return_state` DISABLE KEYS */;
INSERT INTO `ps_order_return_state` VALUES (1,'RoyalBlue'),(2,'BlueViolet'),(3,'LimeGreen'),(4,'Crimson'),(5,'#108510');
/*!40000 ALTER TABLE `ps_order_return_state` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_return_state_lang` WRITE;
/*!40000 ALTER TABLE `ps_order_return_state_lang` DISABLE KEYS */;
INSERT INTO `ps_order_return_state_lang` VALUES (1,1,'Waiting for confirmation'),(1,2,'Waiting for confirmation'),(2,1,'Waiting for package'),(2,2,'Waiting for package'),(3,1,'Package received'),(3,2,'Package received'),(4,1,'Return denied'),(4,2,'Return denied'),(5,1,'Return completed'),(5,2,'Return completed');
/*!40000 ALTER TABLE `ps_order_return_state_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_slip` WRITE;
/*!40000 ALTER TABLE `ps_order_slip` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_order_slip` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_slip_detail` WRITE;
/*!40000 ALTER TABLE `ps_order_slip_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_order_slip_detail` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_state` WRITE;
/*!40000 ALTER TABLE `ps_order_state` DISABLE KEYS */;
INSERT INTO `ps_order_state` VALUES (1,0,1,'cheque','RoyalBlue',1,0,0,0,0,0,0),(2,1,1,'','LimeGreen',1,0,1,0,0,1,0),(3,1,1,'','DarkOrange',1,0,1,1,0,1,0),(4,1,1,'','BlueViolet',1,0,1,1,1,1,0),(5,1,0,'','#108510',1,0,1,1,1,1,0),(6,0,1,'','Crimson',1,0,0,0,0,0,0),(7,1,1,'','#ec2e15',1,0,0,0,0,0,0),(8,0,1,'','#8f0621',1,0,0,0,0,0,0),(9,1,1,'','HotPink',1,0,0,0,0,1,0),(10,0,1,'bankwire','RoyalBlue',1,0,0,0,0,0,0),(11,0,0,'','RoyalBlue',1,0,0,0,0,0,0),(12,1,1,'','LimeGreen',1,0,1,0,0,1,0);
/*!40000 ALTER TABLE `ps_order_state` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_order_state_lang` WRITE;
/*!40000 ALTER TABLE `ps_order_state_lang` DISABLE KEYS */;
INSERT INTO `ps_order_state_lang` VALUES (1,1,'Awaiting cheque payment','cheque'),(1,2,'Awaiting cheque payment','cheque'),(2,1,'Payment accepted','payment'),(2,2,'Payment accepted','payment'),(3,1,'Preparation in progress','preparation'),(3,2,'Preparation in progress','preparation'),(4,1,'Shipped','shipped'),(4,2,'Shipped','shipped'),(5,1,'Delivered',''),(5,2,'Delivered',''),(6,1,'Canceled','order_canceled'),(6,2,'Canceled','order_canceled'),(7,1,'Refund','refund'),(7,2,'Refund','refund'),(8,1,'Payment error','payment_error'),(8,2,'Payment error','payment_error'),(9,1,'On backorder','outofstock'),(9,2,'On backorder','outofstock'),(10,1,'Awaiting bank wire payment','bankwire'),(10,2,'Awaiting bank wire payment','bankwire'),(11,1,'Awaiting PayPal payment',''),(11,2,'Awaiting PayPal payment',''),(12,1,'Payment remotely accepted','payment'),(12,2,'Payment remotely accepted','payment');
/*!40000 ALTER TABLE `ps_order_state_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_orders` WRITE;
/*!40000 ALTER TABLE `ps_orders` DISABLE KEYS */;
INSERT INTO `ps_orders` VALUES (1,'XKBKNABJK',1,1,2,1,1,1,1,2,2,1,'47ce86627c1f3c792a80773c5d2deaf8','Chèque',1.000000,'cheque',0,0,'',0,'',0.00,0.00,0.00,626.37,626.37,523.72,626.37,516.72,618.00,7.98,8.37,7.00,19.600,0.00,0.00,0.00,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2013-06-18 03:25:00','2013-06-18 03:25:00'),(2,'SIDOVFVFE',1,1,2,1,3,6,1,5,5,10,'42bf96bf3373fe56914f978e3087e1ea','Bank Wire',1.000000,'bankwire',0,0,'',0,'',172.56,172.56,172.56,1555.00,1555.00,1555.00,0.00,1725.56,1725.56,2.00,2.00,2.00,0.000,0.00,0.00,0.00,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2013-06-27 22:07:53','2013-06-27 22:07:54');
/*!40000 ALTER TABLE `ps_orders` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_pack` WRITE;
/*!40000 ALTER TABLE `ps_pack` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_pack` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_page` WRITE;
/*!40000 ALTER TABLE `ps_page` DISABLE KEYS */;
INSERT INTO `ps_page` VALUES (1,1,NULL),(2,2,NULL),(3,3,5),(4,3,1),(5,4,3),(6,4,6),(7,4,11),(8,4,32),(9,5,NULL),(10,3,2),(11,6,0),(12,7,NULL),(13,4,7),(14,4,8),(15,4,9),(16,3,8),(17,8,NULL),(18,9,0),(19,4,2),(20,10,NULL),(21,11,NULL),(22,3,37),(23,3,17),(24,3,18),(25,3,19),(26,3,20),(27,4,10),(28,3,21),(29,4,31),(30,12,NULL),(31,3,34),(32,13,NULL),(33,3,27),(34,3,23),(35,3,22),(36,3,36),(37,3,24),(38,14,NULL),(39,15,NULL),(40,16,NULL),(41,6,1),(42,6,2),(43,17,NULL),(44,6,3),(45,18,NULL),(46,19,NULL),(47,20,NULL),(48,21,NULL),(49,4,34),(50,22,NULL),(51,23,NULL),(52,24,NULL),(53,9,1),(54,9,6),(55,9,3),(56,9,4),(57,9,8),(58,25,NULL),(59,4,36),(60,3,31),(61,4,15),(62,3,40),(63,3,41),(64,3,43),(65,3,42),(66,3,32),(67,3,25),(68,3,28),(69,4,12),(70,4,20);
/*!40000 ALTER TABLE `ps_page` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_page_type` WRITE;
/*!40000 ALTER TABLE `ps_page_type` DISABLE KEYS */;
INSERT INTO `ps_page_type` VALUES (1,'index'),(2,'authentication'),(3,'product'),(4,'category'),(5,'pagenotfound'),(6,'order'),(7,'productscomparison'),(8,'sitemap'),(9,'manufacturer'),(10,'newproducts'),(11,'myaccount'),(12,'csproduct'),(13,'search'),(14,'password'),(15,'address'),(16,'addresses'),(17,'cms'),(18,'payment'),(19,'orderconfirmation'),(20,'history'),(21,'orderopc'),(22,'contact'),(23,'bestsales'),(24,'pricesdrop'),(25,'account');
/*!40000 ALTER TABLE `ps_page_type` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_page_viewed` WRITE;
/*!40000 ALTER TABLE `ps_page_viewed` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_page_viewed` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_pagenotfound` WRITE;
/*!40000 ALTER TABLE `ps_pagenotfound` DISABLE KEYS */;
INSERT INTO `ps_pagenotfound` VALUES (1,1,1,'/03_GoMarket/trunk/site/index.php?controller=404','','2013-06-19 08:55:39'),(2,1,1,'/03_GoMarket/trunk/site/undefined','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_product=2&controller=product&id_lang=1','2013-06-19 09:17:12'),(3,1,1,'/03_GoMarket/trunk/site/undefined','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_product=8&controller=product&id_lang=1','2013-06-21 14:25:17'),(4,1,1,'/03_GoMarket/trunk/site/themes/gomarket/img/bkg_line_np.jph','http://192.168.1.91/03_GoMarket/trunk/site/themes/gomarket/css/global.css','2013-06-24 11:39:34'),(5,1,1,'/03_GoMarket/trunk/site/themes/gomarket/img/bkg_line_np.jph','http://192.168.1.91/03_GoMarket/trunk/site/index.php','2013-06-24 11:40:32'),(6,1,1,'/03_GoMarket/trunk/site/themes/gomarket/img/bkg_line_np.jph','','2013-06-24 11:40:55'),(7,1,1,'/03_GoMarket/trunk/site/undefined','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_category=6&controller=category&id_lang=1','2013-06-26 15:39:41'),(8,1,1,'/03_GoMarket/trunk/site/modules/csmegamenu/csmegamenu.php&sortposition=1','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&configure=csmegamenu&token=170ec41a53361345c069e2508b2202e4','2013-06-27 14:34:04'),(9,1,1,'/03_GoMarket/trunk/site/modules/csmegamenu/csmegamenu.php&sortposition=1','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminModules&configure=csmegamenu&token=170ec41a53361345c069e2508b2202e4','2013-06-27 14:38:06'),(10,1,1,'/03_GoMarket/trunk/site/mode_header','http://192.168.1.91/03_GoMarket/trunk/site/index.php','2013-07-11 16:52:20'),(11,1,1,'/03_GoMarket/trunk/site/mode_header','http://192.168.1.91/03_GoMarket/trunk/site/index.php','2013-07-11 16:52:21'),(12,1,1,'/03_GoMarket/trunk/site/index.ph','','2013-07-22 10:03:36'),(13,1,1,'/03_GoMarket/trunk/site/index.ph','','2013-07-22 11:32:03'),(14,1,1,'/03_GoMarket/trunk/site/fr/','','2013-07-22 17:44:02'),(15,1,1,'/03_GoMarket/trunk/site/fr/','http://192.168.1.91/03_GoMarket/trunk/site/en/','2013-07-22 17:44:11'),(16,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/index.php','2013-07-22 17:44:35'),(17,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/fr/','2013-07-22 17:44:54'),(18,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/index.php','2013-07-22 17:44:57'),(19,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/en/','2013-07-22 17:48:51'),(20,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/en/','2013-07-22 17:49:12'),(21,1,1,'/03_GoMarket/trunk/site/en/my-account','http://192.168.1.91/03_GoMarket/trunk/site/en/','2013-07-23 09:08:35'),(22,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_product=18&controller=product&id_lang=1','2013-07-23 14:04:51'),(23,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_product=18&controller=product&id_lang=1','2013-07-23 14:05:05'),(24,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_product=18&controller=product&id_lang=1','2013-07-23 14:30:24'),(25,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/en/','2013-07-23 14:30:26'),(26,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/en/','2013-07-23 14:30:39'),(27,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_product=18&controller=product&id_lang=1','2013-07-23 16:34:36'),(28,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_product=18&controller=product&id_lang=1','2013-07-23 16:34:52'),(29,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_product=18&controller=product&id_lang=1','2013-07-23 16:35:58'),(30,1,1,'/03_GoMarket/trunk/site/en/','http://192.168.1.91/03_GoMarket/trunk/site/index.php?id_product=18&controller=product&id_lang=1','2013-07-23 16:37:48'),(31,1,1,'/03_GoMarket/trunk/site/blue/','http://192.168.1.91/03_GoMarket/trunk/site/demo.html','2013-07-29 11:41:49'),(32,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&id_shop_group=1','2013-07-29 14:15:55'),(33,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&id_shop=1&updateshop&token=ba54b993d806c56fd6d2cf18e90e5d71','2013-07-29 14:16:01'),(34,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&id_shop=1&updateshop&token=ba54b993d806c56fd6d2cf18e90e5d71','2013-07-29 14:16:07'),(35,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&id_shop_group=1','2013-07-29 14:16:14'),(36,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&id_shop=2&updateshop&token=ba54b993d806c56fd6d2cf18e90e5d71','2013-07-29 14:16:25'),(37,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9&id_shop=2','2013-07-29 14:16:34'),(38,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9&id_shop=1','2013-07-29 14:16:40'),(39,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&id_shop_url=1&updateshop_url&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9','2013-07-29 14:16:41'),(40,1,1,'/03_GoMarket/trunk/site/default/index.php?id_category=6&controller=category&id_lang=1','http://192.168.1.91/03_GoMarket/trunk/site/default/index.php','2013-07-29 14:19:35'),(41,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopGroup&token=c07eec3a7e57fc236553a592c6227113','2013-07-29 14:24:22'),(42,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9&id_shop=1','2013-07-29 14:24:27'),(43,1,1,'/03_GoMarket/trunk/site/default/index.php?id_category=6&controller=category&id_lang=1','http://192.168.1.91/03_GoMarket/trunk/site/default/index.php?id_category=6&controller=category&id_lang=1','2013-07-29 14:25:31'),(44,1,1,'/03_GoMarket/trunk/site/pink/','http://192.168.1.91/03_GoMarket/trunk/site/demo.html','2013-07-29 14:32:36'),(45,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&id_shop_url=1&updateshop_url&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9','2013-07-29 14:46:12'),(46,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&id_shop_group=1','2013-07-29 14:46:19'),(47,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&id_shop=1&updateshop&token=ba54b993d806c56fd6d2cf18e90e5d71','2013-07-29 14:46:27'),(48,1,1,'/03_GoMarket/trunk/site/default/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShopUrl&id_shop_url=1&updateshop_url&token=5bdaeaa78a4aa5feb999e8cb8e1b44f9','2013-07-29 14:46:49'),(49,1,1,'/03_GoMarket/trunk/site/orange/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&id_shop_group=1','2013-07-29 14:47:10'),(50,1,1,'/03_GoMarket/trunk/site/orange/index.php?controller=404','http://192.168.1.91/03_GoMarket/trunk/site/psadmin/index.php?controller=AdminShop&token=ba54b993d806c56fd6d2cf18e90e5d71&addshop&id_shop_group=1','2013-07-29 14:47:11');
/*!40000 ALTER TABLE `ps_pagenotfound` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product` WRITE;
/*!40000 ALTER TABLE `ps_product` DISABLE KEYS */;
INSERT INTO `ps_product` VALUES (8,0,8,8,1,6,0,0,'','',0.000000,0,1,590.000000,123.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:10:08','2013-07-24 21:35:48',0),(17,0,8,8,1,0,0,0,'','',0.000000,0,1,123.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:27:18','2013-06-28 01:03:26',0),(18,0,8,6,1,0,0,0,'','',0.000000,0,1,687.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,32,'2013-06-18 23:27:21','2013-06-28 00:42:59',0),(19,0,8,6,1,0,0,0,'','',0.000000,0,1,666.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:27:23','2013-06-28 00:47:59',0),(20,0,8,6,1,0,0,0,'','',0.000000,0,1,360.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:27:26','2013-06-18 23:44:39',0),(21,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,38,'2013-06-18 23:27:32','2013-06-18 23:33:47',0),(22,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:27:39','2013-06-18 23:34:26',0),(23,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:27:44','2013-06-18 23:34:51',0),(24,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:27:47','2013-06-18 23:36:15',0),(25,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:27:50','2013-06-18 23:36:21',0),(26,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:27:54','2013-06-18 23:30:18',0),(27,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:27:59','2013-06-28 03:34:16',0),(28,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:28:03','2013-06-18 23:29:59',0),(29,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,54,'2013-06-18 23:28:23','2013-06-18 23:30:01',0),(30,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:28:27','2013-06-18 23:38:14',0),(31,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:28:33','2013-06-18 23:38:21',0),(32,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:29:25','2013-06-28 04:43:10',0),(33,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:38:37','2013-06-18 23:39:16',0),(34,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:38:43','2013-06-18 23:39:19',0),(35,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:38:51','2013-06-28 04:44:00',0),(36,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:39:00','2013-06-18 23:39:26',0),(37,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-18 23:39:10','2013-06-18 23:39:31',0),(38,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-26 05:17:31','2013-06-26 05:18:59',0),(39,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-26 05:17:40','2013-06-26 05:17:59',0),(40,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-06-26 05:17:48','2013-06-26 05:17:55',0),(41,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-07-17 00:01:03','2013-07-17 00:01:34',0),(42,0,8,6,1,0,0,0,'','',0.000000,0,1,687.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-07-17 00:01:14','2013-07-17 00:01:33',0),(43,0,8,6,1,0,0,0,'','',0.000000,0,1,590.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,0,0,'2013-07-17 00:01:25','2013-07-17 00:01:32',0);
/*!40000 ALTER TABLE `ps_product` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_attachment` WRITE;
/*!40000 ALTER TABLE `ps_product_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_attachment` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_attribute` WRITE;
/*!40000 ALTER TABLE `ps_product_attribute` DISABLE KEYS */;
INSERT INTO `ps_product_attribute` VALUES (28,8,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(29,8,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(30,17,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(31,17,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(32,18,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(33,18,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(34,19,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(35,19,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(36,20,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(37,20,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(38,21,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(39,21,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(40,22,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(41,22,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(42,23,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(43,23,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(44,24,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(45,24,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(46,25,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(47,25,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(48,26,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(49,26,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(50,27,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(51,27,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(52,28,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(53,28,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(54,29,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(55,29,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(56,30,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(57,30,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(58,31,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(59,31,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(60,32,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(61,32,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(62,33,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(63,33,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(64,34,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(65,34,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(66,35,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(67,35,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(68,36,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(69,36,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(70,37,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(71,37,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(72,38,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(73,38,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(74,39,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(75,39,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(76,40,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(77,40,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(78,41,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(79,41,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(80,42,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(81,42,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00'),(82,43,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,1,1,'0000-00-00'),(83,43,'','','','','',0.000000,0.000000,0.000000,0,0.000000,0.00,0,1,'0000-00-00');
/*!40000 ALTER TABLE `ps_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_attribute_combination` WRITE;
/*!40000 ALTER TABLE `ps_product_attribute_combination` DISABLE KEYS */;
INSERT INTO `ps_product_attribute_combination` VALUES (3,28),(3,30),(3,32),(3,34),(3,36),(3,38),(3,40),(3,42),(3,44),(3,46),(3,48),(3,50),(3,52),(3,54),(3,56),(3,58),(3,60),(3,62),(3,64),(3,66),(3,68),(3,70),(3,72),(3,74),(3,76),(3,78),(3,80),(3,82),(9,28),(9,30),(9,32),(9,34),(9,36),(9,38),(9,40),(9,42),(9,44),(9,46),(9,48),(9,50),(9,52),(9,54),(9,56),(9,58),(9,60),(9,62),(9,64),(9,66),(9,68),(9,70),(9,72),(9,74),(9,76),(9,78),(9,80),(9,82),(11,28),(11,29),(11,30),(11,31),(11,32),(11,33),(11,34),(11,35),(11,36),(11,37),(11,38),(11,39),(11,40),(11,41),(11,42),(11,43),(11,44),(11,45),(11,46),(11,47),(11,48),(11,49),(11,50),(11,51),(11,52),(11,53),(11,54),(11,55),(11,56),(11,57),(11,58),(11,59),(11,60),(11,61),(11,62),(11,63),(11,64),(11,65),(11,66),(11,67),(11,68),(11,69),(11,70),(11,71),(11,72),(11,73),(11,74),(11,75),(11,76),(11,77),(11,78),(11,79),(11,80),(11,81),(11,82),(11,83),(13,29),(13,31),(13,33),(13,35),(13,37),(13,39),(13,41),(13,43),(13,45),(13,47),(13,49),(13,51),(13,53),(13,55),(13,57),(13,59),(13,61),(13,63),(13,65),(13,67),(13,69),(13,71),(13,73),(13,75),(13,77),(13,79),(13,81),(13,83),(14,29),(14,31),(14,33),(14,35),(14,37),(14,39),(14,41),(14,43),(14,45),(14,47),(14,49),(14,51),(14,53),(14,55),(14,57),(14,59),(14,61),(14,63),(14,65),(14,67),(14,69),(14,71),(14,73),(14,75),(14,77),(14,79),(14,81),(14,83);
/*!40000 ALTER TABLE `ps_product_attribute_combination` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_attribute_image` WRITE;
/*!40000 ALTER TABLE `ps_product_attribute_image` DISABLE KEYS */;
INSERT INTO `ps_product_attribute_image` VALUES (5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(28,27),(28,28),(28,29),(29,30),(29,31),(30,69),(30,70),(30,71),(31,72),(31,73),(32,76),(32,77),(33,80),(34,83),(34,84),(34,85),(35,86),(35,87),(36,90),(36,91),(36,92),(37,93),(37,94),(38,97),(38,98),(38,99),(39,100),(39,101),(80,221),(80,222),(81,223);
/*!40000 ALTER TABLE `ps_product_attribute_image` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_attribute_shop` WRITE;
/*!40000 ALTER TABLE `ps_product_attribute_shop` DISABLE KEYS */;
INSERT INTO `ps_product_attribute_shop` VALUES (28,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(28,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(28,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(28,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(28,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(29,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(29,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(29,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(29,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(29,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(30,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(30,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(30,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(30,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(30,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(31,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(31,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(31,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(31,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(31,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(32,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(32,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(32,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(32,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(32,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(33,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(33,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(33,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(33,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(33,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(34,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(34,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(34,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(34,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(34,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(35,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(35,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(35,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(35,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(35,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(36,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(36,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(36,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(36,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(36,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(37,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(37,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(37,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(37,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(37,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(38,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(38,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(38,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(38,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(38,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(39,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(39,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(39,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(39,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(39,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(40,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(40,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(40,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(40,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(40,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(41,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(41,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(41,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(41,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(41,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(42,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(42,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(42,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(42,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(42,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(43,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(43,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(43,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(43,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(43,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(44,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(44,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(44,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(44,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(44,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(45,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(45,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(45,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(45,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(45,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(46,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(46,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(46,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(46,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(46,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(47,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(47,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(47,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(47,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(47,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(48,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(48,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(48,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(48,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(48,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(49,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(49,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(49,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(49,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(49,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(50,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(50,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(50,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(50,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(50,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(51,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(51,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(51,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(51,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(51,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(52,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(52,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(52,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(52,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(52,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(53,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(53,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(53,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(53,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(53,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(54,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(54,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(54,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(54,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(54,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(55,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(55,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(55,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(55,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(55,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(56,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(56,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(56,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(56,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(56,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(57,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(57,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(57,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(57,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(57,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(58,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(58,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(58,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(58,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(58,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(59,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(59,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(59,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(59,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(59,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(60,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(60,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(60,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(60,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(60,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(61,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(61,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(61,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(61,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(61,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(62,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(62,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(62,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(62,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(62,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(63,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(63,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(63,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(63,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(63,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(64,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(64,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(64,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(64,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(64,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(65,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(65,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(65,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(65,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(65,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(66,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(66,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(66,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(66,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(66,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(67,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(67,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(67,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(67,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(67,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(68,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(68,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(68,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(68,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(68,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(69,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(69,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(69,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(69,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(69,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(70,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(70,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(70,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(70,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(70,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(71,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(71,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(71,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(71,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(71,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(72,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(72,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(72,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(72,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(72,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(73,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(73,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(73,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(73,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(73,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(74,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(74,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(74,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(74,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(74,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(75,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(75,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(75,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(75,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(75,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(76,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(76,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(76,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(76,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(76,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(77,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(77,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(77,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(77,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(77,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(78,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(78,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(78,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(78,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(78,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(79,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(79,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(79,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(79,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(79,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(80,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(80,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(80,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(80,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(80,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(81,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(81,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(81,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(81,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(81,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(82,1,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(82,2,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(82,3,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(82,4,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(82,5,0.000000,0.000000,0.000000,0.000000,0.00,1,1,'0000-00-00'),(83,1,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(83,2,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(83,3,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(83,4,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00'),(83,5,0.000000,0.000000,0.000000,0.000000,0.00,0,1,'0000-00-00');
/*!40000 ALTER TABLE `ps_product_attribute_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_carrier` WRITE;
/*!40000 ALTER TABLE `ps_product_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_carrier` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_comment` WRITE;
/*!40000 ALTER TABLE `ps_product_comment` DISABLE KEYS */;
INSERT INTO `ps_product_comment` VALUES (1,18,0,29,'anh','nguyen','fasdfasdf',3,0,0,'2013-07-08 06:09:11'),(2,20,3,0,'sdfdsf','sdfdsfds','Duyen Nguyen',3,0,0,'2013-07-12 02:51:40'),(3,8,0,69,'gdsagadf','gad','gadsgadg',3,0,0,'2013-07-22 22:34:24'),(4,25,0,49,'fhjfifnfnfn','fhhfjfmfm','hftnjgngng',3,0,0,'2013-07-22 22:37:58'),(5,18,0,70,'rgg','ffhb','gfsd',3,0,0,'2013-07-22 22:41:17'),(6,18,0,70,'rgg','ffhbfss','gfsdsdc',3,0,0,'2013-07-22 22:42:15'),(7,19,0,56,'fdsfds','fdfdsfds','fdsfds',3,0,0,'2013-07-23 22:51:18');
/*!40000 ALTER TABLE `ps_product_comment` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_comment_criterion` WRITE;
/*!40000 ALTER TABLE `ps_product_comment_criterion` DISABLE KEYS */;
INSERT INTO `ps_product_comment_criterion` VALUES (1,1,1);
/*!40000 ALTER TABLE `ps_product_comment_criterion` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_comment_criterion_category` WRITE;
/*!40000 ALTER TABLE `ps_product_comment_criterion_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_comment_criterion_category` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_comment_criterion_lang` WRITE;
/*!40000 ALTER TABLE `ps_product_comment_criterion_lang` DISABLE KEYS */;
INSERT INTO `ps_product_comment_criterion_lang` VALUES (1,1,'Quality'),(1,2,'Quality');
/*!40000 ALTER TABLE `ps_product_comment_criterion_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_comment_criterion_product` WRITE;
/*!40000 ALTER TABLE `ps_product_comment_criterion_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_comment_criterion_product` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_comment_grade` WRITE;
/*!40000 ALTER TABLE `ps_product_comment_grade` DISABLE KEYS */;
INSERT INTO `ps_product_comment_grade` VALUES (1,1,3),(2,1,3),(3,1,3),(4,1,3),(5,1,3),(6,1,3),(7,1,3);
/*!40000 ALTER TABLE `ps_product_comment_grade` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_comment_report` WRITE;
/*!40000 ALTER TABLE `ps_product_comment_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_comment_report` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_comment_usefulness` WRITE;
/*!40000 ALTER TABLE `ps_product_comment_usefulness` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_comment_usefulness` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_country_tax` WRITE;
/*!40000 ALTER TABLE `ps_product_country_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_country_tax` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_download` WRITE;
/*!40000 ALTER TABLE `ps_product_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_download` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_group_reduction_cache` WRITE;
/*!40000 ALTER TABLE `ps_product_group_reduction_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_group_reduction_cache` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_lang` WRITE;
/*!40000 ALTER TABLE `ps_product_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_sale` WRITE;
/*!40000 ALTER TABLE `ps_product_sale` DISABLE KEYS */;
INSERT INTO `ps_product_sale` VALUES (17,1,1,'2013-06-19'),(18,1,1,'2013-06-19'),(19,1,1,'2013-06-19'),(20,1,1,'2013-06-19'),(21,1,1,'2013-06-19'),(22,1,1,'2013-06-19'),(24,1,1,'2013-06-19'),(25,1,1,'2013-06-19');
/*!40000 ALTER TABLE `ps_product_sale` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_shop` WRITE;
/*!40000 ALTER TABLE `ps_product_shop` DISABLE KEYS */;
INSERT INTO `ps_product_shop` VALUES (8,1,8,6,0,0,0.000000,1,590.000000,123.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:10:08','2013-07-24 21:35:48'),(8,2,8,6,0,0,0.000000,1,590.000000,123.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:10:08','2013-07-24 21:35:48'),(8,3,8,6,0,0,0.000000,1,590.000000,123.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:10:08','2013-07-24 21:35:48'),(8,4,8,6,0,0,0.000000,1,590.000000,123.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:10:08','2013-07-24 21:35:48'),(8,5,8,6,0,0,0.000000,1,590.000000,123.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:10:08','2013-07-24 21:35:48'),(17,1,8,0,0,0,0.000000,1,123.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:18','2013-06-28 01:03:26'),(17,2,8,0,0,0,0.000000,1,123.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:18','2013-06-28 01:03:26'),(17,3,8,0,0,0,0.000000,1,123.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:18','2013-06-28 01:03:26'),(17,4,8,0,0,0,0.000000,1,123.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:18','2013-06-28 01:03:26'),(17,5,8,0,0,0,0.000000,1,123.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:18','2013-06-28 01:03:26'),(18,1,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',32,0,'2013-06-18 23:27:21','2013-06-28 00:42:59'),(18,2,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',32,0,'2013-06-18 23:27:21','2013-06-28 00:42:59'),(18,3,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',32,0,'2013-06-18 23:27:21','2013-06-28 00:42:59'),(18,4,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',32,0,'2013-06-18 23:27:21','2013-06-28 00:42:59'),(18,5,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',32,0,'2013-06-18 23:27:21','2013-06-28 00:42:59'),(19,1,6,0,0,0,0.000000,1,666.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:23','2013-06-28 00:47:59'),(19,2,6,0,0,0,0.000000,1,666.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:23','2013-06-28 00:47:59'),(19,3,6,0,0,0,0.000000,1,666.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:23','2013-06-28 00:47:59'),(19,4,6,0,0,0,0.000000,1,666.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:23','2013-06-28 00:47:59'),(19,5,6,0,0,0,0.000000,1,666.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:23','2013-06-28 00:47:59'),(20,1,6,0,0,0,0.000000,1,360.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:26','2013-06-18 23:44:39'),(20,2,6,0,0,0,0.000000,1,360.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:26','2013-06-18 23:44:39'),(20,3,6,0,0,0,0.000000,1,360.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:26','2013-06-18 23:44:39'),(20,4,6,0,0,0,0.000000,1,360.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:26','2013-06-18 23:44:39'),(20,5,6,0,0,0,0.000000,1,360.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:26','2013-06-18 23:44:39'),(21,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',38,0,'2013-06-18 23:27:32','2013-06-18 23:33:47'),(21,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',38,0,'2013-06-18 23:27:32','2013-06-18 23:33:47'),(21,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',38,0,'2013-06-18 23:27:32','2013-06-18 23:33:47'),(21,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',38,0,'2013-06-18 23:27:32','2013-06-18 23:33:47'),(21,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',38,0,'2013-06-18 23:27:32','2013-06-18 23:33:47'),(22,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:39','2013-06-18 23:34:26'),(22,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:39','2013-06-18 23:34:26'),(22,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:39','2013-06-18 23:34:26'),(22,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:39','2013-06-18 23:34:26'),(22,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:39','2013-06-18 23:34:26'),(23,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:44','2013-06-18 23:34:51'),(23,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:44','2013-06-18 23:34:51'),(23,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:44','2013-06-18 23:34:51'),(23,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:44','2013-06-18 23:34:51'),(23,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:44','2013-06-18 23:34:51'),(24,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:47','2013-06-18 23:36:15'),(24,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:47','2013-06-18 23:36:15'),(24,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:47','2013-06-18 23:36:15'),(24,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:47','2013-06-18 23:36:15'),(24,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:47','2013-06-18 23:36:15'),(25,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:50','2013-06-18 23:36:21'),(25,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:50','2013-06-18 23:36:21'),(25,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:50','2013-06-18 23:36:21'),(25,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:50','2013-06-18 23:36:21'),(25,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:50','2013-06-18 23:36:21'),(26,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:54','2013-06-18 23:30:18'),(26,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:54','2013-06-18 23:30:18'),(26,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:54','2013-06-18 23:30:18'),(26,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:54','2013-06-18 23:30:18'),(26,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:54','2013-06-18 23:30:18'),(27,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:59','2013-06-28 03:34:16'),(27,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:59','2013-06-28 03:34:16'),(27,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:59','2013-06-28 03:34:16'),(27,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:59','2013-06-28 03:34:16'),(27,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:27:59','2013-06-28 03:34:16'),(28,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:03','2013-06-18 23:29:59'),(28,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:03','2013-06-18 23:29:59'),(28,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:03','2013-06-18 23:29:59'),(28,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:03','2013-06-18 23:29:59'),(28,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:03','2013-06-18 23:29:59'),(29,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',54,0,'2013-06-18 23:28:23','2013-06-18 23:30:01'),(29,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',54,0,'2013-06-18 23:28:23','2013-06-18 23:30:01'),(29,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',54,0,'2013-06-18 23:28:23','2013-06-18 23:30:01'),(29,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',54,0,'2013-06-18 23:28:23','2013-06-18 23:30:01'),(29,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',54,0,'2013-06-18 23:28:23','2013-06-18 23:30:01'),(30,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:27','2013-06-18 23:38:14'),(30,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:27','2013-06-18 23:38:14'),(30,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:27','2013-06-18 23:38:14'),(30,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:27','2013-06-18 23:38:14'),(30,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:27','2013-06-18 23:38:14'),(31,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:33','2013-06-18 23:38:21'),(31,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:33','2013-06-18 23:38:21'),(31,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:33','2013-06-18 23:38:21'),(31,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:33','2013-06-18 23:38:21'),(31,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:28:33','2013-06-18 23:38:21'),(32,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:29:25','2013-06-28 04:43:10'),(32,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:29:25','2013-06-28 04:43:10'),(32,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:29:25','2013-06-28 04:43:10'),(32,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:29:25','2013-06-28 04:43:10'),(32,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:29:25','2013-06-28 04:43:10'),(33,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:37','2013-06-18 23:39:16'),(33,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:37','2013-06-18 23:39:16'),(33,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:37','2013-06-18 23:39:16'),(33,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:37','2013-06-18 23:39:16'),(33,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:37','2013-06-18 23:39:16'),(34,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:43','2013-06-18 23:39:19'),(34,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:43','2013-06-18 23:39:19'),(34,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:43','2013-06-18 23:39:19'),(34,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:43','2013-06-18 23:39:19'),(34,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:43','2013-06-18 23:39:19'),(35,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:51','2013-06-28 04:44:00'),(35,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:51','2013-06-28 04:44:00'),(35,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:51','2013-06-28 04:44:00'),(35,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:51','2013-06-28 04:44:00'),(35,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:38:51','2013-06-28 04:44:00'),(36,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:00','2013-06-18 23:39:26'),(36,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:00','2013-06-18 23:39:26'),(36,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:00','2013-06-18 23:39:26'),(36,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:00','2013-06-18 23:39:26'),(36,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:00','2013-06-18 23:39:26'),(37,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:10','2013-06-18 23:39:31'),(37,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:10','2013-06-18 23:39:31'),(37,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:10','2013-06-18 23:39:31'),(37,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:10','2013-06-18 23:39:31'),(37,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-18 23:39:10','2013-06-18 23:39:31'),(38,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:31','2013-06-26 05:18:59'),(38,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:31','2013-06-26 05:18:59'),(38,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:31','2013-06-26 05:18:59'),(38,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:31','2013-06-26 05:18:59'),(38,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:31','2013-06-26 05:18:59'),(39,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:40','2013-06-26 05:17:59'),(39,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:40','2013-06-26 05:17:59'),(39,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:40','2013-06-26 05:17:59'),(39,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:40','2013-06-26 05:17:59'),(39,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:40','2013-06-26 05:17:59'),(40,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:48','2013-06-26 05:17:55'),(40,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:48','2013-06-26 05:17:55'),(40,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:48','2013-06-26 05:17:55'),(40,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:48','2013-06-26 05:17:55'),(40,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-06-26 05:17:48','2013-06-26 05:17:55'),(41,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:03','2013-07-17 00:01:34'),(41,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:03','2013-07-17 00:01:34'),(41,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:03','2013-07-17 00:01:34'),(41,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:03','2013-07-17 00:01:34'),(41,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:03','2013-07-17 00:01:34'),(42,1,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:14','2013-07-17 00:01:33'),(42,2,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:14','2013-07-17 00:01:33'),(42,3,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:14','2013-07-17 00:01:33'),(42,4,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:14','2013-07-17 00:01:33'),(42,5,6,0,0,0,0.000000,1,687.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:14','2013-07-17 00:01:33'),(43,1,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:25','2013-07-17 00:01:32'),(43,2,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:25','2013-07-17 00:01:32'),(43,3,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:25','2013-07-17 00:01:32'),(43,4,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:25','2013-07-17 00:01:32'),(43,5,6,0,0,0,0.000000,1,590.000000,0.000000,'',0.000000,0.00,0,0,0,1,'',0,1,'0000-00-00','new',1,1,'both',0,0,'2013-07-17 00:01:25','2013-07-17 00:01:32');
/*!40000 ALTER TABLE `ps_product_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_supplier` WRITE;
/*!40000 ALTER TABLE `ps_product_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_product_tag` WRITE;
/*!40000 ALTER TABLE `ps_product_tag` DISABLE KEYS */;
INSERT INTO `ps_product_tag` VALUES (8,7),(8,8),(8,9),(8,10),(8,11),(8,12),(8,13),(8,14),(8,15),(8,16),(17,7),(17,8),(17,9),(17,10),(17,11),(17,12),(17,13),(17,14),(17,15),(17,16),(18,7),(18,8),(18,9),(18,10),(18,11),(18,12),(18,13),(18,14),(18,15),(18,16),(19,7),(19,8),(19,9),(19,10),(19,11),(19,12),(19,13),(19,14),(19,15),(19,16),(20,7),(20,8),(20,9),(20,10),(20,11),(20,12),(20,13),(20,14),(20,15),(20,16),(21,7),(21,8),(21,9),(21,10),(21,11),(21,12),(21,13),(21,14),(21,15),(21,16),(22,7),(22,8),(22,9),(22,10),(22,11),(22,12),(22,13),(22,14),(22,15),(22,16),(23,7),(23,8),(23,9),(23,10),(23,11),(23,12),(23,13),(23,14),(23,15),(23,16),(24,7),(24,8),(24,9),(24,10),(24,11),(24,12),(24,13),(24,14),(24,15),(24,16),(25,7),(25,8),(25,9),(25,10),(25,11),(25,12),(25,13),(25,14),(25,15),(25,16),(26,7),(26,8),(26,9),(26,10),(26,11),(26,12),(26,13),(26,14),(26,15),(26,16),(27,7),(27,8),(27,9),(27,10),(27,11),(27,12),(27,13),(27,14),(27,15),(27,16),(28,7),(28,8),(28,9),(28,10),(28,11),(28,12),(28,13),(28,14),(28,15),(28,16),(29,7),(29,8),(29,9),(29,10),(29,11),(29,12),(29,13),(29,14),(29,15),(29,16),(30,7),(30,8),(30,9),(30,10),(30,11),(30,12),(30,13),(30,14),(30,15),(30,16),(31,7),(31,8),(31,9),(31,10),(31,11),(31,12),(31,13),(31,14),(31,15),(31,16),(32,7),(32,8),(32,9),(32,10),(32,11),(32,12),(32,13),(32,14),(32,15),(32,16),(33,7),(33,8),(33,9),(33,10),(33,11),(33,12),(33,13),(33,14),(33,15),(33,16),(34,7),(34,8),(34,9),(34,10),(34,11),(34,12),(34,13),(34,14),(34,15),(34,16),(35,7),(35,8),(35,9),(35,10),(35,11),(35,12),(35,13),(35,14),(35,15),(35,16),(36,7),(36,8),(36,9),(36,10),(36,11),(36,12),(36,13),(36,14),(36,15),(36,16),(37,7),(37,8),(37,9),(37,10),(37,11),(37,12),(37,13),(37,14),(37,15),(37,16),(38,7),(38,8),(38,9),(38,10),(38,11),(38,12),(38,13),(38,14),(38,15),(38,16),(39,7),(39,8),(39,9),(39,10),(39,11),(39,12),(39,13),(39,14),(39,15),(39,16),(40,7),(40,8),(40,9),(40,10),(40,11),(40,12),(40,13),(40,14),(40,15),(40,16),(41,7),(41,8),(41,9),(41,10),(41,11),(41,12),(41,13),(41,14),(41,15),(41,16),(42,7),(42,8),(42,9),(42,10),(42,11),(42,12),(42,13),(42,14),(42,15),(42,16),(43,7),(43,8),(43,9),(43,10),(43,11),(43,12),(43,13),(43,14),(43,15),(43,16);
/*!40000 ALTER TABLE `ps_product_tag` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_profile` WRITE;
/*!40000 ALTER TABLE `ps_profile` DISABLE KEYS */;
INSERT INTO `ps_profile` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `ps_profile` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_profile_lang` WRITE;
/*!40000 ALTER TABLE `ps_profile_lang` DISABLE KEYS */;
INSERT INTO `ps_profile_lang` VALUES (1,1,'SuperAdmin'),(2,1,'SuperAdmin'),(1,2,'Administrator'),(2,2,'Administrator'),(1,3,'Logistician'),(2,3,'Logistician'),(1,4,'Translator'),(2,4,'Translator'),(1,5,'Salesman'),(2,5,'Salesman');
/*!40000 ALTER TABLE `ps_profile_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_quick_access` WRITE;
/*!40000 ALTER TABLE `ps_quick_access` DISABLE KEYS */;
INSERT INTO `ps_quick_access` VALUES (1,0,'index.php'),(2,1,'../'),(3,0,'index.php?controller=AdminCategories&addcategory'),(4,0,'index.php?controller=AdminProducts&addproduct'),(5,0,'index.php?controller=AdminCartRules&addcart_rule');
/*!40000 ALTER TABLE `ps_quick_access` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_quick_access_lang` WRITE;
/*!40000 ALTER TABLE `ps_quick_access_lang` DISABLE KEYS */;
INSERT INTO `ps_quick_access_lang` VALUES (1,1,'Home'),(1,2,'Home'),(2,1,'My Shop'),(2,2,'My Shop'),(3,1,'New category'),(3,2,'New category'),(4,1,'New product'),(4,2,'New product'),(5,1,'New voucher'),(5,2,'New voucher');
/*!40000 ALTER TABLE `ps_quick_access_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_range_price` WRITE;
/*!40000 ALTER TABLE `ps_range_price` DISABLE KEYS */;
INSERT INTO `ps_range_price` VALUES (1,2,0.000000,10000.000000);
/*!40000 ALTER TABLE `ps_range_price` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_range_weight` WRITE;
/*!40000 ALTER TABLE `ps_range_weight` DISABLE KEYS */;
INSERT INTO `ps_range_weight` VALUES (1,2,0.000000,10000.000000);
/*!40000 ALTER TABLE `ps_range_weight` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_referrer` WRITE;
/*!40000 ALTER TABLE `ps_referrer` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_referrer` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_referrer_cache` WRITE;
/*!40000 ALTER TABLE `ps_referrer_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_referrer_cache` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_referrer_shop` WRITE;
/*!40000 ALTER TABLE `ps_referrer_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_referrer_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_request_sql` WRITE;
/*!40000 ALTER TABLE `ps_request_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_request_sql` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_required_field` WRITE;
/*!40000 ALTER TABLE `ps_required_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_required_field` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_risk` WRITE;
/*!40000 ALTER TABLE `ps_risk` DISABLE KEYS */;
INSERT INTO `ps_risk` VALUES (1,0,'LimeGreen'),(2,35,'DarkOrange'),(3,75,'Crimson'),(4,100,'#ec2e15');
/*!40000 ALTER TABLE `ps_risk` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_risk_lang` WRITE;
/*!40000 ALTER TABLE `ps_risk_lang` DISABLE KEYS */;
INSERT INTO `ps_risk_lang` VALUES (1,1,'None'),(1,2,'None'),(2,1,'Low'),(2,2,'Low'),(3,1,'Medium'),(3,2,'Medium'),(4,1,'High'),(4,2,'High');
/*!40000 ALTER TABLE `ps_risk_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_scene` WRITE;
/*!40000 ALTER TABLE `ps_scene` DISABLE KEYS */;
INSERT INTO `ps_scene` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `ps_scene` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_scene_category` WRITE;
/*!40000 ALTER TABLE `ps_scene_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_scene_category` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_scene_lang` WRITE;
/*!40000 ALTER TABLE `ps_scene_lang` DISABLE KEYS */;
INSERT INTO `ps_scene_lang` VALUES (1,1,'The iPods Nano'),(1,2,'The iPods Nano'),(2,1,'The iPods'),(2,2,'The iPods'),(3,1,'The MacBooks'),(3,2,'The MacBooks');
/*!40000 ALTER TABLE `ps_scene_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_scene_products` WRITE;
/*!40000 ALTER TABLE `ps_scene_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_scene_products` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_scene_shop` WRITE;
/*!40000 ALTER TABLE `ps_scene_shop` DISABLE KEYS */;
INSERT INTO `ps_scene_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5);
/*!40000 ALTER TABLE `ps_scene_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_search_engine` WRITE;
/*!40000 ALTER TABLE `ps_search_engine` DISABLE KEYS */;
INSERT INTO `ps_search_engine` VALUES (1,'google','q'),(2,'aol','q'),(3,'yandex','text'),(4,'ask.com','q'),(5,'nhl.com','q'),(6,'yahoo','p'),(7,'baidu','wd'),(8,'lycos','query'),(9,'exalead','q'),(10,'search.live','q'),(11,'voila','rdata'),(12,'altavista','q'),(13,'bing','q'),(14,'daum','q'),(15,'eniro','search_word'),(16,'naver','query'),(17,'msn','q'),(18,'netscape','query'),(19,'cnn','query'),(20,'about','terms'),(21,'mamma','query'),(22,'alltheweb','q'),(23,'virgilio','qs'),(24,'alice','qs'),(25,'najdi','q'),(26,'mama','query'),(27,'seznam','q'),(28,'onet','qt'),(29,'szukacz','q'),(30,'yam','k'),(31,'pchome','q'),(32,'kvasir','q'),(33,'sesam','q'),(34,'ozu','q'),(35,'terra','query'),(36,'mynet','q'),(37,'ekolay','q'),(38,'rambler','words');
/*!40000 ALTER TABLE `ps_search_engine` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_search_index` WRITE;
/*!40000 ALTER TABLE `ps_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_search_index` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_search_word` WRITE;
/*!40000 ALTER TABLE `ps_search_word` DISABLE KEYS */;
INSERT INTO `ps_search_word` VALUES (1,1,1,'aenean'),(2,1,1,'fringilla'),(3,1,1,'venenatis'),(4,1,1,'nulla'),(5,1,1,'non'),(6,1,1,'auctor'),(7,1,1,'maecenas'),(8,1,1,'ullamcorper'),(9,1,1,'ipsum'),(10,1,1,'tempor'),(11,1,1,'ultricies'),(12,1,1,'semper'),(13,1,1,'metus'),(14,1,1,'elementum'),(15,1,1,'est'),(16,1,1,'mollis'),(17,1,1,'egestas'),(18,1,1,'quam'),(19,1,1,'vestibulum'),(20,1,1,'proin'),(21,1,1,'consectetur'),(22,1,1,'placerat'),(23,1,1,'turpis'),(24,1,1,'quis'),(25,1,1,'consequat'),(26,1,1,'sem'),(27,1,1,'pulvinar'),(28,1,1,'arcust'),(29,1,1,'euismod'),(30,1,1,'vel'),(31,1,1,'dictum'),(32,1,1,'eget'),(33,1,1,'laoreet'),(34,1,1,'sed'),(35,1,1,'mattis'),(36,1,1,'sit'),(37,1,1,'amet'),(38,1,1,'facilisis'),(39,1,1,'praesent'),(40,1,1,'faucibus'),(41,1,1,'magna'),(42,1,1,'uttter'),(43,1,1,'sodales'),(44,1,1,'massa'),(45,1,1,'convallis'),(46,1,1,'nibh'),(47,1,1,'diam'),(48,1,1,'neque'),(49,1,1,'augue'),(50,1,1,'nullam'),(51,1,1,'tellus'),(52,1,1,'nec'),(53,1,1,'lectus'),(54,1,1,'pellentesque'),(55,1,1,'malesuada'),(56,1,1,'dapibus'),(57,1,1,'cursus'),(58,1,1,'erat'),(59,1,1,'condimentum'),(60,1,1,'ultrices'),(61,1,1,'dui'),(62,1,1,'ligula'),(63,1,1,'scelerisque'),(64,1,1,'quisque'),(65,1,1,'odio'),(66,1,1,'lorem'),(67,1,1,'posuere'),(68,1,1,'sapien'),(69,1,1,'velit'),(70,1,1,'sagittis'),(71,1,1,'tincidunt'),(72,1,1,'pretium'),(73,1,1,'nisl'),(74,1,1,'suspendisse'),(75,1,1,'lacinia'),(76,1,1,'urna'),(77,1,1,'2nd'),(78,1,1,'generation'),(79,1,1,'intel'),(80,1,1,'core'),(81,1,1,'processorgenuin'),(82,1,1,'windows'),(83,1,1,'home'),(84,1,1,'premium'),(85,1,1,'64bit'),(86,1,1,'seriespremium'),(87,1,1,'black416'),(88,1,1,'164'),(89,1,1,'1920x1080640'),(90,1,1,'8gb'),(91,1,1,'memory'),(92,1,1,'ios'),(93,1,1,'notifications'),(94,1,1,'concept'),(95,1,1,'from'),(96,1,1,'andreas'),(97,1,1,'vimeo'),(98,1,1,'mobile'),(99,1,1,'accessories'),(100,1,1,'new'),(101,1,1,'htc'),(102,1,1,'aucibus'),(103,1,1,'curae'),(104,1,1,'ante'),(105,1,1,'cubilia'),(106,1,1,'luctus'),(107,1,1,'eros'),(108,1,1,'primis'),(109,1,1,'orci'),(110,1,1,'sollicitudin'),(111,1,1,'metal'),(112,1,1,'80gb'),(113,1,1,'parallel'),(114,1,1,'ata'),(115,1,1,'drive'),(116,1,1,'4200'),(117,1,1,'rpm'),(118,1,1,'180ghz'),(119,1,1,'duo'),(120,1,1,'160gb'),(121,1,1,'40000'),(122,1,1,'songs'),(123,1,1,'black'),(124,1,1,'medium'),(125,1,1,'etiam'),(126,1,1,'tortor'),(127,1,1,'nisi'),(128,1,1,'dignissim'),(129,1,1,'mauris'),(130,1,1,'tempus'),(131,1,1,'enim'),(132,1,1,'aliquam'),(133,1,1,'interdum'),(134,1,1,'llcus'),(135,1,1,'jack'),(136,1,1,'stereo'),(137,1,2,'aenean'),(138,1,2,'fringilla'),(139,1,2,'venenatis'),(140,1,2,'nulla'),(141,1,2,'non'),(142,1,2,'auctor'),(143,1,2,'quis'),(144,1,2,'tortor'),(145,1,2,'vel'),(146,1,2,'augue'),(147,1,2,'ultricies'),(148,1,2,'luctus'),(149,1,2,'sed'),(150,1,2,'ullamcorper'),(151,1,2,'mattis'),(152,1,2,'metus'),(153,1,2,'sit'),(154,1,2,'amet'),(155,1,2,'facilisis'),(156,1,2,'praesent'),(157,1,2,'faucibus'),(158,1,2,'magna'),(159,1,2,'uttter'),(160,1,2,'sodales'),(161,1,2,'consectetur'),(162,1,2,'sem'),(163,1,2,'massa'),(164,1,2,'convallis'),(165,1,2,'nibh'),(166,1,2,'elementum'),(167,1,2,'diam'),(168,1,2,'neque'),(169,1,2,'nullam'),(170,1,2,'tellus'),(171,1,2,'nec'),(172,1,2,'lectus'),(173,1,2,'consequat'),(174,1,2,'pellentesque'),(175,1,2,'malesuada'),(176,1,2,'dapibus'),(177,1,2,'cursus'),(178,1,2,'vestibulum'),(179,1,2,'erat'),(180,1,2,'condimentum'),(181,1,2,'ultrices'),(182,1,2,'eget'),(183,1,2,'dui'),(184,1,2,'ligula'),(185,1,2,'tempor'),(186,1,2,'scelerisque'),(187,1,2,'quisque'),(188,1,2,'odio'),(189,1,2,'lorem'),(190,1,2,'egestas'),(191,1,2,'posuere'),(192,1,2,'sapien'),(193,1,2,'velit'),(194,1,2,'sagittis'),(195,1,2,'tincidunt'),(196,1,2,'pretium'),(197,1,2,'nisl'),(198,1,2,'suspendisse'),(199,1,2,'lacinia'),(200,1,2,'urna'),(201,1,2,'2nd'),(202,1,2,'generation'),(203,1,2,'intel'),(204,1,2,'core'),(205,1,2,'processorgenuin'),(206,1,2,'windows'),(207,1,2,'home'),(208,1,2,'premium'),(209,1,2,'64bit'),(210,1,2,'seriespremium'),(211,1,2,'black416'),(212,1,2,'164'),(213,1,2,'1920x1080640'),(214,1,2,'8gb'),(215,1,2,'memory'),(216,1,2,'ios'),(217,1,2,'notifications'),(218,1,2,'concept'),(219,1,2,'from'),(220,1,2,'andreas'),(221,1,2,'vimeo'),(222,1,2,'mobile'),(223,1,2,'accessories'),(224,1,2,'new'),(225,1,2,'htc'),(226,1,2,'metal'),(227,1,2,'80gb'),(228,1,2,'parallel'),(229,1,2,'ata'),(230,1,2,'drive'),(231,1,2,'4200'),(232,1,2,'rpm'),(233,1,2,'180ghz'),(234,1,2,'duo'),(235,1,2,'160gb'),(236,1,2,'40000'),(237,1,2,'songs'),(238,1,2,'black'),(239,1,2,'medium'),(240,1,2,'etiam'),(241,1,2,'nisi'),(242,1,2,'dignissim'),(243,1,2,'mauris'),(244,1,2,'tempus'),(245,1,2,'enim'),(246,1,2,'aliquam'),(247,1,2,'interdum'),(248,1,2,'llcus'),(249,1,2,'turpis'),(250,1,2,'jack'),(251,1,2,'stereo'),(252,2,1,'aenean'),(253,2,1,'fringilla'),(254,2,1,'venenatis'),(255,2,1,'nulla'),(256,2,1,'non'),(257,2,1,'auctor'),(258,2,1,'maecenas'),(259,2,1,'ullamcorper'),(260,2,1,'ipsum'),(261,2,1,'tempor'),(262,2,1,'ultricies'),(263,2,1,'semper'),(264,2,1,'metus'),(265,2,1,'elementum'),(266,2,1,'est'),(267,2,1,'mollis'),(268,2,1,'egestas'),(269,2,1,'quam'),(270,2,1,'vestibulum'),(271,2,1,'proin'),(272,2,1,'consectetur'),(273,2,1,'placerat'),(274,2,1,'turpis'),(275,2,1,'quis'),(276,2,1,'consequat'),(277,2,1,'sem'),(278,2,1,'pulvinar'),(279,2,1,'arcust'),(280,2,1,'euismod'),(281,2,1,'vel'),(282,2,1,'dictum'),(283,2,1,'eget'),(284,2,1,'laoreet'),(285,2,1,'sed'),(286,2,1,'mattis'),(287,2,1,'sit'),(288,2,1,'amet'),(289,2,1,'facilisis'),(290,2,1,'praesent'),(291,2,1,'faucibus'),(292,2,1,'magna'),(293,2,1,'uttter'),(294,2,1,'sodales'),(295,2,1,'massa'),(296,2,1,'convallis'),(297,2,1,'nibh'),(298,2,1,'diam'),(299,2,1,'neque'),(300,2,1,'augue'),(301,2,1,'nullam'),(302,2,1,'tellus'),(303,2,1,'nec'),(304,2,1,'lectus'),(305,2,1,'pellentesque'),(306,2,1,'malesuada'),(307,2,1,'dapibus'),(308,2,1,'cursus'),(309,2,1,'erat'),(310,2,1,'condimentum'),(311,2,1,'ultrices'),(312,2,1,'dui'),(313,2,1,'ligula'),(314,2,1,'scelerisque'),(315,2,1,'quisque'),(316,2,1,'odio'),(317,2,1,'lorem'),(318,2,1,'posuere'),(319,2,1,'sapien'),(320,2,1,'velit'),(321,2,1,'sagittis'),(322,2,1,'tincidunt'),(323,2,1,'pretium'),(324,2,1,'nisl'),(325,2,1,'suspendisse'),(326,2,1,'lacinia'),(327,2,1,'urna'),(328,2,1,'2nd'),(329,2,1,'generation'),(330,2,1,'intel'),(331,2,1,'core'),(332,2,1,'processorgenuin'),(333,2,1,'windows'),(334,2,1,'home'),(335,2,1,'premium'),(336,2,1,'64bit'),(337,2,1,'seriespremium'),(338,2,1,'black416'),(339,2,1,'164'),(340,2,1,'1920x1080640'),(341,2,1,'8gb'),(342,2,1,'memory'),(343,2,1,'ios'),(344,2,1,'notifications'),(345,2,1,'concept'),(346,2,1,'from'),(347,2,1,'andreas'),(348,2,1,'vimeo'),(349,2,1,'mobile'),(350,2,1,'accessories'),(351,2,1,'new'),(352,2,1,'htc'),(353,2,1,'aucibus'),(354,2,1,'curae'),(355,2,1,'ante'),(356,2,1,'cubilia'),(357,2,1,'luctus'),(358,2,1,'eros'),(359,2,1,'primis'),(360,2,1,'orci'),(361,2,1,'sollicitudin'),(362,2,1,'metal'),(363,2,1,'80gb'),(364,2,1,'parallel'),(365,2,1,'ata'),(366,2,1,'drive'),(367,2,1,'4200'),(368,2,1,'rpm'),(369,2,1,'180ghz'),(370,2,1,'duo'),(371,2,1,'160gb'),(372,2,1,'40000'),(373,2,1,'songs'),(374,2,1,'black'),(375,2,1,'medium'),(376,2,1,'etiam'),(377,2,1,'tortor'),(378,2,1,'nisi'),(379,2,1,'dignissim'),(380,2,1,'mauris'),(381,2,1,'tempus'),(382,2,1,'enim'),(383,2,1,'aliquam'),(384,2,1,'interdum'),(385,2,1,'llcus'),(386,2,1,'jack'),(387,2,1,'stereo'),(388,2,2,'aenean'),(389,2,2,'fringilla'),(390,2,2,'venenatis'),(391,2,2,'nulla'),(392,2,2,'non'),(393,2,2,'auctor'),(394,2,2,'quis'),(395,2,2,'tortor'),(396,2,2,'vel'),(397,2,2,'augue'),(398,2,2,'ultricies'),(399,2,2,'luctus'),(400,2,2,'sed'),(401,2,2,'ullamcorper'),(402,2,2,'mattis'),(403,2,2,'metus'),(404,2,2,'sit'),(405,2,2,'amet'),(406,2,2,'facilisis'),(407,2,2,'praesent'),(408,2,2,'faucibus'),(409,2,2,'magna'),(410,2,2,'uttter'),(411,2,2,'sodales'),(412,2,2,'consectetur'),(413,2,2,'sem'),(414,2,2,'massa'),(415,2,2,'convallis'),(416,2,2,'nibh'),(417,2,2,'elementum'),(418,2,2,'diam'),(419,2,2,'neque'),(420,2,2,'nullam'),(421,2,2,'tellus'),(422,2,2,'nec'),(423,2,2,'lectus'),(424,2,2,'consequat'),(425,2,2,'pellentesque'),(426,2,2,'malesuada'),(427,2,2,'dapibus'),(428,2,2,'cursus'),(429,2,2,'vestibulum'),(430,2,2,'erat'),(431,2,2,'condimentum'),(432,2,2,'ultrices'),(433,2,2,'eget'),(434,2,2,'dui'),(435,2,2,'ligula'),(436,2,2,'tempor'),(437,2,2,'scelerisque'),(438,2,2,'quisque'),(439,2,2,'odio'),(440,2,2,'lorem'),(441,2,2,'egestas'),(442,2,2,'posuere'),(443,2,2,'sapien'),(444,2,2,'velit'),(445,2,2,'sagittis'),(446,2,2,'tincidunt'),(447,2,2,'pretium'),(448,2,2,'nisl'),(449,2,2,'suspendisse'),(450,2,2,'lacinia'),(451,2,2,'urna'),(452,2,2,'2nd'),(453,2,2,'generation'),(454,2,2,'intel'),(455,2,2,'core'),(456,2,2,'processorgenuin'),(457,2,2,'windows'),(458,2,2,'home'),(459,2,2,'premium'),(460,2,2,'64bit'),(461,2,2,'seriespremium'),(462,2,2,'black416'),(463,2,2,'164'),(464,2,2,'1920x1080640'),(465,2,2,'8gb'),(466,2,2,'memory'),(467,2,2,'ios'),(468,2,2,'notifications'),(469,2,2,'concept'),(470,2,2,'from'),(471,2,2,'andreas'),(472,2,2,'vimeo'),(473,2,2,'mobile'),(474,2,2,'accessories'),(475,2,2,'new'),(476,2,2,'htc'),(477,2,2,'metal'),(478,2,2,'80gb'),(479,2,2,'parallel'),(480,2,2,'ata'),(481,2,2,'drive'),(482,2,2,'4200'),(483,2,2,'rpm'),(484,2,2,'180ghz'),(485,2,2,'duo'),(486,2,2,'160gb'),(487,2,2,'40000'),(488,2,2,'songs'),(489,2,2,'black'),(490,2,2,'medium'),(491,2,2,'etiam'),(492,2,2,'nisi'),(493,2,2,'dignissim'),(494,2,2,'mauris'),(495,2,2,'tempus'),(496,2,2,'enim'),(497,2,2,'aliquam'),(498,2,2,'interdum'),(499,2,2,'llcus'),(500,2,2,'turpis'),(501,2,2,'jack'),(502,2,2,'stereo'),(503,3,1,'aenean'),(504,3,1,'fringilla'),(505,3,1,'venenatis'),(506,3,1,'nulla'),(507,3,1,'non'),(508,3,1,'auctor'),(509,3,1,'maecenas'),(510,3,1,'ullamcorper'),(511,3,1,'ipsum'),(512,3,1,'tempor'),(513,3,1,'ultricies'),(514,3,1,'semper'),(515,3,1,'metus'),(516,3,1,'elementum'),(517,3,1,'est'),(518,3,1,'mollis'),(519,3,1,'egestas'),(520,3,1,'quam'),(521,3,1,'vestibulum'),(522,3,1,'proin'),(523,3,1,'consectetur'),(524,3,1,'placerat'),(525,3,1,'turpis'),(526,3,1,'quis'),(527,3,1,'consequat'),(528,3,1,'sem'),(529,3,1,'pulvinar'),(530,3,1,'arcust'),(531,3,1,'euismod'),(532,3,1,'vel'),(533,3,1,'dictum'),(534,3,1,'eget'),(535,3,1,'laoreet'),(536,3,1,'sed'),(537,3,1,'mattis'),(538,3,1,'sit'),(539,3,1,'amet'),(540,3,1,'facilisis'),(541,3,1,'praesent'),(542,3,1,'faucibus'),(543,3,1,'magna'),(544,3,1,'uttter'),(545,3,1,'sodales'),(546,3,1,'massa'),(547,3,1,'convallis'),(548,3,1,'nibh'),(549,3,1,'diam'),(550,3,1,'neque'),(551,3,1,'augue'),(552,3,1,'nullam'),(553,3,1,'tellus'),(554,3,1,'nec'),(555,3,1,'lectus'),(556,3,1,'pellentesque'),(557,3,1,'malesuada'),(558,3,1,'dapibus'),(559,3,1,'cursus'),(560,3,1,'erat'),(561,3,1,'condimentum'),(562,3,1,'ultrices'),(563,3,1,'dui'),(564,3,1,'ligula'),(565,3,1,'scelerisque'),(566,3,1,'quisque'),(567,3,1,'odio'),(568,3,1,'lorem'),(569,3,1,'posuere'),(570,3,1,'sapien'),(571,3,1,'velit'),(572,3,1,'sagittis'),(573,3,1,'tincidunt'),(574,3,1,'pretium'),(575,3,1,'nisl'),(576,3,1,'suspendisse'),(577,3,1,'lacinia'),(578,3,1,'urna'),(579,3,1,'2nd'),(580,3,1,'generation'),(581,3,1,'intel'),(582,3,1,'core'),(583,3,1,'processorgenuin'),(584,3,1,'windows'),(585,3,1,'home'),(586,3,1,'premium'),(587,3,1,'64bit'),(588,3,1,'seriespremium'),(589,3,1,'black416'),(590,3,1,'164'),(591,3,1,'1920x1080640'),(592,3,1,'8gb'),(593,3,1,'memory'),(594,3,1,'ios'),(595,3,1,'notifications'),(596,3,1,'concept'),(597,3,1,'from'),(598,3,1,'andreas'),(599,3,1,'vimeo'),(600,3,1,'mobile'),(601,3,1,'accessories'),(602,3,1,'new'),(603,3,1,'htc'),(604,3,1,'aucibus'),(605,3,1,'curae'),(606,3,1,'ante'),(607,3,1,'cubilia'),(608,3,1,'luctus'),(609,3,1,'eros'),(610,3,1,'primis'),(611,3,1,'orci'),(612,3,1,'sollicitudin'),(613,3,1,'metal'),(614,3,1,'80gb'),(615,3,1,'parallel'),(616,3,1,'ata'),(617,3,1,'drive'),(618,3,1,'4200'),(619,3,1,'rpm'),(620,3,1,'180ghz'),(621,3,1,'duo'),(622,3,1,'160gb'),(623,3,1,'40000'),(624,3,1,'songs'),(625,3,1,'black'),(626,3,1,'medium'),(627,3,1,'etiam'),(628,3,1,'tortor'),(629,3,1,'nisi'),(630,3,1,'dignissim'),(631,3,1,'mauris'),(632,3,1,'tempus'),(633,3,1,'enim'),(634,3,1,'aliquam'),(635,3,1,'interdum'),(636,3,1,'llcus'),(637,3,1,'jack'),(638,3,1,'stereo'),(639,3,2,'aenean'),(640,3,2,'fringilla'),(641,3,2,'venenatis'),(642,3,2,'nulla'),(643,3,2,'non'),(644,3,2,'auctor'),(645,3,2,'quis'),(646,3,2,'tortor'),(647,3,2,'vel'),(648,3,2,'augue'),(649,3,2,'ultricies'),(650,3,2,'luctus'),(651,3,2,'sed'),(652,3,2,'ullamcorper'),(653,3,2,'mattis'),(654,3,2,'metus'),(655,3,2,'sit'),(656,3,2,'amet'),(657,3,2,'facilisis'),(658,3,2,'praesent'),(659,3,2,'faucibus'),(660,3,2,'magna'),(661,3,2,'uttter'),(662,3,2,'sodales'),(663,3,2,'consectetur'),(664,3,2,'sem'),(665,3,2,'massa'),(666,3,2,'convallis'),(667,3,2,'nibh'),(668,3,2,'elementum'),(669,3,2,'diam'),(670,3,2,'neque'),(671,3,2,'nullam'),(672,3,2,'tellus'),(673,3,2,'nec'),(674,3,2,'lectus'),(675,3,2,'consequat'),(676,3,2,'pellentesque'),(677,3,2,'malesuada'),(678,3,2,'dapibus'),(679,3,2,'cursus'),(680,3,2,'vestibulum'),(681,3,2,'erat'),(682,3,2,'condimentum'),(683,3,2,'ultrices'),(684,3,2,'eget'),(685,3,2,'dui'),(686,3,2,'ligula'),(687,3,2,'tempor'),(688,3,2,'scelerisque'),(689,3,2,'quisque'),(690,3,2,'odio'),(691,3,2,'lorem'),(692,3,2,'egestas'),(693,3,2,'posuere'),(694,3,2,'sapien'),(695,3,2,'velit'),(696,3,2,'sagittis'),(697,3,2,'tincidunt'),(698,3,2,'pretium'),(699,3,2,'nisl'),(700,3,2,'suspendisse'),(701,3,2,'lacinia'),(702,3,2,'urna'),(703,3,2,'2nd'),(704,3,2,'generation'),(705,3,2,'intel'),(706,3,2,'core'),(707,3,2,'processorgenuin'),(708,3,2,'windows'),(709,3,2,'home'),(710,3,2,'premium'),(711,3,2,'64bit'),(712,3,2,'seriespremium'),(713,3,2,'black416'),(714,3,2,'164'),(715,3,2,'1920x1080640'),(716,3,2,'8gb'),(717,3,2,'memory'),(718,3,2,'ios'),(719,3,2,'notifications'),(720,3,2,'concept'),(721,3,2,'from'),(722,3,2,'andreas'),(723,3,2,'vimeo'),(724,3,2,'mobile'),(725,3,2,'accessories'),(726,3,2,'new'),(727,3,2,'htc'),(728,3,2,'metal'),(729,3,2,'80gb'),(730,3,2,'parallel'),(731,3,2,'ata'),(732,3,2,'drive'),(733,3,2,'4200'),(734,3,2,'rpm'),(735,3,2,'180ghz'),(736,3,2,'duo'),(737,3,2,'160gb'),(738,3,2,'40000'),(739,3,2,'songs'),(740,3,2,'black'),(741,3,2,'medium'),(742,3,2,'etiam'),(743,3,2,'nisi'),(744,3,2,'dignissim'),(745,3,2,'mauris'),(746,3,2,'tempus'),(747,3,2,'enim'),(748,3,2,'aliquam'),(749,3,2,'interdum'),(750,3,2,'llcus'),(751,3,2,'turpis'),(752,3,2,'jack'),(753,3,2,'stereo'),(754,4,1,'aenean'),(755,4,1,'fringilla'),(756,4,1,'venenatis'),(757,4,1,'nulla'),(758,4,1,'non'),(759,4,1,'auctor'),(760,4,1,'maecenas'),(761,4,1,'ullamcorper'),(762,4,1,'ipsum'),(763,4,1,'tempor'),(764,4,1,'ultricies'),(765,4,1,'semper'),(766,4,1,'metus'),(767,4,1,'elementum'),(768,4,1,'est'),(769,4,1,'mollis'),(770,4,1,'egestas'),(771,4,1,'quam'),(772,4,1,'vestibulum'),(773,4,1,'proin'),(774,4,1,'consectetur'),(775,4,1,'placerat'),(776,4,1,'turpis'),(777,4,1,'quis'),(778,4,1,'consequat'),(779,4,1,'sem'),(780,4,1,'pulvinar'),(781,4,1,'arcust'),(782,4,1,'euismod'),(783,4,1,'vel'),(784,4,1,'dictum'),(785,4,1,'eget'),(786,4,1,'laoreet'),(787,4,1,'sed'),(788,4,1,'mattis'),(789,4,1,'sit'),(790,4,1,'amet'),(791,4,1,'facilisis'),(792,4,1,'praesent'),(793,4,1,'faucibus'),(794,4,1,'magna'),(795,4,1,'uttter'),(796,4,1,'sodales'),(797,4,1,'massa'),(798,4,1,'convallis'),(799,4,1,'nibh'),(800,4,1,'diam'),(801,4,1,'neque'),(802,4,1,'augue'),(803,4,1,'nullam'),(804,4,1,'tellus'),(805,4,1,'nec'),(806,4,1,'lectus'),(807,4,1,'pellentesque'),(808,4,1,'malesuada'),(809,4,1,'dapibus'),(810,4,1,'cursus'),(811,4,1,'erat'),(812,4,1,'condimentum'),(813,4,1,'ultrices'),(814,4,1,'dui'),(815,4,1,'ligula'),(816,4,1,'scelerisque'),(817,4,1,'quisque'),(818,4,1,'odio'),(819,4,1,'lorem'),(820,4,1,'posuere'),(821,4,1,'sapien'),(822,4,1,'velit'),(823,4,1,'sagittis'),(824,4,1,'tincidunt'),(825,4,1,'pretium'),(826,4,1,'nisl'),(827,4,1,'suspendisse'),(828,4,1,'lacinia'),(829,4,1,'urna'),(830,4,1,'2nd'),(831,4,1,'generation'),(832,4,1,'intel'),(833,4,1,'core'),(834,4,1,'processorgenuin'),(835,4,1,'windows'),(836,4,1,'home'),(837,4,1,'premium'),(838,4,1,'64bit'),(839,4,1,'seriespremium'),(840,4,1,'black416'),(841,4,1,'164'),(842,4,1,'1920x1080640'),(843,4,1,'8gb'),(844,4,1,'memory'),(845,4,1,'ios'),(846,4,1,'notifications'),(847,4,1,'concept'),(848,4,1,'from'),(849,4,1,'andreas'),(850,4,1,'vimeo'),(851,4,1,'mobile'),(852,4,1,'accessories'),(853,4,1,'new'),(854,4,1,'htc'),(855,4,1,'aucibus'),(856,4,1,'curae'),(857,4,1,'ante'),(858,4,1,'cubilia'),(859,4,1,'luctus'),(860,4,1,'eros'),(861,4,1,'primis'),(862,4,1,'orci'),(863,4,1,'sollicitudin'),(864,4,1,'metal'),(865,4,1,'80gb'),(866,4,1,'parallel'),(867,4,1,'ata'),(868,4,1,'drive'),(869,4,1,'4200'),(870,4,1,'rpm'),(871,4,1,'180ghz'),(872,4,1,'duo'),(873,4,1,'160gb'),(874,4,1,'40000'),(875,4,1,'songs'),(876,4,1,'black'),(877,4,1,'medium'),(878,4,1,'etiam'),(879,4,1,'tortor'),(880,4,1,'nisi'),(881,4,1,'dignissim'),(882,4,1,'mauris'),(883,4,1,'tempus'),(884,4,1,'enim'),(885,4,1,'aliquam'),(886,4,1,'interdum'),(887,4,1,'llcus'),(888,4,1,'jack'),(889,4,1,'stereo'),(890,4,2,'aenean'),(891,4,2,'fringilla'),(892,4,2,'venenatis'),(893,4,2,'nulla'),(894,4,2,'non'),(895,4,2,'auctor'),(896,4,2,'quis'),(897,4,2,'tortor'),(898,4,2,'vel'),(899,4,2,'augue'),(900,4,2,'ultricies'),(901,4,2,'luctus'),(902,4,2,'sed'),(903,4,2,'ullamcorper'),(904,4,2,'mattis'),(905,4,2,'metus'),(906,4,2,'sit'),(907,4,2,'amet'),(908,4,2,'facilisis'),(909,4,2,'praesent'),(910,4,2,'faucibus'),(911,4,2,'magna'),(912,4,2,'uttter'),(913,4,2,'sodales'),(914,4,2,'consectetur'),(915,4,2,'sem'),(916,4,2,'massa'),(917,4,2,'convallis'),(918,4,2,'nibh'),(919,4,2,'elementum'),(920,4,2,'diam'),(921,4,2,'neque'),(922,4,2,'nullam'),(923,4,2,'tellus'),(924,4,2,'nec'),(925,4,2,'lectus'),(926,4,2,'consequat'),(927,4,2,'pellentesque'),(928,4,2,'malesuada'),(929,4,2,'dapibus'),(930,4,2,'cursus'),(931,4,2,'vestibulum'),(932,4,2,'erat'),(933,4,2,'condimentum'),(934,4,2,'ultrices'),(935,4,2,'eget'),(936,4,2,'dui'),(937,4,2,'ligula'),(938,4,2,'tempor'),(939,4,2,'scelerisque'),(940,4,2,'quisque'),(941,4,2,'odio'),(942,4,2,'lorem'),(943,4,2,'egestas'),(944,4,2,'posuere'),(945,4,2,'sapien'),(946,4,2,'velit'),(947,4,2,'sagittis'),(948,4,2,'tincidunt'),(949,4,2,'pretium'),(950,4,2,'nisl'),(951,4,2,'suspendisse'),(952,4,2,'lacinia'),(953,4,2,'urna'),(954,4,2,'2nd'),(955,4,2,'generation'),(956,4,2,'intel'),(957,4,2,'core'),(958,4,2,'processorgenuin'),(959,4,2,'windows'),(960,4,2,'home'),(961,4,2,'premium'),(962,4,2,'64bit'),(963,4,2,'seriespremium'),(964,4,2,'black416'),(965,4,2,'164'),(966,4,2,'1920x1080640'),(967,4,2,'8gb'),(968,4,2,'memory'),(969,4,2,'ios'),(970,4,2,'notifications'),(971,4,2,'concept'),(972,4,2,'from'),(973,4,2,'andreas'),(974,4,2,'vimeo'),(975,4,2,'mobile'),(976,4,2,'accessories'),(977,4,2,'new'),(978,4,2,'htc'),(979,4,2,'metal'),(980,4,2,'80gb'),(981,4,2,'parallel'),(982,4,2,'ata'),(983,4,2,'drive'),(984,4,2,'4200'),(985,4,2,'rpm'),(986,4,2,'180ghz'),(987,4,2,'duo'),(988,4,2,'160gb'),(989,4,2,'40000'),(990,4,2,'songs'),(991,4,2,'black'),(992,4,2,'medium'),(993,4,2,'etiam'),(994,4,2,'nisi'),(995,4,2,'dignissim'),(996,4,2,'mauris'),(997,4,2,'tempus'),(998,4,2,'enim'),(999,4,2,'aliquam'),(1000,4,2,'interdum'),(1001,4,2,'llcus'),(1002,4,2,'turpis'),(1003,4,2,'jack'),(1004,4,2,'stereo'),(1005,5,1,'aenean'),(1006,5,1,'fringilla'),(1007,5,1,'venenatis'),(1008,5,1,'nulla'),(1009,5,1,'non'),(1010,5,1,'auctor'),(1011,5,1,'maecenas'),(1012,5,1,'ullamcorper'),(1013,5,1,'ipsum'),(1014,5,1,'tempor'),(1015,5,1,'ultricies'),(1016,5,1,'semper'),(1017,5,1,'metus'),(1018,5,1,'elementum'),(1019,5,1,'est'),(1020,5,1,'mollis'),(1021,5,1,'egestas'),(1022,5,1,'quam'),(1023,5,1,'vestibulum'),(1024,5,1,'proin'),(1025,5,1,'consectetur'),(1026,5,1,'placerat'),(1027,5,1,'turpis'),(1028,5,1,'quis'),(1029,5,1,'consequat'),(1030,5,1,'sem'),(1031,5,1,'pulvinar'),(1032,5,1,'arcust'),(1033,5,1,'euismod'),(1034,5,1,'vel'),(1035,5,1,'dictum'),(1036,5,1,'eget'),(1037,5,1,'laoreet'),(1038,5,1,'sed'),(1039,5,1,'mattis'),(1040,5,1,'sit'),(1041,5,1,'amet'),(1042,5,1,'facilisis'),(1043,5,1,'praesent'),(1044,5,1,'faucibus'),(1045,5,1,'magna'),(1046,5,1,'uttter'),(1047,5,1,'sodales'),(1048,5,1,'massa'),(1049,5,1,'convallis'),(1050,5,1,'nibh'),(1051,5,1,'diam'),(1052,5,1,'neque'),(1053,5,1,'augue'),(1054,5,1,'nullam'),(1055,5,1,'tellus'),(1056,5,1,'nec'),(1057,5,1,'lectus'),(1058,5,1,'pellentesque'),(1059,5,1,'malesuada'),(1060,5,1,'dapibus'),(1061,5,1,'cursus'),(1062,5,1,'erat'),(1063,5,1,'condimentum'),(1064,5,1,'ultrices'),(1065,5,1,'dui'),(1066,5,1,'ligula'),(1067,5,1,'scelerisque'),(1068,5,1,'quisque'),(1069,5,1,'odio'),(1070,5,1,'lorem'),(1071,5,1,'posuere'),(1072,5,1,'sapien'),(1073,5,1,'velit'),(1074,5,1,'sagittis'),(1075,5,1,'tincidunt'),(1076,5,1,'pretium'),(1077,5,1,'nisl'),(1078,5,1,'suspendisse'),(1079,5,1,'lacinia'),(1080,5,1,'urna'),(1081,5,1,'2nd'),(1082,5,1,'generation'),(1083,5,1,'intel'),(1084,5,1,'core'),(1085,5,1,'processorgenuin'),(1086,5,1,'windows'),(1087,5,1,'home'),(1088,5,1,'premium'),(1089,5,1,'64bit'),(1090,5,1,'seriespremium'),(1091,5,1,'black416'),(1092,5,1,'164'),(1093,5,1,'1920x1080640'),(1094,5,1,'8gb'),(1095,5,1,'memory'),(1096,5,1,'ios'),(1097,5,1,'notifications'),(1098,5,1,'concept'),(1099,5,1,'from'),(1100,5,1,'andreas'),(1101,5,1,'vimeo'),(1102,5,1,'mobile'),(1103,5,1,'accessories'),(1104,5,1,'new'),(1105,5,1,'htc'),(1106,5,1,'aucibus'),(1107,5,1,'curae'),(1108,5,1,'ante'),(1109,5,1,'cubilia'),(1110,5,1,'luctus'),(1111,5,1,'eros'),(1112,5,1,'primis'),(1113,5,1,'orci'),(1114,5,1,'sollicitudin'),(1115,5,1,'metal'),(1116,5,1,'80gb'),(1117,5,1,'parallel'),(1118,5,1,'ata'),(1119,5,1,'drive'),(1120,5,1,'4200'),(1121,5,1,'rpm'),(1122,5,1,'180ghz'),(1123,5,1,'duo'),(1124,5,1,'160gb'),(1125,5,1,'40000'),(1126,5,1,'songs'),(1127,5,1,'black'),(1128,5,1,'medium'),(1129,5,1,'etiam'),(1130,5,1,'tortor'),(1131,5,1,'nisi'),(1132,5,1,'dignissim'),(1133,5,1,'mauris'),(1134,5,1,'tempus'),(1135,5,1,'enim'),(1136,5,1,'aliquam'),(1137,5,1,'interdum'),(1138,5,1,'llcus'),(1139,5,1,'jack'),(1140,5,1,'stereo'),(1141,5,2,'aenean'),(1142,5,2,'fringilla'),(1143,5,2,'venenatis'),(1144,5,2,'nulla'),(1145,5,2,'non'),(1146,5,2,'auctor'),(1147,5,2,'quis'),(1148,5,2,'tortor'),(1149,5,2,'vel'),(1150,5,2,'augue'),(1151,5,2,'ultricies'),(1152,5,2,'luctus'),(1153,5,2,'sed'),(1154,5,2,'ullamcorper'),(1155,5,2,'mattis'),(1156,5,2,'metus'),(1157,5,2,'sit'),(1158,5,2,'amet'),(1159,5,2,'facilisis'),(1160,5,2,'praesent'),(1161,5,2,'faucibus'),(1162,5,2,'magna'),(1163,5,2,'uttter'),(1164,5,2,'sodales'),(1165,5,2,'consectetur'),(1166,5,2,'sem'),(1167,5,2,'massa'),(1168,5,2,'convallis'),(1169,5,2,'nibh'),(1170,5,2,'elementum'),(1171,5,2,'diam'),(1172,5,2,'neque'),(1173,5,2,'nullam'),(1174,5,2,'tellus'),(1175,5,2,'nec'),(1176,5,2,'lectus'),(1177,5,2,'consequat'),(1178,5,2,'pellentesque'),(1179,5,2,'malesuada'),(1180,5,2,'dapibus'),(1181,5,2,'cursus'),(1182,5,2,'vestibulum'),(1183,5,2,'erat'),(1184,5,2,'condimentum'),(1185,5,2,'ultrices'),(1186,5,2,'eget'),(1187,5,2,'dui'),(1188,5,2,'ligula'),(1189,5,2,'tempor'),(1190,5,2,'scelerisque'),(1191,5,2,'quisque'),(1192,5,2,'odio'),(1193,5,2,'lorem'),(1194,5,2,'egestas'),(1195,5,2,'posuere'),(1196,5,2,'sapien'),(1197,5,2,'velit'),(1198,5,2,'sagittis'),(1199,5,2,'tincidunt'),(1200,5,2,'pretium'),(1201,5,2,'nisl'),(1202,5,2,'suspendisse'),(1203,5,2,'lacinia'),(1204,5,2,'urna'),(1205,5,2,'2nd'),(1206,5,2,'generation'),(1207,5,2,'intel'),(1208,5,2,'core'),(1209,5,2,'processorgenuin'),(1210,5,2,'windows'),(1211,5,2,'home'),(1212,5,2,'premium'),(1213,5,2,'64bit'),(1214,5,2,'seriespremium'),(1215,5,2,'black416'),(1216,5,2,'164'),(1217,5,2,'1920x1080640'),(1218,5,2,'8gb'),(1219,5,2,'memory'),(1220,5,2,'ios'),(1221,5,2,'notifications'),(1222,5,2,'concept'),(1223,5,2,'from'),(1224,5,2,'andreas'),(1225,5,2,'vimeo'),(1226,5,2,'mobile'),(1227,5,2,'accessories'),(1228,5,2,'new'),(1229,5,2,'htc'),(1230,5,2,'metal'),(1231,5,2,'80gb'),(1232,5,2,'parallel'),(1233,5,2,'ata'),(1234,5,2,'drive'),(1235,5,2,'4200'),(1236,5,2,'rpm'),(1237,5,2,'180ghz'),(1238,5,2,'duo'),(1239,5,2,'160gb'),(1240,5,2,'40000'),(1241,5,2,'songs'),(1242,5,2,'black'),(1243,5,2,'medium'),(1244,5,2,'etiam'),(1245,5,2,'nisi'),(1246,5,2,'dignissim'),(1247,5,2,'mauris'),(1248,5,2,'tempus'),(1249,5,2,'enim'),(1250,5,2,'aliquam'),(1251,5,2,'interdum'),(1252,5,2,'llcus'),(1253,5,2,'turpis'),(1254,5,2,'jack'),(1255,5,2,'stereo'),(1256,1,1,'nam'),(1257,1,1,'vitae'),(1258,1,1,'eleifend'),(1259,2,1,'nam'),(1260,2,1,'vitae'),(1261,2,1,'eleifend'),(1262,3,1,'nam'),(1263,3,1,'vitae'),(1264,3,1,'eleifend'),(1265,4,1,'nam'),(1266,4,1,'vitae'),(1267,4,1,'eleifend'),(1268,5,1,'nam'),(1269,5,1,'vitae'),(1270,5,1,'eleifend'),(1271,1,1,'lacus'),(1272,1,1,'antedios'),(1273,1,1,'clothes'),(1274,1,1,'for'),(1275,1,1,'men'),(1276,1,2,'clothes'),(1277,1,2,'for'),(1278,1,2,'men'),(1279,2,1,'lacus'),(1280,2,1,'antedios'),(1281,2,1,'clothes'),(1282,2,1,'for'),(1283,2,1,'men'),(1284,2,2,'clothes'),(1285,2,2,'for'),(1286,2,2,'men'),(1287,3,1,'lacus'),(1288,3,1,'antedios'),(1289,3,1,'clothes'),(1290,3,1,'for'),(1291,3,1,'men'),(1292,3,2,'clothes'),(1293,3,2,'for'),(1294,3,2,'men'),(1295,4,1,'lacus'),(1296,4,1,'antedios'),(1297,4,1,'clothes'),(1298,4,1,'for'),(1299,4,1,'men'),(1300,4,2,'clothes'),(1301,4,2,'for'),(1302,4,2,'men'),(1303,5,1,'lacus'),(1304,5,1,'antedios'),(1305,5,1,'clothes'),(1306,5,1,'for'),(1307,5,1,'men'),(1308,5,2,'clothes'),(1309,5,2,'for'),(1310,5,2,'men'),(1311,1,1,'hendrerit'),(1312,1,1,'cras'),(1313,2,1,'hendrerit'),(1314,2,1,'cras'),(1315,3,1,'hendrerit'),(1316,3,1,'cras'),(1317,4,1,'hendrerit'),(1318,4,1,'cras'),(1319,5,1,'hendrerit'),(1320,5,1,'cras');
/*!40000 ALTER TABLE `ps_search_word` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_sekeyword` WRITE;
/*!40000 ALTER TABLE `ps_sekeyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_sekeyword` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_shop` WRITE;
/*!40000 ALTER TABLE `ps_shop` DISABLE KEYS */;
INSERT INTO `ps_shop` VALUES (1,1,'Presthemes GoMarket Prestashop Theme',2,2,1,0),(2,1,'Blue Presthemes GoMarket Prestashop Theme',2,2,1,0),(3,1,'Green Presthemes GoMarket Prestashop Theme',2,2,1,0),(4,1,'Box Presthemes GoMarket Prestashop Theme',2,2,1,0),(5,1,'Orange Presthemes GoMarket Prestashop Theme',2,2,1,0);
/*!40000 ALTER TABLE `ps_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_shop_group` WRITE;
/*!40000 ALTER TABLE `ps_shop_group` DISABLE KEYS */;
INSERT INTO `ps_shop_group` VALUES (1,'Default',0,0,0,1,0);
/*!40000 ALTER TABLE `ps_shop_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_shop_url` WRITE;
/*!40000 ALTER TABLE `ps_shop_url` DISABLE KEYS */;
INSERT INTO `ps_shop_url` VALUES (1,1,'192.168.1.91','192.168.1.91','/03_GoMarket/trunk/site/','',1,1),(2,2,'192.168.1.91','192.168.1.91','/03_GoMarket/trunk/site/','blue/',1,1),(3,3,'192.168.1.91','192.168.1.91','/03_GoMarket/trunk/site/','green/',1,1),(4,4,'192.168.1.91','192.168.1.91','/03_GoMarket/trunk/site/','box/',1,1),(5,5,'192.168.1.91','192.168.1.91','/03_GoMarket/trunk/site/','orange/',1,1);
/*!40000 ALTER TABLE `ps_shop_url` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_specific_price` WRITE;
/*!40000 ALTER TABLE `ps_specific_price` DISABLE KEYS */;
INSERT INTO `ps_specific_price` VALUES (3,0,0,18,0,0,0,0,0,0,0,-1.000000,1,0.120000,'percentage','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,0,0,19,0,0,0,0,0,0,0,-1.000000,1,0.200000,'percentage','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,0,0,20,0,0,0,0,0,0,0,-1.000000,1,0.050000,'percentage','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,0,0,21,0,0,0,0,0,0,0,-1.000000,1,0.100000,'percentage','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,0,0,8,0,0,0,0,0,0,0,-1.000000,1,1.000000,'amount','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,0,0,42,0,0,0,0,0,0,0,-1.000000,1,0.120000,'percentage','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ps_specific_price` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_specific_price_priority` WRITE;
/*!40000 ALTER TABLE `ps_specific_price_priority` DISABLE KEYS */;
INSERT INTO `ps_specific_price_priority` VALUES (1,8,'id_shop;id_currency;id_country;id_group'),(8,17,'id_shop;id_currency;id_country;id_group'),(9,18,'id_shop;id_currency;id_country;id_group'),(10,19,'id_shop;id_currency;id_country;id_group'),(11,20,'id_shop;id_currency;id_country;id_group'),(12,21,'id_shop;id_currency;id_country;id_group'),(13,22,'id_shop;id_currency;id_country;id_group'),(14,23,'id_shop;id_currency;id_country;id_group'),(15,24,'id_shop;id_currency;id_country;id_group'),(16,25,'id_shop;id_currency;id_country;id_group'),(17,30,'id_shop;id_currency;id_country;id_group'),(18,31,'id_shop;id_currency;id_country;id_group'),(19,32,'id_shop;id_currency;id_country;id_group'),(20,38,'id_shop;id_currency;id_country;id_group'),(25,27,'id_shop;id_currency;id_country;id_group'),(27,35,'id_shop;id_currency;id_country;id_group');
/*!40000 ALTER TABLE `ps_specific_price_priority` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_specific_price_rule` WRITE;
/*!40000 ALTER TABLE `ps_specific_price_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_specific_price_rule` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_specific_price_rule_condition` WRITE;
/*!40000 ALTER TABLE `ps_specific_price_rule_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_specific_price_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_specific_price_rule_condition_group` WRITE;
/*!40000 ALTER TABLE `ps_specific_price_rule_condition_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_specific_price_rule_condition_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_state` WRITE;
/*!40000 ALTER TABLE `ps_state` DISABLE KEYS */;
INSERT INTO `ps_state` VALUES (1,21,2,'Alabama','AL',0,1),(2,21,2,'Alaska','AK',0,1),(3,21,2,'Arizona','AZ',0,1),(4,21,2,'Arkansas','AR',0,1),(5,21,2,'California','CA',0,1),(6,21,2,'Colorado','CO',0,1),(7,21,2,'Connecticut','CT',0,1),(8,21,2,'Delaware','DE',0,1),(9,21,2,'Florida','FL',0,1),(10,21,2,'Georgia','GA',0,1),(11,21,2,'Hawaii','HI',0,1),(12,21,2,'Idaho','ID',0,1),(13,21,2,'Illinois','IL',0,1),(14,21,2,'Indiana','IN',0,1),(15,21,2,'Iowa','IA',0,1),(16,21,2,'Kansas','KS',0,1),(17,21,2,'Kentucky','KY',0,1),(18,21,2,'Louisiana','LA',0,1),(19,21,2,'Maine','ME',0,1),(20,21,2,'Maryland','MD',0,1),(21,21,2,'Massachusetts','MA',0,1),(22,21,2,'Michigan','MI',0,1),(23,21,2,'Minnesota','MN',0,1),(24,21,2,'Mississippi','MS',0,1),(25,21,2,'Missouri','MO',0,1),(26,21,2,'Montana','MT',0,1),(27,21,2,'Nebraska','NE',0,1),(28,21,2,'Nevada','NV',0,1),(29,21,2,'New Hampshire','NH',0,1),(30,21,2,'New Jersey','NJ',0,1),(31,21,2,'New Mexico','NM',0,1),(32,21,2,'New York','NY',0,1),(33,21,2,'North Carolina','NC',0,1),(34,21,2,'North Dakota','ND',0,1),(35,21,2,'Ohio','OH',0,1),(36,21,2,'Oklahoma','OK',0,1),(37,21,2,'Oregon','OR',0,1),(38,21,2,'Pennsylvania','PA',0,1),(39,21,2,'Rhode Island','RI',0,1),(40,21,2,'South Carolina','SC',0,1),(41,21,2,'South Dakota','SD',0,1),(42,21,2,'Tennessee','TN',0,1),(43,21,2,'Texas','TX',0,1),(44,21,2,'Utah','UT',0,1),(45,21,2,'Vermont','VT',0,1),(46,21,2,'Virginia','VA',0,1),(47,21,2,'Washington','WA',0,1),(48,21,2,'West Virginia','WV',0,1),(49,21,2,'Wisconsin','WI',0,1),(50,21,2,'Wyoming','WY',0,1),(51,21,2,'Puerto Rico','PR',0,1),(52,21,2,'US Virgin Islands','VI',0,1),(53,21,2,'District of Columbia','DC',0,1),(54,145,2,'Aguascalientes','AGS',0,1),(55,145,2,'Baja California','BCN',0,1),(56,145,2,'Baja California Sur','BCS',0,1),(57,145,2,'Campeche','CAM',0,1),(58,145,2,'Chiapas','CHP',0,1),(59,145,2,'Chihuahua','CHH',0,1),(60,145,2,'Coahuila','COA',0,1),(61,145,2,'Colima','COL',0,1),(62,145,2,'Distrito Federal','DIF',0,1),(63,145,2,'Durango','DUR',0,1),(64,145,2,'Guanajuato','GUA',0,1),(65,145,2,'Guerrero','GRO',0,1),(66,145,2,'Hidalgo','HID',0,1),(67,145,2,'Jalisco','JAL',0,1),(68,145,2,'Estado de México','MEX',0,1),(69,145,2,'Michoacán','MIC',0,1),(70,145,2,'Morelos','MOR',0,1),(71,145,2,'Nayarit','NAY',0,1),(72,145,2,'Nuevo León','NLE',0,1),(73,145,2,'Oaxaca','OAX',0,1),(74,145,2,'Puebla','PUE',0,1),(75,145,2,'Querétaro','QUE',0,1),(76,145,2,'Quintana Roo','ROO',0,1),(77,145,2,'San Luis Potosí','SLP',0,1),(78,145,2,'Sinaloa','SIN',0,1),(79,145,2,'Sonora','SON',0,1),(80,145,2,'Tabasco','TAB',0,1),(81,145,2,'Tamaulipas','TAM',0,1),(82,145,2,'Tlaxcala','TLA',0,1),(83,145,2,'Veracruz','VER',0,1),(84,145,2,'Yucatán','YUC',0,1),(85,145,2,'Zacatecas','ZAC',0,1),(86,4,2,'Ontario','ON',0,1),(87,4,2,'Quebec','QC',0,1),(88,4,2,'British Columbia','BC',0,1),(89,4,2,'Alberta','AB',0,1),(90,4,2,'Manitoba','MB',0,1),(91,4,2,'Saskatchewan','SK',0,1),(92,4,2,'Nova Scotia','NS',0,1),(93,4,2,'New Brunswick','NB',0,1),(94,4,2,'Newfoundland and Labrador','NL',0,1),(95,4,2,'Prince Edward Island','PE',0,1),(96,4,2,'Northwest Territories','NT',0,1),(97,4,2,'Yukon','YT',0,1),(98,4,2,'Nunavut','NU',0,1),(99,44,6,'Buenos Aires','B',0,1),(100,44,6,'Catamarca','K',0,1),(101,44,6,'Chaco','H',0,1),(102,44,6,'Chubut','U',0,1),(103,44,6,'Ciudad de Buenos Aires','C',0,1),(104,44,6,'Córdoba','X',0,1),(105,44,6,'Corrientes','W',0,1),(106,44,6,'Entre Ríos','E',0,1),(107,44,6,'Formosa','P',0,1),(108,44,6,'Jujuy','Y',0,1),(109,44,6,'La Pampa','L',0,1),(110,44,6,'La Rioja','F',0,1),(111,44,6,'Mendoza','M',0,1),(112,44,6,'Misiones','N',0,1),(113,44,6,'Neuquén','Q',0,1),(114,44,6,'Río Negro','R',0,1),(115,44,6,'Salta','A',0,1),(116,44,6,'San Juan','J',0,1),(117,44,6,'San Luis','D',0,1),(118,44,6,'Santa Cruz','Z',0,1),(119,44,6,'Santa Fe','S',0,1),(120,44,6,'Santiago del Estero','G',0,1),(121,44,6,'Tierra del Fuego','V',0,1),(122,44,6,'Tucumán','T',0,1),(123,10,1,'Agrigento','AG',0,1),(124,10,1,'Alessandria','AL',0,1),(125,10,1,'Ancona','AN',0,1),(126,10,1,'Aosta','AO',0,1),(127,10,1,'Arezzo','AR',0,1),(128,10,1,'Ascoli Piceno','AP',0,1),(129,10,1,'Asti','AT',0,1),(130,10,1,'Avellino','AV',0,1),(131,10,1,'Bari','BA',0,1),(132,10,1,'Barletta-Andria-Trani','BT',0,1),(133,10,1,'Belluno','BL',0,1),(134,10,1,'Benevento','BN',0,1),(135,10,1,'Bergamo','BG',0,1),(136,10,1,'Biella','BI',0,1),(137,10,1,'Bologna','BO',0,1),(138,10,1,'Bolzano','BZ',0,1),(139,10,1,'Brescia','BS',0,1),(140,10,1,'Brindisi','BR',0,1),(141,10,1,'Cagliari','CA',0,1),(142,10,1,'Caltanissetta','CL',0,1),(143,10,1,'Campobasso','CB',0,1),(144,10,1,'Carbonia-Iglesias','CI',0,1),(145,10,1,'Caserta','CE',0,1),(146,10,1,'Catania','CT',0,1),(147,10,1,'Catanzaro','CZ',0,1),(148,10,1,'Chieti','CH',0,1),(149,10,1,'Como','CO',0,1),(150,10,1,'Cosenza','CS',0,1),(151,10,1,'Cremona','CR',0,1),(152,10,1,'Crotone','KR',0,1),(153,10,1,'Cuneo','CN',0,1),(154,10,1,'Enna','EN',0,1),(155,10,1,'Fermo','FM',0,1),(156,10,1,'Ferrara','FE',0,1),(157,10,1,'Firenze','FI',0,1),(158,10,1,'Foggia','FG',0,1),(159,10,1,'Forlì-Cesena','FC',0,1),(160,10,1,'Frosinone','FR',0,1),(161,10,1,'Genova','GE',0,1),(162,10,1,'Gorizia','GO',0,1),(163,10,1,'Grosseto','GR',0,1),(164,10,1,'Imperia','IM',0,1),(165,10,1,'Isernia','IS',0,1),(166,10,1,'L\'Aquila','AQ',0,1),(167,10,1,'La Spezia','SP',0,1),(168,10,1,'Latina','LT',0,1),(169,10,1,'Lecce','LE',0,1),(170,10,1,'Lecco','LC',0,1),(171,10,1,'Livorno','LI',0,1),(172,10,1,'Lodi','LO',0,1),(173,10,1,'Lucca','LU',0,1),(174,10,1,'Macerata','MC',0,1),(175,10,1,'Mantova','MN',0,1),(176,10,1,'Massa','MS',0,1),(177,10,1,'Matera','MT',0,1),(178,10,1,'Medio Campidano','VS',0,1),(179,10,1,'Messina','ME',0,1),(180,10,1,'Milano','MI',0,1),(181,10,1,'Modena','MO',0,1),(182,10,1,'Monza e della Brianza','MB',0,1),(183,10,1,'Napoli','NA',0,1),(184,10,1,'Novara','NO',0,1),(185,10,1,'Nuoro','NU',0,1),(186,10,1,'Ogliastra','OG',0,1),(187,10,1,'Olbia-Tempio','OT',0,1),(188,10,1,'Oristano','OR',0,1),(189,10,1,'Padova','PD',0,1),(190,10,1,'Palermo','PA',0,1),(191,10,1,'Parma','PR',0,1),(192,10,1,'Pavia','PV',0,1),(193,10,1,'Perugia','PG',0,1),(194,10,1,'Pesaro-Urbino','PU',0,1),(195,10,1,'Pescara','PE',0,1),(196,10,1,'Piacenza','PC',0,1),(197,10,1,'Pisa','PI',0,1),(198,10,1,'Pistoia','PT',0,1),(199,10,1,'Pordenone','PN',0,1),(200,10,1,'Potenza','PZ',0,1),(201,10,1,'Prato','PO',0,1),(202,10,1,'Ragusa','RG',0,1),(203,10,1,'Ravenna','RA',0,1),(204,10,1,'Reggio Calabria','RC',0,1),(205,10,1,'Reggio Emilia','RE',0,1),(206,10,1,'Rieti','RI',0,1),(207,10,1,'Rimini','RN',0,1),(208,10,1,'Roma','RM',0,1),(209,10,1,'Rovigo','RO',0,1),(210,10,1,'Salerno','SA',0,1),(211,10,1,'Sassari','SS',0,1),(212,10,1,'Savona','SV',0,1),(213,10,1,'Siena','SI',0,1),(214,10,1,'Siracusa','SR',0,1),(215,10,1,'Sondrio','SO',0,1),(216,10,1,'Taranto','TA',0,1),(217,10,1,'Teramo','TE',0,1),(218,10,1,'Terni','TR',0,1),(219,10,1,'Torino','TO',0,1),(220,10,1,'Trapani','TP',0,1),(221,10,1,'Trento','TN',0,1),(222,10,1,'Treviso','TV',0,1),(223,10,1,'Trieste','TS',0,1),(224,10,1,'Udine','UD',0,1),(225,10,1,'Varese','VA',0,1),(226,10,1,'Venezia','VE',0,1),(227,10,1,'Verbano-Cusio-Ossola','VB',0,1),(228,10,1,'Vercelli','VC',0,1),(229,10,1,'Verona','VR',0,1),(230,10,1,'Vibo Valentia','VV',0,1),(231,10,1,'Vicenza','VI',0,1),(232,10,1,'Viterbo','VT',0,1),(233,111,3,'Aceh','AC',0,1),(234,111,3,'Bali','BA',0,1),(235,111,3,'Bangka','BB',0,1),(236,111,3,'Banten','BT',0,1),(237,111,3,'Bengkulu','BE',0,1),(238,111,3,'Central Java','JT',0,1),(239,111,3,'Central Kalimantan','KT',0,1),(240,111,3,'Central Sulawesi','ST',0,1),(241,111,3,'Coat of arms of East Java','JI',0,1),(242,111,3,'East kalimantan','KI',0,1),(243,111,3,'East Nusa Tenggara','NT',0,1),(244,111,3,'Lambang propinsi','GO',0,1),(245,111,3,'Jakarta','JK',0,1),(246,111,3,'Jambi','JA',0,1),(247,111,3,'Lampung','LA',0,1),(248,111,3,'Maluku','MA',0,1),(249,111,3,'North Maluku','MU',0,1),(250,111,3,'North Sulawesi','SA',0,1),(251,111,3,'North Sumatra','SU',0,1),(252,111,3,'Papua','PA',0,1),(253,111,3,'Riau','RI',0,1),(254,111,3,'Lambang Riau','KR',0,1),(255,111,3,'Southeast Sulawesi','SG',0,1),(256,111,3,'South Kalimantan','KS',0,1),(257,111,3,'South Sulawesi','SN',0,1),(258,111,3,'South Sumatra','SS',0,1),(259,111,3,'West Java','JB',0,1),(260,111,3,'West Kalimantan','KB',0,1),(261,111,3,'West Nusa Tenggara','NB',0,1),(262,111,3,'Lambang Provinsi Papua Barat','PB',0,1),(263,111,3,'West Sulawesi','SR',0,1),(264,111,3,'West Sumatra','SB',0,1),(265,111,3,'Yogyakarta','YO',0,1),(266,11,3,'Aichi','23',0,1),(267,11,3,'Akita','05',0,1),(268,11,3,'Aomori','02',0,1),(269,11,3,'Chiba','12',0,1),(270,11,3,'Ehime','38',0,1),(271,11,3,'Fukui','18',0,1),(272,11,3,'Fukuoka','40',0,1),(273,11,3,'Fukushima','07',0,1),(274,11,3,'Gifu','21',0,1),(275,11,3,'Gunma','10',0,1),(276,11,3,'Hiroshima','34',0,1),(277,11,3,'Hokkaido','01',0,1),(278,11,3,'Hyogo','28',0,1),(279,11,3,'Ibaraki','08',0,1),(280,11,3,'Ishikawa','17',0,1),(281,11,3,'Iwate','03',0,1),(282,11,3,'Kagawa','37',0,1),(283,11,3,'Kagoshima','46',0,1),(284,11,3,'Kanagawa','14',0,1),(285,11,3,'Kochi','39',0,1),(286,11,3,'Kumamoto','43',0,1),(287,11,3,'Kyoto','26',0,1),(288,11,3,'Mie','24',0,1),(289,11,3,'Miyagi','04',0,1),(290,11,3,'Miyazaki','45',0,1),(291,11,3,'Nagano','20',0,1),(292,11,3,'Nagasaki','42',0,1),(293,11,3,'Nara','29',0,1),(294,11,3,'Niigata','15',0,1),(295,11,3,'Oita','44',0,1),(296,11,3,'Okayama','33',0,1),(297,11,3,'Okinawa','47',0,1),(298,11,3,'Osaka','27',0,1),(299,11,3,'Saga','41',0,1),(300,11,3,'Saitama','11',0,1),(301,11,3,'Shiga','25',0,1),(302,11,3,'Shimane','32',0,1),(303,11,3,'Shizuoka','22',0,1),(304,11,3,'Tochigi','09',0,1),(305,11,3,'Tokushima','36',0,1),(306,11,3,'Tokyo','13',0,1),(307,11,3,'Tottori','31',0,1),(308,11,3,'Toyama','16',0,1),(309,11,3,'Wakayama','30',0,1),(310,11,3,'Yamagata','06',0,1),(311,11,3,'Yamaguchi','35',0,1),(312,11,3,'Yamanashi','19',0,1);
/*!40000 ALTER TABLE `ps_state` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_staticblock` WRITE;
/*!40000 ALTER TABLE `ps_staticblock` DISABLE KEYS */;
INSERT INTO `ps_staticblock` VALUES (1,'banner-home-center',8,1),(2,'banner_footer_top',128,1),(3,'banner-footer',21,1),(4,'last-new',21,1),(5,'text_footer_bottom',129,1),(6,'banner-home-bottom',127,1);
/*!40000 ALTER TABLE `ps_staticblock` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_staticblock_lang` WRITE;
/*!40000 ALTER TABLE `ps_staticblock_lang` DISABLE KEYS */;
INSERT INTO `ps_staticblock_lang` VALUES (1,1,1,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(1,1,2,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(1,1,3,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(1,1,4,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(1,1,5,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(1,2,1,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(1,2,2,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(1,2,3,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(1,2,4,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(1,2,5,'Banner Home Center','<div class=\"banner_home_center\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_fashsion.jpg\" alt=\"\" /></a></div>'),(2,1,1,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(2,1,2,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(2,1,3,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(2,1,4,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(2,1,5,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(2,2,1,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(2,2,2,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(2,2,3,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(2,2,4,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(2,2,5,'Banner footer top','<div class=\"banner_footer_top\"><a title=\"\" href=\"#\"><img src=\"{static_block_url}img/cms/ads_feature.jpg\" alt=\"\" /></a></div>'),(3,1,1,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(3,1,2,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(3,1,3,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(3,1,4,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(3,1,5,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(3,2,1,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(3,2,2,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(3,2,3,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(3,2,4,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(3,2,5,'Banner Footer','<div class=\"block cs_top_banner_footer\">\n<h4>Lorem ipsum dolor</h4>\n<ul class=\"row_1\">\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_hm.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_look.jpg\" alt=\"\" /></a></li>\n<li class=\"item\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_online.jpg\" alt=\"\" /></a></li>\n</ul>\n<ul class=\"row_2\">\n<li class=\"item first\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_watch.jpg\" alt=\"\" /></a></li>\n<li class=\"item last\"><a href=\"#\"><img src=\"{static_block_url}img/cms/f_digital.jpg\" alt=\"\" /></a></li>\n</ul>\n</div>'),(4,1,1,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Lastest New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Preview Autum Winter 2013</a></li>\n<li><a href=\"#\">Stock Clearence Sales - Save 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">New Customer Offer - $15 Off</a></li>\n<li><a href=\"#\">Grand Store Opening on 05/02</a></li>\n</ul>\n</div>\n</div>'),(4,1,2,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Lastest New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Preview Autum Winter 2013</a></li>\n<li><a href=\"#\">Stock Clearence Sales - Save 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">New Customer Offer - $15 Off</a></li>\n<li><a href=\"#\">Grand Store Opening on 05/02</a></li>\n</ul>\n</div>\n</div>'),(4,1,3,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Lastest New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Preview Autum Winter 2013</a></li>\n<li><a href=\"#\">Stock Clearence Sales - Save 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">New Customer Offer - $15 Off</a></li>\n<li><a href=\"#\">Grand Store Opening on 05/02</a></li>\n</ul>\n</div>\n</div>'),(4,1,4,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Lastest New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Preview Autum Winter 2013</a></li>\n<li><a href=\"#\">Stock Clearence Sales - Save 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">New Customer Offer - $15 Off</a></li>\n<li><a href=\"#\">Grand Store Opening on 05/02</a></li>\n</ul>\n</div>\n</div>'),(4,1,5,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Lastest New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Preview Autum Winter 2013</a></li>\n<li><a href=\"#\">Stock Clearence Sales - Save 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">New Customer Offer - $15 Off</a></li>\n<li><a href=\"#\">Grand Store Opening on 05/02</a></li>\n</ul>\n</div>\n</div>'),(4,2,1,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Dernières New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Aperçu Automne Hiver 2013</a></li>\n<li><a href=\"#\">Banque Clearence ventes - Gagnez 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">Nouvelle offre à la clientèle - 15 $ Off</a></li>\n<li><a href=\"#\">Grande ouverture du magasin le 05/02</a></li>\n</ul>\n</div>\n</div>'),(4,2,2,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Dernières New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Aperçu Automne Hiver 2013</a></li>\n<li><a href=\"#\">Banque Clearence ventes - Gagnez 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">Nouvelle offre à la clientèle - 15 $ Off</a></li>\n<li><a href=\"#\">Grande ouverture du magasin le 05/02</a></li>\n</ul>\n</div>\n</div>'),(4,2,3,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Dernières New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Aperçu Automne Hiver 2013</a></li>\n<li><a href=\"#\">Banque Clearence ventes - Gagnez 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">Nouvelle offre à la clientèle - 15 $ Off</a></li>\n<li><a href=\"#\">Grande ouverture du magasin le 05/02</a></li>\n</ul>\n</div>\n</div>'),(4,2,4,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Dernières New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Aperçu Automne Hiver 2013</a></li>\n<li><a href=\"#\">Banque Clearence ventes - Gagnez 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">Nouvelle offre à la clientèle - 15 $ Off</a></li>\n<li><a href=\"#\">Grande ouverture du magasin le 05/02</a></li>\n</ul>\n</div>\n</div>'),(4,2,5,'Lastest New','<div class=\"cs_lastest_new\">\n<div class=\"block\">\n<h4>Dernières New</h4>\n<a class=\"show_hide_footer\" href=\"javascript:void(0)\">icon</a>\n<ul class=\"cs_content f_block_content\">\n<li><a href=\"#\">Aperçu Automne Hiver 2013</a></li>\n<li><a href=\"#\">Banque Clearence ventes - Gagnez 80%</a></li>\n<li><a href=\"#\">Exdests Store\'s New Design Online</a></li>\n<li><a href=\"#\">Nouvelle offre à la clientèle - 15 $ Off</a></li>\n<li><a href=\"#\">Grande ouverture du magasin le 05/02</a></li>\n</ul>\n</div>\n</div>'),(5,1,1,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(5,1,2,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(5,1,3,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(5,1,4,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(5,1,5,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(5,2,1,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(5,2,2,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(5,2,3,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(5,2,4,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(5,2,5,'Text footer bottom','<div class=\"text_footer_bottom\">\r\n<div class=\"static-footer-payment\">\r\n<h4>Payment method</h4>\r\n<p class=\"icon\"><a title=\"visa\" href=\"#\"><img title=\"visa\" src=\"{static_block_url}img/cms/payment_1.png\" alt=\"visa\" width=\"39\" height=\"18\" /></a> <a title=\"mastercard\" href=\"#\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/mastercard.png\" alt=\"mastercard\" width=\"27\" height=\"18\" /></a> <a title=\"express\" href=\"#\"><img title=\"express\" src=\"{static_block_url}img/cms/american.png\" alt=\"express\" width=\"16\" height=\"18\" /></a> <a title=\"paypal\" href=\"#\"><img title=\"paypal\" src=\"{static_block_url}img/cms/paypal.png\" alt=\"paypal\" width=\"60\" height=\"18\" /></a> <a title=\"skrill\" href=\"#\"><img title=\"skrill\" src=\"{static_block_url}img/cms/skrill.png\" alt=\"skrill\" width=\"48\" height=\"18\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-follow\">\r\n<h4>Follow Us On</h4>\r\n<p class=\"icon\"><a title=\"facebook\" href=\"https://www.facebook.com/emthemes\"> <img title=\"facebook\" src=\"{static_block_url}img/cms/face.png\" alt=\"facebook\" width=\"34\" height=\"34\" /></a> <a title=\"twitter\" href=\"https://twitter.com/eggthemes\"><img title=\"mastercard\" src=\"{static_block_url}img/cms/i_twitter.png\" alt=\"twitter\" width=\"34\" height=\"34\" /></a> <a title=\"flickr\" href=\"http://www.flickr.com/\"><img title=\"flickr\" src=\"{static_block_url}img/cms/i_vimeo.png\" alt=\"flickr\" width=\"34\" height=\"34\" /></a> <a title=\"rss\" href=\"?rss\"><img title=\"rss\" src=\"{static_block_url}img/cms/i_rss.png\" alt=\"rss\" width=\"34\" height=\"34\" /></a></p>\r\n</div>\r\n<div class=\"static-footer-link\"><a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a href=\"#\">Aliquam Auctor</a><a href=\"#\">Elit Quis</a><a href=\"#\">Magna Porta</a><a class=\"last\" href=\"#\">Commodo</a><br /> <a href=\"#\">Fusce Uttest</a><a href=\"#\">Diam Tempor</a><a href=\"#\">Justo Malesuada</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a><br /> <a href=\"#\">Diam Tempor</a><a href=\"#\">Volutpat</a><a class=\"last\" href=\"#\">Aliquam Auctor</a></div>\r\n<p class=\"copy\"><span>©2013 GoMarket Demo Store. All rights reserved.</span><a href=\"#\">GoMarket Theme</a> by <a href=\"#\">PresThemes</a>.</p>\r\n</div>'),(6,1,1,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>'),(6,1,2,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>'),(6,1,3,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>'),(6,1,4,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>'),(6,1,5,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>'),(6,2,1,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>'),(6,2,2,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>'),(6,2,3,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>'),(6,2,4,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>'),(6,2,5,'Banner Home Bottom','<div class=\"banner_home_bottom\"><a href=\"#\"><img src=\"{static_block_url}img/cms/ads_ipod.jpg\" alt=\"\" /></a></div>');
/*!40000 ALTER TABLE `ps_staticblock_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_staticblock_shop` WRITE;
/*!40000 ALTER TABLE `ps_staticblock_shop` DISABLE KEYS */;
INSERT INTO `ps_staticblock_shop` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(1,5,1),(2,1,1),(2,2,1),(2,3,1),(2,4,1),(2,5,1),(3,1,1),(3,2,1),(3,3,1),(3,4,1),(3,5,1),(4,1,1),(4,2,1),(4,3,1),(4,4,1),(4,5,1),(5,1,1),(5,2,1),(5,3,1),(5,4,1),(5,5,1),(6,1,1),(6,2,1),(6,3,1),(6,4,1),(6,5,1);
/*!40000 ALTER TABLE `ps_staticblock_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_statssearch` WRITE;
/*!40000 ALTER TABLE `ps_statssearch` DISABLE KEYS */;
INSERT INTO `ps_statssearch` VALUES (1,1,1,'sdfsdf',0,'2013-06-26 16:10:08'),(2,1,1,'cur',25,'2013-07-10 17:00:40'),(3,1,1,'cur',25,'2013-07-10 17:04:04'),(4,1,1,'cur',25,'2013-07-10 17:06:53'),(5,1,1,'cur',25,'2013-07-10 17:08:38'),(6,1,1,'cur',25,'2013-07-10 17:09:58'),(7,1,1,'cur',25,'2013-07-10 17:10:33'),(8,1,1,'cur',25,'2013-07-10 17:11:15'),(9,1,1,'cur',25,'2013-07-10 17:12:24'),(10,1,1,'cur',25,'2013-07-10 17:12:56'),(11,1,1,'cur',25,'2013-07-10 17:13:07'),(12,1,1,'nean',0,'2013-07-10 17:13:36'),(13,1,1,'venen',25,'2013-07-10 17:14:02'),(14,1,1,'venen',25,'2013-07-10 17:15:29'),(15,1,1,'search entire store here...',0,'2013-07-15 14:31:26'),(16,1,1,'posuere',20,'2013-07-16 13:47:01'),(17,1,1,'eros suspendisse',20,'2013-07-16 14:01:44'),(18,1,1,'eros suspendisse',20,'2013-07-16 14:02:54'),(19,1,1,'eros suspendisse',20,'2013-07-16 14:05:06'),(20,1,1,'nam ',1,'2013-07-16 14:05:34'),(21,1,1,'eros suspendisse',20,'2013-07-16 14:05:46'),(22,1,1,'nam',1,'2013-07-16 14:05:55'),(23,1,1,'nam',1,'2013-07-16 14:06:22'),(24,1,1,'eros suspendisse',20,'2013-07-16 14:06:45'),(25,1,1,'eros suspendisse',20,'2013-07-16 14:07:29'),(26,1,1,'nam',1,'2013-07-16 14:07:39'),(27,1,1,'nam',1,'2013-07-16 14:08:37'),(28,1,1,'eros suspendisse',20,'2013-07-16 14:08:45'),(29,1,1,'eros suspendisse',20,'2013-07-16 14:09:13'),(30,1,1,'eros suspendisse',20,'2013-07-16 14:11:45'),(31,1,1,'eros suspendisse',20,'2013-07-16 14:12:20'),(32,1,1,'eros suspendisse',20,'2013-07-16 14:13:07'),(33,1,1,'eros suspendisse',20,'2013-07-16 14:14:33');
/*!40000 ALTER TABLE `ps_statssearch` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_stock` WRITE;
/*!40000 ALTER TABLE `ps_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_stock` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_stock_available` WRITE;
/*!40000 ALTER TABLE `ps_stock_available` DISABLE KEYS */;
INSERT INTO `ps_stock_available` VALUES (35,1,0,1,0,0,0,0),(36,2,0,1,0,0,0,0),(37,3,0,1,0,0,0,0),(38,5,0,1,0,0,0,0),(39,8,0,1,0,579,0,2),(48,8,28,1,0,123,0,2),(49,8,29,1,0,456,0,2),(50,17,0,1,0,567,0,2),(51,17,30,1,0,456,0,2),(52,17,31,1,0,111,0,2),(53,18,0,1,0,254,0,2),(54,18,32,1,0,254,0,2),(55,18,33,1,0,0,0,2),(56,19,0,1,0,292,0,2),(57,19,34,1,0,145,0,2),(58,19,35,1,0,147,0,2),(59,20,0,1,0,344,0,2),(60,20,36,1,0,221,0,2),(61,20,37,1,0,123,0,2),(62,21,0,1,0,154,0,2),(63,21,38,1,0,122,0,2),(64,21,39,1,0,32,0,2),(65,22,0,1,0,145,0,2),(66,22,40,1,0,145,0,2),(67,22,41,1,0,0,0,2),(68,23,0,1,0,358,0,2),(69,23,42,1,0,144,0,2),(70,23,43,1,0,214,0,2),(71,24,0,1,0,155,0,2),(72,24,44,1,0,32,0,2),(73,24,45,1,0,123,0,2),(74,25,0,1,0,776,0,2),(75,25,46,1,0,233,0,2),(76,25,47,1,0,543,0,2),(77,26,0,1,0,267,0,2),(78,26,48,1,0,144,0,2),(79,26,49,1,0,123,0,2),(80,27,0,1,0,54,0,2),(81,27,50,1,0,54,0,2),(82,27,51,1,0,0,0,2),(83,28,0,1,0,0,0,2),(84,28,52,1,0,0,0,2),(85,28,53,1,0,0,0,2),(86,29,0,1,0,574,0,2),(87,29,54,1,0,31,0,2),(88,29,55,1,0,543,0,2),(89,30,0,1,0,97,0,2),(90,30,56,1,0,54,0,2),(91,30,57,1,0,43,0,2),(92,31,0,1,0,455,0,2),(93,31,58,1,0,433,0,2),(94,31,59,1,0,22,0,2),(95,32,0,1,0,66,0,2),(96,32,60,1,0,33,0,2),(97,32,61,1,0,33,0,2),(98,33,0,1,0,0,0,2),(99,33,62,1,0,0,0,2),(100,33,63,1,0,0,0,2),(101,34,0,1,0,0,0,2),(102,34,64,1,0,0,0,2),(103,34,65,1,0,0,0,2),(104,35,0,1,0,0,0,2),(105,35,66,1,0,0,0,2),(106,35,67,1,0,0,0,2),(107,36,0,1,0,0,0,2),(108,36,68,1,0,0,0,2),(109,36,69,1,0,0,0,2),(110,37,0,1,0,0,0,2),(111,37,70,1,0,0,0,2),(112,37,71,1,0,0,0,2),(113,38,0,1,0,0,0,2),(114,38,72,1,0,0,0,2),(115,38,73,1,0,0,0,2),(116,39,0,1,0,0,0,2),(117,39,74,1,0,0,0,2),(118,39,75,1,0,0,0,2),(119,40,0,1,0,0,0,2),(120,40,76,1,0,0,0,2),(121,40,77,1,0,0,0,2),(122,41,0,1,0,0,0,2),(123,41,78,1,0,0,0,2),(124,41,79,1,0,0,0,2),(125,42,0,1,0,0,0,2),(126,42,80,1,0,0,0,2),(127,42,81,1,0,0,0,2),(128,43,0,1,0,0,0,2),(129,43,82,1,0,0,0,2),(130,43,83,1,0,0,0,2);
/*!40000 ALTER TABLE `ps_stock_available` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_stock_mvt` WRITE;
/*!40000 ALTER TABLE `ps_stock_mvt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_stock_mvt` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_stock_mvt_reason` WRITE;
/*!40000 ALTER TABLE `ps_stock_mvt_reason` DISABLE KEYS */;
INSERT INTO `ps_stock_mvt_reason` VALUES (1,1,'2013-06-18 03:23:33','2013-06-18 03:23:33',0),(2,-1,'2013-06-18 03:23:33','2013-06-18 03:23:33',0),(3,-1,'2013-06-18 03:23:33','2013-06-18 03:23:33',0),(4,-1,'2013-06-18 03:23:33','2013-06-18 03:23:33',0),(5,1,'2013-06-18 03:23:33','2013-06-18 03:23:33',0),(6,-1,'2013-06-18 03:23:33','2013-06-18 03:23:33',0),(7,1,'2013-06-18 03:23:33','2013-06-18 03:23:33',0),(8,1,'2013-06-18 03:23:33','2013-06-18 03:23:33',0);
/*!40000 ALTER TABLE `ps_stock_mvt_reason` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_stock_mvt_reason_lang` WRITE;
/*!40000 ALTER TABLE `ps_stock_mvt_reason_lang` DISABLE KEYS */;
INSERT INTO `ps_stock_mvt_reason_lang` VALUES (1,1,'Increase'),(1,2,'Increase'),(2,1,'Decrease'),(2,2,'Decrease'),(3,1,'Customer Order'),(3,2,'Customer Order'),(4,1,'Regulation following an inventory of stock'),(4,2,'Regulation following an inventory of stock'),(5,1,'Regulation following an inventory of stock'),(5,2,'Regulation following an inventory of stock'),(6,1,'Transfer to another warehouse'),(6,2,'Transfer to another warehouse'),(7,1,'Transfer from another warehouse'),(7,2,'Transfer from another warehouse'),(8,1,'Supply Order'),(8,2,'Supply Order');
/*!40000 ALTER TABLE `ps_stock_mvt_reason_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_store` WRITE;
/*!40000 ALTER TABLE `ps_store` DISABLE KEYS */;
INSERT INTO `ps_store` VALUES (1,21,9,'Dade County','3030 SW 8th St Miami','','Miami',' 33135',25.76500500,-80.24379700,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',1,'2013-06-18 03:25:02','2013-06-18 03:25:02'),(2,21,9,'E Fort Lauderdale','1000 Northeast 4th Ave Fort Lauderdale','','Miami',' 33304',26.13793600,-80.13943500,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',1,'2013-06-18 03:25:03','2013-06-18 03:25:03'),(3,21,9,'Pembroke Pines','11001 Pines Blvd Pembroke Pines','','Miami','33026',26.00998700,-80.29447200,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',1,'2013-06-18 03:25:03','2013-06-18 03:25:03'),(4,21,9,'Coconut Grove','2999 SW 32nd Avenue','','Miami',' 33133',25.73629600,-80.24479700,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',1,'2013-06-18 03:25:03','2013-06-18 03:25:03'),(5,21,9,'N Miami/Biscayne','12055 Biscayne Blvd','','Miami','33181',25.88674000,-80.16329200,'a:7:{i:0;s:13:\"09:00 - 19:00\";i:1;s:13:\"09:00 - 19:00\";i:2;s:13:\"09:00 - 19:00\";i:3;s:13:\"09:00 - 19:00\";i:4;s:13:\"09:00 - 19:00\";i:5;s:13:\"10:00 - 16:00\";i:6;s:13:\"10:00 - 16:00\";}','','','','',1,'2013-06-18 03:25:03','2013-06-18 03:25:03');
/*!40000 ALTER TABLE `ps_store` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_store_shop` WRITE;
/*!40000 ALTER TABLE `ps_store_shop` DISABLE KEYS */;
INSERT INTO `ps_store_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5);
/*!40000 ALTER TABLE `ps_store_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_supplier` WRITE;
/*!40000 ALTER TABLE `ps_supplier` DISABLE KEYS */;
INSERT INTO `ps_supplier` VALUES (1,'AppleStore','2013-06-18 03:24:45','2013-06-18 03:24:45',1),(2,'Shure Online Store','2013-06-18 03:24:45','2013-06-18 03:24:45',1);
/*!40000 ALTER TABLE `ps_supplier` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_supplier_lang` WRITE;
/*!40000 ALTER TABLE `ps_supplier_lang` DISABLE KEYS */;
INSERT INTO `ps_supplier_lang` VALUES (1,1,'','','',''),(1,2,'','','',''),(2,1,'','','',''),(2,2,'','','','');
/*!40000 ALTER TABLE `ps_supplier_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_supplier_shop` WRITE;
/*!40000 ALTER TABLE `ps_supplier_shop` DISABLE KEYS */;
INSERT INTO `ps_supplier_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5);
/*!40000 ALTER TABLE `ps_supplier_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_supply_order` WRITE;
/*!40000 ALTER TABLE `ps_supply_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_supply_order` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_supply_order_detail` WRITE;
/*!40000 ALTER TABLE `ps_supply_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_supply_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_supply_order_history` WRITE;
/*!40000 ALTER TABLE `ps_supply_order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_supply_order_history` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_supply_order_receipt_history` WRITE;
/*!40000 ALTER TABLE `ps_supply_order_receipt_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_supply_order_receipt_history` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_supply_order_state` WRITE;
/*!40000 ALTER TABLE `ps_supply_order_state` DISABLE KEYS */;
INSERT INTO `ps_supply_order_state` VALUES (1,0,1,0,0,0,'#faab00'),(2,1,0,0,0,0,'#273cff'),(3,0,0,0,1,0,'#ff37f5'),(4,0,0,1,1,0,'#ff3e33'),(5,0,0,1,0,1,'#00d60c'),(6,0,0,0,0,1,'#666666');
/*!40000 ALTER TABLE `ps_supply_order_state` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_supply_order_state_lang` WRITE;
/*!40000 ALTER TABLE `ps_supply_order_state_lang` DISABLE KEYS */;
INSERT INTO `ps_supply_order_state_lang` VALUES (1,1,'1 - Creation in progress'),(1,2,'1 - Creation in progress'),(2,1,'2 - Order validated'),(2,2,'2 - Order validated'),(3,1,'3 - Pending receipt'),(3,2,'3 - Pending receipt'),(4,1,'4 - Order received in part'),(4,2,'4 - Order received in part'),(5,1,'5 - Order received completely'),(5,2,'5 - Order received completely'),(6,1,'6 - Order canceled'),(6,2,'6 - Order canceled');
/*!40000 ALTER TABLE `ps_supply_order_state_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_tab` WRITE;
/*!40000 ALTER TABLE `ps_tab` DISABLE KEYS */;
INSERT INTO `ps_tab` VALUES (1,-1,'AdminHome','',0,1),(2,-1,'AdminCms','',1,1),(3,-1,'AdminCmsCategories','',2,1),(4,-1,'AdminAttributeGenerator','',3,1),(5,-1,'AdminSearch','',4,1),(6,-1,'AdminLogin','',5,1),(7,-1,'AdminShop','',6,1),(8,-1,'AdminShopUrl','',7,1),(9,0,'AdminCatalog','',0,1),(10,0,'AdminParentOrders','',1,1),(11,0,'AdminParentCustomer','',2,1),(12,0,'AdminPriceRule','',3,1),(13,0,'AdminParentShipping','',4,1),(14,0,'AdminParentLocalization','',5,1),(15,0,'AdminParentModules','',6,1),(16,0,'AdminParentPreferences','',7,1),(17,0,'AdminTools','',8,1),(18,0,'AdminAdmin','',9,1),(19,0,'AdminParentStats','',10,1),(20,0,'AdminStock','',11,1),(21,9,'AdminProducts','',0,1),(22,9,'AdminCategories','',1,1),(23,9,'AdminTracking','',2,1),(24,9,'AdminAttributesGroups','',3,1),(25,9,'AdminFeatures','',4,1),(26,9,'AdminManufacturers','',5,1),(27,9,'AdminSuppliers','',6,1),(28,9,'AdminScenes','',7,1),(29,9,'AdminTags','',8,1),(30,9,'AdminAttachments','',9,1),(31,10,'AdminOrders','',0,1),(32,10,'AdminInvoices','',1,1),(33,10,'AdminReturn','',2,1),(34,10,'AdminDeliverySlip','',3,1),(35,10,'AdminSlip','',4,1),(36,10,'AdminStatuses','',5,1),(37,10,'AdminOrderMessage','',6,1),(38,11,'AdminCustomers','',0,1),(39,11,'AdminAddresses','',1,1),(40,11,'AdminGroups','',2,1),(41,11,'AdminCarts','',3,1),(42,11,'AdminCustomerThreads','',4,1),(43,11,'AdminContacts','',5,1),(44,11,'AdminGenders','',6,1),(45,11,'AdminOutstanding','',7,0),(46,12,'AdminCartRules','',0,1),(47,12,'AdminSpecificPriceRule','',1,1),(48,12,'AdminMarketing','',2,1),(49,13,'AdminShipping','',0,1),(50,13,'AdminCarriers','',1,1),(51,13,'AdminRangePrice','',2,1),(52,13,'AdminRangeWeight','',3,1),(53,14,'AdminLocalization','',0,1),(54,14,'AdminLanguages','',1,1),(55,14,'AdminZones','',2,1),(56,14,'AdminCountries','',3,1),(57,14,'AdminStates','',4,1),(58,14,'AdminCurrencies','',5,1),(59,14,'AdminTaxes','',6,1),(60,14,'AdminTaxRulesGroup','',7,1),(61,14,'AdminTranslations','',8,1),(62,15,'AdminModules','',0,1),(63,15,'AdminAddonsCatalog','',1,1),(64,15,'AdminModulesPositions','',2,1),(65,15,'AdminPayment','',3,1),(66,16,'AdminPreferences','',0,1),(67,16,'AdminOrderPreferences','',1,1),(68,16,'AdminPPreferences','',2,1),(69,16,'AdminCustomerPreferences','',3,1),(70,16,'AdminThemes','',4,1),(71,16,'AdminMeta','',5,1),(72,16,'AdminCmsContent','',6,1),(73,16,'AdminImages','',7,1),(74,16,'AdminStores','',8,1),(75,16,'AdminSearchConf','',9,1),(76,16,'AdminMaintenance','',10,1),(77,16,'AdminGeolocation','',11,1),(78,17,'AdminInformation','',0,1),(79,17,'AdminPerformance','',1,1),(80,17,'AdminEmails','',2,1),(81,17,'AdminShopGroup','',3,1),(82,17,'AdminImport','',4,1),(83,17,'AdminBackup','',5,1),(84,17,'AdminRequestSql','',6,1),(85,17,'AdminLogs','',7,1),(86,17,'AdminWebservice','',8,1),(87,18,'AdminAdminPreferences','',0,1),(88,18,'AdminQuickAccesses','',1,1),(89,18,'AdminEmployees','',2,1),(90,18,'AdminProfiles','',3,1),(91,18,'AdminAccess','',4,1),(92,18,'AdminTabs','',5,1),(93,19,'AdminStats','',0,1),(94,19,'AdminSearchEngines','',1,1),(95,19,'AdminReferrers','',2,1),(96,20,'AdminWarehouses','',0,1),(97,20,'AdminStockManagement','',1,1),(98,20,'AdminStockMvt','',2,1),(99,20,'AdminStockInstantState','',3,1),(100,20,'AdminStockCover','',4,1),(101,20,'AdminSupplyOrders','',5,1),(102,20,'AdminStockConfiguration','',6,1),(103,18,'AdminGamification','gamification',6,1);
/*!40000 ALTER TABLE `ps_tab` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_tab_lang` WRITE;
/*!40000 ALTER TABLE `ps_tab_lang` DISABLE KEYS */;
INSERT INTO `ps_tab_lang` VALUES (1,1,'Home'),(1,2,'Home'),(2,1,'CMS Pages'),(2,2,'CMS Pages'),(3,1,'CMS Categories'),(3,2,'CMS Categories'),(4,1,'Combinations Generator'),(4,2,'Combinations Generator'),(5,1,'Search'),(5,2,'Search'),(6,1,'Login'),(6,2,'Login'),(7,1,'Shops'),(7,2,'Shops'),(8,1,'Shop URLs'),(8,2,'Shop URLs'),(9,1,'Catalog'),(9,2,'Catalog'),(10,1,'Orders'),(10,2,'Orders'),(11,1,'Customers'),(11,2,'Customers'),(12,1,'Price Rules'),(12,2,'Price Rules'),(13,1,'Shipping'),(13,2,'Shipping'),(14,1,'Localization'),(14,2,'Localization'),(15,1,'Modules'),(15,2,'Modules'),(16,1,'Preferences'),(16,2,'Preferences'),(17,1,'Advanced Parameters'),(17,2,'Advanced Parameters'),(18,1,'Administration'),(18,2,'Administration'),(19,1,'Stats'),(19,2,'Stats'),(20,1,'Stock'),(20,2,'Stock'),(21,1,'Products'),(21,2,'Products'),(22,1,'Categories'),(22,2,'Categories'),(23,1,'Monitoring'),(23,2,'Monitoring'),(24,1,'Attributes and Values'),(24,2,'Attributes and Values'),(25,1,'Features'),(25,2,'Features'),(26,1,'Manufacturers'),(26,2,'Manufacturers'),(27,1,'Suppliers'),(27,2,'Suppliers'),(28,1,'Image Mapping'),(28,2,'Image Mapping'),(29,1,'Tags'),(29,2,'Tags'),(30,1,'Attachments'),(30,2,'Attachments'),(31,1,'Orders'),(31,2,'Orders'),(32,1,'Invoices'),(32,2,'Invoices'),(33,1,'Merchandise Returns'),(33,2,'Merchandise Returns'),(34,1,'Delivery Slips'),(34,2,'Delivery Slips'),(35,1,'Credit Slips'),(35,2,'Credit Slips'),(36,1,'Statuses'),(36,2,'Statuses'),(37,1,'Order Messages'),(37,2,'Order Messages'),(38,1,'Customers'),(38,2,'Customers'),(39,1,'Addresses'),(39,2,'Addresses'),(40,1,'Groups'),(40,2,'Groups'),(41,1,'Shopping Carts'),(41,2,'Shopping Carts'),(42,1,'Customer Service'),(42,2,'Customer Service'),(43,1,'Contacts'),(43,2,'Contacts'),(44,1,'Titles'),(44,2,'Titles'),(45,1,'Outstanding'),(45,2,'Outstanding'),(46,1,'Cart Rules'),(46,2,'Cart Rules'),(47,1,'Catalog Price Rules'),(47,2,'Catalog Price Rules'),(48,1,'Marketing'),(48,2,'Marketing'),(49,1,'Shipping'),(49,2,'Shipping'),(50,1,'Carriers'),(50,2,'Carriers'),(51,1,'Price Ranges'),(51,2,'Price Ranges'),(52,1,'Weight Ranges'),(52,2,'Weight Ranges'),(53,1,'Localization'),(53,2,'Localization'),(54,1,'Languages'),(54,2,'Languages'),(55,1,'Zones'),(55,2,'Zones'),(56,1,'Countries'),(56,2,'Countries'),(57,1,'States'),(57,2,'States'),(58,1,'Currencies'),(58,2,'Currencies'),(59,1,'Taxes'),(59,2,'Taxes'),(60,1,'Tax Rules'),(60,2,'Tax Rules'),(61,1,'Translations'),(61,2,'Translations'),(62,1,'Modules'),(62,2,'Modules'),(63,1,'Modules & Themes Catalog'),(63,2,'Modules & Themes Catalog'),(64,1,'Positions'),(64,2,'Positions'),(65,1,'Payment'),(65,2,'Payment'),(66,1,'General'),(66,2,'General'),(67,1,'Orders'),(67,2,'Orders'),(68,1,'Products'),(68,2,'Products'),(69,1,'Customers'),(69,2,'Customers'),(70,1,'Themes'),(70,2,'Themes'),(71,1,'SEO & URLs'),(71,2,'SEO & URLs'),(72,1,'CMS'),(72,2,'CMS'),(73,1,'Images'),(73,2,'Images'),(74,1,'Store Contacts'),(74,2,'Store Contacts'),(75,1,'Search'),(75,2,'Search'),(76,1,'Maintenance'),(76,2,'Maintenance'),(77,1,'Geolocation'),(77,2,'Geolocation'),(78,1,'Configuration Information'),(78,2,'Configuration Information'),(79,1,'Performance'),(79,2,'Performance'),(80,1,'E-mail'),(80,2,'E-mail'),(81,1,'Multistore'),(81,2,'Multistore'),(82,1,'CSV Import'),(82,2,'CSV Import'),(83,1,'DB Backup'),(83,2,'DB Backup'),(84,1,'SQL Manager'),(84,2,'SQL Manager'),(85,1,'Logs'),(85,2,'Logs'),(86,1,'Webservice'),(86,2,'Webservice'),(87,1,'Preferences'),(87,2,'Preferences'),(88,1,'Quick Access'),(88,2,'Quick Access'),(89,1,'Employees'),(89,2,'Employees'),(90,1,'Profiles'),(90,2,'Profiles'),(91,1,'Permissions'),(91,2,'Permissions'),(92,1,'Menus'),(92,2,'Menus'),(93,1,'Stats'),(93,2,'Stats'),(94,1,'Search Engines'),(94,2,'Search Engines'),(95,1,'Referrers'),(95,2,'Referrers'),(96,1,'Warehouses'),(96,2,'Warehouses'),(97,1,'Stock Management'),(97,2,'Stock Management'),(98,1,'Stock Movement'),(98,2,'Stock Movement'),(99,1,'Instant Stock Status'),(99,2,'Instant Stock Status'),(100,1,'Stock Coverage'),(100,2,'Stock Coverage'),(101,1,'Supply orders'),(101,2,'Supply orders'),(102,1,'Configuration'),(102,2,'Configuration'),(103,1,'Merchant Expertise'),(103,2,'Merchant Expertise');
/*!40000 ALTER TABLE `ps_tab_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_tab_module_preference` WRITE;
/*!40000 ALTER TABLE `ps_tab_module_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_tab_module_preference` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_tag` WRITE;
/*!40000 ALTER TABLE `ps_tag` DISABLE KEYS */;
INSERT INTO `ps_tag` VALUES (7,1,'aucibus'),(8,1,'in curae ante'),(9,1,'cubilia aenean'),(10,1,'posuere'),(11,1,'luctus'),(12,1,'eros suspendisse'),(13,1,'suspendisse'),(14,1,'primis orci sollicitudin'),(15,1,'nec ante cubilia'),(16,1,'aenean posuere');
/*!40000 ALTER TABLE `ps_tag` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_tax` WRITE;
/*!40000 ALTER TABLE `ps_tax` DISABLE KEYS */;
INSERT INTO `ps_tax` VALUES (1,4.000,1,0),(2,0.000,1,0),(3,6.600,1,0),(4,6.000,1,0),(5,8.250,1,0),(6,2.900,1,0),(7,0.000,1,0),(8,0.000,1,0),(9,6.000,1,0),(10,4.000,1,0),(11,4.000,1,0),(12,6.000,1,0),(13,6.250,1,0),(14,7.000,1,0),(15,6.000,1,0),(16,5.300,1,0),(17,6.000,1,0),(18,4.000,1,0),(19,5.000,1,0),(20,6.000,1,0),(21,6.250,1,0),(22,6.000,1,0),(23,6.875,1,0),(24,7.000,1,0),(25,4.225,1,0),(26,0.000,1,0),(27,5.500,1,0),(28,6.850,1,0),(29,0.000,1,0),(30,7.000,1,0),(31,5.125,1,0),(32,4.000,1,0),(33,5.500,1,0),(34,5.000,1,0),(35,5.500,1,0),(36,4.500,1,0),(37,0.000,1,0),(38,6.000,1,0),(39,7.000,1,0),(40,6.000,1,0),(41,4.000,1,0),(42,7.000,1,0),(43,6.250,1,0),(44,4.750,1,0),(45,6.000,1,0),(46,4.000,1,0),(47,6.500,1,0),(48,6.000,1,0),(49,5.000,1,0),(50,4.000,1,0),(51,5.500,1,0),(52,6.000,1,0);
/*!40000 ALTER TABLE `ps_tax` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_tax_lang` WRITE;
/*!40000 ALTER TABLE `ps_tax_lang` DISABLE KEYS */;
INSERT INTO `ps_tax_lang` VALUES (1,1,'Sales-taxes US-AL 4%'),(1,2,'Sales-taxes US-AL 4%'),(2,1,'Sales-taxes US-AK 0%'),(2,2,'Sales-taxes US-AK 0%'),(3,1,'Sales-taxes US-AZ 6.6%'),(3,2,'Sales-taxes US-AZ 6.6%'),(4,1,'Sales-taxes US-AR 6%'),(4,2,'Sales-taxes US-AR 6%'),(5,1,'Sales-taxes US-CA 8.25%'),(5,2,'Sales-taxes US-CA 8.25%'),(6,1,'Sales-taxes US-CO 2.9%'),(6,2,'Sales-taxes US-CO 2.9%'),(7,1,'Sales-taxes US-CT 0%'),(7,2,'Sales-taxes US-CT 0%'),(8,1,'Sales-taxes US-DE 0%'),(8,2,'Sales-taxes US-DE 0%'),(9,1,'Sales-taxes US-FL 6%'),(9,2,'Sales-taxes US-FL 6%'),(10,1,'Sales-taxes US-GA 4%'),(10,2,'Sales-taxes US-GA 4%'),(11,1,'Sales-taxes US-HI 4%'),(11,2,'Sales-taxes US-HI 4%'),(12,1,'Sales-taxes US-ID 6%'),(12,2,'Sales-taxes US-ID 6%'),(13,1,'Sales-taxes US-IL 6.25%'),(13,2,'Sales-taxes US-IL 6.25%'),(14,1,'Sales-taxes US-IN 7%'),(14,2,'Sales-taxes US-IN 7%'),(15,1,'Sales-taxes US-IA 6%'),(15,2,'Sales-taxes US-IA 6%'),(16,1,'Sales-taxes US-KS 5.3%'),(16,2,'Sales-taxes US-KS 5.3%'),(17,1,'Sales-taxes US-KY 6%'),(17,2,'Sales-taxes US-KY 6%'),(18,1,'Sales-taxes US-LA 4%'),(18,2,'Sales-taxes US-LA 4%'),(19,1,'Sales-taxes US-ME 5%'),(19,2,'Sales-taxes US-ME 5%'),(20,1,'Sales-taxes US-MD 6%'),(20,2,'Sales-taxes US-MD 6%'),(21,1,'Sales-taxes US-MA 6.25%'),(21,2,'Sales-taxes US-MA 6.25%'),(22,1,'Sales-taxes US-MI 6%'),(22,2,'Sales-taxes US-MI 6%'),(23,1,'Sales-taxes US-MN 6.875%'),(23,2,'Sales-taxes US-MN 6.875%'),(24,1,'Sales-taxes US-MS 7%'),(24,2,'Sales-taxes US-MS 7%'),(25,1,'Sales-taxes US-MO 4.225%'),(25,2,'Sales-taxes US-MO 4.225%'),(26,1,'Sales-taxes US-MT 0.0%'),(26,2,'Sales-taxes US-MT 0.0%'),(27,1,'Sales-taxes US-NE 5.5%'),(27,2,'Sales-taxes US-NE 5.5%'),(28,1,'Sales-taxes US-NV 6.85%'),(28,2,'Sales-taxes US-NV 6.85%'),(29,1,'Sales-taxes US-NH 0%'),(29,2,'Sales-taxes US-NH 0%'),(30,1,'Sales-taxes US-NJ 7%'),(30,2,'Sales-taxes US-NJ 7%'),(31,1,'Sales-taxes US-NM 5.125%'),(31,2,'Sales-taxes US-NM 5.125%'),(32,1,'Sales-taxes US-NY 4%'),(32,2,'Sales-taxes US-NY 4%'),(33,1,'Sales-taxes US-NC 5.5%'),(33,2,'Sales-taxes US-NC 5.5%'),(34,1,'Sales-taxes US-ND 5%'),(34,2,'Sales-taxes US-ND 5%'),(35,1,'Sales-taxes US-OH 5.5%'),(35,2,'Sales-taxes US-OH 5.5%'),(36,1,'Sales-taxes US-OK 4.5%'),(36,2,'Sales-taxes US-OK 4.5%'),(37,1,'Sales-taxes US-OR 0%'),(37,2,'Sales-taxes US-OR 0%'),(38,1,'Sales-taxes US-PA 6%'),(38,2,'Sales-taxes US-PA 6%'),(39,1,'Sales-taxes US-RI 7%'),(39,2,'Sales-taxes US-RI 7%'),(40,1,'Sales-taxes US-SC 6%'),(40,2,'Sales-taxes US-SC 6%'),(41,1,'Sales-taxes US-SD 4%'),(41,2,'Sales-taxes US-SD 4%'),(42,1,'Sales-taxes US-TN 7%'),(42,2,'Sales-taxes US-TN 7%'),(43,1,'Sales-taxes US-TX 6.25%'),(43,2,'Sales-taxes US-TX 6.25%'),(44,1,'Sales-taxes US-UT 4.75%'),(44,2,'Sales-taxes US-UT 4.75%'),(45,1,'Sales-taxes US-VT 6%'),(45,2,'Sales-taxes US-VT 6%'),(46,1,'Sales-taxes US-VA 4%'),(46,2,'Sales-taxes US-VA 4%'),(47,1,'Sales-taxes US-WA 6.5%'),(47,2,'Sales-taxes US-WA 6.5%'),(48,1,'Sales-taxes US-WV 6%'),(48,2,'Sales-taxes US-WV 6%'),(49,1,'Sales-taxes US-WI 5%'),(49,2,'Sales-taxes US-WI 5%'),(50,1,'Sales-taxes US-WY 4%'),(50,2,'Sales-taxes US-WY 4%'),(51,1,'Sales-taxes US-PR 5.5%'),(51,2,'Sales-taxes US-PR 5.5%'),(52,1,'Sales-taxes US-DC 6%'),(52,2,'Sales-taxes US-DC 6%');
/*!40000 ALTER TABLE `ps_tax_lang` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_tax_rule` WRITE;
/*!40000 ALTER TABLE `ps_tax_rule` DISABLE KEYS */;
INSERT INTO `ps_tax_rule` VALUES (1,1,21,1,'0','0',1,1,''),(2,2,21,2,'0','0',2,1,''),(3,3,21,3,'0','0',3,1,''),(4,4,21,4,'0','0',4,1,''),(5,5,21,5,'0','0',5,1,''),(6,6,21,6,'0','0',6,1,''),(7,7,21,7,'0','0',7,1,''),(8,8,21,8,'0','0',8,1,''),(9,9,21,9,'0','0',9,1,''),(10,10,21,10,'0','0',10,1,''),(11,11,21,11,'0','0',11,1,''),(12,12,21,12,'0','0',12,1,''),(13,13,21,13,'0','0',13,1,''),(14,14,21,14,'0','0',14,1,''),(15,15,21,15,'0','0',15,1,''),(16,16,21,16,'0','0',16,1,''),(17,17,21,17,'0','0',17,1,''),(18,18,21,18,'0','0',18,1,''),(19,19,21,19,'0','0',19,1,''),(20,20,21,20,'0','0',20,1,''),(21,21,21,21,'0','0',21,1,''),(22,22,21,22,'0','0',22,1,''),(23,23,21,23,'0','0',23,1,''),(24,24,21,24,'0','0',24,1,''),(25,25,21,25,'0','0',25,1,''),(26,26,21,26,'0','0',26,1,''),(27,27,21,27,'0','0',27,1,''),(28,28,21,28,'0','0',28,1,''),(29,29,21,29,'0','0',29,1,''),(30,30,21,30,'0','0',30,1,''),(31,31,21,31,'0','0',31,1,''),(32,32,21,32,'0','0',32,1,''),(33,33,21,33,'0','0',33,1,''),(34,34,21,34,'0','0',34,1,''),(35,35,21,35,'0','0',35,1,''),(36,36,21,36,'0','0',36,1,''),(37,37,21,37,'0','0',37,1,''),(38,38,21,38,'0','0',38,1,''),(39,39,21,39,'0','0',39,1,''),(40,40,21,40,'0','0',40,1,''),(41,41,21,41,'0','0',41,1,''),(42,42,21,42,'0','0',42,1,''),(43,43,21,43,'0','0',43,1,''),(44,44,21,44,'0','0',44,1,''),(45,45,21,45,'0','0',45,1,''),(46,46,21,46,'0','0',46,1,''),(47,47,21,47,'0','0',47,1,''),(48,48,21,48,'0','0',48,1,''),(49,49,21,49,'0','0',49,1,''),(50,50,21,50,'0','0',50,1,''),(51,51,21,51,'0','0',51,1,''),(52,52,21,53,'0','0',52,1,'');
/*!40000 ALTER TABLE `ps_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_tax_rules_group` WRITE;
/*!40000 ALTER TABLE `ps_tax_rules_group` DISABLE KEYS */;
INSERT INTO `ps_tax_rules_group` VALUES (1,'US-AL Rate (4%)',1),(2,'US-AK Rate (0%)',1),(3,'US-AZ Rate (6.6%)',1),(4,'US-AR Rate (6%)',1),(5,'US-CA Rate (8.25%)',1),(6,'US-CO Rate (2.9%)',1),(7,'US-CT Rate (0%)',1),(8,'US-DE Rate (0%)',1),(9,'US-FL Rate (6%)',1),(10,'US-GA Rate (4%)',1),(11,'US-HI Rate (4%)',1),(12,'US-ID Rate (6%)',1),(13,'US-IL Rate (6.25%)',1),(14,'US-IN Rate (7%)',1),(15,'US-IA Rate (6%)',1),(16,'US-KS Rate (5.3%)',1),(17,'US-KY Rate (6%)',1),(18,'US-LA Rate (4%)',1),(19,'US-ME Rate (5%)',1),(20,'US-MD Rate (6%)',1),(21,'US-MA Rate (6.25%)',1),(22,'US-MI Rate (6%)',1),(23,'US-MN Rate (6.875%)',1),(24,'US-MS Rate (7%)',1),(25,'US-MO Rate (4.225%)',1),(26,'US-MT Rate (0%)',1),(27,'US-NE Rate (5.5%)',1),(28,'US-NV Rate (6.85%)',1),(29,'US-NH Rate (0%)',1),(30,'US-NJ Rate (7%)',1),(31,'US-NM Rate (5.125%)',1),(32,'US-NY Rate (4%)',1),(33,'US-NC Rate (5.5%)',1),(34,'US-ND Rate (5%)',1),(35,'US-OH Rate (5.5%)',1),(36,'US-OK Rate (4.5%)',1),(37,'US-OR Rate (0%)',1),(38,'US-PA Rate (6%)',1),(39,'US-RI Rate (7%)',1),(40,'US-SC Rate (6%)',1),(41,'US-SD Rate (4%)',1),(42,'US-TN Rate (7%)',1),(43,'US-TX Rate (6.25%)',1),(44,'US-UT Rate (4.75%)',1),(45,'US-VT Rate (6%)',1),(46,'US-VA Rate (4%)',1),(47,'US-WA Rate (6.5%)',1),(48,'US-WV Rate (6%)',1),(49,'US-WI Rate (5%)',1),(50,'US-WY Rate (4%)',1),(51,'US-PR Rate (5.5%)',1),(52,'US-DC Rate (6%)',1);
/*!40000 ALTER TABLE `ps_tax_rules_group` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_tax_rules_group_shop` WRITE;
/*!40000 ALTER TABLE `ps_tax_rules_group_shop` DISABLE KEYS */;
INSERT INTO `ps_tax_rules_group_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(7,1),(7,2),(7,3),(7,4),(7,5),(8,1),(8,2),(8,3),(8,4),(8,5),(9,1),(9,2),(9,3),(9,4),(9,5),(10,1),(10,2),(10,3),(10,4),(10,5),(11,1),(11,2),(11,3),(11,4),(11,5),(12,1),(12,2),(12,3),(12,4),(12,5),(13,1),(13,2),(13,3),(13,4),(13,5),(14,1),(14,2),(14,3),(14,4),(14,5),(15,1),(15,2),(15,3),(15,4),(15,5),(16,1),(16,2),(16,3),(16,4),(16,5),(17,1),(17,2),(17,3),(17,4),(17,5),(18,1),(18,2),(18,3),(18,4),(18,5),(19,1),(19,2),(19,3),(19,4),(19,5),(20,1),(20,2),(20,3),(20,4),(20,5),(21,1),(21,2),(21,3),(21,4),(21,5),(22,1),(22,2),(22,3),(22,4),(22,5),(23,1),(23,2),(23,3),(23,4),(23,5),(24,1),(24,2),(24,3),(24,4),(24,5),(25,1),(25,2),(25,3),(25,4),(25,5),(26,1),(26,2),(26,3),(26,4),(26,5),(27,1),(27,2),(27,3),(27,4),(27,5),(28,1),(28,2),(28,3),(28,4),(28,5),(29,1),(29,2),(29,3),(29,4),(29,5),(30,1),(30,2),(30,3),(30,4),(30,5),(31,1),(31,2),(31,3),(31,4),(31,5),(32,1),(32,2),(32,3),(32,4),(32,5),(33,1),(33,2),(33,3),(33,4),(33,5),(34,1),(34,2),(34,3),(34,4),(34,5),(35,1),(35,2),(35,3),(35,4),(35,5),(36,1),(36,2),(36,3),(36,4),(36,5),(37,1),(37,2),(37,3),(37,4),(37,5),(38,1),(38,2),(38,3),(38,4),(38,5),(39,1),(39,2),(39,3),(39,4),(39,5),(40,1),(40,2),(40,3),(40,4),(40,5),(41,1),(41,2),(41,3),(41,4),(41,5),(42,1),(42,2),(42,3),(42,4),(42,5),(43,1),(43,2),(43,3),(43,4),(43,5),(44,1),(44,2),(44,3),(44,4),(44,5),(45,1),(45,2),(45,3),(45,4),(45,5),(46,1),(46,2),(46,3),(46,4),(46,5),(47,1),(47,2),(47,3),(47,4),(47,5),(48,1),(48,2),(48,3),(48,4),(48,5),(49,1),(49,2),(49,3),(49,4),(49,5),(50,1),(50,2),(50,3),(50,4),(50,5),(51,1),(51,2),(51,3),(51,4),(51,5),(52,1),(52,2),(52,3),(52,4),(52,5);
/*!40000 ALTER TABLE `ps_tax_rules_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_theme` WRITE;
/*!40000 ALTER TABLE `ps_theme` DISABLE KEYS */;
INSERT INTO `ps_theme` VALUES (1,'default','default'),(2,'gomarket','gomarket');
/*!40000 ALTER TABLE `ps_theme` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_theme_specific` WRITE;
/*!40000 ALTER TABLE `ps_theme_specific` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_theme_specific` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_timezone` WRITE;
/*!40000 ALTER TABLE `ps_timezone` DISABLE KEYS */;
INSERT INTO `ps_timezone` VALUES (1,'Africa/Abidjan'),(2,'Africa/Accra'),(3,'Africa/Addis_Ababa'),(4,'Africa/Algiers'),(5,'Africa/Asmara'),(6,'Africa/Asmera'),(7,'Africa/Bamako'),(8,'Africa/Bangui'),(9,'Africa/Banjul'),(10,'Africa/Bissau'),(11,'Africa/Blantyre'),(12,'Africa/Brazzaville'),(13,'Africa/Bujumbura'),(14,'Africa/Cairo'),(15,'Africa/Casablanca'),(16,'Africa/Ceuta'),(17,'Africa/Conakry'),(18,'Africa/Dakar'),(19,'Africa/Dar_es_Salaam'),(20,'Africa/Djibouti'),(21,'Africa/Douala'),(22,'Africa/El_Aaiun'),(23,'Africa/Freetown'),(24,'Africa/Gaborone'),(25,'Africa/Harare'),(26,'Africa/Johannesburg'),(27,'Africa/Kampala'),(28,'Africa/Khartoum'),(29,'Africa/Kigali'),(30,'Africa/Kinshasa'),(31,'Africa/Lagos'),(32,'Africa/Libreville'),(33,'Africa/Lome'),(34,'Africa/Luanda'),(35,'Africa/Lubumbashi'),(36,'Africa/Lusaka'),(37,'Africa/Malabo'),(38,'Africa/Maputo'),(39,'Africa/Maseru'),(40,'Africa/Mbabane'),(41,'Africa/Mogadishu'),(42,'Africa/Monrovia'),(43,'Africa/Nairobi'),(44,'Africa/Ndjamena'),(45,'Africa/Niamey'),(46,'Africa/Nouakchott'),(47,'Africa/Ouagadougou'),(48,'Africa/Porto-Novo'),(49,'Africa/Sao_Tome'),(50,'Africa/Timbuktu'),(51,'Africa/Tripoli'),(52,'Africa/Tunis'),(53,'Africa/Windhoek'),(54,'America/Adak'),(55,'America/Anchorage '),(56,'America/Anguilla'),(57,'America/Antigua'),(58,'America/Araguaina'),(59,'America/Argentina/Buenos_Aires'),(60,'America/Argentina/Catamarca'),(61,'America/Argentina/ComodRivadavia'),(62,'America/Argentina/Cordoba'),(63,'America/Argentina/Jujuy'),(64,'America/Argentina/La_Rioja'),(65,'America/Argentina/Mendoza'),(66,'America/Argentina/Rio_Gallegos'),(67,'America/Argentina/Salta'),(68,'America/Argentina/San_Juan'),(69,'America/Argentina/San_Luis'),(70,'America/Argentina/Tucuman'),(71,'America/Argentina/Ushuaia'),(72,'America/Aruba'),(73,'America/Asuncion'),(74,'America/Atikokan'),(75,'America/Atka'),(76,'America/Bahia'),(77,'America/Barbados'),(78,'America/Belem'),(79,'America/Belize'),(80,'America/Blanc-Sablon'),(81,'America/Boa_Vista'),(82,'America/Bogota'),(83,'America/Boise'),(84,'America/Buenos_Aires'),(85,'America/Cambridge_Bay'),(86,'America/Campo_Grande'),(87,'America/Cancun'),(88,'America/Caracas'),(89,'America/Catamarca'),(90,'America/Cayenne'),(91,'America/Cayman'),(92,'America/Chicago'),(93,'America/Chihuahua'),(94,'America/Coral_Harbour'),(95,'America/Cordoba'),(96,'America/Costa_Rica'),(97,'America/Cuiaba'),(98,'America/Curacao'),(99,'America/Danmarkshavn'),(100,'America/Dawson'),(101,'America/Dawson_Creek'),(102,'America/Denver'),(103,'America/Detroit'),(104,'America/Dominica'),(105,'America/Edmonton'),(106,'America/Eirunepe'),(107,'America/El_Salvador'),(108,'America/Ensenada'),(109,'America/Fort_Wayne'),(110,'America/Fortaleza'),(111,'America/Glace_Bay'),(112,'America/Godthab'),(113,'America/Goose_Bay'),(114,'America/Grand_Turk'),(115,'America/Grenada'),(116,'America/Guadeloupe'),(117,'America/Guatemala'),(118,'America/Guayaquil'),(119,'America/Guyana'),(120,'America/Halifax'),(121,'America/Havana'),(122,'America/Hermosillo'),(123,'America/Indiana/Indianapolis'),(124,'America/Indiana/Knox'),(125,'America/Indiana/Marengo'),(126,'America/Indiana/Petersburg'),(127,'America/Indiana/Tell_City'),(128,'America/Indiana/Vevay'),(129,'America/Indiana/Vincennes'),(130,'America/Indiana/Winamac'),(131,'America/Indianapolis'),(132,'America/Inuvik'),(133,'America/Iqaluit'),(134,'America/Jamaica'),(135,'America/Jujuy'),(136,'America/Juneau'),(137,'America/Kentucky/Louisville'),(138,'America/Kentucky/Monticello'),(139,'America/Knox_IN'),(140,'America/La_Paz'),(141,'America/Lima'),(142,'America/Los_Angeles'),(143,'America/Louisville'),(144,'America/Maceio'),(145,'America/Managua'),(146,'America/Manaus'),(147,'America/Marigot'),(148,'America/Martinique'),(149,'America/Mazatlan'),(150,'America/Mendoza'),(151,'America/Menominee'),(152,'America/Merida'),(153,'America/Mexico_City'),(154,'America/Miquelon'),(155,'America/Moncton'),(156,'America/Monterrey'),(157,'America/Montevideo'),(158,'America/Montreal'),(159,'America/Montserrat'),(160,'America/Nassau'),(161,'America/New_York'),(162,'America/Nipigon'),(163,'America/Nome'),(164,'America/Noronha'),(165,'America/North_Dakota/Center'),(166,'America/North_Dakota/New_Salem'),(167,'America/Panama'),(168,'America/Pangnirtung'),(169,'America/Paramaribo'),(170,'America/Phoenix'),(171,'America/Port-au-Prince'),(172,'America/Port_of_Spain'),(173,'America/Porto_Acre'),(174,'America/Porto_Velho'),(175,'America/Puerto_Rico'),(176,'America/Rainy_River'),(177,'America/Rankin_Inlet'),(178,'America/Recife'),(179,'America/Regina'),(180,'America/Resolute'),(181,'America/Rio_Branco'),(182,'America/Rosario'),(183,'America/Santarem'),(184,'America/Santiago'),(185,'America/Santo_Domingo'),(186,'America/Sao_Paulo'),(187,'America/Scoresbysund'),(188,'America/Shiprock'),(189,'America/St_Barthelemy'),(190,'America/St_Johns'),(191,'America/St_Kitts'),(192,'America/St_Lucia'),(193,'America/St_Thomas'),(194,'America/St_Vincent'),(195,'America/Swift_Current'),(196,'America/Tegucigalpa'),(197,'America/Thule'),(198,'America/Thunder_Bay'),(199,'America/Tijuana'),(200,'America/Toronto'),(201,'America/Tortola'),(202,'America/Vancouver'),(203,'America/Virgin'),(204,'America/Whitehorse'),(205,'America/Winnipeg'),(206,'America/Yakutat'),(207,'America/Yellowknife'),(208,'Antarctica/Casey'),(209,'Antarctica/Davis'),(210,'Antarctica/DumontDUrville'),(211,'Antarctica/Mawson'),(212,'Antarctica/McMurdo'),(213,'Antarctica/Palmer'),(214,'Antarctica/Rothera'),(215,'Antarctica/South_Pole'),(216,'Antarctica/Syowa'),(217,'Antarctica/Vostok'),(218,'Arctic/Longyearbyen'),(219,'Asia/Aden'),(220,'Asia/Almaty'),(221,'Asia/Amman'),(222,'Asia/Anadyr'),(223,'Asia/Aqtau'),(224,'Asia/Aqtobe'),(225,'Asia/Ashgabat'),(226,'Asia/Ashkhabad'),(227,'Asia/Baghdad'),(228,'Asia/Bahrain'),(229,'Asia/Baku'),(230,'Asia/Bangkok'),(231,'Asia/Beirut'),(232,'Asia/Bishkek'),(233,'Asia/Brunei'),(234,'Asia/Calcutta'),(235,'Asia/Choibalsan'),(236,'Asia/Chongqing'),(237,'Asia/Chungking'),(238,'Asia/Colombo'),(239,'Asia/Dacca'),(240,'Asia/Damascus'),(241,'Asia/Dhaka'),(242,'Asia/Dili'),(243,'Asia/Dubai'),(244,'Asia/Dushanbe'),(245,'Asia/Gaza'),(246,'Asia/Harbin'),(247,'Asia/Ho_Chi_Minh'),(248,'Asia/Hong_Kong'),(249,'Asia/Hovd'),(250,'Asia/Irkutsk'),(251,'Asia/Istanbul'),(252,'Asia/Jakarta'),(253,'Asia/Jayapura'),(254,'Asia/Jerusalem'),(255,'Asia/Kabul'),(256,'Asia/Kamchatka'),(257,'Asia/Karachi'),(258,'Asia/Kashgar'),(259,'Asia/Kathmandu'),(260,'Asia/Katmandu'),(261,'Asia/Kolkata'),(262,'Asia/Krasnoyarsk'),(263,'Asia/Kuala_Lumpur'),(264,'Asia/Kuching'),(265,'Asia/Kuwait'),(266,'Asia/Macao'),(267,'Asia/Macau'),(268,'Asia/Magadan'),(269,'Asia/Makassar'),(270,'Asia/Manila'),(271,'Asia/Muscat'),(272,'Asia/Nicosia'),(273,'Asia/Novosibirsk'),(274,'Asia/Omsk'),(275,'Asia/Oral'),(276,'Asia/Phnom_Penh'),(277,'Asia/Pontianak'),(278,'Asia/Pyongyang'),(279,'Asia/Qatar'),(280,'Asia/Qyzylorda'),(281,'Asia/Rangoon'),(282,'Asia/Riyadh'),(283,'Asia/Saigon'),(284,'Asia/Sakhalin'),(285,'Asia/Samarkand'),(286,'Asia/Seoul'),(287,'Asia/Shanghai'),(288,'Asia/Singapore'),(289,'Asia/Taipei'),(290,'Asia/Tashkent'),(291,'Asia/Tbilisi'),(292,'Asia/Tehran'),(293,'Asia/Tel_Aviv'),(294,'Asia/Thimbu'),(295,'Asia/Thimphu'),(296,'Asia/Tokyo'),(297,'Asia/Ujung_Pandang'),(298,'Asia/Ulaanbaatar'),(299,'Asia/Ulan_Bator'),(300,'Asia/Urumqi'),(301,'Asia/Vientiane'),(302,'Asia/Vladivostok'),(303,'Asia/Yakutsk'),(304,'Asia/Yekaterinburg'),(305,'Asia/Yerevan'),(306,'Atlantic/Azores'),(307,'Atlantic/Bermuda'),(308,'Atlantic/Canary'),(309,'Atlantic/Cape_Verde'),(310,'Atlantic/Faeroe'),(311,'Atlantic/Faroe'),(312,'Atlantic/Jan_Mayen'),(313,'Atlantic/Madeira'),(314,'Atlantic/Reykjavik'),(315,'Atlantic/South_Georgia'),(316,'Atlantic/St_Helena'),(317,'Atlantic/Stanley'),(318,'Australia/ACT'),(319,'Australia/Adelaide'),(320,'Australia/Brisbane'),(321,'Australia/Broken_Hill'),(322,'Australia/Canberra'),(323,'Australia/Currie'),(324,'Australia/Darwin'),(325,'Australia/Eucla'),(326,'Australia/Hobart'),(327,'Australia/LHI'),(328,'Australia/Lindeman'),(329,'Australia/Lord_Howe'),(330,'Australia/Melbourne'),(331,'Australia/North'),(332,'Australia/NSW'),(333,'Australia/Perth'),(334,'Australia/Queensland'),(335,'Australia/South'),(336,'Australia/Sydney'),(337,'Australia/Tasmania'),(338,'Australia/Victoria'),(339,'Australia/West'),(340,'Australia/Yancowinna'),(341,'Europe/Amsterdam'),(342,'Europe/Andorra'),(343,'Europe/Athens'),(344,'Europe/Belfast'),(345,'Europe/Belgrade'),(346,'Europe/Berlin'),(347,'Europe/Bratislava'),(348,'Europe/Brussels'),(349,'Europe/Bucharest'),(350,'Europe/Budapest'),(351,'Europe/Chisinau'),(352,'Europe/Copenhagen'),(353,'Europe/Dublin'),(354,'Europe/Gibraltar'),(355,'Europe/Guernsey'),(356,'Europe/Helsinki'),(357,'Europe/Isle_of_Man'),(358,'Europe/Istanbul'),(359,'Europe/Jersey'),(360,'Europe/Kaliningrad'),(361,'Europe/Kiev'),(362,'Europe/Lisbon'),(363,'Europe/Ljubljana'),(364,'Europe/London'),(365,'Europe/Luxembourg'),(366,'Europe/Madrid'),(367,'Europe/Malta'),(368,'Europe/Mariehamn'),(369,'Europe/Minsk'),(370,'Europe/Monaco'),(371,'Europe/Moscow'),(372,'Europe/Nicosia'),(373,'Europe/Oslo'),(374,'Europe/Paris'),(375,'Europe/Podgorica'),(376,'Europe/Prague'),(377,'Europe/Riga'),(378,'Europe/Rome'),(379,'Europe/Samara'),(380,'Europe/San_Marino'),(381,'Europe/Sarajevo'),(382,'Europe/Simferopol'),(383,'Europe/Skopje'),(384,'Europe/Sofia'),(385,'Europe/Stockholm'),(386,'Europe/Tallinn'),(387,'Europe/Tirane'),(388,'Europe/Tiraspol'),(389,'Europe/Uzhgorod'),(390,'Europe/Vaduz'),(391,'Europe/Vatican'),(392,'Europe/Vienna'),(393,'Europe/Vilnius'),(394,'Europe/Volgograd'),(395,'Europe/Warsaw'),(396,'Europe/Zagreb'),(397,'Europe/Zaporozhye'),(398,'Europe/Zurich'),(399,'Indian/Antananarivo'),(400,'Indian/Chagos'),(401,'Indian/Christmas'),(402,'Indian/Cocos'),(403,'Indian/Comoro'),(404,'Indian/Kerguelen'),(405,'Indian/Mahe'),(406,'Indian/Maldives'),(407,'Indian/Mauritius'),(408,'Indian/Mayotte'),(409,'Indian/Reunion'),(410,'Pacific/Apia'),(411,'Pacific/Auckland'),(412,'Pacific/Chatham'),(413,'Pacific/Easter'),(414,'Pacific/Efate'),(415,'Pacific/Enderbury'),(416,'Pacific/Fakaofo'),(417,'Pacific/Fiji'),(418,'Pacific/Funafuti'),(419,'Pacific/Galapagos'),(420,'Pacific/Gambier'),(421,'Pacific/Guadalcanal'),(422,'Pacific/Guam'),(423,'Pacific/Honolulu'),(424,'Pacific/Johnston'),(425,'Pacific/Kiritimati'),(426,'Pacific/Kosrae'),(427,'Pacific/Kwajalein'),(428,'Pacific/Majuro'),(429,'Pacific/Marquesas'),(430,'Pacific/Midway'),(431,'Pacific/Nauru'),(432,'Pacific/Niue'),(433,'Pacific/Norfolk'),(434,'Pacific/Noumea'),(435,'Pacific/Pago_Pago'),(436,'Pacific/Palau'),(437,'Pacific/Pitcairn'),(438,'Pacific/Ponape'),(439,'Pacific/Port_Moresby'),(440,'Pacific/Rarotonga'),(441,'Pacific/Saipan'),(442,'Pacific/Samoa'),(443,'Pacific/Tahiti'),(444,'Pacific/Tarawa'),(445,'Pacific/Tongatapu'),(446,'Pacific/Truk'),(447,'Pacific/Wake'),(448,'Pacific/Wallis'),(449,'Pacific/Yap'),(450,'Brazil/Acre'),(451,'Brazil/DeNoronha'),(452,'Brazil/East'),(453,'Brazil/West'),(454,'Canada/Atlantic'),(455,'Canada/Central'),(456,'Canada/East-Saskatchewan'),(457,'Canada/Eastern'),(458,'Canada/Mountain'),(459,'Canada/Newfoundland'),(460,'Canada/Pacific'),(461,'Canada/Saskatchewan'),(462,'Canada/Yukon'),(463,'CET'),(464,'Chile/Continental'),(465,'Chile/EasterIsland'),(466,'CST6CDT'),(467,'Cuba'),(468,'EET'),(469,'Egypt'),(470,'Eire'),(471,'EST'),(472,'EST5EDT'),(473,'Etc/GMT'),(474,'Etc/GMT+0'),(475,'Etc/GMT+1'),(476,'Etc/GMT+10'),(477,'Etc/GMT+11'),(478,'Etc/GMT+12'),(479,'Etc/GMT+2'),(480,'Etc/GMT+3'),(481,'Etc/GMT+4'),(482,'Etc/GMT+5'),(483,'Etc/GMT+6'),(484,'Etc/GMT+7'),(485,'Etc/GMT+8'),(486,'Etc/GMT+9'),(487,'Etc/GMT-0'),(488,'Etc/GMT-1'),(489,'Etc/GMT-10'),(490,'Etc/GMT-11'),(491,'Etc/GMT-12'),(492,'Etc/GMT-13'),(493,'Etc/GMT-14'),(494,'Etc/GMT-2'),(495,'Etc/GMT-3'),(496,'Etc/GMT-4'),(497,'Etc/GMT-5'),(498,'Etc/GMT-6'),(499,'Etc/GMT-7'),(500,'Etc/GMT-8'),(501,'Etc/GMT-9'),(502,'Etc/GMT0'),(503,'Etc/Greenwich'),(504,'Etc/UCT'),(505,'Etc/Universal'),(506,'Etc/UTC'),(507,'Etc/Zulu'),(508,'Factory'),(509,'GB'),(510,'GB-Eire'),(511,'GMT'),(512,'GMT+0'),(513,'GMT-0'),(514,'GMT0'),(515,'Greenwich'),(516,'Hongkong'),(517,'HST'),(518,'Iceland'),(519,'Iran'),(520,'Israel'),(521,'Jamaica'),(522,'Japan'),(523,'Kwajalein'),(524,'Libya'),(525,'MET'),(526,'Mexico/BajaNorte'),(527,'Mexico/BajaSur'),(528,'Mexico/General'),(529,'MST'),(530,'MST7MDT'),(531,'Navajo'),(532,'NZ'),(533,'NZ-CHAT'),(534,'Poland'),(535,'Portugal'),(536,'PRC'),(537,'PST8PDT'),(538,'ROC'),(539,'ROK'),(540,'Singapore'),(541,'Turkey'),(542,'UCT'),(543,'Universal'),(544,'US/Alaska'),(545,'US/Aleutian'),(546,'US/Arizona'),(547,'US/Central'),(548,'US/East-Indiana'),(549,'US/Eastern'),(550,'US/Hawaii'),(551,'US/Indiana-Starke'),(552,'US/Michigan'),(553,'US/Mountain'),(554,'US/Pacific'),(555,'US/Pacific-New'),(556,'US/Samoa'),(557,'UTC'),(558,'W-SU'),(559,'WET'),(560,'Zulu');
/*!40000 ALTER TABLE `ps_timezone` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_warehouse` WRITE;
/*!40000 ALTER TABLE `ps_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_warehouse_carrier` WRITE;
/*!40000 ALTER TABLE `ps_warehouse_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_warehouse_carrier` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_warehouse_product_location` WRITE;
/*!40000 ALTER TABLE `ps_warehouse_product_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_warehouse_product_location` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_warehouse_shop` WRITE;
/*!40000 ALTER TABLE `ps_warehouse_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_warehouse_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_web_browser` WRITE;
/*!40000 ALTER TABLE `ps_web_browser` DISABLE KEYS */;
INSERT INTO `ps_web_browser` VALUES (1,'Safari'),(2,'Safari iPad'),(3,'Firefox'),(4,'Opera'),(5,'IE 6'),(6,'IE 7'),(7,'IE 8'),(8,'IE 9'),(9,'IE 10'),(10,'Chrome');
/*!40000 ALTER TABLE `ps_web_browser` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_webservice_account` WRITE;
/*!40000 ALTER TABLE `ps_webservice_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_webservice_account` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_webservice_account_shop` WRITE;
/*!40000 ALTER TABLE `ps_webservice_account_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_webservice_account_shop` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_webservice_permission` WRITE;
/*!40000 ALTER TABLE `ps_webservice_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `ps_webservice_permission` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_zone` WRITE;
/*!40000 ALTER TABLE `ps_zone` DISABLE KEYS */;
INSERT INTO `ps_zone` VALUES (1,'Europe',1),(2,'North America',1),(3,'Asia',1),(4,'Africa',1),(5,'Oceania',1),(6,'South America',1),(7,'Europe (out E.U)',1),(8,'Central America/Antilla',1);
/*!40000 ALTER TABLE `ps_zone` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `ps_zone_shop` WRITE;
/*!40000 ALTER TABLE `ps_zone_shop` DISABLE KEYS */;
INSERT INTO `ps_zone_shop` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,3),(2,4),(2,5),(3,1),(3,2),(3,3),(3,4),(3,5),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(7,1),(7,2),(7,3),(7,4),(7,5),(8,1),(8,2),(8,3),(8,4),(8,5);
/*!40000 ALTER TABLE `ps_zone_shop` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
