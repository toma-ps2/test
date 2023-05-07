-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 07 2023 г., 19:59
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `webasyst`
--

-- --------------------------------------------------------

--
-- Структура таблицы `shop_abtest`
--

CREATE TABLE `shop_abtest` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_abtest_variants`
--

CREATE TABLE `shop_abtest_variants` (
  `id` int(11) UNSIGNED NOT NULL,
  `abtest_id` int(11) UNSIGNED NOT NULL,
  `code` varchar(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_affiliate_transaction`
--

CREATE TABLE `shop_affiliate_transaction` (
  `id` int(11) UNSIGNED NOT NULL,
  `contact_id` int(11) UNSIGNED NOT NULL,
  `create_datetime` datetime NOT NULL,
  `order_id` int(11) UNSIGNED DEFAULT NULL,
  `amount` decimal(15,4) NOT NULL,
  `balance` decimal(15,4) NOT NULL,
  `comment` text DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_api_courier`
--

CREATE TABLE `shop_api_courier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT 1,
  `contact_id` int(11) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `orders_processed` int(11) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `api_token` varchar(32) DEFAULT NULL,
  `api_pin` varchar(32) DEFAULT NULL,
  `api_pin_expire` datetime DEFAULT NULL,
  `api_last_use` datetime DEFAULT NULL,
  `all_storefronts` int(1) NOT NULL DEFAULT 1,
  `rights_order_edit` int(11) NOT NULL DEFAULT 0,
  `rights_customer_edit` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_api_courier_storefronts`
--

CREATE TABLE `shop_api_courier_storefronts` (
  `courier_id` int(11) NOT NULL,
  `storefront` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_cart_items`
--

CREATE TABLE `shop_cart_items` (
  `id` int(11) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT 1.000,
  `type` enum('product','service') NOT NULL DEFAULT 'product',
  `service_id` int(11) DEFAULT NULL,
  `service_variant_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category`
--

CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL,
  `left_key` int(11) DEFAULT NULL,
  `right_key` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT 0,
  `url` varchar(255) DEFAULT NULL,
  `full_url` varchar(255) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `description` mediumtext DEFAULT NULL,
  `conditions` text DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `edit_datetime` datetime DEFAULT NULL,
  `filter` text DEFAULT NULL,
  `sort_products` varchar(32) DEFAULT NULL,
  `include_sub_categories` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_category`
--

INSERT INTO `shop_category` (`id`, `left_key`, `right_key`, `depth`, `parent_id`, `name`, `meta_title`, `meta_keywords`, `meta_description`, `type`, `url`, `full_url`, `count`, `description`, `conditions`, `create_datetime`, `edit_datetime`, `filter`, `sort_products`, `include_sub_categories`, `status`) VALUES
(1, 1, 8, 0, 0, 'Бытовая техника', '', '', '', 0, 'bytovaya-tekhnika', 'bytovaya-tekhnika', 0, '', NULL, '2023-05-06 13:33:10', '2023-05-07 12:02:29', NULL, 'name ASC', 0, 1),
(2, 2, 3, 1, 1, 'Подкатегория 1', '', '', '', 0, 'podkategoriya-1', 'bytovaya-tekhnika/podkategoriya-1', 3, '', NULL, '2023-05-06 16:32:18', '2023-05-07 10:37:25', NULL, 'name ASC', 0, 1),
(3, 4, 5, 1, 1, 'Подкатегория 2', '', '', '', 0, 'podkategoriya-2', 'bytovaya-tekhnika/podkategoriya-2', 3, '', NULL, '2023-05-06 16:32:47', '2023-05-07 10:36:06', NULL, 'name ASC', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category_og`
--

CREATE TABLE `shop_category_og` (
  `category_id` int(11) NOT NULL,
  `property` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category_params`
--

CREATE TABLE `shop_category_params` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_category_params`
--

INSERT INTO `shop_category_params` (`category_id`, `name`, `value`) VALUES
(1, 'enable_sorting', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category_products`
--

CREATE TABLE `shop_category_products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_category_products`
--

INSERT INTO `shop_category_products` (`product_id`, `category_id`, `sort`) VALUES
(9, 2, 0),
(8, 2, 1),
(7, 2, 2),
(6, 3, 0),
(5, 3, 1),
(4, 3, 2),
(3, 4, 0),
(2, 4, 1),
(1, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category_routes`
--

CREATE TABLE `shop_category_routes` (
  `category_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_category_routes`
--

INSERT INTO `shop_category_routes` (`category_id`, `route`) VALUES
(2, 'localhost/wa/shop/*');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_checkout_flow`
--

CREATE TABLE `shop_checkout_flow` (
  `id` int(11) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `quarter` smallint(6) DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `step` tinyint(2) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_contact_category_discount`
--

CREATE TABLE `shop_contact_category_discount` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `discount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_coupon`
--

CREATE TABLE `shop_coupon` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(32) NOT NULL,
  `type` varchar(3) NOT NULL,
  `limit` int(11) DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `value` decimal(15,4) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `expire_datetime` datetime DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `create_contact_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `products_hash` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_currency`
--

CREATE TABLE `shop_currency` (
  `code` char(3) NOT NULL,
  `rate` decimal(18,10) NOT NULL DEFAULT 1.0000000000,
  `rounding` decimal(8,2) DEFAULT NULL,
  `round_up_only` int(11) NOT NULL DEFAULT 1,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_currency`
--

INSERT INTO `shop_currency` (`code`, `rate`, `rounding`, `round_up_only`, `sort`) VALUES
('RUB', '1.0000000000', NULL, 1, 0),
('USD', '65.0000000000', NULL, 1, 1),
('EUR', '75.0000000000', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_customer`
--

CREATE TABLE `shop_customer` (
  `contact_id` int(11) UNSIGNED NOT NULL,
  `total_spent` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `affiliate_bonus` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `number_of_orders` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `last_order_id` int(11) UNSIGNED DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_customers_filter`
--

CREATE TABLE `shop_customers_filter` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hash` text DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `contact_id` int(11) NOT NULL,
  `mass_edit` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_customers_filter`
--

INSERT INTO `shop_customers_filter` (`id`, `name`, `hash`, `create_datetime`, `contact_id`, `mass_edit`, `icon`) VALUES
(1, 'Из Москвы', 'contact_info.address.country=rus&contact_info.address.region=rus:77', '2023-05-06 13:12:38', 1, 1, 'marker'),
(2, 'Из Вконтакте', 'app.referer=vk.com', '2023-05-06 13:12:38', 1, 1, 'vkontakte'),
(3, 'Из Фейсбука', 'app.referer=facebook.com', '2023-05-06 13:12:38', 1, 1, 'facebook'),
(4, 'Из Твиттера', 'app.referer=twitter.com', '2023-05-06 13:12:38', 1, 1, 'twitter'),
(5, 'Заказывали более месяца назад', 'app.last_order_datetime<=-30d', '2023-05-06 13:12:38', 1, 1, 'clock');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_discount_by_sum`
--

CREATE TABLE `shop_discount_by_sum` (
  `type` varchar(32) NOT NULL,
  `sum` decimal(15,4) NOT NULL,
  `discount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_expense`
--

CREATE TABLE `shop_expense` (
  `id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `storefront` varchar(255) DEFAULT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_feature`
--

CREATE TABLE `shop_feature` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `code` varchar(64) NOT NULL,
  `status` enum('public','hidden','private') NOT NULL DEFAULT 'public',
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `selectable` int(11) NOT NULL,
  `multiple` int(11) NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `available_for_sku` int(11) DEFAULT NULL,
  `default_unit` varchar(255) DEFAULT NULL,
  `builtin` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_feature`
--

INSERT INTO `shop_feature` (`id`, `parent_id`, `code`, `status`, `name`, `type`, `selectable`, `multiple`, `count`, `available_for_sku`, `default_unit`, `builtin`) VALUES
(1, NULL, 'weight', 'public', 'Вес', 'dimension.weight', 0, 0, 0, NULL, '', 1),
(2, NULL, 'length', 'public', 'Длина', 'dimension.length', 0, 0, 0, NULL, '', 0),
(3, NULL, 'color', 'public', 'Цвет', 'color', 1, 1, 10, 1, '', 0),
(4, NULL, 'gtin', 'private', 'GTIN', 'varchar', 0, 0, 0, 1, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_feature_values_color`
--

CREATE TABLE `shop_feature_values_color` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `code` mediumint(8) UNSIGNED DEFAULT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_feature_values_color`
--

INSERT INTO `shop_feature_values_color` (`id`, `feature_id`, `sort`, `code`, `value`) VALUES
(1, 3, 1, 16777215, 'белый'),
(2, 3, 2, 16776960, 'желтый'),
(3, 3, 3, 65280, 'зеленый'),
(4, 3, 4, 255, 'синий'),
(5, 3, 5, 9849600, 'коричневый'),
(6, 3, 6, 16711680, 'красный'),
(7, 3, 7, 16753920, 'оранжевый'),
(8, 3, 8, 12632256, 'серебро'),
(9, 3, 9, 8421504, 'серый'),
(10, 3, 10, 0, 'черный');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_feature_values_dimension`
--

CREATE TABLE `shop_feature_values_dimension` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `value` double NOT NULL,
  `unit` varchar(255) NOT NULL,
  `type` varchar(16) NOT NULL,
  `value_base_unit` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_feature_values_double`
--

CREATE TABLE `shop_feature_values_double` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `value` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_feature_values_range`
--

CREATE TABLE `shop_feature_values_range` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `begin` double DEFAULT NULL,
  `end` double DEFAULT NULL,
  `unit` varchar(255) NOT NULL,
  `type` varchar(16) NOT NULL,
  `begin_base_unit` double DEFAULT NULL,
  `end_base_unit` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_feature_values_text`
--

CREATE TABLE `shop_feature_values_text` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_feature_values_varchar`
--

CREATE TABLE `shop_feature_values_varchar` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_filter`
--

CREATE TABLE `shop_filter` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `creator_contact_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_filter_rules`
--

CREATE TABLE `shop_filter_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `filter_id` int(10) UNSIGNED NOT NULL,
  `rule_type` varchar(255) NOT NULL,
  `rule_params` longtext DEFAULT NULL,
  `rule_group` int(11) NOT NULL DEFAULT 0,
  `open_interval` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_followup`
--

CREATE TABLE `shop_followup` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `delay` int(10) UNSIGNED NOT NULL,
  `first_order_only` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `same_state_id` tinyint(4) DEFAULT 0,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `last_cron_time` datetime NOT NULL,
  `from` varchar(32) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `transport` enum('email','sms') NOT NULL DEFAULT 'email',
  `state_id` varchar(32) DEFAULT 'paid'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_followup_sources`
--

CREATE TABLE `shop_followup_sources` (
  `followup_id` int(11) NOT NULL,
  `source` varchar(510) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_importexport`
--

CREATE TABLE `shop_importexport` (
  `id` int(11) NOT NULL,
  `plugin` varchar(64) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `config` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_importexport`
--

INSERT INTO `shop_importexport` (`id`, `plugin`, `sort`, `name`, `description`, `config`) VALUES
(1, 'csv:product:import', 0, 'Test', '', '[]');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_notification`
--

CREATE TABLE `shop_notification` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `event` varchar(64) NOT NULL,
  `transport` enum('email','sms','http') NOT NULL DEFAULT 'email',
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_notification`
--

INSERT INTO `shop_notification` (`id`, `name`, `event`, `transport`, `status`) VALUES
(1, 'Заказ оформлен (Покупатель)', 'order.create', 'email', 1),
(2, 'Заказ оформлен (Администратор магазина)', 'order.create', 'email', 1),
(3, 'Заказ подтвержден и принят в обработку (Покупатель)', 'order.process', 'email', 1),
(4, 'Заказ отправлен (Покупатель)', 'order.ship', 'email', 1),
(5, 'Заказ удален (Покупатель)', 'order.delete', 'email', 1),
(6, 'Добавлен комментарий к заказу (Покупатель)', 'order.comment', 'email', 1),
(7, 'Изменены параметры доставки (Покупатель)', 'order.editshippingdetails', 'email', 1),
(8, 'Заказ был объединен с другим (Покупатель)', 'order.settle', 'email', 1),
(9, 'Возврат (Покупатель)', 'order.refund', 'email', 1),
(10, 'Заказ отредактирован (Покупатель)', 'order.edit', 'email', 1),
(11, 'Заказ восстановлен (Покупатель)', 'order.restore', 'email', 1),
(12, 'Заказ выполнен (Покупатель)', 'order.complete', 'email', 1),
(13, 'Сообщение отправлено (Покупатель)', 'order.message', 'email', 1),
(14, 'Ответ платежной системы (callback) (Покупатель)', 'order.callback', 'email', 1),
(15, 'Заказ оплачен (Покупатель)', 'order.pay', 'email', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_notification_params`
--

CREATE TABLE `shop_notification_params` (
  `notification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_notification_params`
--

INSERT INTO `shop_notification_params` (`notification_id`, `name`, `value`) VALUES
(1, 'description', 'Оформление заказа на витрине или создание заказа администратором в бекенде магазина.'),
(1, 'subject', 'Новый заказ {$order.id}'),
(1, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n        font-family:Helvetica,Arial,sans-serif;\n        letter-spacing:normal;\n        text-indent:0;\n        text-transform:none;\n        word-spacing:0;\n        background-color:rgb(232,232,232);\n        border-collapse:collapse\n    \">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0 0;\n                                        text-align:center;\n                                        \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                        text-decoration:none;\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                        width:225px;\n                                        background: {$_button_background};\n                                        border-radius: 4px;\n                                        \" target=\"_blank\">[`Order status`]</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                            color:rgb(48,48,48);\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;\n                                            font-size:14px;\n                                            line-height:16px;\n                                            font-family:Helvetica,Arial,sans-serif;\n                                            margin: 20px 0;\n                                            text-align:center;\n                                            text-transform: uppercase;\n                                            \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- LIST -->\n                <tr>\n                    <td bgcolor=\"{$_products_bg}\">\n                    </td>\n                    <td bgcolor=\"{$_products_bg}\" style=\"\">\n                        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                            {$subtotal = 0}\n                            {foreach $order.items as $item}\n                                {$_border_style = \"border: 0;\"}\n                                {$_is_service = ($item.type == \"service\")}\n                                {if $item@index > 0}\n                                    {$_border_style = \"border: solid `{$_border_color}`; border-width: 1px 0  0;\"}\n                                {/if}\n                                <tr>\n                                    <td width=\"40\" style=\"padding: 8px 4px 8px 0; {$_border_style}\">\n                                        {if !$_is_service && !empty($item.product.image.crop_url)}\n                                            <img src=\"{$item.product.image.crop_url}\" alt=\"\" style=\"width: 48px; height: 48px; vertical-align: middle;\">\n                                        {/if}\n                                    </td>\n                                    <td style=\"padding: 8px 0 8px 4px; {$_border_style}\">\n                                        <p style=\"\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;\n                                            font-size: {if $_is_service}12{else}14{/if}px;\n                                            line-height:16px;\n                                            font-family:Helvetica,Arial,sans-serif;\n                                            \">\n                                            {if !$_is_service}\n                                                <a href=\"{$item.product.frontend_url|default:\'javascript:void(0);\'}\">\n                                                    <font style=\"text-decoration: underline;\">{if $_is_service}+&nbsp;{/if}{$item.name|escape}</font>\n                                                    {if !empty($item.sku_code)} <font style=\"color: #aaaaaa; font-size: 0.8em;\">{$item.sku_code|escape}</font>{/if}\n                                                </a>\n                                            {else}\n                                                {if $_is_service}+&nbsp;{/if}{$item.name|escape}\n                                                {if !empty($item.sku_code)} <font style=\"color: #aaaaaa; font-size: 0.8em;\">{$item.sku_code|escape}</font>{/if}\n                                            {/if}\n                                            {if !empty($item.download_link)}<a href=\"{$item.download_link}\"><strong>Скачать</strong></a>{/if}\n                                        </p>\n                                    </td>\n                                    <td style=\"padding: 8px 4px 8px 4px; white-space: nowrap; text-align: right; {$_border_style}\">\n                                        <font style=\"color:#aaa;\">{wa_currency($item.price, $order.currency)}&nbsp;&times;</font>&nbsp;{$item.quantity}\n                                    </td>\n                                    <td style=\"padding: 8px 0 8px 8px; white-space: nowrap; text-align: right; {$_border_style}\">\n                                        <font style=\"font-weight: bold;\">{wa_currency($item.price * $item.quantity, $order.currency)}</font>\n                                    </td>\n                                </tr>\n                                {$subtotal = $subtotal + $item.price * $item.quantity}\n                            {/foreach}\n                        </table>\n                    </td>\n                    <td bgcolor=\"{$_products_bg}\"></td>\n                </tr>\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 20px 0; border-bottom: 1px solid {$_border_color}\">\n                        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse; text-align: right;\">\n                            <tr>\n                                <td style=\"padding: 8px 0;\">Подытог</td>\n                                <td style=\"white-space: nowrap; width: 20%; padding: 8px 0 8px 8px;\">{wa_currency($subtotal, $order.currency)}</td>\n                            </tr>\n                            {if !empty((float)$order.discount)}\n                                <tr>\n                                    <td style=\"padding: 8px 0;\">Скидка</td>\n                                    <td style=\"white-space: nowrap; padding: 8px 0 8px 8px;\">− {wa_currency($order.discount, $order.currency)}</td>\n                                </tr>\n                            {/if}\n                            <tr>\n                                <td style=\"padding: 8px 0;\">Доставка</td>\n                                <td style=\"white-space: nowrap; padding: 8px 0 8px 8px;\">\n                                    {if empty((float)$order.shipping)}\n                                        [`free`]\n                                    {else}\n                                        {wa_currency($order.shipping, $order.currency)}\n                                    {/if}\n                                </td>\n                            </tr>\n                            {if !empty($order.tax)}\n                                <tr>\n                                    <td style=\"padding: 8px 0;\">Налог</td>\n                                    <td style=\"white-space: nowrap; padding: 8px 0 8px 8px;\">{wa_currency($order.tax, $order.currency)}</td>\n                                </tr>\n                            {/if}\n                            <tr>\n                                <td style=\"padding: 8px 0;\">\n                                    <h3 style=\"font-size:18px;margin:0;\">Итого</h3>\n                                </td>\n                                <td style=\"white-space: nowrap; padding: 8px 0 8px 8px;\">\n                                    <h3 style=\"font-size:18px;margin:0;\">{wa_currency($order.total, $order.currency)}</h3>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- DETAILS -->\n                <tr>\n                    <td style=\"border: 0;\">\n                    </td>\n                    <td style=\"border: 0; padding: 16px 0 0;\">\n                        {if strlen($customer->get(\'email\', \'default\'))}\n                            <p style=\"margin: 10px 0 0;\">\n                                [`Email`]: {$customer->get(\'email\', \'default\')|escape}\n                            </p>\n                        {/if}\n                        {if strlen($customer->get(\'phone\', \'default\'))}\n                            <p style=\"margin: 10px 0 0;\">\n                                [`Phone`]: {$customer->get(\'phone\', \'default\')|escape}\n                            </p>\n                        {/if}\n                    </td>\n                    <td style=\"border: 0;\">\n                    </td>\n                </tr>\n                {if $order.comment}\n                    <tr>\n                        <td style=\"border: 0;\">\n                        </td>\n                        <td style=\"border: 0; padding: 16px 0 0;\">\n                            <h3>Комментарий к заказу</h3>\n                            <p style=\"margin: 10px 0 0;\">\n                                <pre>{$order.comment|escape}</pre>\n                            </p>\n                        </td>\n                        <td style=\"border: 0;\">\n                        </td>\n                    </tr>\n                {/if}\n                <tr>\n                    <td style=\"border: 0;\">\n                    </td>\n                    <td style=\"border: 0; padding: 16px 0;\">\n                        <b>\n                            {if !empty($order.params.shipping_name)}\n                                <font style=\"color: #aaa;\">Доставка&nbsp;—</font>&nbsp;{$order.params.shipping_name}\n                            {else}\n                                <font style=\"color: #aaa;\">Доставка</font>\n                            {/if}\n                        </b>\n                        <p style=\"margin: 10px 0 0;\">\n                            {$customer.name|escape}<br>{$shipping_address}\n                        </p>\n                    </td>\n                    <td style=\"border: 0;\">\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"border: 0;\">\n                    </td>\n                    <td style=\"border: 0; padding: 16px 0;\">\n                        <b>\n                            {if !empty($order.params.payment_name)}\n                                <font style=\"color: #aaa;\">Оплата&nbsp;—</font>&nbsp;{$order.params.payment_name}\n                            {else}\n                                <font style=\"color: #aaa;\">Оплата</font>\n                            {/if}\n                        </b>\n                        <p style=\"margin: 10px 0 0;\">{$customer.name|escape}<br>{$billing_address}</p>\n                    </td>\n                    <td style=\"border: 0;\">\n                    </td>\n                </tr>\n\n                <!-- BONUS POINTS -->\n                {if $is_affiliate_enabled}\n                    <tr>\n                        <td style=\"background: {$_bonus_background};\"></td>\n                        <td height=\"50\" align=\"center\" style=\"background: {$_bonus_background}; padding: 16px 0;\">\n                            {if $add_affiliate_bonus}\n                                <p style=\"\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-size:16px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 0;\n                                    color:rgb(48,48,48);\n                                        \">\n                                    <b>{sprintf(\"[`This order will add +%s points to your affiliate bonus.`]\", round($add_affiliate_bonus, 2))}</b>\n                                </p>\n                                <p style=\"margin: 16px 0 0;\">\n                                {if $signup_url}\n                                    [`Registered customers apply for affiliate bonuses and discounts on future orders.`]\n&nbsp;<a href=\"{$signup_url}\" target=\"_blank\">[`Create permanent user account`]</a>\n                                {else}\n                                    {sprintf(\'[`When this order is paid, your affiliate bonus will be increased to %s.`]\', round($customer.affiliate_bonus + $add_affiliate_bonus, 2))}\n                                {/if}\n                                </p>\n\n                            {/if}\n                        </td>\n                        <td style=\"background: {$_bonus_background}\"></td>\n                    </tr>\n                {else}\n                    <br>\n                    <br>\n                {/if}\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                            font-style:normal;\n                            font-variant:normal;\n                            font-weight:normal;\n                            font-size:13px;\n                            line-height:16px;\n                            font-family:Arial,sans-serif,Helvetica;\n                            color:rgb(147,154,164);\n                            margin: 20px 0 0;\n                            \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded|default:\'\'}\" target=\"_blank\">{$order.params.storefront_decoded|default:\'\'}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(1, 'sms', 'Ваш заказ успешно оформлен. Мы свяжемся с вами в ближайшее время. Ваш номер заказа: {$order.id}. Сумма заказа: {wa_currency($order.total, $order.currency)}'),
(1, 'to', 'customer'),
(2, 'description', 'Оформление заказа на витрине или создание заказа администратором в бекенде магазина.'),
(2, 'subject', 'Новый заказ {$order.id}'),
(2, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n        font-family:Helvetica,Arial,sans-serif;\n        letter-spacing:normal;\n        text-indent:0;\n        text-transform:none;\n        word-spacing:0;\n        background-color:rgb(232,232,232);\n        border-collapse:collapse\n    \">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0 0;\n                                        text-align:center;\n                                        \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                        text-decoration:none;\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                        width:225px;\n                                        background: {$_button_background};\n                                        border-radius: 4px;\n                                        \" target=\"_blank\">[`Order status`]</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                            color:rgb(48,48,48);\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;\n                                            font-size:14px;\n                                            line-height:16px;\n                                            font-family:Helvetica,Arial,sans-serif;\n                                            margin: 20px 0;\n                                            text-align:center;\n                                            text-transform: uppercase;\n                                            \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- LIST -->\n                <tr>\n                    <td bgcolor=\"{$_products_bg}\">\n                    </td>\n                    <td bgcolor=\"{$_products_bg}\" style=\"\">\n                        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                            {$subtotal = 0}\n                            {foreach $order.items as $item}\n                                {$_border_style = \"border: 0;\"}\n                                {$_is_service = ($item.type == \"service\")}\n                                {if $item@index > 0}\n                                    {$_border_style = \"border: solid `{$_border_color}`; border-width: 1px 0  0;\"}\n                                {/if}\n                                <tr>\n                                    <td width=\"40\" style=\"padding: 8px 4px 8px 0; {$_border_style}\">\n                                        {if !$_is_service && !empty($item.product.image.crop_url)}\n                                            <img src=\"{$item.product.image.crop_url}\" alt=\"\" style=\"width: 48px; height: 48px; vertical-align: middle;\">\n                                        {/if}\n                                    </td>\n                                    <td style=\"padding: 8px 0 8px 4px; {$_border_style}\">\n                                        <p style=\"\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;\n                                            font-size: {if $_is_service}12{else}14{/if}px;\n                                            line-height:16px;\n                                            font-family:Helvetica,Arial,sans-serif;\n                                            \">\n                                            {if !$_is_service}\n                                                <a href=\"{$item.product.frontend_url|default:\'javascript:void(0);\'}\">\n                                                    <font style=\"text-decoration: underline;\">{if $_is_service}+&nbsp;{/if}{$item.name|escape}</font>\n                                                    {if !empty($item.sku_code)} <font style=\"color: #aaaaaa; font-size: 0.8em;\">{$item.sku_code|escape}</font>{/if}\n                                                </a>\n                                            {else}\n                                                {if $_is_service}+&nbsp;{/if}{$item.name|escape}\n                                                {if !empty($item.sku_code)} <font style=\"color: #aaaaaa; font-size: 0.8em;\">{$item.sku_code|escape}</font>{/if}\n                                            {/if}\n                                            {if !empty($item.download_link)}<a href=\"{$item.download_link}\"><strong>Скачать</strong></a>{/if}\n                                        </p>\n                                    </td>\n                                    <td style=\"padding: 8px 4px 8px 4px; white-space: nowrap; text-align: right; {$_border_style}\">\n                                        <font style=\"color:#aaa;\">{wa_currency($item.price, $order.currency)}&nbsp;&times;</font>&nbsp;{$item.quantity}\n                                    </td>\n                                    <td style=\"padding: 8px 0 8px 8px; white-space: nowrap; text-align: right; {$_border_style}\">\n                                        <font style=\"font-weight: bold;\">{wa_currency($item.price * $item.quantity, $order.currency)}</font>\n                                    </td>\n                                </tr>\n                                {$subtotal = $subtotal + $item.price * $item.quantity}\n                            {/foreach}\n                        </table>\n                    </td>\n                    <td bgcolor=\"{$_products_bg}\"></td>\n                </tr>\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 20px 0; border-bottom: 1px solid {$_border_color}\">\n                        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse; text-align: right;\">\n                            <tr>\n                                <td style=\"padding: 8px 0;\">Подытог</td>\n                                <td style=\"white-space: nowrap; width: 20%; padding: 8px 0 8px 8px;\">{wa_currency($subtotal, $order.currency)}</td>\n                            </tr>\n                            {if !empty((float)$order.discount)}\n                                <tr>\n                                    <td style=\"padding: 8px 0;\">Скидка</td>\n                                    <td style=\"white-space: nowrap; padding: 8px 0 8px 8px;\">− {wa_currency($order.discount, $order.currency)}</td>\n                                </tr>\n                            {/if}\n                            <tr>\n                                <td style=\"padding: 8px 0;\">Доставка</td>\n                                <td style=\"white-space: nowrap; padding: 8px 0 8px 8px;\">\n                                    {if empty((float)$order.shipping)}\n                                        [`free`]\n                                    {else}\n                                        {wa_currency($order.shipping, $order.currency)}\n                                    {/if}\n                                </td>\n                            </tr>\n                            {if !empty($order.tax)}\n                                <tr>\n                                    <td style=\"padding: 8px 0;\">Налог</td>\n                                    <td style=\"white-space: nowrap; padding: 8px 0 8px 8px;\">{wa_currency($order.tax, $order.currency)}</td>\n                                </tr>\n                            {/if}\n                            <tr>\n                                <td style=\"padding: 8px 0;\">\n                                    <h3 style=\"font-size:18px;margin:0;\">Итого</h3>\n                                </td>\n                                <td style=\"white-space: nowrap; padding: 8px 0 8px 8px;\">\n                                    <h3 style=\"font-size:18px;margin:0;\">{wa_currency($order.total, $order.currency)}</h3>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- DETAILS -->\n                <tr>\n                    <td style=\"border: 0;\">\n                    </td>\n                    <td style=\"border: 0; padding: 16px 0 0;\">\n                        {if strlen($customer->get(\'email\', \'default\'))}\n                            <p style=\"margin: 10px 0 0;\">\n                                [`Email`]: {$customer->get(\'email\', \'default\')|escape}\n                            </p>\n                        {/if}\n                        {if strlen($customer->get(\'phone\', \'default\'))}\n                            <p style=\"margin: 10px 0 0;\">\n                                [`Phone`]: {$customer->get(\'phone\', \'default\')|escape}\n                            </p>\n                        {/if}\n                    </td>\n                    <td style=\"border: 0;\">\n                    </td>\n                </tr>\n                {if $order.comment}\n                    <tr>\n                        <td style=\"border: 0;\">\n                        </td>\n                        <td style=\"border: 0; padding: 16px 0 0;\">\n                            <h3>Комментарий к заказу</h3>\n                            <p style=\"margin: 10px 0 0;\">\n                                <pre>{$order.comment|escape}</pre>\n                            </p>\n                        </td>\n                        <td style=\"border: 0;\">\n                        </td>\n                    </tr>\n                {/if}\n                <tr>\n                    <td style=\"border: 0;\">\n                    </td>\n                    <td style=\"border: 0; padding: 16px 0;\">\n                        <b>\n                            {if !empty($order.params.shipping_name)}\n                                <font style=\"color: #aaa;\">Доставка&nbsp;—</font>&nbsp;{$order.params.shipping_name}\n                            {else}\n                                <font style=\"color: #aaa;\">Доставка</font>\n                            {/if}\n                        </b>\n                        <p style=\"margin: 10px 0 0;\">\n                            {$customer.name|escape}<br>{$shipping_address}\n                        </p>\n                    </td>\n                    <td style=\"border: 0;\">\n                    </td>\n                </tr>\n                <tr>\n                    <td style=\"border: 0;\">\n                    </td>\n                    <td style=\"border: 0; padding: 16px 0;\">\n                        <b>\n                            {if !empty($order.params.payment_name)}\n                                <font style=\"color: #aaa;\">Оплата&nbsp;—</font>&nbsp;{$order.params.payment_name}\n                            {else}\n                                <font style=\"color: #aaa;\">Оплата</font>\n                            {/if}\n                        </b>\n                        <p style=\"margin: 10px 0 0;\">{$customer.name|escape}<br>{$billing_address}</p>\n                    </td>\n                    <td style=\"border: 0;\">\n                    </td>\n                </tr>\n\n                <!-- BONUS POINTS -->\n                {if $is_affiliate_enabled}\n                    <tr>\n                        <td style=\"background: {$_bonus_background};\"></td>\n                        <td height=\"50\" align=\"center\" style=\"background: {$_bonus_background}; padding: 16px 0;\">\n                            {if $add_affiliate_bonus}\n                                <p style=\"\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-size:16px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 0;\n                                    color:rgb(48,48,48);\n                                        \">\n                                    <b>{sprintf(\"[`This order will add +%s points to your affiliate bonus.`]\", round($add_affiliate_bonus, 2))}</b>\n                                </p>\n                                <p style=\"margin: 16px 0 0;\">\n                                {if $signup_url}\n                                    [`Registered customers apply for affiliate bonuses and discounts on future orders.`]\n&nbsp;<a href=\"{$signup_url}\" target=\"_blank\">[`Create permanent user account`]</a>\n                                {else}\n                                    {sprintf(\'[`When this order is paid, your affiliate bonus will be increased to %s.`]\', round($customer.affiliate_bonus + $add_affiliate_bonus, 2))}\n                                {/if}\n                                </p>\n\n                            {/if}\n                        </td>\n                        <td style=\"background: {$_bonus_background}\"></td>\n                    </tr>\n                {else}\n                    <br>\n                    <br>\n                {/if}\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                            font-style:normal;\n                            font-variant:normal;\n                            font-weight:normal;\n                            font-size:13px;\n                            line-height:16px;\n                            font-family:Arial,sans-serif,Helvetica;\n                            color:rgb(147,154,164);\n                            margin: 20px 0 0;\n                            \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded|default:\'\'}\" target=\"_blank\">{$order.params.storefront_decoded|default:\'\'}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(2, 'sms', 'Ваш заказ успешно оформлен. Мы свяжемся с вами в ближайшее время. Ваш номер заказа: {$order.id}. Сумма заказа: {wa_currency($order.total, $order.currency)}'),
(2, 'to', 'admin'),
(3, 'description', 'Выполнение действия «В обработку» в бекенде магазина.'),
(3, 'subject', 'Заказ {$order.id} подтвержден'),
(3, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\nfont-family:Helvetica,Arial,sans-serif;\nletter-spacing:normal;\ntext-indent:0;\ntext-transform:none;\nword-spacing:0;\nbackground-color:rgb(232,232,232);\nborder-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                            color:rgb(48,48,48);\n                            font-style:normal;\n                            font-variant:normal;\n                            font-weight:normal;\n                            font-size:14px;\n                            line-height:16px;\n                            font-family:Helvetica,Arial,sans-serif;\n                            margin: 20px 0 0;\n                            text-align:center;\n                            \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                color:rgb(48,48,48);\n                                font-style:normal;\n                                font-variant:normal;\n                                font-weight:normal;\n                                font-size:14px;\n                                line-height:16px;\n                                font-family:Helvetica,Arial,sans-serif;\n                                margin: 20px 0;\n                                text-align:center;\n                                text-transform: uppercase;\n                                \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer->get(\"name\", \"html\")}!</p>\n                        <p>Ваш заказ {$order.id} подтвержден и принят в обработку.</p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                font-style:normal;\n                font-variant:normal;\n                font-weight:normal;\n                font-size:13px;\n                line-height:16px;\n                font-family:Arial,sans-serif,Helvetica;\n                color:rgb(147,154,164);\n                margin: 20px 0 0;\n                \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded}\" target=\"_blank\">{$order.params.storefront_decoded}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n\n'),
(3, 'sms', 'Ваш заказ {$order.id} подтвержден и принят в обработку.'),
(3, 'to', 'customer'),
(4, 'description', 'Выполнение действия «Отправлен» в бекенде магазина.'),
(4, 'subject', 'Заказ {$order.id} отправлен!');
INSERT INTO `shop_notification_params` (`notification_id`, `name`, `value`) VALUES
(4, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\nfont-family:Helvetica,Arial,sans-serif;\nletter-spacing:normal;\ntext-indent:0;\ntext-transform:none;\nword-spacing:0;\nbackground-color:rgb(232,232,232);\nborder-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                color:rgb(48,48,48);\n                                font-style:normal;\n                                font-variant:normal;\n                                font-weight:normal;\n                                font-size:14px;\n                                line-height:16px;\n                                font-family:Helvetica,Arial,sans-serif;\n                                margin: 20px 0 0;\n                                text-align:center;\n                                \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0;\n                                    text-align:center;\n                                    text-transform: uppercase;\n                                    \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer->get(\"name\", \"html\")}!</p>\n                        <p>Ваш заказ {$order.id} был отправлен!</p>\n                        {if !empty($action_data.params.tracking_number)}\n                            <p>Номер отслеживания отправления: <strong>{$action_data.params.tracking_number|escape}</strong></p>\n                        {/if}\n                        {if !empty($action_data.params.tracking_number) && !empty($shipping_plugin)}\n                            {$tracking = $shipping_plugin->tracking($action_data.params.tracking_number)}\n                            {if $tracking}\n                                <p>{$tracking}</p>\n                            {/if}\n                        {/if}\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                    font-style:normal;\n                    font-variant:normal;\n                    font-weight:normal;\n                    font-size:13px;\n                    line-height:16px;\n                    font-family:Arial,sans-serif,Helvetica;\n                    color:rgb(147,154,164);\n                    margin: 20px 0 0;\n                    \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded}\" target=\"_blank\">{$order.params.storefront_decoded}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(4, 'sms', 'Ваш заказ {$order.id} отправлен!{if !empty($action_data.params.tracking_number)} Идентификатор отправления: {$action_data.params.tracking_number}{/if}'),
(4, 'to', 'customer'),
(5, 'description', 'Выполнение действия «Удалить» в бекенде магазина.'),
(5, 'subject', 'Заказ {$order.id} был отменен'),
(5, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\nfont-family:Helvetica,Arial,sans-serif;\nletter-spacing:normal;\ntext-indent:0;\ntext-transform:none;\nword-spacing:0;\nbackground-color:rgb(232,232,232);\nborder-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                            color:rgb(48,48,48);\n                            font-style:normal;\n                            font-variant:normal;\n                            font-weight:normal;\n                            font-size:14px;\n                            line-height:16px;\n                            font-family:Helvetica,Arial,sans-serif;\n                            margin: 20px 0 0;\n                            text-align:center;\n                            \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>Ваш заказ {$order.id} был отменен. Если вы хотите восстановить свой заказ, пожалуйста, свяжитесь с нами.</p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                font-style:normal;\n                font-variant:normal;\n                font-weight:normal;\n                font-size:13px;\n                line-height:16px;\n                font-family:Arial,sans-serif,Helvetica;\n                color:rgb(147,154,164);\n                margin: 20px 0 0;\n                \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded}\" target=\"_blank\">{$order.params.storefront_decoded}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n\n'),
(5, 'sms', 'Ваш заказ {$order.id} отменен'),
(5, 'to', 'customer'),
(6, 'description', 'Добавление комментария к заказу в бекенде.'),
(6, 'subject', 'К вашему заказу {$order.id} добавлен комментарий'),
(6, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0 0;\n                                    text-align:center;\n                                    \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0;\n                                        text-align:center;\n                                        text-transform: uppercase;\n                                        \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>{sprintf(_w(\"Administrator has added a comment to your order %s:<br><strong>%s</strong>\"), $order.id, $action_data.text)}</p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded}\" target=\"_blank\">{$order.params.storefront_decoded}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(6, 'sms', 'К вашему заказу {$order.id} добавлен комментарий'),
(6, 'to', 'customer'),
(7, 'description', 'Изменение параметров доставки заказа в бекенде.'),
(7, 'subject', 'Параметры доставки вашего заказа {$order.id} изменились'),
(7, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0 0;\n                                    text-align:center;\n                                    \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0;\n                                        text-align:center;\n                                        text-transform: uppercase;\n                                        \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>{sprintf(_w(\"Administrator has changed the shipping details of your order %s as follows:<br><strong>%s</strong>\"), $order.id, $action_data.text|nl2br)}</p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront}\" target=\"_blank\">{$order.params.storefront}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(7, 'sms', 'Параметры доставки вашего заказа {$order.id} изменились'),
(7, 'to', 'customer'),
(8, 'description', 'Объединение оплаченного через мобильный терминал заказа без номера с другим заказом администратором в бекенде.'),
(8, 'subject', 'Ваш подвешенный заказ {$order.id} обработан'),
(8, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    {if empty($action_data.params[\'workflow.settle_target_id\']) || $action_data.params[\'workflow.settle_target_id\'] == shopHelper::decodeOrderId($order.id)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0 0;\n                                        text-align:center;\n                                        \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                        <p align=\"center\" style=\"margin: 20px 0;\">\n                                            <a href=\"{$order_url}\" style=\"\n                                                text-decoration:none;\n                                                font-style:normal;\n                                                font-variant:normal;\n                                                font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                                width:225px;\n                                                background: {$_button_background};\n                                                border-radius: 4px;\n                                                \" target=\"_blank\">Статус заказа</a>\n                                        </p>\n                                        {if !empty($order.params.auth_pin)}\n                                            <p style=\"\n                                            color:rgb(48,48,48);\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;\n                                            font-size:14px;\n                                            line-height:16px;\n                                            font-family:Helvetica,Arial,sans-serif;\n                                            margin: 20px 0;\n                                            text-align:center;\n                                            text-transform: uppercase;\n                                            \">\n                                                PIN: <b>{$order.params.auth_pin}</b>\n                                            </p>\n                                        {/if}\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>{if !empty($action_data.params[\'workflow.settle_target_id\'])}\n                            {if $action_data.params[\'workflow.settle_target_id\'] == shopHelper::decodeOrderId($order.id)}\n                                {sprintf(_w(\'Administrator has settled your unsettled order %s.\'), $order.id)}\n                            {else}\n                                {sprintf(_w(\'Administrator has settled your unsettled order %s by merging it with order %s.\'), $order.id, shopHelper::encodeOrderId($action_data.params[\'workflow.settle_target_id\']))}\n                            {/if}\n                        {else}\n                            {sprintf(_w(\'Administrator has merged your order %s with an unsettled order.\'), $order.id)}\n                        {/if}</p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded}\" target=\"_blank\">{$order.params.storefront_decoded}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(8, 'sms', 'Ваш подвешенный заказ {$order.id} обработан'),
(8, 'to', 'customer'),
(9, 'description', 'Выполнение действия «Возврат» в бекенде магазина.'),
(9, 'subject', 'Заказ {$order.id} обновлен'),
(9, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0 0;\n                                    text-align:center;\n                                    \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0;\n                                        text-align:center;\n                                        text-transform: uppercase;\n                                        \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>Статус вашего заказа {$order.id} был обновлен на <strong>{$status}</strong></p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded|default:\'\'}\" target=\"_blank\">{$order.params.storefront_decoded|default:\'\'}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(9, 'sms', 'Статус вашего заказа {$order.id} изменен на «{$status}»'),
(9, 'to', 'customer'),
(10, 'description', 'Сохранение изменений в заказе после его редактирования в бекенде магазина.'),
(10, 'subject', 'Заказ {$order.id} обновлен');
INSERT INTO `shop_notification_params` (`notification_id`, `name`, `value`) VALUES
(10, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0 0;\n                                    text-align:center;\n                                    \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0;\n                                        text-align:center;\n                                        text-transform: uppercase;\n                                        \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>Статус вашего заказа {$order.id} был обновлен на <strong>{$status}</strong></p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded|default:\'\'}\" target=\"_blank\">{$order.params.storefront_decoded|default:\'\'}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(10, 'sms', 'Статус вашего заказа {$order.id} изменен на «{$status}»'),
(10, 'to', 'customer'),
(11, 'description', 'Выполнение действия «Восстановить» в бекенде магазина.'),
(11, 'subject', 'Заказ {$order.id} обновлен'),
(11, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0 0;\n                                    text-align:center;\n                                    \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0;\n                                        text-align:center;\n                                        text-transform: uppercase;\n                                        \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>Статус вашего заказа {$order.id} был обновлен на <strong>{$status}</strong></p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded|default:\'\'}\" target=\"_blank\">{$order.params.storefront_decoded|default:\'\'}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(11, 'sms', 'Статус вашего заказа {$order.id} изменен на «{$status}»'),
(11, 'to', 'customer'),
(12, 'description', 'Выполнение действия «Выполнить» в бекенде магазина.'),
(12, 'subject', 'Заказ {$order.id} обновлен'),
(12, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0 0;\n                                    text-align:center;\n                                    \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0;\n                                        text-align:center;\n                                        text-transform: uppercase;\n                                        \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>Статус вашего заказа {$order.id} был обновлен на <strong>{$status}</strong></p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded|default:\'\'}\" target=\"_blank\">{$order.params.storefront_decoded|default:\'\'}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(12, 'sms', 'Статус вашего заказа {$order.id} изменен на «{$status}»'),
(12, 'to', 'customer'),
(13, 'description', 'Отправка сообщения клиенту администратором из бекенда магазина.'),
(13, 'subject', 'Заказ {$order.id} обновлен'),
(13, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0 0;\n                                    text-align:center;\n                                    \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0;\n                                        text-align:center;\n                                        text-transform: uppercase;\n                                        \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>Статус вашего заказа {$order.id} был обновлен на <strong>{$status}</strong></p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded|default:\'\'}\" target=\"_blank\">{$order.params.storefront_decoded|default:\'\'}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(13, 'sms', 'Статус вашего заказа {$order.id} изменен на «{$status}»'),
(13, 'to', 'customer'),
(14, 'description', 'Получение автоматического запроса от платежной системы (например, для обновления статуса заказа). В зависимости от результата запроса дополнительно к нему может быть выполнено действие «Оплачен».'),
(14, 'subject', 'Заказ {$order.id} обновлен'),
(14, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0 0;\n                                    text-align:center;\n                                    \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0;\n                                        text-align:center;\n                                        text-transform: uppercase;\n                                        \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>Статус вашего заказа {$order.id} был обновлен на <strong>{$status}</strong></p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded|default:\'\'}\" target=\"_blank\">{$order.params.storefront_decoded|default:\'\'}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(14, 'sms', 'Статус вашего заказа {$order.id} изменен на «{$status}»'),
(14, 'to', 'customer'),
(15, 'description', 'Выполнение действия «Оплачен» в бекенде магазина либо в результате автоматического запроса (callback) платежной системы.'),
(15, 'subject', 'Заказ {$order.id} обновлен'),
(15, 'body', '{strip}\n\n{$_background_color = \"#eeeeee\"}\n{$_products_bg = \"#ffffff\"}\n{$_bonus_background = \"#ffffcc\"}\n{$_button_background = \"#fcd630\"}\n{$_main_border_color = \"#cccccc\"}\n{$_border_color = \"#dddddd\"}\n\n<table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"{$_background_color}\" style=\"\n    font-family:Helvetica,Arial,sans-serif;\n    letter-spacing:normal;\n    text-indent:0;\n    text-transform:none;\n    word-spacing:0;\n    background-color:rgb(232,232,232);\n    border-collapse:collapse\n\">\n    <tr>\n        <td style=\"padding: 20px;\">\n            <table width=\"600\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"\n                width: 600px !important;\n                background-color:#fff;\n                border:1px solid {$_main_border_color};\n                border-radius: 4px;\n                margin:auto;\n                overflow: hidden;\n                \">\n\n                <!-- HEADER -->\n                <tr>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                    <td height=\"70\" align=\"center\" valign=\"middle\" style=\"border: solid {$_border_color}; border-width: 0 0 1px 0;\">\n                        <table width=\"500\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 100% !important;\">\n                            <tr>\n                                <td>\n                                    <font style=\"font-weight: bold; font-size: 20px; margin: 0 12px 0 0;\"><b>{$order.id}</b></font>\n                                    <font style=\"color: #888\">{$order.create_datetime|wa_date:\'humandate\'}</font>\n                                </td>\n                                <td style=\"text-align: right;\">\n                                    <font style=\"{if !empty($order.style)}{$order.style}{/if}\">{$status}</font>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td width=\"50\" style=\"width:50px !important; border: solid {$_border_color}; border-width: 0 0 1px 0;\"></td>\n                </tr>\n\n                <!-- STATUS -->\n                <tr>\n                    <td></td>\n                    <td>\n                        <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-collapse:collapse\">\n                            <tr>\n                                <td>\n                                    <p style=\"\n                                    color:rgb(48,48,48);\n                                    font-style:normal;\n                                    font-variant:normal;\n                                    font-weight:normal;\n                                    font-size:14px;\n                                    line-height:16px;\n                                    font-family:Helvetica,Arial,sans-serif;\n                                    margin: 20px 0 0;\n                                    text-align:center;\n                                    \">Спасибо за покупку в магазине «{$wa->shop->settings(\"name\")}»!</p>\n                                    <p align=\"center\" style=\"margin: 20px 0;\">\n                                        <a href=\"{$order_url}\" style=\"\n                                            text-decoration:none;\n                                            font-style:normal;\n                                            font-variant:normal;\n                                            font-weight:normal;font-size:17px;line-height:40px;font-family:Helvetica,Arial,sans-serif;color:rgb(48,48,48);display:block;\n                                            width:225px;\n                                            background: {$_button_background};\n                                            border-radius: 4px;\n                                            \" target=\"_blank\">Статус заказа</a>\n                                    </p>\n                                    {if !empty($order.params.auth_pin)}\n                                        <p style=\"\n                                        color:rgb(48,48,48);\n                                        font-style:normal;\n                                        font-variant:normal;\n                                        font-weight:normal;\n                                        font-size:14px;\n                                        line-height:16px;\n                                        font-family:Helvetica,Arial,sans-serif;\n                                        margin: 20px 0;\n                                        text-align:center;\n                                        text-transform: uppercase;\n                                        \">\n                                            PIN: <b>{$order.params.auth_pin}</b>\n                                        </p>\n                                    {/if}\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                    <td></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                    <td bgcolor=\"{$_bonus_background}\" style=\"padding: 12px 0 12px 0;\">\n                        <p>Здравствуйте, {$customer.name|escape}!</p>\n                        <p>Статус вашего заказа {$order.id} был обновлен на <strong>{$status}</strong></p>\n                    </td>\n                    <td bgcolor=\"{$_bonus_background}\"></td>\n                </tr>\n\n                <!-- TEXT -->\n                <tr>\n                    <td></td>\n                    <td style=\"padding: 24px 0 36px 0;\">\n                        <h3 style=\"margin: 0;\">Контактная информация</h3>\n                        {if strlen($wa->shop->settings(\"email\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Email: <a href=\"mailto:{$wa->shop->settings(\"email\")}\">{$wa->shop->settings(\"email\")}</a>\n                            </p>\n                        {/if}\n                        {if strlen($wa->shop->settings(\"phone\"))}\n                            <p style=\"margin: 10px 0 0;\">\n                                Телефон: {$wa->shop->settings(\"phone\")}\n                            </p>\n                        {/if}\n                    </td>\n                    <td></td>\n                </tr>\n            </table>\n\n            <!-- BOTTOM SITE INFORMATION -->\n            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse\">\n                <tr>\n                    <td valign=\"middle\" align=\"center\" height=\"45\">\n                        <p style=\"\n                        font-style:normal;\n                        font-variant:normal;\n                        font-weight:normal;\n                        font-size:13px;\n                        line-height:16px;\n                        font-family:Arial,sans-serif,Helvetica;\n                        color:rgb(147,154,164);\n                        margin: 20px 0 0;\n                        \">\n                            &copy;&nbsp;{date(\"Y\")}&nbsp;{$wa->shop->settings(\"name\")}<br>\n                            <a href=\"http://{$order.params.storefront_decoded|default:\'\'}\" target=\"_blank\">{$order.params.storefront_decoded|default:\'\'}</a>\n                        </p>\n                    </td>\n                </tr>\n            </table>\n\n        </td>\n    </tr>\n</table>\n\n{/strip}\n'),
(15, 'sms', 'Статус вашего заказа {$order.id} изменен на «{$status}»'),
(15, 'to', 'customer');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_notification_sources`
--

CREATE TABLE `shop_notification_sources` (
  `notification_id` int(11) NOT NULL,
  `source` varchar(510) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_order`
--

CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `state_id` varchar(32) NOT NULL DEFAULT 'new',
  `total` decimal(15,4) NOT NULL,
  `currency` char(3) NOT NULL,
  `rate` decimal(15,8) NOT NULL DEFAULT 1.00000000,
  `tax` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `shipping` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `discount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `assigned_contact_id` int(11) DEFAULT NULL,
  `paid_year` smallint(6) DEFAULT NULL,
  `paid_quarter` smallint(6) DEFAULT NULL,
  `paid_month` smallint(6) DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `auth_date` date DEFAULT NULL,
  `is_first` tinyint(1) NOT NULL DEFAULT 0,
  `unsettled` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `shipping_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_order_items`
--

CREATE TABLE `shop_order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `sku_code` varchar(255) NOT NULL DEFAULT '',
  `type` enum('product','service') NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `service_variant_id` int(11) DEFAULT NULL,
  `price` decimal(15,4) NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `quantity_denominator` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `parent_id` int(11) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `virtualstock_id` int(11) DEFAULT NULL,
  `stock_unit_id` int(11) NOT NULL DEFAULT 0,
  `purchase_price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `total_discount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(7,4) DEFAULT NULL,
  `tax_included` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_order_item_codes`
--

CREATE TABLE `shop_order_item_codes` (
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `code_id` int(11) DEFAULT NULL,
  `code` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_order_log`
--

CREATE TABLE `shop_order_log` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `action_id` varchar(32) NOT NULL,
  `datetime` datetime NOT NULL,
  `before_state_id` varchar(32) NOT NULL,
  `after_state_id` varchar(32) NOT NULL,
  `text` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_order_log_params`
--

CREATE TABLE `shop_order_log_params` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_order_params`
--

CREATE TABLE `shop_order_params` (
  `order_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_page`
--

CREATE TABLE `shop_page` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `full_url` varchar(255) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  `create_contact_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_page_params`
--

CREATE TABLE `shop_page_params` (
  `page_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_plugin`
--

CREATE TABLE `shop_plugin` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `plugin` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `logo` text NOT NULL,
  `status` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `options` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_plugin`
--

INSERT INTO `shop_plugin` (`id`, `type`, `plugin`, `name`, `description`, `logo`, `status`, `sort`, `options`) VALUES
(1, 'payment', 'cash', 'Наличные', 'Оплата наличными при получении', '/wa/wa-plugins/payment/cash/img/cash.png', 1, 0, '[]'),
(2, 'payment', 'dummy', 'Оплата в ручном режиме', '', '', 0, 1, '[]'),
(3, 'payment', 'invoicephys', 'Оплата по квитанции', 'Оплата наличными по квитанции для физических лиц (РФ)', '/wa/wa-plugins/payment/invoicephys/img/invoicephys.png', 0, 2, '[]'),
(4, 'payment', 'invoicejur', 'Оплата по счету', 'Оплата безналичным расчетом для юридических лиц (РФ)', '/wa/wa-plugins/payment/invoicejur/img/invoicejur.png', 0, 3, '[]'),
(5, 'payment', 'yandexkassa', 'ЮKassa (бывшая Яндекс.Касса)', 'Приём платежей через сервис «ЮKassa» (<a href=\"https://yookassa.ru/\">yookassa.ru</a>).', '/wa/wa-plugins/payment/yandexkassa/img/yandexkassa.png', 1, 4, '[]'),
(6, 'shipping', 'boxberry', 'Boxberry', 'Расчет стоимости доставки сервисом <a href=\"https://boxberry.ru/\">Boxberry</a>.', '/wa/wa-plugins/shipping/boxberry/img/boxberry60x32.png', 0, 0, '[]'),
(7, 'shipping', 'dummy', 'Бесплатная доставка курьером', '', '', 1, 1, '[]'),
(8, 'shipping', 'courier', 'Курьер', 'Доставка ограничивается только определенной страной и регионом. Стоимость доставки рассчитывается на основании итоговой стоимости заказа либо веса отправления.', '/wa/wa-plugins/shipping/courier/img/courier.png', 0, 2, '[]'),
(9, 'shipping', 'worldwide', 'Международная доставка', 'Доставка в любую точку мира по доступным ценам.', '/wa/wa-plugins/shipping/worldwide/img/worldwide.png', 0, 3, '[]'),
(10, 'shipping', 'sd', 'Пункт выдачи заказов', 'Пункт выдачи заказов для покупателей из указанного региона или населённых пунктов.', '/wa/wa-plugins/shipping/sd/img/sd-60x32.png', 0, 4, '[]');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_plugin_settings`
--

CREATE TABLE `shop_plugin_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_presentation`
--

CREATE TABLE `shop_presentation` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `creator_contact_id` int(11) NOT NULL,
  `use_datetime` datetime DEFAULT NULL,
  `sort_column_id` int(10) UNSIGNED DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `sort_order` enum('asc','desc') NOT NULL DEFAULT 'asc',
  `view` enum('table','table_extended','thumbs') NOT NULL DEFAULT 'table',
  `rows_on_page` int(11) NOT NULL DEFAULT 30,
  `browser` varchar(64) DEFAULT NULL,
  `filter_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_presentation_columns`
--

CREATE TABLE `shop_presentation_columns` (
  `id` int(10) UNSIGNED NOT NULL,
  `presentation_id` int(10) UNSIGNED NOT NULL,
  `column_type` varchar(64) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product`
--

CREATE TABLE `shop_product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `edit_datetime` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `image_filename` varchar(255) NOT NULL DEFAULT '',
  `video_url` varchar(255) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `ext` varchar(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `rating` decimal(3,2) NOT NULL DEFAULT 0.00,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `compare_price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `currency` char(3) DEFAULT NULL,
  `min_price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `max_price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax_id` int(11) DEFAULT NULL,
  `count` decimal(15,3) DEFAULT NULL,
  `count_denominator` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `order_multiplicity_factor` decimal(9,3) NOT NULL DEFAULT 1.000,
  `stock_unit_id` int(11) NOT NULL DEFAULT 0,
  `base_unit_id` int(11) NOT NULL DEFAULT 0,
  `stock_base_ratio` decimal(16,8) UNSIGNED NOT NULL DEFAULT 1.00000000,
  `order_count_min` decimal(15,3) UNSIGNED NOT NULL DEFAULT 1.000,
  `order_count_step` decimal(15,3) UNSIGNED NOT NULL DEFAULT 1.000,
  `base_price` decimal(15,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `min_base_price` decimal(15,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `max_base_price` decimal(15,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `cross_selling` tinyint(1) DEFAULT NULL,
  `upselling` tinyint(1) DEFAULT NULL,
  `rating_count` int(11) NOT NULL DEFAULT 0,
  `total_sales` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `category_id` int(11) DEFAULT NULL,
  `badge` text DEFAULT NULL,
  `sku_type` tinyint(1) NOT NULL DEFAULT 0,
  `base_price_selectable` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `compare_price_selectable` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `purchase_price_selectable` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sku_count` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_product`
--

INSERT INTO `shop_product` (`id`, `name`, `summary`, `meta_title`, `meta_keywords`, `meta_description`, `description`, `contact_id`, `create_datetime`, `edit_datetime`, `status`, `type_id`, `image_id`, `image_filename`, `video_url`, `sku_id`, `ext`, `url`, `rating`, `price`, `compare_price`, `currency`, `min_price`, `max_price`, `tax_id`, `count`, `count_denominator`, `order_multiplicity_factor`, `stock_unit_id`, `base_unit_id`, `stock_base_ratio`, `order_count_min`, `order_count_step`, `base_price`, `min_base_price`, `max_base_price`, `cross_selling`, `upselling`, `rating_count`, `total_sales`, `category_id`, `badge`, `sku_type`, `base_price_selectable`, `compare_price_selectable`, `purchase_price_selectable`, `sku_count`) VALUES
(1, 'Фен Goodhelper HD-F082 ', 'Фен Goodhelper HD-F082', '', '', '', '<p>Фен Goodhelper HD-F082 представляет собой невероятно компактное устройство со складной ручкой, которое не потребует много места в дорожной сумке. При его непосредственном участии вы не только высушите шевелюру, но и придадите ей желаемую форму.</p>', 1, '2023-05-06 13:46:49', '2023-05-06 16:34:49', 1, 1, 1, '', NULL, 1, 'png', 'fen-goodhelper-hd-f082', '0.00', '250.0000', '0.0000', 'RUB', '250.0000', '250.0000', 0, NULL, 1, '1.000', 0, 0, '1.00000000', '1.000', '1.000', '250.0000', '250.0000', '250.0000', NULL, NULL, 0, '0.0000', 4, NULL, 0, '0.0000', '0.0000', '0.0000', 1),
(2, 'Фен DEXP BA-200', 'Фен DEXP BA-200', '', '', '', '<p>Фен DEXP BA-200, представленный в стильном корпусе черно-коричневого цвета, - прибор, потребность в котором испытывает каждая девушка. Данная модель отличается компактными размерами, благодаря которым она сможет стать вашим неизменным спутником.</p>', 1, '2023-05-06 16:03:19', '2023-05-06 16:34:49', 1, 1, 2, '', NULL, 2, 'png', 'fen-dexp-ba-200', '0.00', '299.0000', '0.0000', 'RUB', '299.0000', '299.0000', 0, NULL, 1, '1.000', 0, 0, '1.00000000', '1.000', '1.000', '299.0000', '299.0000', '299.0000', NULL, NULL, 0, '0.0000', 4, NULL, 0, '0.0000', '0.0000', '0.0000', 1),
(3, 'Фен Leben 489-049', 'Фен Leben 489-049', '', '', '', '<p>Фен для волос – незаменимая вещь для тех, кто хочет всегда иметь отличную прическу и ценит свое время.</p>', 1, '2023-05-06 16:06:07', '2023-05-06 16:34:49', 1, 1, 3, '', NULL, 3, 'png', 'fen-leben-489-049', '0.00', '299.0000', '0.0000', 'RUB', '299.0000', '299.0000', 0, NULL, 1, '1.000', 0, 0, '1.00000000', '1.000', '1.000', '299.0000', '299.0000', '299.0000', NULL, NULL, 0, '0.0000', 4, NULL, 0, '0.0000', '0.0000', '0.0000', 1),
(4, 'Электрочайник GOODHELPER KP-A11 голубой', 'Электрочайник GOODHELPER KP-A11 голубой', '', '', '', '<p>Электрочайник GOODHELPER KP-A11 – простая модель без лишнего функционала с емкостью 500 мл. Полупрозрачный корпус из термостойкого пластика позволит визуально определить количество воды без шкалы и прочих обозначений.</p>', 1, '2023-05-06 16:09:38', '2023-05-07 12:07:07', 1, 1, 13, '', NULL, 4, 'png', 'elektrochaynik-goodhelper-kp-a11-goluboy', '0.00', '350.0000', '0.0000', 'RUB', '350.0000', '350.0000', 0, NULL, 1, '1.000', 0, 0, '1.00000000', '1.000', '1.000', '350.0000', '350.0000', '350.0000', NULL, NULL, 0, '0.0000', 3, NULL, 0, '0.0000', '0.0000', '0.0000', 1),
(5, 'Электрочайник Капелька 003909 красный', 'Электрочайник Капелька 003909 красный', '', '', '', '<p>Электрочайник – миниатюрная модель, которую можно использовать в путешествиях. Модель способна буквально за минуту вскипятить 0.5 литра воды благодаря мощности в 600 ватт и открытому нагревательному элементу из нержавеющей стали.</p>', 1, '2023-05-06 16:11:42', '2023-05-07 12:06:12', 1, 1, 12, '', NULL, 5, 'png', 'elektrochaynik-kapelka-003909-krasnyy', '0.00', '399.0000', '0.0000', 'RUB', '399.0000', '399.0000', 0, NULL, 1, '1.000', 0, 0, '1.00000000', '1.000', '1.000', '399.0000', '399.0000', '399.0000', NULL, NULL, 0, '0.0000', 3, NULL, 0, '0.0000', '0.0000', '0.0000', 1),
(6, 'Электрочайник Мастерица ЭЧ 0,5/0,5-220С фиолетовый', 'Электрочайник Мастерица ЭЧ 0,5/0,5-220С фиолетовый', '', '', '', '<p>Электрочайник Мастерица ЭЧ 0,5/0,5-220С представлен в светло-сиреневой расцветке и оснащен легким пластиковым корпусом. Вместимость устройства составляет 0.5 л. Работа осуществляется с мощностью 500 Вт, чего достаточно для оперативного кипячения. Предусматривается наличие удобной шкалы для определения уровня воды.</p>', 1, '2023-05-06 16:14:00', '2023-05-07 12:05:45', 1, 1, 11, '', NULL, 6, 'png', 'elektrochaynik-masteritsa-ech-0-5-0-5-220s-fioletovyy', '0.00', '499.0000', '0.0000', 'RUB', '499.0000', '499.0000', 0, NULL, 1, '1.000', 0, 0, '1.00000000', '1.000', '1.000', '499.0000', '499.0000', '499.0000', NULL, NULL, 0, '0.0000', 3, NULL, 0, '0.0000', '0.0000', '0.0000', 1),
(7, 'Утюг BBK ISE-1802 фиолетовый', 'Утюг BBK ISE-1802 фиолетовый', '', '', '', '<p>Утюг BBK ISE-1802 обращает на себя внимание симпатичной расцветкой, представленной утонченным сочетанием фиолетового корпуса и белых вставок. Благодаря этому устройству вы сможете качественно и с комфортом отутюжить огромное количество мятой одежды и постельного белья.</p>', 1, '2023-05-06 16:15:38', '2023-05-06 16:34:32', 1, 1, 8, '', NULL, 7, 'png', 'utyug-bbk-ise-1802-fioletovyy', '0.00', '799.0000', '0.0000', 'RUB', '799.0000', '799.0000', 0, NULL, 1, '1.000', 0, 0, '1.00000000', '1.000', '1.000', '799.0000', '799.0000', '799.0000', NULL, NULL, 0, '0.0000', 2, NULL, 0, '0.0000', '0.0000', '0.0000', 1),
(8, 'Утюг DEXP HH2200BS фиолетовый', 'Утюг DEXP HH2200BS фиолетовый', '', '', '', '<p>Утюг DEXP HH2200BS представляет собой мощное устройство, с которым процесс глажения станет легким и быстрым. Обладая мощностью 2200 Вт, прибор поддерживает паровой удар, позволяющий избавиться от любых складок, даже очень глубоких, за считанные секунды.</p>', 1, '2023-05-06 16:21:52', '2023-05-06 16:34:32', 1, 1, 9, '', NULL, 8, 'png', 'utyug-dexp-hh2200bs-fioletovyy', '0.00', '850.0000', '0.0000', 'RUB', '850.0000', '850.0000', 0, NULL, 1, '1.000', 0, 0, '1.00000000', '1.000', '1.000', '850.0000', '850.0000', '850.0000', NULL, NULL, 0, '0.0000', 2, NULL, 0, '0.0000', '0.0000', '0.0000', 1),
(9, 'Утюг Centek CT-2347 красный', 'Утюг Centek CT-2347 красный', '', '', '', '<p>С утюгом Centek CT-2347 красного цвета гладить белье Вам будет легко и комфортно, а Ваша одежда будет выглядеть безупречно. Для этого утюг обладает всеми необходимыми функциональными особенностями: мощность в 1800 Вт заставит прибор быстро нагреваться, терморегулятор позволит выбрать подходящий температурный режим и для деликатных и для грубых тканей, вертикальное отпаривание приведет в порядок Вашу одежду без необходимости снимать ее с плечиков.</p>', 1, '2023-05-06 16:24:11', '2023-05-06 16:34:32', 1, 1, 10, '', NULL, 9, 'png', 'utyug-centek-ct-2347-krasnyy', '0.00', '799.0000', '0.0000', 'RUB', '799.0000', '799.0000', 0, NULL, 1, '1.000', 0, 0, '1.00000000', '1.000', '1.000', '799.0000', '799.0000', '799.0000', NULL, NULL, 0, '0.0000', 2, NULL, 0, '0.0000', '0.0000', '0.0000', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_code`
--

CREATE TABLE `shop_product_code` (
  `id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `protected` tinyint(1) DEFAULT 0,
  `plugin_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_features`
--

CREATE TABLE `shop_product_features` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `feature_id` int(11) NOT NULL,
  `feature_value_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_features_selectable`
--

CREATE TABLE `shop_product_features_selectable` (
  `product_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_images`
--

CREATE TABLE `shop_product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `upload_datetime` datetime NOT NULL,
  `edit_datetime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `width` int(5) NOT NULL DEFAULT 0,
  `height` int(5) NOT NULL DEFAULT 0,
  `size` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) DEFAULT NULL,
  `ext` varchar(10) DEFAULT NULL,
  `badge_type` int(4) DEFAULT NULL,
  `badge_code` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_product_images`
--

INSERT INTO `shop_product_images` (`id`, `product_id`, `upload_datetime`, `edit_datetime`, `description`, `sort`, `width`, `height`, `size`, `filename`, `original_filename`, `ext`, `badge_type`, `badge_code`) VALUES
(1, 1, '2023-05-06 15:58:46', NULL, NULL, 0, 500, 500, 6404, '', '1.png', 'png', NULL, NULL),
(2, 2, '2023-05-06 16:04:29', NULL, NULL, 0, 500, 499, 16464, '', '2.png', 'png', NULL, NULL),
(3, 3, '2023-05-06 16:06:49', NULL, NULL, 0, 500, 500, 4828, '', '3.png', 'png', NULL, NULL),
(13, 4, '2023-05-07 12:07:01', NULL, NULL, 0, 400, 400, 178372, '', '4.png', 'png', NULL, NULL),
(12, 5, '2023-05-07 12:06:10', NULL, NULL, 0, 300, 292, 101057, '', '5.png', 'png', NULL, NULL),
(11, 6, '2023-05-07 12:05:41', NULL, NULL, 0, 400, 352, 195047, '', '6.png', 'png', NULL, NULL),
(8, 7, '2023-05-06 16:19:17', NULL, NULL, 0, 370, 492, 193564, '', '7.png', 'png', NULL, NULL),
(9, 8, '2023-05-06 16:21:56', NULL, NULL, 0, 500, 500, 34744, '', '8.png', 'png', NULL, NULL),
(10, 9, '2023-05-06 16:24:14', NULL, NULL, 0, 375, 500, 9314, '', '9.png', 'png', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_og`
--

CREATE TABLE `shop_product_og` (
  `product_id` int(11) NOT NULL,
  `property` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_pages`
--

CREATE TABLE `shop_product_pages` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  `create_contact_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `keywords` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_params`
--

CREATE TABLE `shop_product_params` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_related`
--

CREATE TABLE `shop_product_related` (
  `product_id` int(11) NOT NULL,
  `type` enum('cross_selling','upselling') NOT NULL,
  `related_product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_reviews`
--

CREATE TABLE `shop_product_reviews` (
  `id` int(11) NOT NULL,
  `left_key` int(11) DEFAULT NULL,
  `right_key` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL DEFAULT 0,
  `datetime` datetime NOT NULL,
  `status` enum('approved','deleted','moderation') NOT NULL DEFAULT 'approved',
  `title` varchar(64) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `rate` decimal(3,2) DEFAULT NULL,
  `contact_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `images_count` int(11) DEFAULT 0,
  `site` varchar(100) DEFAULT NULL,
  `auth_provider` varchar(100) DEFAULT NULL,
  `ip` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_reviews_images`
--

CREATE TABLE `shop_product_reviews_images` (
  `id` int(11) NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `upload_datetime` datetime NOT NULL,
  `edit_datetime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT 0,
  `width` int(5) DEFAULT 0,
  `height` int(5) DEFAULT 0,
  `size` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `original_filename` varchar(255) DEFAULT NULL,
  `ext` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_services`
--

CREATE TABLE `shop_product_services` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku_id` int(11) DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  `service_variant_id` int(11) NOT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `primary_price` decimal(15,4) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_skus`
--

CREATE TABLE `shop_product_skus` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `image_id` int(11) DEFAULT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `primary_price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `purchase_price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `compare_price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `count` decimal(15,3) DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `stock_base_ratio` decimal(16,8) UNSIGNED DEFAULT NULL,
  `order_count_min` decimal(15,3) UNSIGNED DEFAULT NULL,
  `order_count_step` decimal(15,3) UNSIGNED DEFAULT NULL,
  `dimension_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_size` int(11) NOT NULL DEFAULT 0,
  `file_description` text DEFAULT NULL,
  `virtual` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_product_skus`
--

INSERT INTO `shop_product_skus` (`id`, `product_id`, `sku`, `sort`, `name`, `image_id`, `price`, `primary_price`, `purchase_price`, `compare_price`, `count`, `available`, `status`, `stock_base_ratio`, `order_count_min`, `order_count_step`, `dimension_id`, `file_name`, `file_size`, `file_description`, `virtual`) VALUES
(1, 1, '8195338', 1, '', NULL, '250.0000', '250.0000', '0.0000', '0.0000', NULL, 1, 1, NULL, NULL, NULL, NULL, '', 0, NULL, 0),
(2, 2, '1203121', 1, '', NULL, '299.0000', '299.0000', '0.0000', '0.0000', NULL, 1, 1, NULL, NULL, NULL, NULL, '', 0, NULL, 0),
(3, 3, '9937505', 1, '', NULL, '299.0000', '299.0000', '0.0000', '0.0000', NULL, 1, 1, NULL, NULL, NULL, NULL, '', 0, NULL, 0),
(4, 4, '4781697', 1, '', NULL, '350.0000', '350.0000', '0.0000', '0.0000', NULL, 1, 1, NULL, NULL, NULL, NULL, '', 0, NULL, 0),
(5, 5, '9935955', 1, '', NULL, '399.0000', '399.0000', '0.0000', '0.0000', NULL, 1, 1, NULL, NULL, NULL, NULL, '', 0, NULL, 0),
(6, 6, '1051755', 1, '', NULL, '499.0000', '499.0000', '0.0000', '0.0000', NULL, 1, 1, NULL, NULL, NULL, NULL, '', 0, NULL, 0),
(7, 7, '1186539', 1, '', NULL, '799.0000', '799.0000', '0.0000', '0.0000', NULL, 1, 1, NULL, NULL, NULL, NULL, '', 0, NULL, 0),
(8, 8, '1365322', 1, '', NULL, '850.0000', '850.0000', '0.0000', '0.0000', NULL, 1, 1, NULL, NULL, NULL, NULL, '', 0, NULL, 0),
(9, 9, '1090786', 1, '', NULL, '799.0000', '799.0000', '0.0000', '0.0000', NULL, 1, 1, NULL, NULL, NULL, NULL, '', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_stocks`
--

CREATE TABLE `shop_product_stocks` (
  `sku_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL,
  `count` decimal(15,3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_stocks_log`
--

CREATE TABLE `shop_product_stocks_log` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `stock_name` varchar(255) DEFAULT NULL,
  `before_count` decimal(15,3) DEFAULT NULL,
  `after_count` decimal(15,3) DEFAULT NULL,
  `diff_count` decimal(15,3) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `description` text DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_tags`
--

CREATE TABLE `shop_product_tags` (
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_product_tags`
--

INSERT INTO `shop_product_tags` (`product_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 4),
(3, 6),
(4, 3),
(4, 7),
(4, 8),
(4, 9),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 12),
(7, 13),
(7, 14),
(7, 15),
(8, 5),
(8, 13),
(8, 14),
(8, 16),
(9, 13),
(9, 14),
(9, 16),
(9, 17);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_promo`
--

CREATE TABLE `shop_promo` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `consider_end_orders` tinyint(1) NOT NULL DEFAULT 1,
  `text_id` varchar(64) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `finish_datetime` datetime DEFAULT NULL,
  `author_contact_id` int(11) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_promo`
--

INSERT INTO `shop_promo` (`id`, `name`, `enabled`, `consider_end_orders`, `text_id`, `note`, `start_datetime`, `finish_datetime`, `author_contact_id`, `create_datetime`, `update_datetime`) VALUES
(1, 'Онлайн-заказы', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Быстрая доставка', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Скидки до 30%', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Товар недели', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_promo_orders`
--

CREATE TABLE `shop_promo_orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `promo_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_promo_routes`
--

CREATE TABLE `shop_promo_routes` (
  `promo_id` int(10) UNSIGNED NOT NULL,
  `storefront` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_promo_routes`
--

INSERT INTO `shop_promo_routes` (`promo_id`, `storefront`, `sort`) VALUES
(1, '%all%', 1),
(2, '%all%', 2),
(3, '%all%', 3),
(4, '%all%', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_promo_rules`
--

CREATE TABLE `shop_promo_rules` (
  `id` int(11) UNSIGNED NOT NULL,
  `promo_id` int(10) UNSIGNED NOT NULL,
  `rule_type` varchar(32) NOT NULL,
  `rule_params` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_promo_rules`
--

INSERT INTO `shop_promo_rules` (`id`, `promo_id`, `rule_type`, `rule_params`) VALUES
(1, 1, 'banner', '{\"banners\":[{\"type\":\"link\",\"title\":\"Онлайн-заказ\",\"body\":\"Заказывайте с помощью компьютера, планшета или телефона.\",\"link\":\"#\",\"color\":\"#ffffff\",\"image_filename\":\"promo_64563626a6f99493690728.jpg\"}]}'),
(2, 2, 'banner', '{\"banners\":[{\"type\":\"link\",\"title\":\"Быстрая доставка\",\"body\":\"Закажите до 20:00 — доставим уже завтра утром!\",\"link\":\"#\",\"color\":\"#ffffff\",\"image_filename\":\"promo_64563626aafdc215816934.jpg\"}]}'),
(3, 3, 'banner', '{\"banners\":[{\"type\":\"link\",\"title\":\"Скидки до 30%\",\"body\":\"Распродажа зимней коллекции по суперценам. Не пропустите!\",\"link\":\"#\",\"color\":\"#ffffff\",\"image_filename\":\"promo_64563626ad83c428213691.jpg\"}]}'),
(4, 4, 'banner', '{\"banners\":[{\"type\":\"link\",\"title\":\"Товар недели\",\"body\":\"Заказывайте сегодня по лучшей цене и получите подарок.\",\"link\":\"#\",\"color\":\"#ffffff\",\"image_filename\":\"promo_64563626b03e1232812843.jpg\"}]}');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_push_client`
--

CREATE TABLE `shop_push_client` (
  `contact_id` int(11) NOT NULL,
  `client_id` varchar(64) NOT NULL,
  `shop_url` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `api_token` varchar(32) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_sales`
--

CREATE TABLE `shop_sales` (
  `hash` varchar(32) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `order_count` int(11) NOT NULL DEFAULT 0,
  `sales` float NOT NULL DEFAULT 0,
  `shipping` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `purchase` float NOT NULL DEFAULT 0,
  `cost` float NOT NULL DEFAULT 0,
  `new_customer_count` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_search_index`
--

CREATE TABLE `shop_search_index` (
  `word_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_search_index`
--

INSERT INTO `shop_search_index` (`word_id`, `product_id`, `weight`) VALUES
(1, 1, 160),
(1, 2, 160),
(1, 3, 160),
(2, 1, 160),
(2, 4, 160),
(3, 1, 130),
(4, 1, 130),
(5, 1, 130),
(6, 1, 130),
(7, 1, 130),
(8, 1, 20),
(8, 8, 20),
(9, 1, 20),
(9, 8, 20),
(10, 1, 20),
(11, 1, 20),
(11, 2, 20),
(12, 1, 20),
(12, 8, 20),
(13, 1, 20),
(14, 1, 20),
(15, 1, 20),
(16, 1, 20),
(16, 2, 20),
(16, 5, 20),
(16, 8, 20),
(17, 1, 20),
(18, 1, 20),
(19, 1, 20),
(20, 1, 20),
(21, 1, 20),
(21, 2, 20),
(21, 5, 20),
(21, 6, 20),
(21, 9, 20),
(22, 1, 20),
(23, 1, 20),
(24, 1, 20),
(25, 1, 20),
(26, 1, 20),
(27, 1, 20),
(28, 1, 20),
(28, 7, 20),
(29, 1, 20),
(30, 1, 20),
(31, 1, 20),
(32, 1, 20),
(33, 1, 20),
(33, 3, 20),
(33, 4, 20),
(33, 5, 20),
(33, 6, 20),
(33, 7, 20),
(33, 8, 20),
(33, 9, 20),
(34, 1, 20),
(35, 1, 20),
(35, 9, 20),
(36, 1, 20),
(37, 1, 20),
(38, 1, 40),
(39, 1, 10),
(39, 2, 10),
(39, 3, 10),
(39, 4, 10),
(39, 5, 10),
(39, 6, 10),
(39, 7, 10),
(39, 8, 10),
(39, 9, 10),
(40, 1, 10),
(40, 2, 10),
(40, 3, 10),
(40, 4, 10),
(40, 5, 10),
(40, 6, 10),
(40, 7, 10),
(40, 8, 10),
(40, 9, 10),
(41, 1, 15),
(41, 2, 15),
(41, 3, 15),
(42, 1, 15),
(42, 2, 30),
(42, 3, 50),
(43, 1, 30),
(43, 2, 30),
(43, 3, 30),
(44, 2, 160),
(44, 8, 160),
(45, 2, 130),
(46, 2, 130),
(47, 2, 130),
(48, 2, 130),
(49, 2, 20),
(49, 6, 20),
(49, 7, 20),
(50, 2, 20),
(51, 2, 20),
(51, 4, 20),
(51, 6, 20),
(51, 7, 20),
(52, 2, 20),
(53, 2, 20),
(53, 9, 20),
(54, 2, 20),
(55, 2, 20),
(55, 8, 20),
(55, 9, 20),
(56, 2, 20),
(57, 2, 20),
(58, 2, 20),
(59, 2, 20),
(60, 2, 20),
(61, 2, 20),
(61, 4, 20),
(61, 5, 20),
(62, 2, 20),
(63, 2, 20),
(64, 2, 20),
(64, 5, 20),
(64, 7, 20),
(65, 2, 20),
(66, 2, 20),
(66, 7, 20),
(67, 2, 20),
(68, 2, 20),
(68, 9, 20),
(69, 2, 20),
(70, 2, 20),
(71, 2, 20),
(72, 2, 20),
(73, 2, 20),
(74, 2, 40),
(75, 3, 140),
(76, 3, 110),
(77, 3, 20),
(77, 6, 20),
(77, 9, 20),
(78, 3, 20),
(78, 4, 20),
(78, 5, 20),
(79, 3, 20),
(80, 3, 20),
(81, 3, 20),
(82, 3, 20),
(83, 3, 20),
(84, 3, 20),
(85, 3, 20),
(86, 3, 20),
(87, 3, 20),
(88, 3, 20),
(89, 3, 20),
(90, 3, 20),
(91, 3, 40),
(92, 4, 160),
(92, 5, 160),
(92, 6, 160),
(93, 4, 130),
(94, 4, 110),
(95, 4, 130),
(96, 4, 130),
(97, 4, 130),
(98, 4, 130),
(99, 4, 20),
(100, 4, 20),
(100, 9, 20),
(101, 4, 20),
(102, 4, 20),
(103, 4, 20),
(103, 6, 20),
(103, 7, 20),
(103, 8, 20),
(103, 9, 20),
(104, 4, 20),
(105, 4, 20),
(105, 6, 20),
(106, 4, 20),
(107, 4, 20),
(108, 4, 20),
(108, 5, 20),
(109, 4, 20),
(110, 4, 20),
(111, 4, 20),
(111, 9, 20),
(112, 4, 20),
(113, 4, 20),
(114, 4, 20),
(114, 7, 20),
(115, 4, 50),
(115, 5, 50),
(115, 6, 50),
(116, 4, 20),
(116, 6, 20),
(117, 4, 20),
(118, 4, 20),
(119, 4, 40),
(120, 4, 30),
(120, 5, 30),
(120, 6, 30),
(121, 5, 140),
(122, 5, 110),
(123, 5, 110),
(123, 9, 130),
(124, 5, 20),
(125, 5, 20),
(126, 5, 20),
(127, 5, 20),
(128, 5, 20),
(129, 5, 20),
(130, 5, 20),
(130, 8, 20),
(131, 5, 20),
(132, 5, 20),
(133, 5, 20),
(133, 6, 20),
(134, 5, 20),
(135, 5, 20),
(135, 6, 20),
(135, 8, 20),
(135, 9, 20),
(136, 5, 20),
(137, 5, 20),
(138, 5, 20),
(139, 5, 20),
(140, 5, 20),
(141, 5, 20),
(142, 5, 20),
(143, 5, 40),
(144, 5, 30),
(144, 6, 30),
(145, 6, 160),
(146, 6, 130),
(147, 6, 130),
(148, 6, 130),
(149, 6, 110),
(149, 7, 130),
(149, 8, 110),
(150, 6, 20),
(151, 6, 20),
(151, 7, 20),
(152, 6, 20),
(153, 6, 20),
(153, 8, 20),
(154, 6, 20),
(155, 6, 20),
(156, 6, 20),
(157, 6, 20),
(158, 6, 20),
(159, 6, 20),
(160, 6, 20),
(161, 6, 20),
(161, 8, 20),
(161, 9, 20),
(162, 6, 20),
(163, 6, 20),
(164, 6, 20),
(165, 6, 20),
(166, 6, 20),
(167, 6, 20),
(168, 6, 20),
(169, 6, 20),
(170, 6, 20),
(171, 6, 20),
(172, 6, 20),
(173, 6, 20),
(174, 6, 40),
(175, 7, 160),
(175, 8, 160),
(175, 9, 160),
(176, 7, 160),
(177, 7, 130),
(178, 7, 130),
(179, 7, 130),
(180, 7, 130),
(181, 7, 20),
(182, 7, 20),
(183, 7, 20),
(184, 7, 20),
(185, 7, 20),
(186, 7, 20),
(187, 7, 20),
(188, 7, 20),
(189, 7, 20),
(190, 7, 20),
(191, 7, 20),
(192, 7, 20),
(193, 7, 20),
(194, 7, 20),
(195, 7, 20),
(196, 7, 20),
(197, 7, 20),
(197, 9, 20),
(198, 7, 20),
(199, 7, 20),
(199, 8, 30),
(199, 9, 50),
(200, 7, 40),
(201, 7, 30),
(201, 8, 30),
(201, 9, 50),
(202, 8, 130),
(203, 8, 130),
(204, 8, 130),
(205, 8, 20),
(206, 8, 20),
(207, 8, 20),
(208, 8, 20),
(209, 8, 20),
(210, 8, 20),
(211, 8, 20),
(212, 8, 20),
(213, 8, 20),
(214, 8, 20),
(215, 8, 20),
(216, 8, 20),
(217, 8, 20),
(218, 8, 20),
(219, 8, 20),
(220, 8, 20),
(221, 8, 20),
(222, 8, 20),
(223, 8, 20),
(224, 8, 40),
(225, 9, 160),
(226, 9, 130),
(227, 9, 130),
(228, 9, 130),
(229, 9, 130),
(230, 9, 20),
(231, 9, 20),
(232, 9, 20),
(233, 9, 20),
(234, 9, 20),
(235, 9, 20),
(236, 9, 20),
(237, 9, 20),
(238, 9, 20),
(239, 9, 20),
(240, 9, 20),
(241, 9, 20),
(242, 9, 20),
(243, 9, 20),
(244, 9, 20),
(245, 9, 20),
(246, 9, 20),
(247, 9, 20),
(248, 9, 20),
(249, 9, 20),
(250, 9, 20),
(251, 9, 20),
(252, 9, 20),
(253, 9, 20),
(254, 9, 20),
(255, 9, 20),
(256, 9, 20),
(257, 9, 20),
(258, 9, 20),
(259, 9, 20),
(260, 9, 20),
(261, 9, 20),
(262, 9, 20),
(263, 9, 40);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_search_word`
--

CREATE TABLE `shop_search_word` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_search_word`
--

INSERT INTO `shop_search_word` (`id`, `name`) VALUES
(1, 'фен'),
(2, 'goodhelp'),
(3, 'hd-f082'),
(4, 'hd'),
(5, 'f082'),
(6, 'hdf082'),
(7, '082'),
(8, 'представля'),
(9, 'соб'),
(10, 'невероятно'),
(11, 'компактн'),
(12, 'устройство'),
(13, 'со'),
(14, 'складн'),
(15, 'ручк'),
(16, 'котор'),
(17, 'не'),
(18, 'потребует'),
(19, 'много'),
(20, 'мест'),
(21, 'в'),
(22, 'дорожн'),
(23, 'сумк'),
(24, 'при'),
(25, 'его'),
(26, 'непосредствен'),
(27, 'участ'),
(28, 'вы'),
(29, 'только'),
(30, 'высуш'),
(31, 'шевелюру'),
(32, 'но'),
(33, 'и'),
(34, 'придад'),
(35, 'е'),
(36, 'жела'),
(37, 'форму'),
(38, '8195338'),
(39, 'обычн'),
(40, 'товар'),
(41, 'сушк'),
(42, 'волос'),
(43, 'сушка волос'),
(44, 'dexp'),
(45, 'ba-200'),
(46, 'ba'),
(47, '200'),
(48, 'ba200'),
(49, 'представлен'),
(50, 'стильн'),
(51, 'корпус'),
(52, 'черно-коричневого'),
(53, 'цвет'),
(54, '-'),
(55, 'прибор'),
(56, 'потребн'),
(57, 'испытыва'),
(58, 'кажд'),
(59, 'девушк'),
(60, 'дан'),
(61, 'модел'),
(62, 'отлича'),
(63, 'размер'),
(64, 'благодар'),
(65, 'он'),
(66, 'сможет'),
(67, 'стат'),
(68, 'ваш'),
(69, 'неизмен'),
(70, 'спутник'),
(71, 'черно'),
(72, 'коричнев'),
(73, 'чернокоричнев'),
(74, '1203121'),
(75, 'leben'),
(76, '489-049'),
(77, 'для'),
(78, '–'),
(79, 'незаменим'),
(80, 'вещ'),
(81, 'тех'),
(82, 'кто'),
(83, 'хочет'),
(84, 'всегд'),
(85, 'имет'),
(86, 'отличн'),
(87, 'прическу'),
(88, 'ценит'),
(89, 'сво'),
(90, 'врем'),
(91, '9937505'),
(92, 'электрочайник'),
(93, 'kp-a11'),
(94, 'голуб'),
(95, 'kp'),
(96, 'a11'),
(97, 'kpa11'),
(98, '11'),
(99, 'прост'),
(100, 'без'),
(101, 'лишн'),
(102, 'функциона'),
(103, 'с'),
(104, 'емкост'),
(105, '500'),
(106, 'мл'),
(107, 'полупрозрачн'),
(108, 'из'),
(109, 'термостойк'),
(110, 'пластик'),
(111, 'позволит'),
(112, 'визуально'),
(113, 'определ'),
(114, 'количество'),
(115, 'вод'),
(116, 'шкал'),
(117, 'прочих'),
(118, 'обозначен'),
(119, '4781697'),
(120, 'чайник'),
(121, 'капельк'),
(122, '003909'),
(123, 'красн'),
(124, 'миниатюрн'),
(125, 'можно'),
(126, 'использова'),
(127, 'путешествиях'),
(128, 'способн'),
(129, 'буквально'),
(130, 'за'),
(131, 'минуту'),
(132, 'вскипят'),
(133, '05'),
(134, 'литр'),
(135, 'мощност'),
(136, '600'),
(137, 'ватт'),
(138, 'открытому'),
(139, 'нагревательному'),
(140, 'элементу'),
(141, 'нержавеющ'),
(142, 'стал'),
(143, '9935955'),
(144, 'кипяток'),
(145, 'мастериц'),
(146, 'эч'),
(147, '50'),
(148, '5-220с'),
(149, 'фиолетов'),
(150, 'светло-сиреневой'),
(151, 'расцветк'),
(152, 'оснащен'),
(153, 'легк'),
(154, 'пластиков'),
(155, 'вместим'),
(156, 'устройств'),
(157, 'составля'),
(158, 'л'),
(159, 'работ'),
(160, 'осуществля'),
(161, 'вт'),
(162, 'чего'),
(163, 'достаточно'),
(164, 'оперативн'),
(165, 'кипячен'),
(166, 'предусматрива'),
(167, 'налич'),
(168, 'удобн'),
(169, 'определен'),
(170, 'уровн'),
(171, 'светло'),
(172, 'сиренев'),
(173, 'светлосиренев'),
(174, '1051755'),
(175, 'утюг'),
(176, 'bbk'),
(177, 'ise-1802'),
(178, 'is'),
(179, '1802'),
(180, 'ise1802'),
(181, 'обраща'),
(182, 'на'),
(183, 'себ'),
(184, 'вниман'),
(185, 'симпатичн'),
(186, 'утончен'),
(187, 'сочетан'),
(188, 'белых'),
(189, 'вставок'),
(190, 'этому'),
(191, 'устройству'),
(192, 'качественно'),
(193, 'комфорт'),
(194, 'отутюж'),
(195, 'огромн'),
(196, 'мят'),
(197, 'одежд'),
(198, 'постельн'),
(199, 'бел'),
(200, '1186539'),
(201, 'глад'),
(202, 'hh2200bs'),
(203, '2200'),
(204, 'hh2200'),
(205, 'мощн'),
(206, 'процесс'),
(207, 'глажен'),
(208, 'станет'),
(209, 'быстр'),
(210, 'облад'),
(211, 'поддержива'),
(212, 'паров'),
(213, 'удар'),
(214, 'позволя'),
(215, 'избав'),
(216, 'от'),
(217, 'любых'),
(218, 'складок'),
(219, 'даж'),
(220, 'очен'),
(221, 'глубоких'),
(222, 'счита'),
(223, 'секунд'),
(224, '1365322'),
(225, 'centek'),
(226, 'ct-2347'),
(227, 'ct'),
(228, '2347'),
(229, 'ct2347'),
(230, 'вам'),
(231, 'будет'),
(232, 'легко'),
(233, 'комфортно'),
(234, 'а'),
(235, 'выглядет'),
(236, 'безупречно'),
(237, 'эт'),
(238, 'облада'),
(239, 'всем'),
(240, 'необходим'),
(241, 'функциональн'),
(242, 'особен'),
(243, '1800'),
(244, 'заставит'),
(245, 'быстро'),
(246, 'нагрева'),
(247, 'терморегулятор'),
(248, 'выбра'),
(249, 'подходя'),
(250, 'температурн'),
(251, 'реж'),
(252, 'деликатных'),
(253, 'грубых'),
(254, 'ткан'),
(255, 'вертикальн'),
(256, 'отпариван'),
(257, 'приведет'),
(258, 'порядок'),
(259, 'вашу'),
(260, 'одежду'),
(261, 'снима'),
(262, 'плечик'),
(263, '1090786');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_service`
--

CREATE TABLE `shop_service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `currency` char(3) DEFAULT NULL,
  `variant_id` int(11) NOT NULL,
  `tax_id` int(11) DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_service_variants`
--

CREATE TABLE `shop_service_variants` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `primary_price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_set`
--

CREATE TABLE `shop_set` (
  `id` varchar(64) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rule` varchar(32) DEFAULT NULL,
  `type` int(1) DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `sort_products` varchar(32) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `edit_datetime` datetime DEFAULT NULL,
  `json_params` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_set`
--

INSERT INTO `shop_set` (`id`, `group_id`, `name`, `rule`, `type`, `count`, `sort`, `sort_products`, `create_datetime`, `edit_datetime`, `json_params`) VALUES
('promo', NULL, 'Промо', NULL, 0, 0, 1, NULL, '2023-05-06 13:12:38', NULL, NULL),
('bestsellers', NULL, 'Хиты продаж', 'rating DESC', 1, 8, 0, NULL, '2023-05-06 13:12:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_set_group`
--

CREATE TABLE `shop_set_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_set_products`
--

CREATE TABLE `shop_set_products` (
  `set_id` varchar(64) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_set_products`
--

INSERT INTO `shop_set_products` (`set_id`, `product_id`, `sort`) VALUES
('', 1, 0),
('', 2, 1),
('', 3, 2),
('', 4, 3),
('', 5, 4),
('', 6, 5),
('', 7, 6),
('', 8, 7),
('', 9, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_stock`
--

CREATE TABLE `shop_stock` (
  `id` int(11) NOT NULL,
  `low_count` int(11) NOT NULL DEFAULT 0,
  `critical_count` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `public` int(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_stock_rules`
--

CREATE TABLE `shop_stock_rules` (
  `id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `stock_id` int(11) DEFAULT NULL,
  `virtualstock_id` int(11) DEFAULT NULL,
  `rule_type` varchar(255) NOT NULL,
  `rule_data` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_tag`
--

CREATE TABLE `shop_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_tag`
--

INSERT INTO `shop_tag` (`id`, `name`, `count`) VALUES
(1, 'фен', 3),
(2, 'сушка волос', 3),
(3, 'Goodhelper', 2),
(4, 'волосы', 2),
(5, 'dexp', 2),
(6, 'leben', 1),
(7, 'Электрочайник', 3),
(8, 'чайник', 3),
(9, 'вода', 3),
(10, 'кипяток', 2),
(11, 'Капелька', 1),
(12, 'Мастерица', 1),
(13, 'утюг', 3),
(14, 'гладить', 3),
(15, 'BBK', 1),
(16, 'белье', 2),
(17, 'Centek', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_tax`
--

CREATE TABLE `shop_tax` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `included` int(11) NOT NULL DEFAULT 0,
  `address_type` varchar(8) NOT NULL DEFAULT 'shipping'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_tax`
--

INSERT INTO `shop_tax` (`id`, `name`, `included`, `address_type`) VALUES
(1, 'НДС', 1, 'shipping');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_tax_regions`
--

CREATE TABLE `shop_tax_regions` (
  `tax_id` int(11) NOT NULL,
  `country_iso3` varchar(3) NOT NULL,
  `region_code` varchar(8) DEFAULT NULL,
  `tax_value` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `tax_name` varchar(255) DEFAULT NULL,
  `params` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_tax_regions`
--

INSERT INTO `shop_tax_regions` (`tax_id`, `country_iso3`, `region_code`, `tax_value`, `tax_name`, `params`) VALUES
(1, 'rus', NULL, '20.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_tax_zip_codes`
--

CREATE TABLE `shop_tax_zip_codes` (
  `tax_id` int(11) NOT NULL,
  `zip_expr` varchar(16) NOT NULL,
  `tax_value` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_transfer`
--

CREATE TABLE `shop_transfer` (
  `id` int(11) NOT NULL,
  `string_id` varchar(255) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `finalize_datetime` datetime DEFAULT NULL,
  `status` enum('sent','completed','cancelled') NOT NULL DEFAULT 'sent',
  `stock_id_from` int(11) NOT NULL,
  `stock_id_to` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_transfer_products`
--

CREATE TABLE `shop_transfer_products` (
  `product_id` int(11) NOT NULL,
  `sku_id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `count` decimal(15,3) NOT NULL DEFAULT 0.000
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_type`
--

CREATE TABLE `shop_type` (
  `id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `cross_selling` varchar(64) NOT NULL DEFAULT 'alsobought',
  `upselling` tinyint(1) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `stock_unit_fixed` int(11) NOT NULL DEFAULT 2,
  `stock_unit_id` int(11) NOT NULL DEFAULT 0,
  `base_unit_fixed` int(11) NOT NULL DEFAULT 2,
  `base_unit_id` int(11) DEFAULT NULL,
  `stock_base_ratio_fixed` int(11) NOT NULL DEFAULT 2,
  `stock_base_ratio` decimal(16,8) UNSIGNED NOT NULL DEFAULT 1.00000000,
  `count_denominator_fixed` int(11) NOT NULL DEFAULT 2,
  `count_denominator` int(11) UNSIGNED DEFAULT NULL,
  `order_multiplicity_factor_fixed` int(11) NOT NULL DEFAULT 2,
  `order_multiplicity_factor` decimal(9,3) DEFAULT NULL,
  `order_count_min_fixed` int(11) NOT NULL DEFAULT 2,
  `order_count_min` decimal(15,3) UNSIGNED DEFAULT NULL,
  `order_count_step_fixed` int(11) NOT NULL DEFAULT 2,
  `order_count_step` decimal(15,3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_type`
--

INSERT INTO `shop_type` (`id`, `sort`, `name`, `icon`, `cross_selling`, `upselling`, `count`, `stock_unit_fixed`, `stock_unit_id`, `base_unit_fixed`, `base_unit_id`, `stock_base_ratio_fixed`, `stock_base_ratio`, `count_denominator_fixed`, `count_denominator`, `order_multiplicity_factor_fixed`, `order_multiplicity_factor`, `order_count_min_fixed`, `order_count_min`, `order_count_step_fixed`, `order_count_step`) VALUES
(1, 0, 'Обычный товар', 'box', 'alsobought', 0, 9, 2, 0, 2, NULL, 2, '1.00000000', 2, NULL, 2, NULL, 2, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_type_codes`
--

CREATE TABLE `shop_type_codes` (
  `type_id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_type_features`
--

CREATE TABLE `shop_type_features` (
  `type_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_type_features`
--

INSERT INTO `shop_type_features` (`type_id`, `feature_id`, `sort`) VALUES
(1, 1, 0),
(1, 2, 1),
(1, 3, 2),
(1, 4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_type_services`
--

CREATE TABLE `shop_type_services` (
  `type_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_type_upselling`
--

CREATE TABLE `shop_type_upselling` (
  `type_id` int(11) NOT NULL,
  `feature` varchar(32) NOT NULL,
  `feature_id` int(11) DEFAULT NULL,
  `cond` varchar(16) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_unit`
--

CREATE TABLE `shop_unit` (
  `id` int(11) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL DEFAULT '',
  `name5` varchar(255) NOT NULL DEFAULT '',
  `okei_code` varchar(64) NOT NULL,
  `storefront_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `builtin` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `shop_unit`
--

INSERT INTO `shop_unit` (`id`, `short_name`, `name`, `name2`, `name5`, `okei_code`, `storefront_name`, `sort`, `status`, `builtin`) VALUES
(1, 'мм', 'миллиметр', '', '', '003', 'мм', 0, 0, 0),
(2, 'см', 'сантиметр', '', '', '004', 'см', 0, 0, 0),
(3, 'м', 'метр', '', '', '006', 'м', 0, 0, 0),
(4, 'пог. м', 'погонный метр', '', '', '018', 'пог. м', 0, 0, 0),
(5, 'мм2', 'квадратный миллиметр', '', '', '050', 'мм²', 0, 0, 0),
(6, 'см2', 'квадратный сантиметр', '', '', '051', 'см²', 0, 0, 0),
(7, 'м2', 'квадратный метр', '', '', '055', 'м²', 0, 0, 0),
(8, 'л', 'литр', '', '', '112', 'л', 0, 0, 0),
(9, 'дм3', 'кубический дециметр', '', '', '112', 'дм³', 0, 0, 0),
(10, 'г', 'грамм', '', '', '163', 'г', 0, 0, 0),
(11, 'кг', 'килограмм', '', '', '166', 'кг', 0, 0, 0),
(12, 'ч', 'час', '', '', '356', 'ч', 0, 0, 0),
(13, 'боб', 'бобина', '', '', '616', 'боб.', 0, 0, 0),
(14, 'л.', 'лист', '', '', '625', 'л.', 0, 0, 0),
(15, 'пач', 'пачка', '', '', '728', 'пач.', 0, 0, 0),
(16, 'рул', 'рулон', '', '', '736', 'рул.', 0, 0, 0),
(17, 'упак', 'упаковка', '', '', '778', 'упак.', 0, 0, 0),
(18, 'шт', 'штука', '', '', '796', 'шт.', 0, 0, 0),
(19, 'ящ', 'ящик', '', '', '812', 'ящ.', 0, 0, 0),
(20, 'бут', 'бутылка', '', '', '868', 'бут.', 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_virtualstock`
--

CREATE TABLE `shop_virtualstock` (
  `id` int(11) NOT NULL,
  `low_count` int(11) NOT NULL DEFAULT 0,
  `critical_count` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `public` int(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_virtualstock_stocks`
--

CREATE TABLE `shop_virtualstock_stocks` (
  `virtualstock_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `site_block`
--

CREATE TABLE `site_block` (
  `id` varchar(64) NOT NULL,
  `content` text NOT NULL,
  `create_datetime` datetime NOT NULL,
  `description` text NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `site_domain`
--

CREATE TABLE `site_domain` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(128) NOT NULL DEFAULT '',
  `style` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `site_domain`
--

INSERT INTO `site_domain` (`id`, `name`, `title`, `style`) VALUES
(1, 'localhost/wa', '', 'green');

-- --------------------------------------------------------

--
-- Структура таблицы `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `full_url` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  `create_contact_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int(11) DEFAULT NULL,
  `thumbpage` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `site_page_params`
--

CREATE TABLE `site_page_params` (
  `page_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `team_calendar_external`
--

CREATE TABLE `team_calendar_external` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `integration_level` enum('subscription','sync','full') NOT NULL DEFAULT 'subscription',
  `name` varchar(255) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `calendar_id` int(11) DEFAULT NULL,
  `native_calendar_id` text DEFAULT NULL,
  `synchronize_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `team_calendar_external_params`
--

CREATE TABLE `team_calendar_external_params` (
  `calendar_external_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `team_event_external`
--

CREATE TABLE `team_event_external` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `calendar_external_id` int(11) NOT NULL,
  `native_event_id` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `team_event_external_params`
--

CREATE TABLE `team_event_external_params` (
  `event_external_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `team_location`
--

CREATE TABLE `team_location` (
  `group_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_announcement`
--

CREATE TABLE `wa_announcement` (
  `id` int(11) NOT NULL,
  `app_id` varchar(32) NOT NULL,
  `text` text NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_api_auth_codes`
--

CREATE TABLE `wa_api_auth_codes` (
  `code` varchar(32) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `client_id` varchar(32) NOT NULL,
  `scope` text NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_api_tokens`
--

CREATE TABLE `wa_api_tokens` (
  `contact_id` int(11) NOT NULL,
  `client_id` varchar(32) NOT NULL,
  `token` varchar(32) NOT NULL,
  `scope` text NOT NULL,
  `create_datetime` datetime NOT NULL,
  `last_use_datetime` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_app_settings`
--

CREATE TABLE `wa_app_settings` (
  `app_id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_app_settings`
--

INSERT INTO `wa_app_settings` (`app_id`, `name`, `value`) VALUES
('webasyst', 'waid_endpoints_sync_time', '1683456765'),
('webasyst', 'waid_credentials', '{\"client_id\":\"3e3c5f6cc8907f522f87b149f7476757\",\"client_secret\":\"e005bc286173ca32e4d41d498aac9da5c494a1408a7d8ab5af57d44aed2c4f5b\"}'),
('webasyst', 'update_time', '1678808888'),
('webasyst', 'locale', 'ru_RU'),
('webasyst', 'name', 'Test'),
('webasyst', 'email', 'toma-ps2@yandex.ru'),
('webasyst', 'sender', 'toma-ps2@yandex.ru'),
('installer', 'update_time', '1614683137'),
('installer', 'update_counter', ''),
('shop', 'shipping_payment_disabled', '[]'),
('shop', 'update_time', '1668591806'),
('shop', 'country', 'rus'),
('shop', 'currency', 'RUB'),
('shop', 'use_product_currency', 'true'),
('installer', 'update_counter_timestamp', '1683481423'),
('installer', 'token_data', '{\"token\":\"01c7742961e3b1cea4839d3bdc6eb9ca\",\"expire_datetime\":\"2023-05-08 13:55:44\"}'),
('site', 'update_time', '1575540282'),
('shop', 'tutorial_passed_steps', '[\"welcome\"]'),
('team', 'update_time', '1600953803'),
('team', 'first_login', '2023-05-06 14:23:01'),
('site', 'preview_hash', '64579d4994c04.1683463497'),
('site.thumbpage', 'update_time', '1'),
('webasyst', 'url', 'http://localhost/wa/'),
('webasyst.payment.cash', 'update_time', '1'),
('webasyst.payment.yandexkassa', 'update_time', '1650545832'),
('webasyst', 'theme_hash', '1a9868c561901b53956128157b5b7d5f.1683469642'),
('webasyst', 'logo', '{\"mode\":\"gradient\",\"text\":{\"value\":\"\",\"color\":\"#fff\",\"default_value\":\"\",\"default_color\":\"#fff\",\"formatted_value\":\"\"},\"two_lines\":\"\",\"gradient\":{\"from\":\"#FF248B\",\"to\":\"#FF5900\",\"angle\":\"0\"},\"gradients\":[{\"from\":\"#FF248B\",\"to\":\"#FF5900\",\"angle\":0},{\"from\":\"#FFA629\",\"to\":\"#FF743D\",\"angle\":0},{\"from\":\"#E6CF00\",\"to\":\"#F5A300\",\"angle\":0},{\"from\":\"#E0E000\",\"to\":\"#99CC00\",\"angle\":0},{\"from\":\"#28F500\",\"to\":\"#88CC00\",\"angle\":0},{\"from\":\"#42F642\",\"to\":\"#00D66B\",\"angle\":0},{\"from\":\"#00FA7D\",\"to\":\"#00CCAA\",\"angle\":0},{\"from\":\"#00F0F0\",\"to\":\"#00BBFA\",\"angle\":0},{\"from\":\"#57C7FF\",\"to\":\"#668CFF\",\"angle\":0},{\"from\":\"#B18AFF\",\"to\":\"#4C6AFF\",\"angle\":0},{\"from\":\"#E252FF\",\"to\":\"#A05CFF\",\"angle\":0},{\"from\":\"#F370FF\",\"to\":\"#F23DA7\",\"angle\":0},{\"from\":\"#C4C4C4\",\"to\":\"#808080\",\"angle\":0},{\"from\":\"#FF0F80\",\"to\":\"#CC4700\",\"angle\":0},{\"from\":\"#F58F00\",\"to\":\"#FA4700\",\"angle\":0},{\"from\":\"#DBC500\",\"to\":\"#C78500\",\"angle\":0},{\"from\":\"#CCCC00\",\"to\":\"#7EA800\",\"angle\":0},{\"from\":\"#24DB00\",\"to\":\"#669900\",\"angle\":0},{\"from\":\"#0BDF0B\",\"to\":\"#00994C\",\"angle\":0},{\"from\":\"#00EB75\",\"to\":\"#00A88C\",\"angle\":0},{\"from\":\"#00D6D6\",\"to\":\"#0091C2\",\"angle\":0},{\"from\":\"#05ACFF\",\"to\":\"#1F57FF\",\"angle\":0},{\"from\":\"#8B52FF\",\"to\":\"#1E42F5\",\"angle\":0},{\"from\":\"#D91AFF\",\"to\":\"#6A00FF\",\"angle\":0},{\"from\":\"#EE2EFF\",\"to\":\"#BF0D75\",\"angle\":0},{\"from\":\"#999999\",\"to\":\"#545454\",\"angle\":0},{\"from\":\"#DB0067\",\"to\":\"#993500\",\"angle\":0},{\"from\":\"#DB8000\",\"to\":\"#C73800\",\"angle\":0},{\"from\":\"#A89700\",\"to\":\"#8A5C00\",\"angle\":0},{\"from\":\"#A3A300\",\"to\":\"#547000\",\"angle\":0},{\"from\":\"#1FBD00\",\"to\":\"#4E7500\",\"angle\":0},{\"from\":\"#09B909\",\"to\":\"#00753B\",\"angle\":0},{\"from\":\"#00B359\",\"to\":\"#006B59\",\"angle\":0},{\"from\":\"#00ADAD\",\"to\":\"#006B8F\",\"angle\":0},{\"from\":\"#008BD1\",\"to\":\"#0029A3\",\"angle\":0},{\"from\":\"#793EEF\",\"to\":\"#0724B0\",\"angle\":0},{\"from\":\"#A600C7\",\"to\":\"#4A00B3\",\"angle\":0},{\"from\":\"#B600C7\",\"to\":\"#690740\",\"angle\":0},{\"from\":\"#757575\",\"to\":\"#333333\",\"angle\":0},{\"from\":\"#A3004D\",\"to\":\"#5C2000\",\"angle\":0},{\"from\":\"#995900\",\"to\":\"#8A2700\",\"angle\":0},{\"from\":\"#706500\",\"to\":\"#473000\",\"angle\":0},{\"from\":\"#707000\",\"to\":\"#2E3D00\",\"angle\":0},{\"from\":\"#147A00\",\"to\":\"#334D00\",\"angle\":0},{\"from\":\"#067E06\",\"to\":\"#004D26\",\"angle\":0},{\"from\":\"#007A3D\",\"to\":\"#003D33\",\"angle\":0},{\"from\":\"#006080\",\"to\":\"#003838\",\"angle\":0},{\"from\":\"#00527A\",\"to\":\"#001452\",\"angle\":0},{\"from\":\"#4000C2\",\"to\":\"#000E52\",\"angle\":0},{\"from\":\"#73008A\",\"to\":\"#280061\",\"angle\":0},{\"from\":\"#670070\",\"to\":\"#30031D\",\"angle\":0},{\"from\":\"#5E5E5E\",\"to\":\"#171717\",\"angle\":0},{\"from\":\"#520026\",\"to\":\"#1A0900\",\"angle\":0},{\"from\":\"#523000\",\"to\":\"#1F0900\",\"angle\":0},{\"from\":\"#474000\",\"to\":\"#140E00\",\"angle\":0},{\"from\":\"#474700\",\"to\":\"#0F1400\",\"angle\":0},{\"from\":\"#0C4700\",\"to\":\"#0E1400\",\"angle\":0},{\"from\":\"#044904\",\"to\":\"#00140A\",\"angle\":0},{\"from\":\"#004221\",\"to\":\"#001411\",\"angle\":0},{\"from\":\"#00394D\",\"to\":\"#000F0F\",\"angle\":0},{\"from\":\"#003652\",\"to\":\"#00061A\",\"angle\":0},{\"from\":\"#23006B\",\"to\":\"#000624\",\"angle\":0},{\"from\":\"#440052\",\"to\":\"#110029\",\"angle\":0},{\"from\":\"#410047\",\"to\":\"#18020F\",\"angle\":0},{\"from\":\"#383838\",\"to\":\"#0F0F0F\",\"angle\":0}],\"image\":{\"thumbs\":[],\"original\":[]}}'),
('shop.redirect', 'update_time', '1'),
('shop', 'preview_hash', '6457b5d8dfc59.1683469784');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_app_tokens`
--

CREATE TABLE `wa_app_tokens` (
  `contact_id` int(11) DEFAULT NULL,
  `app_id` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `expire_datetime` datetime DEFAULT NULL,
  `token` varchar(32) NOT NULL,
  `data` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_cache`
--

CREATE TABLE `wa_cache` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact`
--

CREATE TABLE `wa_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `middlename` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(150) NOT NULL DEFAULT '',
  `jobtitle` varchar(50) NOT NULL DEFAULT '',
  `company_contact_id` int(11) NOT NULL DEFAULT 0,
  `is_company` tinyint(1) NOT NULL DEFAULT 0,
  `is_user` tinyint(1) NOT NULL DEFAULT 0,
  `is_staff` int(11) NOT NULL DEFAULT 0,
  `login` varchar(32) DEFAULT NULL,
  `password` varchar(128) NOT NULL DEFAULT '',
  `last_datetime` datetime DEFAULT NULL,
  `sex` enum('m','f') DEFAULT NULL,
  `birth_day` tinyint(2) UNSIGNED DEFAULT NULL,
  `birth_month` tinyint(2) UNSIGNED DEFAULT NULL,
  `birth_year` smallint(4) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `photo` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `create_datetime` datetime NOT NULL,
  `create_app_id` varchar(32) NOT NULL DEFAULT '',
  `create_method` varchar(32) NOT NULL DEFAULT '',
  `create_contact_id` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(8) NOT NULL DEFAULT '',
  `timezone` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_contact`
--

INSERT INTO `wa_contact` (`id`, `name`, `firstname`, `middlename`, `lastname`, `title`, `company`, `jobtitle`, `company_contact_id`, `is_company`, `is_user`, `is_staff`, `login`, `password`, `last_datetime`, `sex`, `birth_day`, `birth_month`, `birth_year`, `about`, `photo`, `create_datetime`, `create_app_id`, `create_method`, `create_contact_id`, `locale`, `timezone`) VALUES
(1, 'Тамара', 'Тамара', '', '', '', '', '', 0, 0, 1, 0, 'admintoma', '827ccb0eea8a706c4c34a16891f84e7b', '2023-05-07 19:53:40', NULL, NULL, NULL, NULL, NULL, 0, '2023-05-06 12:53:15', 'webasyst', 'install', 0, 'ru_RU', '');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_auths`
--

CREATE TABLE `wa_contact_auths` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `token` varchar(42) NOT NULL,
  `login_datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_contact_auths`
--

INSERT INTO `wa_contact_auths` (`id`, `contact_id`, `session_id`, `token`, `login_datetime`, `last_datetime`, `user_agent`) VALUES
(1, 1, '3c4mcn0q49vffcv97gvne1s04u', 'e8167f62bde95741a514c60e9e1f5da', '2023-05-06 12:53:15', '2023-05-06 17:31:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 YaBrowser/23.3.3.719 Yowser/2.5 Safari/537.36'),
(2, 1, '4rv662gnqr5g25tecagpr296lt', 'e8167f62bde95741a514c60e9e1f5da', '2023-05-06 17:05:27', '2023-05-06 17:32:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 Edg/112.0.1722.68'),
(3, 1, '1cijprgpdaupnhdmhaafsimtjo', 'e8167f62bde95741a514c60e9e1f5da', '2023-05-07 10:31:23', '2023-05-07 19:51:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 YaBrowser/23.3.3.719 Yowser/2.5 Safari/537.36');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_calendars`
--

CREATE TABLE `wa_contact_calendars` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bg_color` varchar(7) DEFAULT NULL,
  `font_color` varchar(7) DEFAULT NULL,
  `status_bg_color` varchar(7) DEFAULT NULL,
  `status_font_color` varchar(7) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `is_limited` tinyint(1) NOT NULL DEFAULT 0,
  `default_status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_contact_calendars`
--

INSERT INTO `wa_contact_calendars` (`id`, `name`, `bg_color`, `font_color`, `status_bg_color`, `status_font_color`, `icon`, `sort`, `is_limited`, `default_status`) VALUES
(1, 'Отпуск', '#b8f2ff', '#00819e', '#00c2ed', '#ffffff', 'fas fa-circle', 0, 0, 'в отпуске'),
(2, 'Командировка', '#d4dcfc', '#0a2eae', '#718ef7', '#ffffff', 'fas fa-circle', 1, 0, 'в командировке'),
(3, 'Больничный', '#fcc197', '#773404', '#f98836', '#ffffff', 'fas fa-circle', 2, 0, 'болею'),
(4, 'Встреча', '#ffeab8', '#9e6f00', '#eba400', '#ffffff', 'fas fa-circle', 3, 0, 'на встрече'),
(5, 'Удаленно', '#e9ccff', '#6500b3', '#bb64ff', '#ffffff', 'fas fa-circle', 4, 0, NULL),
(6, 'Другое', '#cccccc', '#404040', '#999999', '#ffffff', 'fas fa-circle', 5, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_categories`
--

CREATE TABLE `wa_contact_categories` (
  `category_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_category`
--

CREATE TABLE `wa_contact_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `system_id` varchar(64) DEFAULT NULL,
  `app_id` varchar(32) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `cnt` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_data`
--

CREATE TABLE `wa_contact_data` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `field` varchar(32) NOT NULL,
  `ext` varchar(32) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_data_text`
--

CREATE TABLE `wa_contact_data_text` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `field` varchar(32) NOT NULL,
  `ext` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_emails`
--

CREATE TABLE `wa_contact_emails` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ext` varchar(32) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT 0,
  `status` enum('unknown','confirmed','unconfirmed','unavailable') NOT NULL DEFAULT 'unknown'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_contact_emails`
--

INSERT INTO `wa_contact_emails` (`id`, `contact_id`, `email`, `ext`, `sort`, `status`) VALUES
(1, 1, 'toma-ps2@yandex.ru', '', 0, 'unknown');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_events`
--

CREATE TABLE `wa_contact_events` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  `contact_id` int(11) NOT NULL,
  `calendar_id` int(11) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `is_allday` tinyint(4) NOT NULL DEFAULT 0,
  `is_status` tinyint(4) NOT NULL DEFAULT 0,
  `sequence` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_field_values`
--

CREATE TABLE `wa_contact_field_values` (
  `id` int(11) NOT NULL,
  `parent_field` varchar(64) NOT NULL,
  `parent_value` varchar(255) NOT NULL,
  `field` varchar(64) NOT NULL,
  `value` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_files`
--

CREATE TABLE `wa_contact_files` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `purpose` enum('cover','general') NOT NULL DEFAULT 'general',
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_rights`
--

CREATE TABLE `wa_contact_rights` (
  `group_id` int(11) NOT NULL,
  `app_id` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_contact_rights`
--

INSERT INTO `wa_contact_rights` (`group_id`, `app_id`, `name`, `value`) VALUES
(-1, 'webasyst', 'backend', 1),
(2, 'team', 'backend', 1),
(3, 'team', 'backend', 1),
(1, 'webasyst', 'backend', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_settings`
--

CREATE TABLE `wa_contact_settings` (
  `contact_id` int(11) NOT NULL,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_contact_settings`
--

INSERT INTO `wa_contact_settings` (`contact_id`, `app_id`, `name`, `value`) VALUES
(1, 'webasyst', 'dashboard', '1'),
(1, 'webasyst', 'webasyst_id_announcement_close', '2023-05-06 12:53:26'),
(1, 'shop', 'shop_last_datetime', '1683448284'),
(1, 'shop', 'products_default_view', 'thumbs'),
(1, 'shop', 'default_chapter', 'old_chapter'),
(1, 'shop', 'order_list_sort', 'create_datetime/desc'),
(1, 'shop', 'last_type_id', '1,0,Обычный товар,box,alsobought,0,8,2,0,2,,2,1.00000000,2,,2,,2,,2,'),
(1, 'shop', 'all:sort', 'create_datetime desc'),
(1, 'shop', 'expanded_category_natural_mode', '1'),
(1, 'shop', 'expanded_category_0', '1'),
(1, 'shop', 'expanded_category_1', '1'),
(1, '', 'apps', 'webasyst.settings,installer,shop,site,team'),
(1, 'site', 'last_domain_id', '1'),
(1, 'webasyst', 'backend_url', 'http://localhost/wa/webasyst/');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_contact_waid`
--

CREATE TABLE `wa_contact_waid` (
  `contact_id` int(11) NOT NULL,
  `token` text NOT NULL,
  `webasyst_contact_id` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `login_datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_country`
--

CREATE TABLE `wa_country` (
  `name` varchar(255) NOT NULL,
  `iso3letter` varchar(3) NOT NULL,
  `iso2letter` varchar(2) NOT NULL,
  `isonumeric` varchar(3) NOT NULL,
  `fav_sort` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_country`
--

INSERT INTO `wa_country` (`name`, `iso3letter`, `iso2letter`, `isonumeric`, `fav_sort`) VALUES
('Afghanistan', 'afg', 'af', '004', NULL),
('Åland Islands', 'ala', 'ax', '248', NULL),
('Albania', 'alb', 'al', '008', NULL),
('Algeria', 'dza', 'dz', '012', NULL),
('American Samoa', 'asm', 'as', '016', NULL),
('Andorra', 'and', 'ad', '020', NULL),
('Angola', 'ago', 'ao', '024', NULL),
('Anguilla', 'aia', 'ai', '660', NULL),
('Antigua and Barbuda', 'atg', 'ag', '028', NULL),
('Argentina', 'arg', 'ar', '032', NULL),
('Armenia', 'arm', 'am', '051', NULL),
('Aruba', 'abw', 'aw', '533', NULL),
('Australia', 'aus', 'au', '036', NULL),
('Austria', 'aut', 'at', '040', NULL),
('Azerbaijan', 'aze', 'az', '031', NULL),
('Bahamas', 'bhs', 'bs', '044', NULL),
('Bahrain', 'bhr', 'bh', '048', NULL),
('Bangladesh', 'bgd', 'bd', '050', NULL),
('Barbados', 'brb', 'bb', '052', NULL),
('Belarus', 'blr', 'by', '112', NULL),
('Belgium', 'bel', 'be', '056', NULL),
('Belize', 'blz', 'bz', '084', NULL),
('Benin', 'ben', 'bj', '204', NULL),
('Bermuda', 'bmu', 'bm', '060', NULL),
('Bhutan', 'btn', 'bt', '064', NULL),
('Bolivia, Plurinational State of', 'bol', 'bo', '068', NULL),
('Bosnia and Herzegovina', 'bih', 'ba', '070', NULL),
('Botswana', 'bwa', 'bw', '072', NULL),
('Bouvet Island', 'bvt', 'bv', '074', NULL),
('Brazil', 'bra', 'br', '076', NULL),
('British Indian Ocean Territory', 'iot', 'io', '086', NULL),
('Brunei Darussalam', 'brn', 'bn', '096', NULL),
('Bulgaria', 'bgr', 'bg', '100', NULL),
('Burkina Faso', 'bfa', 'bf', '854', NULL),
('Burundi', 'bdi', 'bi', '108', NULL),
('Côte d\'Ivoire', 'civ', 'ci', '384', NULL),
('Cambodia', 'khm', 'kh', '116', NULL),
('Cameroon', 'cmr', 'cm', '120', NULL),
('Canada', 'can', 'ca', '124', NULL),
('Cape Verde', 'cpv', 'cv', '132', NULL),
('Cayman Islands', 'cym', 'ky', '136', NULL),
('Central African Republic', 'caf', 'cf', '140', NULL),
('Chad', 'tcd', 'td', '148', NULL),
('Chile', 'chl', 'cl', '152', NULL),
('China', 'chn', 'cn', '156', NULL),
('Christmas Island', 'cxr', 'cx', '162', NULL),
('Cocos (Keeling) Islands', 'cck', 'cc', '166', NULL),
('Colombia', 'col', 'co', '170', NULL),
('Comoros', 'com', 'km', '174', NULL),
('Congo', 'cog', 'cg', '178', NULL),
('Congo, the Democratic Republic of the', 'cod', 'cd', '180', NULL),
('Cook Islands', 'cok', 'ck', '184', NULL),
('Costa Rica', 'cri', 'cr', '188', NULL),
('Croatia', 'hrv', 'hr', '191', NULL),
('Cuba', 'cub', 'cu', '192', NULL),
('Cyprus', 'cyp', 'cy', '196', NULL),
('Czech Republic', 'cze', 'cz', '203', NULL),
('Denmark', 'dnk', 'dk', '208', NULL),
('Djibouti', 'dji', 'dj', '262', NULL),
('Dominica', 'dma', 'dm', '212', NULL),
('Dominican Republic', 'dom', 'do', '214', NULL),
('Ecuador', 'ecu', 'ec', '218', NULL),
('Egypt', 'egy', 'eg', '818', NULL),
('El Salvador', 'slv', 'sv', '222', NULL),
('Equatorial Guinea', 'gnq', 'gq', '226', NULL),
('Eritrea', 'eri', 'er', '232', NULL),
('Estonia', 'est', 'ee', '233', NULL),
('Ethiopia', 'eth', 'et', '231', NULL),
('Falkland Islands (Malvinas)', 'flk', 'fk', '238', NULL),
('Faroe Islands', 'fro', 'fo', '234', NULL),
('Fiji', 'fji', 'fj', '242', NULL),
('Finland', 'fin', 'fi', '246', NULL),
('France', 'fra', 'fr', '250', NULL),
('French Guiana', 'guf', 'gf', '254', NULL),
('French Polynesia', 'pyf', 'pf', '258', NULL),
('French Southern Territories', 'atf', 'tf', '260', NULL),
('Gabon', 'gab', 'ga', '266', NULL),
('Gambia', 'gmb', 'gm', '270', NULL),
('Georgia', 'geo', 'ge', '268', NULL),
('Germany', 'deu', 'de', '276', NULL),
('Ghana', 'gha', 'gh', '288', NULL),
('Gibraltar', 'gib', 'gi', '292', NULL),
('Greece', 'grc', 'gr', '300', NULL),
('Greenland', 'grl', 'gl', '304', NULL),
('Grenada', 'grd', 'gd', '308', NULL),
('Guadeloupe', 'glp', 'gp', '312', NULL),
('Guam', 'gum', 'gu', '316', NULL),
('Guatemala', 'gtm', 'gt', '320', NULL),
('Guinea', 'gin', 'gn', '324', NULL),
('Guinea-Bissau', 'gnb', 'gw', '624', NULL),
('Guyana', 'guy', 'gy', '328', NULL),
('Haiti', 'hti', 'ht', '332', NULL),
('Heard Island and McDonald Islands', 'hmd', 'hm', '334', NULL),
('Holy See (Vatican City State)', 'vat', 'va', '336', NULL),
('Honduras', 'hnd', 'hn', '340', NULL),
('Hong Kong', 'hkg', 'hk', '344', NULL),
('Hungary', 'hun', 'hu', '348', NULL),
('Iceland', 'isl', 'is', '352', NULL),
('India', 'ind', 'in', '356', NULL),
('Indonesia', 'idn', 'id', '360', NULL),
('Iran, Islamic Republic of', 'irn', 'ir', '364', NULL),
('Iraq', 'irq', 'iq', '368', NULL),
('Ireland', 'irl', 'ie', '372', NULL),
('Israel', 'isr', 'il', '376', NULL),
('Italy', 'ita', 'it', '380', NULL),
('Jamaica', 'jam', 'jm', '388', NULL),
('Japan', 'jpn', 'jp', '392', NULL),
('Jordan', 'jor', 'jo', '400', NULL),
('Kazakhstan', 'kaz', 'kz', '398', NULL),
('Kenya', 'ken', 'ke', '404', NULL),
('Kiribati', 'kir', 'ki', '296', NULL),
('Korea, Democratic People\'s Republic of', 'prk', 'kp', '408', NULL),
('Korea, Republic of', 'kor', 'kr', '410', NULL),
('Kuwait', 'kwt', 'kw', '414', NULL),
('Kyrgyzstan', 'kgz', 'kg', '417', NULL),
('Lao People\'s Democratic Republic', 'lao', 'la', '418', NULL),
('Latvia', 'lva', 'lv', '428', NULL),
('Lebanon', 'lbn', 'lb', '422', NULL),
('Lesotho', 'lso', 'ls', '426', NULL),
('Liberia', 'lbr', 'lr', '430', NULL),
('Libyan Arab Jamahiriya', 'lby', 'ly', '434', NULL),
('Liechtenstein', 'lie', 'li', '438', NULL),
('Lithuania', 'ltu', 'lt', '440', NULL),
('Luxembourg', 'lux', 'lu', '442', NULL),
('Macao', 'mac', 'mo', '446', NULL),
('Macedonia, the former Yugoslav Republic of', 'mkd', 'mk', '807', NULL),
('Madagascar', 'mdg', 'mg', '450', NULL),
('Malawi', 'mwi', 'mw', '454', NULL),
('Malaysia', 'mys', 'my', '458', NULL),
('Maldives', 'mdv', 'mv', '462', NULL),
('Mali', 'mli', 'ml', '466', NULL),
('Malta', 'mlt', 'mt', '470', NULL),
('Marshall Islands', 'mhl', 'mh', '584', NULL),
('Martinique', 'mtq', 'mq', '474', NULL),
('Mauritania', 'mrt', 'mr', '478', NULL),
('Mauritius', 'mus', 'mu', '480', NULL),
('Mayotte', 'myt', 'yt', '175', NULL),
('Mexico', 'mex', 'mx', '484', NULL),
('Micronesia, Federated States of', 'fsm', 'fm', '583', NULL),
('Moldova, Republic of', 'mda', 'md', '498', NULL),
('Monaco', 'mco', 'mc', '492', NULL),
('Mongolia', 'mng', 'mn', '496', NULL),
('Montenegro', 'mne', 'me', '499', NULL),
('Montserrat', 'msr', 'ms', '500', NULL),
('Morocco', 'mar', 'ma', '504', NULL),
('Mozambique', 'moz', 'mz', '508', NULL),
('Myanmar', 'mmr', 'mm', '104', NULL),
('Namibia', 'nam', 'na', '516', NULL),
('Nauru', 'nru', 'nr', '520', NULL),
('Nepal', 'npl', 'np', '524', NULL),
('Netherlands', 'nld', 'nl', '528', NULL),
('Netherlands Antilles', 'ant', 'an', '530', NULL),
('New Caledonia', 'ncl', 'nc', '540', NULL),
('New Zealand', 'nzl', 'nz', '554', NULL),
('Nicaragua', 'nic', 'ni', '558', NULL),
('Niger', 'ner', 'ne', '562', NULL),
('Nigeria', 'nga', 'ng', '566', NULL),
('Niue', 'niu', 'nu', '570', NULL),
('Norfolk Island', 'nfk', 'nf', '574', NULL),
('Northern Mariana Islands', 'mnp', 'mp', '580', NULL),
('Norway', 'nor', 'no', '578', NULL),
('Oman', 'omn', 'om', '512', NULL),
('Pakistan', 'pak', 'pk', '586', NULL),
('Palau', 'plw', 'pw', '585', NULL),
('Palestinian Territory, Occupied', 'pse', 'ps', '275', NULL),
('Panama', 'pan', 'pa', '591', NULL),
('Papua New Guinea', 'png', 'pg', '598', NULL),
('Paraguay', 'pry', 'py', '600', NULL),
('Peru', 'per', 'pe', '604', NULL),
('Philippines', 'phl', 'ph', '608', NULL),
('Pitcairn', 'pcn', 'pn', '612', NULL),
('Poland', 'pol', 'pl', '616', NULL),
('Portugal', 'prt', 'pt', '620', NULL),
('Puerto Rico', 'pri', 'pr', '630', NULL),
('Qatar', 'qat', 'qa', '634', NULL),
('Réunion', 'reu', 're', '638', NULL),
('Romania', 'rou', 'ro', '642', NULL),
('Russian Federation', 'rus', 'ru', '643', 1),
('Rwanda', 'rwa', 'rw', '646', NULL),
('Saint Helena, Ascension and Tristan da Cunha', 'shn', 'sh', '654', NULL),
('Saint Kitts and Nevis', 'kna', 'kn', '659', NULL),
('Saint Lucia', 'lca', 'lc', '662', NULL),
('Saint Pierre and Miquelon', 'spm', 'pm', '666', NULL),
('Saint Vincent and the Grenadines', 'vct', 'vc', '670', NULL),
('Samoa', 'wsm', 'ws', '882', NULL),
('San Marino', 'smr', 'sm', '674', NULL),
('Sao Tome and Principe', 'stp', 'st', '678', NULL),
('Saudi Arabia', 'sau', 'sa', '682', NULL),
('Senegal', 'sen', 'sn', '686', NULL),
('Serbia', 'srb', 'rs', '688', NULL),
('Seychelles', 'syc', 'sc', '690', NULL),
('Sierra Leone', 'sle', 'sl', '694', NULL),
('Singapore', 'sgp', 'sg', '702', NULL),
('Slovakia', 'svk', 'sk', '703', NULL),
('Slovenia', 'svn', 'si', '705', NULL),
('Solomon Islands', 'slb', 'sb', '090', NULL),
('Somalia', 'som', 'so', '706', NULL),
('South Africa', 'zaf', 'za', '710', NULL),
('South Georgia and the South Sandwich Islands', 'sgs', 'gs', '239', NULL),
('Spain', 'esp', 'es', '724', NULL),
('Sri Lanka', 'lka', 'lk', '144', NULL),
('Sudan', 'sdn', 'sd', '736', NULL),
('Suriname', 'sur', 'sr', '740', NULL),
('Svalbard and Jan Mayen', 'sjm', 'sj', '744', NULL),
('Swaziland', 'swz', 'sz', '748', NULL),
('Sweden', 'swe', 'se', '752', NULL),
('Switzerland', 'che', 'ch', '756', NULL),
('Syrian Arab Republic', 'syr', 'sy', '760', NULL),
('Taiwan, Province of China', 'twn', 'tw', '158', NULL),
('Tajikistan', 'tjk', 'tj', '762', NULL),
('Tanzania, United Republic of', 'tza', 'tz', '834', NULL),
('Thailand', 'tha', 'th', '764', NULL),
('Timor-Leste', 'tls', 'tl', '626', NULL),
('Togo', 'tgo', 'tg', '768', NULL),
('Tokelau', 'tkl', 'tk', '772', NULL),
('Tonga', 'ton', 'to', '776', NULL),
('Trinidad and Tobago', 'tto', 'tt', '780', NULL),
('Tunisia', 'tun', 'tn', '788', NULL),
('Turkey', 'tur', 'tr', '792', NULL),
('Turkmenistan', 'tkm', 'tm', '795', NULL),
('Turks and Caicos Islands', 'tca', 'tc', '796', NULL),
('Tuvalu', 'tuv', 'tv', '798', NULL),
('Uganda', 'uga', 'ug', '800', NULL),
('Ukraine', 'ukr', 'ua', '804', 1),
('United Arab Emirates', 'are', 'ae', '784', NULL),
('United Kingdom', 'gbr', 'gb', '826', NULL),
('United States', 'usa', 'us', '840', NULL),
('United States Minor Outlying Islands', 'umi', 'um', '581', NULL),
('Uruguay', 'ury', 'uy', '858', NULL),
('Uzbekistan', 'uzb', 'uz', '860', NULL),
('Vanuatu', 'vut', 'vu', '548', NULL),
('Venezuela, Bolivarian Republic of', 'ven', 've', '862', NULL),
('Viet Nam', 'vnm', 'vn', '704', NULL),
('Virgin Islands, British', 'vgb', 'vg', '092', NULL),
('Virgin Islands, U.S.', 'vir', 'vi', '850', NULL),
('Wallis and Futuna', 'wlf', 'wf', '876', NULL),
('Western Sahara', 'esh', 'eh', '732', NULL),
('Yemen', 'yem', 'ye', '887', NULL),
('Zambia', 'zmb', 'zm', '894', NULL),
('Zimbabwe', 'zwe', 'zw', '716', NULL),
('Abkhazia', 'abh', 'ab', '895', NULL),
('Bonaire, Sint Eustatius and Saba', 'bes', 'bq', '535', NULL),
('Guernsey', 'ggy', 'gg', '831', NULL),
('Jersey', 'jey', 'je', '832', NULL),
('Curaçao', 'cuw', 'cw', '531', NULL),
('Isle of Man', 'imn', 'im', '833', NULL),
('Saint Barthélemy', 'blm', 'bl', '652', NULL),
('Saint Martin (French Part)', 'maf', 'mf', '663', NULL),
('Sint Maarten', 'sxm', 'sx', '534', NULL),
('South Ossetia', 'ost', 'os', '896', NULL),
('South Sudan', 'ssd', 'ss', '728', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_dashboard`
--

CREATE TABLE `wa_dashboard` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hash` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_group`
--

CREATE TABLE `wa_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cnt` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `type` enum('group','location') NOT NULL DEFAULT 'group',
  `description` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_group`
--

INSERT INTO `wa_group` (`id`, `name`, `cnt`, `icon`, `sort`, `type`, `description`) VALUES
(1, 'Администраторы', 1, NULL, 0, 'group', NULL),
(2, 'Мой офис', 1, NULL, 1, 'location', NULL),
(3, 'Удаленно', 0, NULL, 2, 'location', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_log`
--

CREATE TABLE `wa_log` (
  `id` bigint(20) NOT NULL,
  `app_id` varchar(32) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `action` varchar(255) NOT NULL,
  `subject_contact_id` int(11) DEFAULT NULL,
  `params` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_log`
--

INSERT INTO `wa_log` (`id`, `app_id`, `contact_id`, `datetime`, `action`, `subject_contact_id`, `params`) VALUES
(1, 'webasyst', 0, '2023-05-06 13:52:20', 'welcome', NULL, ''),
(2, 'shop', 1, '2023-05-06 13:33:10', 'category_add', NULL, '1'),
(3, 'shop', 1, '2023-05-06 13:46:50', 'product_add', NULL, '1'),
(4, 'shop', 1, '2023-05-06 13:46:51', 'product_edit', NULL, '1'),
(5, 'installer', 1, '2023-05-06 14:11:13', 'item_install', NULL, '{\"type\":\"plugins\",\"id\":\"site\\/thumbpage\",\"ip\":\"127.0.0.1\"}'),
(6, 'shop', 1, '2023-05-06 16:00:25', 'product_edit', NULL, '1'),
(7, 'shop', 1, '2023-05-06 16:03:19', 'product_add', NULL, '2'),
(8, 'shop', 1, '2023-05-06 16:03:19', 'product_edit', NULL, '2'),
(9, 'shop', 1, '2023-05-06 16:04:33', 'product_edit', NULL, '2'),
(10, 'shop', 1, '2023-05-06 16:04:42', 'product_edit', NULL, '2'),
(11, 'shop', 1, '2023-05-06 16:06:07', 'product_add', NULL, '3'),
(12, 'shop', 1, '2023-05-06 16:06:07', 'product_edit', NULL, '3'),
(13, 'shop', 1, '2023-05-06 16:09:38', 'product_add', NULL, '4'),
(14, 'shop', 1, '2023-05-06 16:09:39', 'product_edit', NULL, '4'),
(15, 'shop', 1, '2023-05-06 16:11:42', 'product_add', NULL, '5'),
(16, 'shop', 1, '2023-05-06 16:11:43', 'product_edit', NULL, '5'),
(17, 'shop', 1, '2023-05-06 16:14:00', 'product_add', NULL, '6'),
(18, 'shop', 1, '2023-05-06 16:14:00', 'product_edit', NULL, '6'),
(19, 'shop', 1, '2023-05-06 16:14:07', 'product_edit', NULL, '6'),
(20, 'shop', 1, '2023-05-06 16:15:38', 'product_add', NULL, '7'),
(21, 'shop', 1, '2023-05-06 16:15:38', 'product_edit', NULL, '7'),
(22, 'shop', 1, '2023-05-06 16:19:20', 'product_edit', NULL, '7'),
(23, 'shop', 1, '2023-05-06 16:21:52', 'product_add', NULL, '8'),
(24, 'shop', 1, '2023-05-06 16:21:53', 'product_edit', NULL, '8'),
(25, 'shop', 1, '2023-05-06 16:21:58', 'product_edit', NULL, '8'),
(26, 'shop', 1, '2023-05-06 16:24:11', 'product_add', NULL, '9'),
(27, 'shop', 1, '2023-05-06 16:24:11', 'product_edit', NULL, '9'),
(28, 'shop', 1, '2023-05-06 16:24:17', 'product_edit', NULL, '9'),
(29, 'shop', 1, '2023-05-06 16:31:07', 'category_edit', NULL, '1'),
(30, 'shop', 1, '2023-05-06 16:32:18', 'category_add', NULL, '2'),
(31, 'shop', 1, '2023-05-06 16:32:47', 'category_add', NULL, '3'),
(32, 'shop', 1, '2023-05-06 16:33:04', 'category_add', NULL, '4'),
(33, 'shop', 1, '2023-05-06 16:34:32', 'products_edit', NULL, '3$9,8,7'),
(34, 'shop', 1, '2023-05-06 16:34:41', 'products_edit', NULL, '3$6,5,4'),
(35, 'shop', 1, '2023-05-06 16:34:49', 'products_edit', NULL, '3$3,2,1'),
(36, 'shop', 1, '2023-05-06 16:37:23', 'category_edit', NULL, '2'),
(37, 'shop', 1, '2023-05-06 16:37:35', 'category_edit', NULL, '3'),
(38, 'shop', 1, '2023-05-06 16:37:40', 'category_edit', NULL, '4'),
(39, 'webasyst', 1, '2023-05-06 17:05:27', 'login', NULL, 'backend'),
(40, 'webasyst', 1, '2023-05-07 10:31:23', 'login', NULL, 'backend'),
(41, 'site', 1, '2023-05-07 10:31:49', 'site_edit', NULL, 'localhost/wa/shop'),
(42, 'site', 1, '2023-05-07 10:32:05', 'page_add', NULL, '1'),
(43, 'site', 1, '2023-05-07 10:33:08', 'site_edit', NULL, 'localhost/wa'),
(44, 'site', 1, '2023-05-07 10:33:13', 'site_edit', NULL, 'localhost/wa'),
(45, 'site', 1, '2023-05-07 10:34:15', 'site_edit', NULL, 'localhost/wa'),
(46, 'site', 1, '2023-05-07 10:35:18', 'page_edit', NULL, '1'),
(47, 'shop', 1, '2023-05-07 10:35:57', 'category_edit', NULL, '2'),
(48, 'shop', 1, '2023-05-07 10:36:06', 'category_edit', NULL, '3'),
(49, 'shop', 1, '2023-05-07 10:36:18', 'category_edit', NULL, '4'),
(50, 'shop', 1, '2023-05-07 10:36:35', 'category_edit', NULL, '1'),
(51, 'shop', 1, '2023-05-07 10:37:25', 'category_edit', NULL, '2'),
(52, 'shop', 1, '2023-05-07 12:02:29', 'category_edit', NULL, '1'),
(53, 'shop', 1, '2023-05-07 12:05:45', 'product_edit', NULL, '6'),
(54, 'shop', 1, '2023-05-07 12:06:12', 'product_edit', NULL, '5'),
(55, 'shop', 1, '2023-05-07 12:07:05', 'product_edit', NULL, '4'),
(56, 'shop', 1, '2023-05-07 12:07:07', 'product_edit', NULL, '4'),
(57, 'shop', 1, '2023-05-07 12:08:13', 'category_edit', NULL, '4'),
(58, 'shop', 1, '2023-05-07 12:08:41', 'category_edit', NULL, '4'),
(59, 'shop', 1, '2023-05-07 13:23:36', 'template_edit', NULL, 'index.html'),
(60, 'shop', 1, '2023-05-07 13:27:47', 'template_edit', NULL, 'index.html'),
(61, 'shop', 1, '2023-05-07 13:47:02', 'template_edit', NULL, 'category.html'),
(62, 'shop', 1, '2023-05-07 13:48:51', 'template_edit', NULL, 'category.html'),
(63, 'shop', 1, '2023-05-07 13:54:16', 'template_edit', NULL, 'category.html'),
(64, 'shop', 1, '2023-05-07 14:11:23', 'template_edit', NULL, 'category.html'),
(65, 'shop', 1, '2023-05-07 14:57:39', 'template_edit', NULL, 'category.html'),
(66, 'shop', 1, '2023-05-07 15:00:51', 'template_edit', NULL, 'category.html'),
(67, 'shop', 1, '2023-05-07 15:26:49', 'template_edit', NULL, 'category.html'),
(68, 'shop', 1, '2023-05-07 15:32:13', 'template_edit', NULL, 'category.html'),
(69, 'shop', 1, '2023-05-07 15:35:03', 'template_edit', NULL, 'category.html'),
(70, 'shop', 1, '2023-05-07 15:50:49', 'template_edit', NULL, 'category.html'),
(71, 'shop', 1, '2023-05-07 15:53:20', 'template_edit', NULL, 'category.html'),
(72, 'shop', 1, '2023-05-07 16:01:14', 'template_edit', NULL, 'category.html'),
(73, 'shop', 1, '2023-05-07 16:06:58', 'template_edit', NULL, 'category.html'),
(74, 'shop', 1, '2023-05-07 16:07:58', 'template_edit', NULL, 'category.html'),
(75, 'site', 1, '2023-05-07 16:28:36', 'page_edit', NULL, '1'),
(76, 'site', 1, '2023-05-07 16:44:50', 'page_delete', NULL, '1'),
(77, 'shop', 1, '2023-05-07 17:04:39', 'theme_download', NULL, 'default'),
(78, 'shop', 1, '2023-05-07 17:07:12', 'theme_download', NULL, 'default'),
(79, 'shop', 1, '2023-05-07 17:31:14', 'template_edit', NULL, 'index.html'),
(80, 'shop', 1, '2023-05-07 17:31:33', 'theme_download', NULL, 'default'),
(81, 'shop', 1, '2023-05-07 17:31:35', 'theme_download', NULL, 'default');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_login_log`
--

CREATE TABLE `wa_login_log` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `datetime_in` datetime NOT NULL,
  `datetime_out` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_login_log`
--

INSERT INTO `wa_login_log` (`id`, `contact_id`, `datetime_in`, `datetime_out`, `ip`) VALUES
(1, 1, '2023-05-06 12:53:15', '2023-05-06 12:53:15', '127.0.0.1'),
(2, 1, '2023-05-06 13:11:38', '2023-05-06 14:24:36', '127.0.0.1'),
(3, 1, '2023-05-06 15:21:34', '2023-05-06 15:42:17', '127.0.0.1'),
(4, 1, '2023-05-06 15:57:26', '2023-05-06 17:32:02', '127.0.0.1'),
(5, 1, '2023-05-07 10:31:23', '2023-05-07 10:53:15', '127.0.0.1'),
(6, 1, '2023-05-07 11:09:53', '2023-05-07 11:37:57', '127.0.0.1'),
(7, 1, '2023-05-07 11:59:24', '2023-05-07 12:27:42', '127.0.0.1'),
(8, 1, '2023-05-07 13:09:19', '2023-05-07 14:16:04', '127.0.0.1'),
(9, 1, '2023-05-07 14:44:49', '2023-05-07 15:05:05', '127.0.0.1'),
(10, 1, '2023-05-07 15:25:12', '2023-05-07 16:28:44', '127.0.0.1'),
(11, 1, '2023-05-07 16:44:25', '2023-05-07 16:48:55', '127.0.0.1'),
(12, 1, '2023-05-07 17:04:39', '2023-05-07 17:31:03', '127.0.0.1'),
(13, 1, '2023-05-07 17:47:39', '2023-05-07 18:58:36', '127.0.0.1'),
(14, 1, '2023-05-07 19:21:04', NULL, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_push_subscribers`
--

CREATE TABLE `wa_push_subscribers` (
  `id` int(11) NOT NULL,
  `provider_id` varchar(64) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `subscriber_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_region`
--

CREATE TABLE `wa_region` (
  `country_iso3` varchar(3) NOT NULL,
  `code` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fav_sort` int(11) DEFAULT NULL,
  `region_center` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_region`
--

INSERT INTO `wa_region` (`country_iso3`, `code`, `name`, `fav_sort`, `region_center`) VALUES
('usa', 'AL', 'Alabama', NULL, 'Montgomery'),
('usa', 'AK', 'Alaska', NULL, 'Juneau'),
('usa', 'AZ', 'Arizona', NULL, 'Phoenix'),
('usa', 'AR', 'Arkansas', NULL, 'Little Rock'),
('usa', 'CA', 'California', NULL, 'Sacramento'),
('usa', 'CO', 'Colorado', NULL, 'Denver'),
('usa', 'CT', 'Connecticut', NULL, 'Hartford'),
('usa', 'DE', 'Delaware', NULL, 'Dover'),
('usa', 'DC', 'District of Columbia', NULL, 'Washington DC'),
('usa', 'FL', 'Florida', NULL, 'Tallahassee'),
('usa', 'GA', 'Georgia', NULL, 'Atlanta'),
('usa', 'HI', 'Hawaii', NULL, 'Honolulu'),
('usa', 'ID', 'Idaho', NULL, 'Boise'),
('usa', 'IL', 'Illinois', NULL, 'Springfield'),
('usa', 'IN', 'Indiana', NULL, 'Indianapolis'),
('usa', 'IA', 'Iowa', NULL, 'Des Moines'),
('usa', 'KS', 'Kansas', NULL, 'Topeka'),
('usa', 'KY', 'Kentucky', NULL, 'Frankfort'),
('usa', 'LA', 'Louisiana', NULL, 'Baton Rouge'),
('usa', 'ME', 'Maine', NULL, 'Augusta'),
('usa', 'MD', 'Maryland', NULL, 'Annapolis'),
('usa', 'MA', 'Massachusetts', NULL, 'Boston'),
('usa', 'MI', 'Michigan', NULL, 'Lansing'),
('usa', 'MN', 'Minnesota', NULL, 'Saint Paul'),
('usa', 'MS', 'Mississippi', NULL, 'Jackson'),
('usa', 'MO', 'Missouri', NULL, 'Jefferson City'),
('usa', 'MT', 'Montana', NULL, 'Helena'),
('usa', 'NE', 'Nebraska', NULL, 'Lincoln'),
('usa', 'NV', 'Nevada', NULL, 'Carson City'),
('usa', 'NH', 'New Hampshire', NULL, 'Concord'),
('usa', 'NJ', 'New Jersey', NULL, 'Trenton'),
('usa', 'NM', 'New Mexico', NULL, 'Santa Fe'),
('usa', 'NY', 'New York', NULL, 'Albany'),
('usa', 'NC', 'North Carolina', NULL, 'Rayleigh'),
('usa', 'ND', 'North Dakota', NULL, 'Bismarck'),
('usa', 'OH', 'Ohio', NULL, 'Columbus'),
('usa', 'OK', 'Oklahoma', NULL, 'Oklahoma City'),
('usa', 'OR', 'Oregon', NULL, 'Salem'),
('usa', 'PA', 'Pennsylvania', NULL, 'Harrisburg'),
('usa', 'RI', 'Rhode Island', NULL, 'Providence'),
('usa', 'SC', 'South Carolina', NULL, 'Columbia'),
('usa', 'SD', 'South Dakota', NULL, 'Pierre'),
('usa', 'TN', 'Tennessee', NULL, 'Nashville'),
('usa', 'TX', 'Texas', NULL, 'Austin'),
('usa', 'UT', 'Utah', NULL, 'Salt Lake City'),
('usa', 'VT', 'Vermont', NULL, 'Montpelier'),
('usa', 'VA', 'Virginia', NULL, 'Richmond'),
('usa', 'WA', 'Washington', NULL, 'Olympia'),
('usa', 'WV', 'West Virginia', NULL, 'Charleston'),
('usa', 'WI', 'Wisconsin', NULL, 'Madison'),
('usa', 'WY', 'Wyoming', NULL, 'Cheyenne'),
('can', '10', 'Newfoundland', NULL, NULL),
('can', '11', 'Prince Edward Island', NULL, NULL),
('can', '12', 'Nova Scotia', NULL, NULL),
('can', '13', 'New Brunswick', NULL, NULL),
('can', '24', 'Quebec', NULL, NULL),
('can', '35', 'Ontario', NULL, NULL),
('can', '46', 'Manitoba', NULL, NULL),
('can', '47', 'Saskatchewan', NULL, NULL),
('can', '48', 'Alberta', NULL, NULL),
('can', '59', 'British Columbia', NULL, NULL),
('can', '60', 'Yukon', NULL, NULL),
('can', '61', 'Northwest Territories', NULL, NULL),
('can', '62', 'Nunavut', NULL, NULL),
('rus', '01', 'Адыгея республика', NULL, NULL),
('rus', '04', 'Алтай республика', NULL, NULL),
('rus', '22', 'Алтайский край', NULL, NULL),
('rus', '28', 'Амурская область', NULL, NULL),
('rus', '29', 'Архангельская область', NULL, NULL),
('rus', '30', 'Астраханская область', NULL, NULL),
('rus', '02', 'Башкортостан республика', NULL, NULL),
('rus', '31', 'Белгородская область', NULL, NULL),
('rus', '32', 'Брянская область', NULL, NULL),
('rus', '03', 'Бурятия республика', NULL, NULL),
('rus', '33', 'Владимирская область', NULL, NULL),
('rus', '34', 'Волгоградская область', NULL, NULL),
('rus', '35', 'Вологодская область', NULL, NULL),
('rus', '36', 'Воронежская область', NULL, NULL),
('rus', '05', 'Дагестан республика', NULL, NULL),
('rus', '80', 'Донецкая Народная Республика', NULL, NULL),
('rus', '79', 'Еврейская автономная область', NULL, NULL),
('rus', '75', 'Забайкальский край', NULL, NULL),
('rus', '85', 'Запорожская область', NULL, NULL),
('rus', '37', 'Ивановская область', NULL, NULL),
('rus', '06', 'Ингушетия республика', NULL, NULL),
('rus', '38', 'Иркутская область', NULL, NULL),
('rus', '07', 'Кабардино-Балкарская республика', NULL, NULL),
('rus', '09', 'Карачаево-Черкесская республика', NULL, NULL),
('rus', '39', 'Калининградская область', NULL, NULL),
('rus', '08', 'Калмыкия республика', NULL, NULL),
('rus', '40', 'Калужская область', NULL, NULL),
('rus', '41', 'Камчатский край', NULL, NULL),
('rus', '10', 'Карелия республика', NULL, NULL),
('rus', '42', 'Кемеровская область', NULL, NULL),
('rus', '43', 'Кировская область', NULL, NULL),
('rus', '11', 'Коми республика', NULL, NULL),
('rus', '44', 'Костромская область', NULL, NULL),
('rus', '23', 'Краснодарский край', NULL, NULL),
('rus', '24', 'Красноярский край', NULL, NULL),
('rus', '91', 'Крым республика', NULL, NULL),
('rus', '45', 'Курганская область', NULL, NULL),
('rus', '46', 'Курская область', NULL, NULL),
('rus', '47', 'Ленинградская область', NULL, NULL),
('rus', '48', 'Липецкая область', NULL, NULL),
('rus', '81', 'Луганская Народная Республика', NULL, NULL),
('rus', '49', 'Магаданская область', NULL, NULL),
('rus', '12', 'Марий Эл республика', NULL, NULL),
('rus', '50', 'Московская область', NULL, NULL),
('rus', '77', 'Москва', NULL, 'Москва'),
('rus', '13', 'Мордовия республика', NULL, NULL),
('rus', '51', 'Мурманская область', NULL, NULL),
('rus', '83', 'Ненецкий автономный округ', NULL, NULL),
('rus', '52', 'Нижегородская область', NULL, NULL),
('rus', '53', 'Новгородская область', NULL, NULL),
('rus', '54', 'Новосибирская область', NULL, NULL),
('rus', '55', 'Омская область', NULL, NULL),
('rus', '56', 'Оренбургская область', NULL, NULL),
('rus', '57', 'Орловская область', NULL, NULL),
('rus', '58', 'Пензенская область', NULL, NULL),
('rus', '59', 'Пермский край', NULL, NULL),
('rus', '25', 'Приморский край', NULL, NULL),
('rus', '60', 'Псковская область', NULL, NULL),
('rus', '61', 'Ростовская область', NULL, NULL),
('rus', '62', 'Рязанская область', NULL, NULL),
('rus', '63', 'Самарская область', NULL, NULL),
('rus', '78', 'Санкт-Петербург', NULL, 'Санкт-Петербург'),
('rus', '64', 'Саратовская область', NULL, NULL),
('rus', '14', 'Саха (Якутия) республика', NULL, NULL),
('rus', '65', 'Сахалинская область', NULL, NULL),
('rus', '66', 'Свердловская область', NULL, NULL),
('rus', '92', 'Севастополь', NULL, 'Севастополь'),
('rus', '15', 'Северная Осетия-Алания', NULL, NULL),
('rus', '67', 'Смоленская область', NULL, NULL),
('rus', '26', 'Ставропольский край', NULL, NULL),
('rus', '68', 'Тамбовская область', NULL, NULL),
('rus', '16', 'Татарстан республика', NULL, NULL),
('rus', '69', 'Тверская область', NULL, NULL),
('rus', '70', 'Томская область', NULL, NULL),
('rus', '71', 'Тульская область', NULL, NULL),
('rus', '72', 'Тюменская область', NULL, NULL),
('rus', '17', 'Тыва республика', NULL, NULL),
('rus', '18', 'Удмуртская республика', NULL, NULL),
('rus', '73', 'Ульяновская область', NULL, NULL),
('rus', '27', 'Хабаровский край', NULL, NULL),
('rus', '19', 'Хакасия республика', NULL, NULL),
('rus', '86', 'Ханты-Мансийский-Югра автономный округ', NULL, NULL),
('rus', '84', 'Херсонская область', NULL, NULL),
('rus', '74', 'Челябинская область', NULL, NULL),
('rus', '20', 'Чеченская республика', NULL, NULL),
('rus', '21', 'Чувашская республика', NULL, NULL),
('rus', '87', 'Чукотский автономный округ', NULL, NULL),
('rus', '89', 'Ямало-Ненецкий автономный округ', NULL, NULL),
('rus', '76', 'Ярославская область', NULL, NULL),
('ukr', '01', 'Автономна Республіка Крим', NULL, NULL),
('ukr', '02', 'Вінницька область', NULL, NULL),
('ukr', '03', 'Волинська область', NULL, NULL),
('ukr', '04', 'Дніпропетровська область', NULL, NULL),
('ukr', '05', 'Донецька область', NULL, NULL),
('ukr', '06', 'Житомирська область', NULL, NULL),
('ukr', '07', 'Закарпатська область', NULL, NULL),
('ukr', '08', 'Запорізька область', NULL, NULL),
('ukr', '09', 'Івано-Франківська область', NULL, NULL),
('ukr', '10', 'Київська область', NULL, NULL),
('ukr', '11', 'місто Київ', NULL, NULL),
('ukr', '12', 'Кіровоградська область', NULL, NULL),
('ukr', '13', 'Луганська область', NULL, NULL),
('ukr', '14', 'Львівська область', NULL, NULL),
('ukr', '15', 'Миколаївська область', NULL, NULL),
('ukr', '16', 'Одеська область', NULL, NULL),
('ukr', '17', 'Полтавська область', NULL, NULL),
('ukr', '18', 'Рівненська область', NULL, NULL),
('ukr', '19', 'Сумська область', NULL, NULL),
('ukr', '20', 'Тернопільська область', NULL, NULL),
('ukr', '21', 'Харківська область', NULL, NULL),
('ukr', '22', 'Херсонська область', NULL, NULL),
('ukr', '23', 'Хмельницька область', NULL, NULL),
('ukr', '24', 'Черкаська область', NULL, NULL),
('ukr', '25', 'Чернігівська область', NULL, NULL),
('ukr', '26', 'Чернівецька область', NULL, NULL),
('blr', '01', 'Брэсцкая вобласць', NULL, 'Брэст'),
('blr', '02', 'Віцебская вобласць', NULL, 'Віцебск'),
('blr', '03', 'Гомельская вобласць', NULL, 'Гомель'),
('blr', '04', 'Гродзенская вобласць', NULL, 'Гродна'),
('blr', '05', 'Мінская вобласць', NULL, 'Мінск'),
('blr', '06', 'Магілёўская вобласць', NULL, 'Магілёў'),
('blr', '07', 'Мінск', NULL, 'Мінск'),
('kaz', '01', 'Астана', NULL, 'Астана'),
('kaz', '02', 'Алматы', NULL, 'Алматы'),
('kaz', '03', 'Ақмола облысы', NULL, 'Көкшетау'),
('kaz', '04', 'Ақтөбе облысы', NULL, 'Ақтөбе'),
('kaz', '05', 'Алматы облысы', NULL, 'Қонаев'),
('kaz', '06', 'Атырау облысы', NULL, 'Атырау'),
('kaz', '07', 'Батыс Қазақстан облысы', NULL, 'Орал'),
('kaz', '08', 'Жамбыл облысы', NULL, 'Тараз'),
('kaz', '09', 'Қарағанды облысы', NULL, 'Қарағанды'),
('kaz', '10', 'Қостанай облысы', NULL, 'Қостанай'),
('kaz', '11', 'Қызылорда облысы', NULL, 'Қызылорда'),
('kaz', '12', 'Маңғыстау облысы', NULL, 'Ақтау'),
('kaz', '13', 'Түркістан облысы', NULL, 'Түркістан'),
('kaz', '14', 'Павлодар облысы', NULL, 'Павлодар'),
('kaz', '15', 'Солтүстік Қазақстан облысы', NULL, 'Петропавл'),
('kaz', '16', 'Шығыс Қазақстан облысы', NULL, 'Өскемен'),
('kaz', '17', 'Шымкент', NULL, 'Шымкент'),
('kaz', '18', 'Абай облысы', NULL, 'Семей'),
('kaz', '19', 'Жетісу облысы', NULL, 'Талдықорған'),
('kaz', '20', 'Ұлытау облысы', NULL, 'Жезқазған'),
('arm', '01', 'Арагацотнская область', NULL, 'Аштарак'),
('arm', '02', 'Араратская область', NULL, 'Арташат'),
('arm', '03', 'Армавирская область', NULL, 'Армавир'),
('arm', '04', 'Вайоцдзорская область', NULL, 'Ехегнадзор'),
('arm', '05', 'Гехаркуникская область', NULL, 'Гавар'),
('arm', '06', 'Котайкская область', NULL, 'Раздан'),
('arm', '07', 'Лорийская область', NULL, 'Ванадзор'),
('arm', '08', 'Сюникская область', NULL, 'Капан'),
('arm', '09', 'Тавушская область', NULL, 'Иджеван'),
('arm', '10', 'Ширакская область', NULL, 'Гюмри'),
('arm', '11', 'Ереван', NULL, 'Ереван'),
('geo', 'GE-AB', 'Абхазская Автономная Республика', NULL, 'Сухуми'),
('geo', 'GE-SZ', 'Самегрело-Верхняя Сванетия', NULL, 'Зугдиди'),
('geo', 'GE-GU', 'Гурия', NULL, 'Озургети'),
('geo', 'GE-AJ', 'Аджарская Автономная Республика', NULL, 'Батуми'),
('geo', 'GE-RL', 'Рача-Лечхуми и Нижняя Сванетия', NULL, 'Амбролаури'),
('geo', 'GE-IM', 'Имеретия', NULL, 'Кутаиси'),
('geo', 'GE-SJ', 'Самцхе-Джавахетия', NULL, 'Ахалцихе'),
('geo', 'GE-SK', 'Шида-Картли', NULL, 'Гори'),
('geo', 'GE-MM', 'Мцхета-Мтианети', NULL, 'Мцхета'),
('geo', 'GE-KK', 'Квемо-Картли', NULL, 'Рустави'),
('geo', 'GE-KA', 'Кахетия', NULL, 'Телави'),
('geo', 'GE-TB', 'Тбилиси', NULL, 'Тбилиси'),
('chn', '11', 'Beijing', NULL, NULL),
('chn', '12', 'Tianjin', NULL, NULL),
('chn', '13', 'Hebei', NULL, NULL),
('chn', '14', 'Shanxi', NULL, NULL),
('chn', '21', 'Liaoning', NULL, NULL),
('chn', '15', 'Inner Mongolia', NULL, NULL),
('chn', '22', 'Jilin', NULL, NULL),
('chn', '23', 'Heilongjiang', NULL, NULL),
('chn', '34', 'Anhui', NULL, NULL),
('chn', '33', 'Zhejiang', NULL, NULL),
('chn', '36', 'Jiangxi', NULL, NULL),
('chn', '31', 'Shanghai', NULL, NULL),
('chn', '35', 'Fujian', NULL, NULL),
('chn', '32', 'Jiangsu', NULL, NULL),
('chn', '37', 'Shandong', NULL, NULL),
('chn', '46', 'Hainan', NULL, NULL),
('chn', '42', 'Hubei', NULL, NULL),
('chn', '43', 'Hunan', NULL, NULL),
('chn', '41', 'Henan', NULL, NULL),
('chn', '44', 'Guangdong', NULL, NULL),
('chn', '45', 'Guangxi', NULL, NULL),
('chn', '50', 'Chongqing', NULL, NULL),
('chn', '51', 'Sichuan', NULL, NULL),
('chn', '61', 'Shaanxi', NULL, NULL),
('chn', '53', 'Yunnan', NULL, NULL),
('chn', '54', 'Xizang', NULL, NULL),
('chn', '62', 'Gansu', NULL, NULL),
('chn', '52', 'Guizhou', NULL, NULL),
('chn', '64', 'Ningxia', NULL, NULL),
('chn', '63', 'Qinghai', NULL, NULL),
('chn', '65', 'Xinjiang', NULL, NULL),
('ind', '37', 'Andhra Pradesh', NULL, 'Amaravati'),
('ind', '12', 'Arunachal Pradesh', NULL, 'Itanagar'),
('ind', '18', 'Assam', NULL, 'Dispur'),
('ind', '10', 'Bihar', NULL, 'Patna'),
('ind', '22', 'Chhattisgarh', NULL, 'Raipur'),
('ind', '7', 'Delhi', NULL, 'Delhi'),
('ind', '30', 'Goa', NULL, 'Panaji'),
('ind', '24', 'Gujarat', NULL, 'Gandhinagar'),
('ind', '6', 'Haryana', NULL, 'Chandigarh'),
('ind', '2', 'Himachal Pradesh', NULL, 'Shimla'),
('ind', '1', 'Jammu and Kashmir', NULL, 'Srinagar'),
('ind', '20', 'Jharkhand', NULL, 'Ranchi'),
('ind', '29', 'Karnataka', NULL, 'Bengaluru'),
('ind', '32', 'Kerala', NULL, 'Thiruvananthapuram'),
('ind', '31', 'Lakshadweep Islands', NULL, 'Kavaratti'),
('ind', '23', 'Madhya Pradesh', NULL, 'Bhopal'),
('ind', '27', 'Maharashtra', NULL, 'Mumbai'),
('ind', '14', 'Manipur', NULL, 'Imphal'),
('ind', '17', 'Meghalaya', NULL, 'Shillong'),
('ind', '15', 'Mizoram', NULL, 'Aizawl'),
('ind', '13', 'Nagaland', NULL, 'Kohima'),
('ind', '21', 'Odisha', NULL, 'Bhubaneswar'),
('ind', '34', 'Pondicherry', NULL, 'Pondicherry'),
('ind', '3', 'Punjab', NULL, 'Chandigarh'),
('ind', '8', 'Rajasthan', NULL, 'Jaipur'),
('ind', '11', 'Sikkim', NULL, 'Gangtok'),
('ind', '33', 'Tamil Nadu', NULL, 'Chennai'),
('ind', '36', 'Telangana', NULL, 'Hyderabad'),
('ind', '16', 'Tripura', NULL, 'Agartala'),
('ind', '9', 'Uttar Pradesh', NULL, 'Lucknow'),
('ind', '5', 'Uttarakhand', NULL, 'Dehradun'),
('ind', '19', 'West Bengal', NULL, 'Kolkata'),
('aus', '1', 'New South Wales', NULL, 'Sydney'),
('aus', '2', 'Victoria', NULL, 'Melbourne'),
('aus', '3', 'Queensland', NULL, 'Brisbane'),
('aus', '4', 'South Australia', NULL, 'Adelaide'),
('aus', '5', 'Western Australia', NULL, 'Perth'),
('aus', '6', 'Tasmania', NULL, 'Hobart'),
('aus', '7', 'Northern Territory', NULL, 'Darwin'),
('aus', '8', 'Australian Capital Territory', NULL, 'Canberra'),
('aus', '9', 'Other Territories', NULL, NULL),
('deu', '01', 'Schleswig-Holstein', NULL, NULL),
('deu', '02', 'Hamburg', NULL, NULL),
('deu', '03', 'Niedersachsen', NULL, NULL),
('deu', '04', 'Bremen', NULL, NULL),
('deu', '05', 'Nordrhein-Westfalen', NULL, NULL),
('deu', '06', 'Hessen', NULL, NULL),
('deu', '07', 'Rheinland-Pfalz', NULL, NULL),
('deu', '08', 'Baden-Württemberg', NULL, NULL),
('deu', '09', 'Bayern', NULL, NULL),
('deu', '10', 'Saarland', NULL, NULL),
('deu', '11', 'Berlin', NULL, NULL),
('deu', '12', 'Brandenburg', NULL, NULL),
('deu', '13', 'Mecklenburg-Vorpommern', NULL, NULL),
('deu', '14', 'Sachsen', NULL, NULL),
('deu', '15', 'Sachsen-Anhalt', NULL, NULL),
('deu', '16', 'Thueringen', NULL, NULL),
('bel', '11', 'Antwerpen', NULL, NULL),
('bel', '12', 'Mechelen', NULL, NULL),
('bel', '13', 'Turnhout', NULL, NULL),
('bel', '21', 'Brussel-Hoofdstad', NULL, NULL),
('bel', '23', 'Halle-Vilvoorde', NULL, NULL),
('bel', '24', 'Leuven', NULL, NULL),
('bel', '25', 'Nijvel', NULL, NULL),
('bel', '31', 'Brugge', NULL, NULL),
('bel', '32', 'Diksmuide', NULL, NULL),
('bel', '33', 'Ieper', NULL, NULL),
('bel', '34', 'Kortrijk', NULL, NULL),
('bel', '35', 'Oostende', NULL, NULL),
('bel', '36', 'Roeselare', NULL, NULL),
('bel', '37', 'Tielt', NULL, NULL),
('bel', '38', 'Veurne', NULL, NULL),
('bel', '41', 'Aalst', NULL, NULL),
('bel', '42', 'Dendermonde', NULL, NULL),
('bel', '43', 'Eeklo', NULL, NULL),
('bel', '44', 'Gent', NULL, NULL),
('bel', '45', 'Oudenaarde', NULL, NULL),
('bel', '46', 'Sint-Niklaas', NULL, NULL),
('bel', '51', 'Aat', NULL, NULL),
('bel', '52', 'Charleroi', NULL, NULL),
('bel', '53', 'Bergen', NULL, NULL),
('bel', '54', 'Moeskroen', NULL, NULL),
('bel', '55', 'Zinnik', NULL, NULL),
('bel', '56', 'Thuin', NULL, NULL),
('bel', '57', 'Doornik', NULL, NULL),
('bel', '61', 'Hoei', NULL, NULL),
('bel', '62', 'Luik', NULL, NULL),
('bel', '63', 'Verviers', NULL, NULL),
('bel', '64', 'Borgworm', NULL, NULL),
('bel', '71', 'Hasselt', NULL, NULL),
('bel', '72', 'Maaseik', NULL, NULL),
('bel', '73', 'Tongeren', NULL, NULL),
('bel', '81', 'Aarlen', NULL, NULL),
('bel', '82', 'Bastenaken', NULL, NULL),
('bel', '83', 'Marche-en-Famenne', NULL, NULL),
('bel', '84', 'Neufchâteau', NULL, NULL),
('bel', '85', 'Virton', NULL, NULL),
('bel', '91', 'Dinant', NULL, NULL),
('bel', '92', 'Namen', NULL, NULL),
('bel', '93', 'Philippeville', NULL, NULL),
('dnk', '101', 'København', NULL, NULL),
('dnk', '102', 'Frederiksberg', NULL, NULL),
('dnk', '150', 'Københavns Amt', NULL, NULL),
('dnk', '200', 'Frederiksborg Amt', NULL, NULL),
('dnk', '250', 'Roskilde Amt', NULL, NULL),
('dnk', '300', 'Vestsjællands Amt', NULL, NULL),
('dnk', '350', 'Storstrøms Amt', NULL, NULL),
('dnk', '400', 'Bornholms Amt', NULL, NULL),
('dnk', '420', 'Fyns Amt', NULL, NULL),
('dnk', '500', 'Sønderjyllands Amt', NULL, NULL),
('dnk', '550', 'Ribe Amt', NULL, NULL),
('dnk', '600', 'Vejle Amt', NULL, NULL),
('dnk', '650', 'Ringkøbing Amt', NULL, NULL),
('dnk', '700', 'Århus Amt', NULL, NULL),
('dnk', '760', 'Viborg Amt', NULL, NULL),
('dnk', '800', 'Nordjyllands Amt', NULL, NULL),
('fra', '01', 'Ain', NULL, NULL),
('fra', '02', 'Aisne', NULL, NULL),
('fra', '03', 'Allier', NULL, NULL),
('fra', '04', 'Alpes-de-Haute-Provence', NULL, NULL),
('fra', '05', 'Hautes-Alpes', NULL, NULL),
('fra', '06', 'Alpes-Maritimes', NULL, NULL),
('fra', '07', 'Ardèche', NULL, NULL),
('fra', '08', 'Ardennes', NULL, NULL),
('fra', '09', 'Ariège', NULL, NULL),
('fra', '10', 'Aube', NULL, NULL),
('fra', '11', 'Aude', NULL, NULL),
('fra', '12', 'Aveyron', NULL, NULL),
('fra', '13', 'Bouches-du-Rhône', NULL, NULL),
('fra', '14', 'Calvados', NULL, NULL),
('fra', '15', 'Cantal', NULL, NULL),
('fra', '16', 'Charente', NULL, NULL),
('fra', '17', 'Charente-Maritime', NULL, NULL),
('fra', '18', 'Cher', NULL, NULL),
('fra', '19', 'Corrèze', NULL, NULL),
('fra', '21', 'Côte-d\'Or', NULL, NULL),
('fra', '22', 'Côtes-du-Nord', NULL, NULL),
('fra', '23', 'Creuse', NULL, NULL),
('fra', '24', 'Dordogne', NULL, NULL),
('fra', '25', 'Doubs', NULL, NULL),
('fra', '26', 'Drôme', NULL, NULL),
('fra', '27', 'Eure', NULL, NULL),
('fra', '28', 'Eure-et-Loir', NULL, NULL),
('fra', '29', 'Finistère', NULL, NULL),
('fra', '30', 'Gard', NULL, NULL),
('fra', '31', 'Haute-Garonne', NULL, NULL),
('fra', '32', 'Gers', NULL, NULL),
('fra', '33', 'Gironde', NULL, NULL),
('fra', '34', 'Hérault', NULL, NULL),
('fra', '35', 'Ille-et-Vilaine', NULL, NULL),
('fra', '36', 'Indre', NULL, NULL),
('fra', '37', 'Indre-et-Loire', NULL, NULL),
('fra', '38', 'Isère', NULL, NULL),
('fra', '39', 'Jura', NULL, NULL),
('fra', '40', 'Landes', NULL, NULL),
('fra', '41', 'Loir-et-Cher', NULL, NULL),
('fra', '42', 'Loire', NULL, NULL),
('fra', '43', 'Haute-Loire', NULL, NULL),
('fra', '44', 'Loire-Atlantique', NULL, NULL),
('fra', '45', 'Loiret', NULL, NULL),
('fra', '46', 'Lot', NULL, NULL),
('fra', '47', 'Lot-et-Garonne', NULL, NULL),
('fra', '48', 'Lozère', NULL, NULL),
('fra', '49', 'Maine-et-Loire', NULL, NULL),
('fra', '50', 'Manche', NULL, NULL),
('fra', '51', 'Marne', NULL, NULL),
('fra', '52', 'Haute-Marne', NULL, NULL),
('fra', '53', 'Mayenne', NULL, NULL),
('fra', '54', 'Meurthe-et-Moselle', NULL, NULL),
('fra', '55', 'Meuse', NULL, NULL),
('fra', '56', 'Morbihan', NULL, NULL),
('fra', '57', 'Moselle', NULL, NULL),
('fra', '58', 'Nièvre', NULL, NULL),
('fra', '59', 'Nord', NULL, NULL),
('fra', '60', 'Oise', NULL, NULL),
('fra', '61', 'Orne', NULL, NULL),
('fra', '62', 'Pas-de-Calais', NULL, NULL),
('fra', '63', 'Puy-de-Dôme', NULL, NULL),
('fra', '64', 'Pyrénées-Atlantiques', NULL, NULL),
('fra', '65', 'Hautes-Pyrénées', NULL, NULL),
('fra', '66', 'Pyrénées-Orientales', NULL, NULL),
('fra', '67', 'Bas-Rhin', NULL, NULL),
('fra', '68', 'Haut-Rhin', NULL, NULL),
('fra', '69', 'Rhône', NULL, NULL),
('fra', '70', 'Haute-Saône', NULL, NULL),
('fra', '71', 'Saône-et-Loire', NULL, NULL),
('fra', '72', 'Sarthe', NULL, NULL),
('fra', '73', 'Savoie', NULL, NULL),
('fra', '74', 'Haute-Savoie', NULL, NULL),
('fra', '75', 'Ville-de-Paris', NULL, NULL),
('fra', '76', 'Seine-Maritime', NULL, NULL),
('fra', '77', 'Seine-et-Marne', NULL, NULL),
('fra', '78', 'Yvelines', NULL, NULL),
('fra', '79', 'Deux-Sèvres', NULL, NULL),
('fra', '80', 'Somme', NULL, NULL),
('fra', '81', 'Tarn', NULL, NULL),
('fra', '82', 'Tarn-et-Garonne', NULL, NULL),
('fra', '83', 'Var', NULL, NULL),
('fra', '84', 'Vaucluse', NULL, NULL),
('fra', '85', 'Vendée', NULL, NULL),
('fra', '86', 'Vienne', NULL, NULL),
('fra', '87', 'Haute-Vienne', NULL, NULL),
('fra', '88', 'Vosges', NULL, NULL),
('fra', '89', 'Yonne', NULL, NULL),
('fra', '90', 'Territoire-de-Belfort', NULL, NULL),
('fra', '91', 'Essonne', NULL, NULL),
('fra', '92', 'Hauts-de-Seine', NULL, NULL),
('fra', '93', 'Seine-Saint-Denis', NULL, NULL),
('fra', '94', 'Val-de-Marne', NULL, NULL),
('fra', '95', 'Val-d\'Oise', NULL, NULL),
('fra', '99', 'Monaco', NULL, NULL),
('fra', '2A', 'Corse-du-Sud', NULL, NULL),
('fra', '2B', 'Haute-Corse', NULL, NULL),
('grc', '01', 'Aitolias Kai Akarnanias', NULL, NULL),
('grc', '03', 'Voiotia', NULL, NULL),
('grc', '04', 'Eivoias', NULL, NULL),
('grc', '05', 'Evritania', NULL, NULL),
('grc', '06', 'Fthiotida', NULL, NULL),
('grc', '07', 'Fokida', NULL, NULL),
('grc', '11', 'Argolidos', NULL, NULL),
('grc', '12', 'Arkadias', NULL, NULL),
('grc', '13', 'Ahaia', NULL, NULL),
('grc', '14', 'Ilia', NULL, NULL),
('grc', '15', 'Korinthos', NULL, NULL),
('grc', '16', 'Lakonia', NULL, NULL),
('grc', '17', 'Messinia', NULL, NULL),
('grc', '21', 'Zakinthos', NULL, NULL),
('grc', '22', 'Kerkira (Corfu)', NULL, NULL),
('grc', '23', 'Kefallonia', NULL, NULL),
('grc', '24', 'Lefkada', NULL, NULL),
('grc', '31', 'Arta', NULL, NULL),
('grc', '32', 'Thesprotia', NULL, NULL),
('grc', '33', 'Ioannina', NULL, NULL),
('grc', '34', 'Preveza', NULL, NULL),
('grc', '41', 'Karditsa', NULL, NULL),
('grc', '42', 'Larissa', NULL, NULL),
('grc', '43', 'Magnisias', NULL, NULL),
('grc', '44', 'Trikala', NULL, NULL),
('grc', '51', 'Grevena', NULL, NULL),
('grc', '52', 'Drama', NULL, NULL),
('grc', '53', 'Imathia', NULL, NULL),
('grc', '54', 'Thessaloniki', NULL, NULL),
('grc', '55', 'Kavala', NULL, NULL),
('grc', '56', 'Kastoria', NULL, NULL),
('grc', '57', 'Kilkis', NULL, NULL),
('grc', '58', 'Kozani', NULL, NULL),
('grc', '59', 'Pela', NULL, NULL),
('grc', '61', 'Pieria', NULL, NULL),
('grc', '62', 'Seres', NULL, NULL),
('grc', '63', 'Florina', NULL, NULL),
('grc', '64', 'Halkida', NULL, NULL),
('grc', '65', 'Agion Opos', NULL, NULL),
('grc', '71', 'Evros', NULL, NULL),
('grc', '72', 'Xanthi', NULL, NULL),
('grc', '73', 'Rodopi', NULL, NULL),
('grc', '81', 'Dodekanissa (Dodecanese)', NULL, NULL),
('grc', '82', 'Kiklades (Cyclades)', NULL, NULL),
('grc', '83', 'Lesvos', NULL, NULL),
('grc', '84', 'Samos', NULL, NULL),
('grc', '85', 'Hios', NULL, NULL),
('grc', '91', 'Iraklio', NULL, NULL),
('grc', '92', 'Lasithioi', NULL, NULL),
('grc', '93', 'Rethimno', NULL, NULL),
('grc', '94', 'Hania', NULL, NULL),
('grc', 'A1', 'Athina (Athens)', NULL, NULL),
('grc', 'A2', 'Anatoliki Attiki', NULL, NULL),
('grc', 'A3', 'Ditiki Attiki', NULL, NULL),
('grc', 'A4', 'Peiria', NULL, NULL),
('idn', '11', 'Nanggroe Aceh Darussalam', NULL, NULL),
('idn', '12', 'Sumatera Utara', NULL, NULL),
('idn', '13', 'Sumatera Barat', NULL, NULL),
('idn', '14', 'Riau', NULL, NULL),
('idn', '15', 'Jambi', NULL, NULL),
('idn', '16', 'Sumatera Selatan', NULL, NULL),
('idn', '17', 'Bengkulu', NULL, NULL),
('idn', '18', 'Lampung', NULL, NULL),
('idn', '19', 'Kepulauan Bangka Belitung', NULL, NULL),
('idn', '21', 'Kepulauan Riau', NULL, NULL),
('idn', '31', 'DKI Jakarta', NULL, NULL),
('idn', '32', 'Jawa Barat', NULL, NULL),
('idn', '33', 'Jawa Tengah', NULL, NULL),
('idn', '34', 'DI Yogyakarta', NULL, NULL),
('idn', '35', 'Jawa Timur', NULL, NULL),
('idn', '36', 'Banten', NULL, NULL),
('idn', '51', 'Bali', NULL, NULL),
('idn', '52', 'Nusa Tenggara Barat', NULL, NULL),
('idn', '53', 'Nusa Tenggara Timur', NULL, NULL),
('idn', '61', 'Kalimantan Barat', NULL, NULL),
('idn', '62', 'Kalimantan Tengah', NULL, NULL),
('idn', '63', 'Kalimantan Selatan', NULL, NULL),
('idn', '64', 'Kalimantan Timur', NULL, NULL),
('idn', '71', 'Sulawesi Utara', NULL, NULL),
('idn', '72', 'Sulawesi Tengah', NULL, NULL),
('idn', '73', 'Sulawesi Selatan', NULL, NULL),
('idn', '74', 'Sulawesi Tenggara', NULL, NULL),
('idn', '75', 'Gorontalo', NULL, NULL),
('idn', '76', 'Sulawesi Barat', NULL, NULL),
('idn', '81', 'Maluku', NULL, NULL),
('idn', '82', 'Maluku Utara', NULL, NULL),
('idn', '91', 'Papua Barat', NULL, NULL),
('idn', '94', 'Papua', NULL, NULL),
('irl', '01', 'Carlow', NULL, NULL),
('irl', '02', 'Dublin County Borough', NULL, NULL),
('irl', '03', 'South Dublin', NULL, NULL),
('irl', '04', 'Fingal', NULL, NULL),
('irl', '05', 'Dun Laoghaire-Rathdown', NULL, NULL),
('irl', '06', 'Kildare', NULL, NULL),
('irl', '07', 'Kilkenny', NULL, NULL),
('irl', '08', 'Laoighis', NULL, NULL),
('irl', '09', 'Longford', NULL, NULL),
('irl', '10', 'Louth', NULL, NULL),
('irl', '11', 'Meath', NULL, NULL),
('irl', '12', 'Offaly', NULL, NULL),
('irl', '13', 'Westmeath', NULL, NULL),
('irl', '14', 'Wexford', NULL, NULL),
('irl', '15', 'Wicklow', NULL, NULL),
('irl', '16', 'Clare', NULL, NULL),
('irl', '18', 'Cork County Borough', NULL, NULL),
('irl', '19', 'Cork', NULL, NULL),
('irl', '20', 'Kerry', NULL, NULL),
('irl', '22', 'Limerick County Borough', NULL, NULL),
('irl', '23', 'Limerick', NULL, NULL),
('irl', '24', 'Tipperary North Riding', NULL, NULL),
('irl', '25', 'Tipperay South Riding', NULL, NULL),
('irl', '27', 'Waterford County Borough', NULL, NULL),
('irl', '28', 'Waterford', NULL, NULL),
('irl', '29', 'Galway', NULL, NULL),
('irl', '30', 'Leitrim', NULL, NULL),
('irl', '31', 'Mayo', NULL, NULL),
('irl', '32', 'Roscommon', NULL, NULL),
('irl', '33', 'Sligo', NULL, NULL),
('irl', '34', 'Cavan', NULL, NULL),
('irl', '35', 'Donegal', NULL, NULL),
('irl', '36', 'Monaghan', NULL, NULL),
('irl', '37', 'Galway County Borough', NULL, NULL),
('isr', '01', 'Akko', NULL, NULL),
('isr', '02', 'Ashqelon', NULL, NULL),
('isr', '03', 'Beer Sheva', NULL, NULL),
('isr', '04', 'Gaza Area', NULL, NULL),
('isr', '05', 'Golan', NULL, NULL),
('isr', '06', 'Hadera', NULL, NULL),
('isr', '07', 'Haifa', NULL, NULL),
('isr', '08', 'Jericho', NULL, NULL),
('isr', '09', 'Jerusalem', NULL, NULL),
('isr', '10', 'Kinneret', NULL, NULL),
('isr', '11', 'Petah Tiqwa', NULL, NULL),
('isr', '12', 'Ramla', NULL, NULL),
('isr', '13', 'Rehovot', NULL, NULL),
('isr', '14', 'Sharon', NULL, NULL),
('isr', '15', 'Tel Aviv', NULL, NULL),
('isr', '16', 'Yizreel', NULL, NULL),
('isr', '17', 'Zefat', NULL, NULL),
('ita', '001', 'Torino', NULL, NULL),
('ita', '002', 'Vercelli', NULL, NULL),
('ita', '003', 'Novara', NULL, NULL),
('ita', '004', 'Cuneo', NULL, NULL),
('ita', '005', 'Asti', NULL, NULL),
('ita', '006', 'Alessandria', NULL, NULL),
('ita', '007', 'Valle d\'Aosta', NULL, NULL),
('ita', '008', 'Imperia', NULL, NULL),
('ita', '009', 'Savona', NULL, NULL),
('ita', '010', 'Genova', NULL, NULL),
('ita', '011', 'La Spezia', NULL, NULL),
('ita', '012', 'Varese', NULL, NULL),
('ita', '013', 'Como', NULL, NULL),
('ita', '014', 'Sondrio', NULL, NULL),
('ita', '015', 'Milano', NULL, NULL),
('ita', '016', 'Bergamo', NULL, NULL),
('ita', '017', 'Brescia', NULL, NULL),
('ita', '018', 'Pavia', NULL, NULL),
('ita', '019', 'Cremona', NULL, NULL),
('ita', '020', 'Mantova', NULL, NULL),
('ita', '021', 'Bolzano', NULL, NULL),
('ita', '022', 'Trento', NULL, NULL),
('ita', '023', 'Verona', NULL, NULL),
('ita', '024', 'Vicenza', NULL, NULL),
('ita', '025', 'Belluno', NULL, NULL),
('ita', '026', 'Treviso', NULL, NULL),
('ita', '027', 'Venezia', NULL, NULL),
('ita', '028', 'Padova', NULL, NULL),
('ita', '029', 'Rovigo', NULL, NULL),
('ita', '030', 'Udine', NULL, NULL),
('ita', '031', 'Gorizia', NULL, NULL),
('ita', '032', 'Trieste', NULL, NULL),
('ita', '033', 'Piacenza', NULL, NULL),
('ita', '034', 'Parma', NULL, NULL),
('ita', '035', 'Reggio Emilia', NULL, NULL),
('ita', '036', 'Modena', NULL, NULL),
('ita', '037', 'Bologna', NULL, NULL),
('ita', '038', 'Ferrara', NULL, NULL),
('ita', '039', 'Ravenna', NULL, NULL),
('ita', '040', 'Forli-Cesena', NULL, NULL),
('ita', '041', 'Pesaro E Urbino', NULL, NULL),
('ita', '042', 'Ancona', NULL, NULL),
('ita', '043', 'Macerata', NULL, NULL),
('ita', '044', 'Ascoli Piceno', NULL, NULL),
('ita', '045', 'Massa Carrara', NULL, NULL),
('ita', '046', 'Lucca', NULL, NULL),
('ita', '047', 'Pistoia', NULL, NULL),
('ita', '048', 'Firenze', NULL, NULL),
('ita', '049', 'Livorno', NULL, NULL),
('ita', '050', 'Pisa', NULL, NULL),
('ita', '051', 'Arezzo', NULL, NULL),
('ita', '052', 'Siena', NULL, NULL),
('ita', '053', 'Grosseto', NULL, NULL),
('ita', '054', 'Perugia', NULL, NULL),
('ita', '055', 'Terni', NULL, NULL),
('ita', '056', 'Viterbo', NULL, NULL),
('ita', '057', 'Rieti', NULL, NULL),
('ita', '058', 'Roma', NULL, NULL),
('ita', '059', 'Latina', NULL, NULL),
('ita', '060', 'Frosinone', NULL, NULL),
('ita', '061', 'Caserta', NULL, NULL),
('ita', '062', 'Benevento', NULL, NULL),
('ita', '063', 'Napoli', NULL, NULL),
('ita', '064', 'Avellino', NULL, NULL),
('ita', '065', 'Salerno', NULL, NULL),
('ita', '066', 'L\'Aquila', NULL, NULL),
('ita', '067', 'Teramo', NULL, NULL),
('ita', '068', 'Pescara', NULL, NULL),
('ita', '069', 'Chieti', NULL, NULL),
('ita', '070', 'Campobasso', NULL, NULL),
('ita', '071', 'Foggia', NULL, NULL),
('ita', '072', 'Bari', NULL, NULL),
('ita', '073', 'Taranto', NULL, NULL),
('ita', '074', 'Brindisi', NULL, NULL),
('ita', '075', 'Lecce', NULL, NULL),
('ita', '076', 'Potenza', NULL, NULL),
('ita', '077', 'Matera', NULL, NULL),
('ita', '078', 'Cosenza', NULL, NULL),
('ita', '079', 'Catanzaro', NULL, NULL),
('ita', '080', 'Reggio Calabria', NULL, NULL),
('ita', '081', 'Trapani', NULL, NULL),
('ita', '082', 'Palermo', NULL, NULL),
('ita', '083', 'Messina', NULL, NULL),
('ita', '084', 'Agrigento', NULL, NULL),
('ita', '085', 'Caltanissetta', NULL, NULL),
('ita', '086', 'Enna', NULL, NULL),
('ita', '087', 'Catania', NULL, NULL),
('ita', '088', 'Ragusa', NULL, NULL),
('ita', '089', 'Siracusa', NULL, NULL),
('ita', '090', 'Sassari', NULL, NULL),
('ita', '091', 'Nuoro', NULL, NULL),
('ita', '092', 'Cagliari', NULL, NULL),
('ita', '093', 'Pordenone', NULL, NULL),
('ita', '094', 'Isernia', NULL, NULL),
('ita', '095', 'Oristano', NULL, NULL),
('ita', '096', 'Biella', NULL, NULL),
('ita', '097', 'Lecco', NULL, NULL),
('ita', '098', 'Lodi', NULL, NULL),
('ita', '099', 'Rimini', NULL, NULL),
('ita', '100', 'Prato', NULL, NULL),
('ita', '101', 'Crotone', NULL, NULL),
('ita', '102', 'Vibo Valentia', NULL, NULL),
('ita', '103', 'Verbano-Cusio-Ossola', NULL, NULL),
('ita', '104', 'Olbia-Tempio', NULL, NULL),
('ita', '105', 'Ogliastra', NULL, NULL),
('ita', '106', 'Medio Campidano', NULL, NULL),
('ita', '107', 'Carbonia-Iglesias', NULL, NULL),
('ita', '888', 'Citta del Vaticano', NULL, NULL),
('ita', '999', 'San Marino', NULL, NULL),
('kor', '11', 'Seoul', NULL, NULL),
('kor', '21', 'Busan', NULL, NULL),
('kor', '22', 'Daegu', NULL, NULL),
('kor', '23', 'Incheon', NULL, NULL),
('kor', '24', 'Gwangju', NULL, NULL),
('kor', '25', 'Daejeon', NULL, NULL),
('kor', '26', 'Ulsan', NULL, NULL),
('kor', '31', 'Gyeonggi-do', NULL, NULL),
('kor', '32', 'Gangwon-do', NULL, NULL),
('kor', '33', 'Chungcheongbuk-do', NULL, NULL),
('kor', '34', 'Chungcheongnam-do', NULL, NULL),
('kor', '35', 'Jeollabuk-do', NULL, NULL),
('kor', '36', 'Jeollanam-do', NULL, NULL),
('kor', '37', 'Gyeongsangbuk-do', NULL, NULL),
('kor', '38', 'Gyeongsangnam-do', NULL, NULL),
('kor', '39', 'Jeju-do', NULL, NULL),
('tur', '01', 'Adana', NULL, NULL),
('tur', '02', 'Adýyaman', NULL, NULL),
('tur', '03', 'Afyonkarahisar', NULL, NULL),
('tur', '04', 'Aðrý', NULL, NULL),
('tur', '05', 'Amasya', NULL, NULL),
('tur', '06', 'Ankara', NULL, NULL),
('tur', '07', 'Antalya', NULL, NULL),
('tur', '08', 'Artvin', NULL, NULL),
('tur', '09', 'Aydýn', NULL, NULL),
('tur', '10', 'Balýkesir', NULL, NULL),
('tur', '11', 'Bilecik', NULL, NULL),
('tur', '12', 'Bingöl', NULL, NULL),
('tur', '13', 'Bitlis', NULL, NULL),
('tur', '14', 'Bolu', NULL, NULL),
('tur', '15', 'Burdur', NULL, NULL),
('tur', '16', 'Bursa', NULL, NULL),
('tur', '17', 'Çanakkale', NULL, NULL),
('tur', '18', 'Çankýrý', NULL, NULL),
('tur', '19', 'Çorum', NULL, NULL),
('tur', '20', 'Denizli', NULL, NULL),
('tur', '21', 'Diyarbakýr', NULL, NULL),
('tur', '22', 'Edirne', NULL, NULL),
('tur', '23', 'Elazýð', NULL, NULL),
('tur', '24', 'Erzincan', NULL, NULL),
('tur', '25', 'Erzurum', NULL, NULL),
('tur', '26', 'Eskiþehir', NULL, NULL),
('tur', '27', 'Gaziantep', NULL, NULL),
('tur', '28', 'Giresun', NULL, NULL),
('tur', '29', 'Gümüþhane', NULL, NULL),
('tur', '30', 'Hakkari', NULL, NULL),
('tur', '31', 'Hatay', NULL, NULL),
('tur', '32', 'Isparta', NULL, NULL),
('tur', '33', 'Mersin', NULL, NULL),
('tur', '34', 'Ýstanbul', NULL, NULL),
('tur', '35', 'Ýzmir', NULL, NULL),
('tur', '36', 'Kars', NULL, NULL),
('tur', '37', 'Kastamonu', NULL, NULL),
('tur', '38', 'Kayseri', NULL, NULL),
('tur', '39', 'Kýrklareli', NULL, NULL),
('tur', '40', 'Kýrþehir', NULL, NULL),
('tur', '41', 'Kocaeli', NULL, NULL),
('tur', '42', 'Konya', NULL, NULL),
('tur', '43', 'Kütahya', NULL, NULL),
('tur', '44', 'Malatya', NULL, NULL),
('tur', '45', 'Manisa', NULL, NULL),
('tur', '46', 'Kahramanmaraþ', NULL, NULL),
('tur', '47', 'Mardin', NULL, NULL),
('tur', '48', 'Muðla', NULL, NULL),
('tur', '49', 'Muþ', NULL, NULL),
('tur', '50', 'Nevþehir', NULL, NULL),
('tur', '51', 'Niðde', NULL, NULL),
('tur', '52', 'Ordu', NULL, NULL),
('tur', '53', 'Rize', NULL, NULL),
('tur', '54', 'Sakarya', NULL, NULL),
('tur', '55', 'Samsun', NULL, NULL),
('tur', '56', 'Siirt', NULL, NULL),
('tur', '57', 'Sinop', NULL, NULL),
('tur', '58', 'Sivas', NULL, NULL),
('tur', '59', 'Tekirdað', NULL, NULL),
('tur', '60', 'Tokat', NULL, NULL),
('tur', '61', 'Trabzon', NULL, NULL),
('tur', '62', 'Tunceli', NULL, NULL),
('tur', '63', 'Þanlýurfa', NULL, NULL),
('tur', '64', 'Uþak', NULL, NULL),
('tur', '65', 'Van', NULL, NULL),
('tur', '66', 'Yozgat', NULL, NULL),
('tur', '67', 'Zonguldak', NULL, NULL),
('tur', '68', 'Aksaray', NULL, NULL),
('tur', '69', 'Bayburt', NULL, NULL),
('tur', '70', 'Karaman', NULL, NULL),
('tur', '71', 'Kýrýkkale', NULL, NULL),
('tur', '72', 'Batman', NULL, NULL),
('tur', '73', 'Þýrnak', NULL, NULL),
('tur', '74', 'Bartýn', NULL, NULL),
('tur', '75', 'Ardahan', NULL, NULL),
('tur', '76', 'Iðdýr', NULL, NULL),
('tur', '77', 'Yalova', NULL, NULL),
('tur', '78', 'Karabük', NULL, NULL),
('tur', '79', 'Kilis', NULL, NULL),
('tur', '80', 'Osmaniye', NULL, NULL),
('tur', '81', 'Düzce', NULL, NULL),
('gbr', 'AB', 'Aberdeen', NULL, NULL),
('gbr', 'AL', 'St Albans', NULL, NULL),
('gbr', 'B', 'Birmingham', NULL, NULL),
('gbr', 'BA', 'Bath', NULL, NULL),
('gbr', 'BB', 'Blackburn', NULL, NULL),
('gbr', 'BD', 'Bradford', NULL, NULL),
('gbr', 'BH', 'Bournemouth', NULL, NULL),
('gbr', 'BL', 'Bolton', NULL, NULL),
('gbr', 'BN', 'Brighton', NULL, NULL),
('gbr', 'BR', 'Bromley', NULL, NULL),
('gbr', 'BS', 'Bristol', NULL, NULL),
('gbr', 'BT', 'Northern Ireland', NULL, NULL),
('gbr', 'CA', 'Carlisle', NULL, NULL),
('gbr', 'CB', 'Cambridge', NULL, NULL),
('gbr', 'CF', 'Cardiff', NULL, NULL),
('gbr', 'CH', 'Chester', NULL, NULL),
('gbr', 'CM', 'Chelmsford', NULL, NULL),
('gbr', 'CO', 'Colchester', NULL, NULL),
('gbr', 'CR', 'Croydon', NULL, NULL),
('gbr', 'CT', 'Canterbury', NULL, NULL),
('gbr', 'CV', 'Coventry', NULL, NULL),
('gbr', 'CW', 'Crewe', NULL, NULL),
('gbr', 'DA', 'Dartford', NULL, NULL),
('gbr', 'DD', 'Dundee', NULL, NULL),
('gbr', 'DE', 'Derby', NULL, NULL),
('gbr', 'DG', 'Dumfries', NULL, NULL),
('gbr', 'DH', 'Durham', NULL, NULL),
('gbr', 'DL', 'Darlington', NULL, NULL),
('gbr', 'DN', 'Doncaster', NULL, NULL),
('gbr', 'DT', 'Dorchester', NULL, NULL),
('gbr', 'DY', 'Dudley', NULL, NULL),
('gbr', 'E', 'London E', NULL, NULL),
('gbr', 'EC', 'London EC', NULL, NULL),
('gbr', 'EH', 'Edinburgh', NULL, NULL),
('gbr', 'EN', 'Enfield', NULL, NULL),
('gbr', 'EX', 'Exeter', NULL, NULL),
('gbr', 'FK', 'Falkirk', NULL, NULL),
('gbr', 'FY', 'Blackpool', NULL, NULL),
('gbr', 'G', 'Glasgow', NULL, NULL),
('gbr', 'GL', 'Gloucester', NULL, NULL),
('gbr', 'GU', 'Guildford', NULL, NULL),
('gbr', 'GY', 'Guernsey', NULL, NULL),
('gbr', 'HA', 'Harrow', NULL, NULL),
('gbr', 'HD', 'Huddersfield', NULL, NULL),
('gbr', 'HG', 'Harrogate', NULL, NULL),
('gbr', 'HP', 'Hemel Hempstead', NULL, NULL),
('gbr', 'HR', 'Hereford', NULL, NULL),
('gbr', 'HS', 'Outer Hebrides', NULL, NULL),
('gbr', 'HU', 'Hull', NULL, NULL),
('gbr', 'HX', 'Halifax', NULL, NULL),
('gbr', 'IC', 'Channel Islands', NULL, NULL),
('gbr', 'IG', 'Ilford', NULL, NULL),
('gbr', 'IM', 'Isle of Man', NULL, NULL),
('gbr', 'IP', 'Ipswich', NULL, NULL),
('gbr', 'IV', 'Inverness', NULL, NULL),
('gbr', 'JE', 'Jersey', NULL, NULL),
('gbr', 'KA', 'Kilmarnock', NULL, NULL),
('gbr', 'KT', 'Kingston upon Thames', NULL, NULL),
('gbr', 'KW', 'Kirkwall', NULL, NULL),
('gbr', 'KY', 'Kirkcaldy', NULL, NULL),
('gbr', 'L', 'Liverpool', NULL, NULL),
('gbr', 'LA', 'Lancaster', NULL, NULL),
('gbr', 'LD', 'Llandrindod Wells', NULL, NULL),
('gbr', 'LE', 'Leicester', NULL, NULL),
('gbr', 'LL', 'Llandudno', NULL, NULL),
('gbr', 'LN', 'Lincoln', NULL, NULL),
('gbr', 'LS', 'Leeds', NULL, NULL),
('gbr', 'LU', 'Luton', NULL, NULL),
('gbr', 'M', 'Manchester', NULL, NULL),
('gbr', 'ME', 'Medway', NULL, NULL),
('gbr', 'MK', 'Milton Keynes', NULL, NULL),
('gbr', 'ML', 'Motherwell', NULL, NULL),
('gbr', 'N', 'London N', NULL, NULL),
('gbr', 'NE', 'Newcastle upon Tyne', NULL, NULL),
('gbr', 'NG', 'Nottingham', NULL, NULL),
('gbr', 'NN', 'Northampton', NULL, NULL),
('gbr', 'NP', 'Newport', NULL, NULL),
('gbr', 'NR', 'Norwich', NULL, NULL),
('gbr', 'NW', 'London NW', NULL, NULL),
('gbr', 'OL', 'Oldham', NULL, NULL),
('gbr', 'OX', 'Oxford', NULL, NULL),
('gbr', 'PA', 'Paisley', NULL, NULL),
('gbr', 'PE', 'Peterborough', NULL, NULL),
('gbr', 'PH', 'Perth', NULL, NULL),
('gbr', 'PL', 'Plymouth', NULL, NULL),
('gbr', 'PO', 'Portsmouth', NULL, NULL),
('gbr', 'PR', 'Preston', NULL, NULL),
('gbr', 'RG', 'Reading', NULL, NULL),
('gbr', 'RH', 'Redhill', NULL, NULL),
('gbr', 'RM', 'Romford', NULL, NULL),
('gbr', 'S', 'Sheffield', NULL, NULL),
('gbr', 'SA', 'Swansea', NULL, NULL),
('gbr', 'SE', 'London SE', NULL, NULL),
('gbr', 'SG', 'Stevenage', NULL, NULL),
('gbr', 'SK', 'Stockport', NULL, NULL),
('gbr', 'SL', 'Slough', NULL, NULL),
('gbr', 'SM', 'Sutton', NULL, NULL),
('gbr', 'SN', 'Swindon', NULL, NULL),
('gbr', 'SO', 'Southampton', NULL, NULL),
('gbr', 'SP', 'Salisbury', NULL, NULL),
('gbr', 'SR', 'Sunderland', NULL, NULL),
('gbr', 'SS', 'Southend-on-Sea', NULL, NULL),
('gbr', 'ST', 'Stoke-on-Trent', NULL, NULL),
('gbr', 'SW', 'London SW', NULL, NULL),
('gbr', 'SY', 'Shrewsbury', NULL, NULL),
('gbr', 'TA', 'Taunton', NULL, NULL),
('gbr', 'TD', 'Galashiels', NULL, NULL),
('gbr', 'TF', 'Telford', NULL, NULL),
('gbr', 'TN', 'Tonbridge', NULL, NULL),
('gbr', 'TQ', 'Torquay', NULL, NULL),
('gbr', 'TR', 'Truro', NULL, NULL),
('gbr', 'TS', 'Cleveland', NULL, NULL),
('gbr', 'TW', 'Twickenham', NULL, NULL),
('gbr', 'UB', 'Southall', NULL, NULL),
('gbr', 'W', 'London W', NULL, NULL),
('gbr', 'WA', 'Warrington', NULL, NULL),
('gbr', 'WC', 'London WC', NULL, NULL),
('gbr', 'WD', 'Watford', NULL, NULL),
('gbr', 'WF', 'Wakefield', NULL, NULL),
('gbr', 'WN', 'Wigan', NULL, NULL),
('gbr', 'WR', 'Worcester', NULL, NULL),
('gbr', 'WS', 'Walsall', NULL, NULL),
('gbr', 'WV', 'Wolverhampton', NULL, NULL),
('gbr', 'YO', 'York', NULL, NULL),
('gbr', 'ZE', 'Lerwick', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_transaction`
--

CREATE TABLE `wa_transaction` (
  `id` int(11) NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `app_id` varchar(50) NOT NULL,
  `merchant_id` varchar(50) DEFAULT NULL,
  `native_id` varchar(255) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `update_datetime` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `part_number` int(11) NOT NULL DEFAULT 0,
  `customer_id` varchar(50) DEFAULT NULL,
  `result` varchar(20) NOT NULL,
  `error` varchar(255) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `view_data` text DEFAULT NULL,
  `amount` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `currency_id` varchar(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_transaction_data`
--

CREATE TABLE `wa_transaction_data` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `field_id` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_user_groups`
--

CREATE TABLE `wa_user_groups` (
  `contact_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_user_groups`
--

INSERT INTO `wa_user_groups` (`contact_id`, `group_id`, `datetime`) VALUES
(1, 2, '2023-05-06 14:11:15'),
(1, 1, '2023-05-06 14:11:15');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_verification_channel`
--

CREATE TABLE `wa_verification_channel` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `system` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_verification_channel`
--

INSERT INTO `wa_verification_channel` (`id`, `name`, `address`, `type`, `create_datetime`, `system`) VALUES
(1, 'Системные шаблоны', 'toma-ps2@yandex.ru', 'email', '2023-05-06 12:53:16', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `wa_verification_channel_assets`
--

CREATE TABLE `wa_verification_channel_assets` (
  `id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `address` varchar(64) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL,
  `value` text DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `tries` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_verification_channel_params`
--

CREATE TABLE `wa_verification_channel_params` (
  `channel_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `wa_widget`
--

CREATE TABLE `wa_widget` (
  `id` int(11) NOT NULL,
  `widget` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `dashboard_id` int(11) DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  `app_id` varchar(32) NOT NULL,
  `block` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `size` char(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_widget`
--

INSERT INTO `wa_widget` (`id`, `widget`, `name`, `contact_id`, `dashboard_id`, `create_datetime`, `app_id`, `block`, `sort`, `size`) VALUES
(1, 'news', 'Новости', 1, NULL, '2023-05-06 12:53:16', 'webasyst', 0, 0, '2x2'),
(2, 'currencyquotes', 'Курсы валют', 1, NULL, '2023-05-06 12:53:16', 'webasyst', 1, 0, '2x2'),
(3, 'clock', 'Часы', 1, NULL, '2023-05-06 12:53:16', 'webasyst', 2, 0, '2x1'),
(4, 'clock', 'Часы', 1, NULL, '2023-05-06 12:53:16', 'webasyst', 2, 1, '1x1'),
(5, 'clock', 'Часы', 1, NULL, '2023-05-06 12:53:16', 'webasyst', 2, 2, '1x1'),
(6, 'weather', 'Погода', 1, NULL, '2023-05-06 12:53:16', 'webasyst', 3, 0, '2x2'),
(7, 'news', 'Новости', 1, NULL, '2023-05-06 12:53:16', 'webasyst', 4, 0, '2x2');

-- --------------------------------------------------------

--
-- Структура таблицы `wa_widget_params`
--

CREATE TABLE `wa_widget_params` (
  `widget_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `wa_widget_params`
--

INSERT INTO `wa_widget_params` (`widget_id`, `name`, `value`) VALUES
(1, 'rss_feed', 'https://news.yandex.ru/index.rss'),
(3, 'source', 'local'),
(3, 'type', 'round'),
(4, 'source', '3'),
(4, 'town', 'Москва'),
(4, 'type', 'round'),
(5, 'source', '8'),
(5, 'town', 'Гонконг'),
(5, 'type', 'round'),
(6, 'city', 'Москва'),
(6, 'unit', 'C'),
(7, 'rss_feed', 'custom'),
(7, 'custom_rss_feed', 'http://feeds.feedburner.com/webasystcom/ru'),
(2, 'quotes', '{\"2023-05-07\":{\"USD\":{\"code\":\"USD\",\"val\":\"76.8207\"},\"EUR\":{\"code\":\"EUR\",\"val\":\"84.9073\"}},\"2023-05-06\":{\"USD\":{\"code\":\"USD\",\"val\":\"76.8207\"},\"EUR\":{\"code\":\"EUR\",\"val\":\"84.9073\"}},\"2023-05-05\":{\"USD\":{\"code\":\"USD\",\"val\":\"78.6139\"},\"EUR\":{\"code\":\"EUR\",\"val\":\"86.9986\"}},\"2023-05-08\":{\"USD\":{\"code\":\"USD\",\"val\":\"76.8207\"},\"EUR\":{\"code\":\"EUR\",\"val\":\"84.9073\"}}}'),
(6, 'weathers', '{\"2023-05-06 12\":{\"\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430\":{\"coord\":{\"lon\":37.6156,\"lat\":55.7522},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04d\"}],\"base\":\"stations\",\"main\":{\"temp\":41.9,\"feels_like\":35.17,\"temp_min\":40.08,\"temp_max\":43.38,\"pressure\":1024,\"humidity\":23,\"sea_level\":1024,\"grnd_level\":1006},\"visibility\":10000,\"wind\":{\"speed\":12.21,\"deg\":322,\"gust\":15.79},\"clouds\":{\"all\":88},\"dt\":1683369792,\"sys\":{\"type\":2,\"id\":2000314,\"country\":\"RU\",\"sunrise\":1683337001,\"sunset\":1683393338},\"timezone\":10800,\"id\":524901,\"name\":\"Moscow\",\"cod\":200}},\"2023-05-07 19\":{\"\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430\":{\"coord\":{\"lon\":37.6156,\"lat\":55.7522},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":44.37,\"feels_like\":41.36,\"temp_min\":43.03,\"temp_max\":45.37,\"pressure\":1030,\"humidity\":36,\"sea_level\":1030,\"grnd_level\":1011},\"visibility\":10000,\"wind\":{\"speed\":5.35,\"deg\":337,\"gust\":9.26},\"clouds\":{\"all\":88},\"dt\":1683480102,\"sys\":{\"type\":2,\"id\":2000314,\"country\":\"RU\",\"sunrise\":1683423275,\"sunset\":1683479857},\"timezone\":10800,\"id\":524901,\"name\":\"Moscow\",\"cod\":200}}}');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `shop_abtest`
--
ALTER TABLE `shop_abtest`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_abtest_variants`
--
ALTER TABLE `shop_abtest_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `antest_code` (`abtest_id`,`code`);

--
-- Индексы таблицы `shop_affiliate_transaction`
--
ALTER TABLE `shop_affiliate_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Индексы таблицы `shop_api_courier`
--
ALTER TABLE `shop_api_courier`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_api_courier_storefronts`
--
ALTER TABLE `shop_api_courier_storefronts`
  ADD KEY `courier` (`courier_id`);

--
-- Индексы таблицы `shop_cart_items`
--
ALTER TABLE `shop_cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Индексы таблицы `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`parent_id`,`url`),
  ADD UNIQUE KEY `full_url` (`full_url`),
  ADD KEY `ns_keys` (`left_key`,`right_key`);

--
-- Индексы таблицы `shop_category_og`
--
ALTER TABLE `shop_category_og`
  ADD PRIMARY KEY (`category_id`,`property`);

--
-- Индексы таблицы `shop_category_params`
--
ALTER TABLE `shop_category_params`
  ADD PRIMARY KEY (`category_id`,`name`);

--
-- Индексы таблицы `shop_category_products`
--
ALTER TABLE `shop_category_products`
  ADD PRIMARY KEY (`category_id`,`product_id`);

--
-- Индексы таблицы `shop_category_routes`
--
ALTER TABLE `shop_category_routes`
  ADD PRIMARY KEY (`category_id`,`route`);

--
-- Индексы таблицы `shop_checkout_flow`
--
ALTER TABLE `shop_checkout_flow`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_contact_category_discount`
--
ALTER TABLE `shop_contact_category_discount`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `shop_coupon`
--
ALTER TABLE `shop_coupon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `shop_currency`
--
ALTER TABLE `shop_currency`
  ADD PRIMARY KEY (`code`);

--
-- Индексы таблицы `shop_customer`
--
ALTER TABLE `shop_customer`
  ADD PRIMARY KEY (`contact_id`);

--
-- Индексы таблицы `shop_customers_filter`
--
ALTER TABLE `shop_customers_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Индексы таблицы `shop_expense`
--
ALTER TABLE `shop_expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `start_end` (`start`,`end`);

--
-- Индексы таблицы `shop_feature`
--
ALTER TABLE `shop_feature`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `shop_feature_values_color`
--
ALTER TABLE `shop_feature_values_color`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `values` (`feature_id`,`value`);

--
-- Индексы таблицы `shop_feature_values_dimension`
--
ALTER TABLE `shop_feature_values_dimension`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `feature_id` (`feature_id`,`value`,`unit`,`type`);

--
-- Индексы таблицы `shop_feature_values_double`
--
ALTER TABLE `shop_feature_values_double`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `values` (`feature_id`,`value`);

--
-- Индексы таблицы `shop_feature_values_range`
--
ALTER TABLE `shop_feature_values_range`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `feature_id` (`feature_id`,`begin`,`end`,`unit`,`type`);

--
-- Индексы таблицы `shop_feature_values_text`
--
ALTER TABLE `shop_feature_values_text`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_feature_values_varchar`
--
ALTER TABLE `shop_feature_values_varchar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `values` (`feature_id`,`value`);

--
-- Индексы таблицы `shop_filter`
--
ALTER TABLE `shop_filter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_contact_id` (`creator_contact_id`);

--
-- Индексы таблицы `shop_filter_rules`
--
ALTER TABLE `shop_filter_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Индексы таблицы `shop_followup`
--
ALTER TABLE `shop_followup`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_followup_sources`
--
ALTER TABLE `shop_followup_sources`
  ADD KEY `followup_id` (`followup_id`),
  ADD KEY `source` (`source`(190));

--
-- Индексы таблицы `shop_importexport`
--
ALTER TABLE `shop_importexport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`plugin`,`id`,`sort`);

--
-- Индексы таблицы `shop_notification`
--
ALTER TABLE `shop_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event` (`event`);

--
-- Индексы таблицы `shop_notification_params`
--
ALTER TABLE `shop_notification_params`
  ADD PRIMARY KEY (`notification_id`,`name`);

--
-- Индексы таблицы `shop_notification_sources`
--
ALTER TABLE `shop_notification_sources`
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `source` (`source`(190));

--
-- Индексы таблицы `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `shipping_datetime` (`shipping_datetime`);

--
-- Индексы таблицы `shop_order_items`
--
ALTER TABLE `shop_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_type` (`order_id`,`type`),
  ADD KEY `product_order` (`product_id`,`order_id`);

--
-- Индексы таблицы `shop_order_item_codes`
--
ALTER TABLE `shop_order_item_codes`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_item_id` (`order_item_id`);

--
-- Индексы таблицы `shop_order_log`
--
ALTER TABLE `shop_order_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `datetime` (`datetime`);

--
-- Индексы таблицы `shop_order_log_params`
--
ALTER TABLE `shop_order_log_params`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`order_id`,`log_id`,`name`);

--
-- Индексы таблицы `shop_order_params`
--
ALTER TABLE `shop_order_params`
  ADD PRIMARY KEY (`order_id`,`name`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `shop_page`
--
ALTER TABLE `shop_page`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_page_params`
--
ALTER TABLE `shop_page_params`
  ADD PRIMARY KEY (`page_id`,`name`);

--
-- Индексы таблицы `shop_plugin`
--
ALTER TABLE `shop_plugin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `shop_plugin_settings`
--
ALTER TABLE `shop_plugin_settings`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Индексы таблицы `shop_presentation`
--
ALTER TABLE `shop_presentation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_contact_id` (`creator_contact_id`);

--
-- Индексы таблицы `shop_presentation_columns`
--
ALTER TABLE `shop_presentation_columns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `presentation_id` (`presentation_id`);

--
-- Индексы таблицы `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`),
  ADD KEY `total_sales` (`total_sales`);

--
-- Индексы таблицы `shop_product_code`
--
ALTER TABLE `shop_product_code`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_product_features`
--
ALTER TABLE `shop_product_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `feature` (`product_id`,`sku_id`,`feature_id`,`feature_value_id`),
  ADD KEY `product_feature` (`product_id`,`feature_id`,`feature_value_id`);

--
-- Индексы таблицы `shop_product_features_selectable`
--
ALTER TABLE `shop_product_features_selectable`
  ADD PRIMARY KEY (`product_id`,`feature_id`,`value_id`);

--
-- Индексы таблицы `shop_product_images`
--
ALTER TABLE `shop_product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `shop_product_og`
--
ALTER TABLE `shop_product_og`
  ADD PRIMARY KEY (`product_id`,`property`);

--
-- Индексы таблицы `shop_product_pages`
--
ALTER TABLE `shop_product_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`,`url`);

--
-- Индексы таблицы `shop_product_params`
--
ALTER TABLE `shop_product_params`
  ADD PRIMARY KEY (`product_id`,`name`);

--
-- Индексы таблицы `shop_product_related`
--
ALTER TABLE `shop_product_related`
  ADD PRIMARY KEY (`product_id`,`type`,`related_product_id`);

--
-- Индексы таблицы `shop_product_reviews`
--
ALTER TABLE `shop_product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `status` (`status`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `product_id` (`product_id`,`review_id`);

--
-- Индексы таблицы `shop_product_reviews_images`
--
ALTER TABLE `shop_product_reviews_images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_product_services`
--
ALTER TABLE `shop_product_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`sku_id`,`service_id`,`service_variant_id`),
  ADD KEY `service_id` (`service_id`,`service_variant_id`);

--
-- Индексы таблицы `shop_product_skus`
--
ALTER TABLE `shop_product_skus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `shop_product_stocks`
--
ALTER TABLE `shop_product_stocks`
  ADD PRIMARY KEY (`sku_id`,`stock_id`),
  ADD KEY `product_id` (`product_id`,`sku_id`);

--
-- Индексы таблицы `shop_product_stocks_log`
--
ALTER TABLE `shop_product_stocks_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`,`sku_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Индексы таблицы `shop_product_tags`
--
ALTER TABLE `shop_product_tags`
  ADD PRIMARY KEY (`product_id`,`tag_id`);

--
-- Индексы таблицы `shop_promo`
--
ALTER TABLE `shop_promo`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_promo_orders`
--
ALTER TABLE `shop_promo_orders`
  ADD PRIMARY KEY (`order_id`,`promo_id`);

--
-- Индексы таблицы `shop_promo_routes`
--
ALTER TABLE `shop_promo_routes`
  ADD PRIMARY KEY (`storefront`,`promo_id`);

--
-- Индексы таблицы `shop_promo_rules`
--
ALTER TABLE `shop_promo_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_id` (`promo_id`),
  ADD KEY `rule_type` (`rule_type`);

--
-- Индексы таблицы `shop_push_client`
--
ALTER TABLE `shop_push_client`
  ADD UNIQUE KEY `client` (`client_id`);

--
-- Индексы таблицы `shop_sales`
--
ALTER TABLE `shop_sales`
  ADD PRIMARY KEY (`hash`,`name`,`date`),
  ADD KEY `hash_date` (`hash`,`date`),
  ADD KEY `date` (`date`);

--
-- Индексы таблицы `shop_search_index`
--
ALTER TABLE `shop_search_index`
  ADD PRIMARY KEY (`product_id`,`word_id`),
  ADD KEY `word` (`word_id`,`product_id`,`weight`);

--
-- Индексы таблицы `shop_search_word`
--
ALTER TABLE `shop_search_word`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `shop_service`
--
ALTER TABLE `shop_service`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_service_variants`
--
ALTER TABLE `shop_service_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `shop_set`
--
ALTER TABLE `shop_set`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_set_group`
--
ALTER TABLE `shop_set_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_set_products`
--
ALTER TABLE `shop_set_products`
  ADD PRIMARY KEY (`set_id`,`product_id`);

--
-- Индексы таблицы `shop_stock`
--
ALTER TABLE `shop_stock`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_stock_rules`
--
ALTER TABLE `shop_stock_rules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_tag`
--
ALTER TABLE `shop_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `shop_tax`
--
ALTER TABLE `shop_tax`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_tax_regions`
--
ALTER TABLE `shop_tax_regions`
  ADD UNIQUE KEY `tax_country_region` (`tax_id`,`country_iso3`,`region_code`);

--
-- Индексы таблицы `shop_tax_zip_codes`
--
ALTER TABLE `shop_tax_zip_codes`
  ADD PRIMARY KEY (`tax_id`,`zip_expr`);

--
-- Индексы таблицы `shop_transfer`
--
ALTER TABLE `shop_transfer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `string_id` (`string_id`);

--
-- Индексы таблицы `shop_transfer_products`
--
ALTER TABLE `shop_transfer_products`
  ADD PRIMARY KEY (`product_id`,`sku_id`,`transfer_id`);

--
-- Индексы таблицы `shop_type`
--
ALTER TABLE `shop_type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_type_codes`
--
ALTER TABLE `shop_type_codes`
  ADD UNIQUE KEY `type_code` (`type_id`,`code_id`);

--
-- Индексы таблицы `shop_type_features`
--
ALTER TABLE `shop_type_features`
  ADD PRIMARY KEY (`type_id`,`feature_id`),
  ADD KEY `feature_id` (`feature_id`);

--
-- Индексы таблицы `shop_type_services`
--
ALTER TABLE `shop_type_services`
  ADD PRIMARY KEY (`type_id`,`service_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `shop_type_upselling`
--
ALTER TABLE `shop_type_upselling`
  ADD PRIMARY KEY (`type_id`,`feature`);

--
-- Индексы таблицы `shop_unit`
--
ALTER TABLE `shop_unit`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_virtualstock`
--
ALTER TABLE `shop_virtualstock`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `site_block`
--
ALTER TABLE `site_block`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `site_domain`
--
ALTER TABLE `site_domain`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`domain_id`,`route`,`full_url`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `site_page_params`
--
ALTER TABLE `site_page_params`
  ADD PRIMARY KEY (`page_id`,`name`);

--
-- Индексы таблицы `team_calendar_external`
--
ALTER TABLE `team_calendar_external`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `calendar_id` (`calendar_id`);

--
-- Индексы таблицы `team_calendar_external_params`
--
ALTER TABLE `team_calendar_external_params`
  ADD PRIMARY KEY (`calendar_external_id`,`name`);

--
-- Индексы таблицы `team_event_external`
--
ALTER TABLE `team_event_external`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id_calendar_external_id` (`event_id`,`calendar_external_id`),
  ADD KEY `calendar_external_id_native_event_id` (`calendar_external_id`,`native_event_id`);

--
-- Индексы таблицы `team_event_external_params`
--
ALTER TABLE `team_event_external_params`
  ADD PRIMARY KEY (`event_external_id`,`name`);

--
-- Индексы таблицы `team_location`
--
ALTER TABLE `team_location`
  ADD PRIMARY KEY (`group_id`);

--
-- Индексы таблицы `wa_announcement`
--
ALTER TABLE `wa_announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_datetime` (`datetime`,`app_id`);

--
-- Индексы таблицы `wa_api_auth_codes`
--
ALTER TABLE `wa_api_auth_codes`
  ADD PRIMARY KEY (`code`);

--
-- Индексы таблицы `wa_api_tokens`
--
ALTER TABLE `wa_api_tokens`
  ADD PRIMARY KEY (`token`),
  ADD UNIQUE KEY `contact_client` (`contact_id`,`client_id`);

--
-- Индексы таблицы `wa_app_settings`
--
ALTER TABLE `wa_app_settings`
  ADD PRIMARY KEY (`app_id`,`name`);

--
-- Индексы таблицы `wa_app_tokens`
--
ALTER TABLE `wa_app_tokens`
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `app` (`app_id`),
  ADD KEY `contact` (`contact_id`),
  ADD KEY `expire` (`expire_datetime`);

--
-- Индексы таблицы `wa_cache`
--
ALTER TABLE `wa_cache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `expires` (`expires`);

--
-- Индексы таблицы `wa_contact`
--
ALTER TABLE `wa_contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `name` (`name`),
  ADD KEY `is_user` (`is_user`),
  ADD KEY `is_staff` (`is_staff`);

--
-- Индексы таблицы `wa_contact_auths`
--
ALTER TABLE `wa_contact_auths`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_id` (`session_id`),
  ADD UNIQUE KEY `contact_session_id` (`contact_id`,`session_id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `token` (`token`);

--
-- Индексы таблицы `wa_contact_calendars`
--
ALTER TABLE `wa_contact_calendars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sort` (`id`);

--
-- Индексы таблицы `wa_contact_categories`
--
ALTER TABLE `wa_contact_categories`
  ADD PRIMARY KEY (`category_id`,`contact_id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Индексы таблицы `wa_contact_category`
--
ALTER TABLE `wa_contact_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_id` (`system_id`);

--
-- Индексы таблицы `wa_contact_data`
--
ALTER TABLE `wa_contact_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_field_sort` (`contact_id`,`field`,`sort`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `value` (`value`),
  ADD KEY `field` (`field`);

--
-- Индексы таблицы `wa_contact_data_text`
--
ALTER TABLE `wa_contact_data_text`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_field_sort` (`contact_id`,`field`,`sort`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `field` (`field`);

--
-- Индексы таблицы `wa_contact_emails`
--
ALTER TABLE `wa_contact_emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_sort` (`contact_id`,`sort`),
  ADD KEY `email` (`email`),
  ADD KEY `status` (`status`);

--
-- Индексы таблицы `wa_contact_events`
--
ALTER TABLE `wa_contact_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `calendar_id` (`calendar_id`);

--
-- Индексы таблицы `wa_contact_field_values`
--
ALTER TABLE `wa_contact_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_field` (`parent_field`,`parent_value`);

--
-- Индексы таблицы `wa_contact_files`
--
ALTER TABLE `wa_contact_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `purpose` (`purpose`);

--
-- Индексы таблицы `wa_contact_rights`
--
ALTER TABLE `wa_contact_rights`
  ADD PRIMARY KEY (`group_id`,`app_id`,`name`),
  ADD KEY `name_value` (`name`,`value`,`group_id`,`app_id`);

--
-- Индексы таблицы `wa_contact_settings`
--
ALTER TABLE `wa_contact_settings`
  ADD PRIMARY KEY (`contact_id`,`app_id`,`name`);

--
-- Индексы таблицы `wa_contact_waid`
--
ALTER TABLE `wa_contact_waid`
  ADD PRIMARY KEY (`contact_id`),
  ADD UNIQUE KEY `webasyst_contact_id` (`webasyst_contact_id`);

--
-- Индексы таблицы `wa_country`
--
ALTER TABLE `wa_country`
  ADD PRIMARY KEY (`iso3letter`),
  ADD UNIQUE KEY `isonumeric` (`isonumeric`),
  ADD UNIQUE KEY `iso2letter` (`iso2letter`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `wa_dashboard`
--
ALTER TABLE `wa_dashboard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash` (`hash`);

--
-- Индексы таблицы `wa_group`
--
ALTER TABLE `wa_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `wa_log`
--
ALTER TABLE `wa_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact` (`contact_id`,`id`),
  ADD KEY `datetime` (`datetime`);

--
-- Индексы таблицы `wa_login_log`
--
ALTER TABLE `wa_login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_datetime` (`contact_id`,`datetime_out`);

--
-- Индексы таблицы `wa_push_subscribers`
--
ALTER TABLE `wa_push_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `domain` (`domain`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `create_datetime` (`create_datetime`);

--
-- Индексы таблицы `wa_region`
--
ALTER TABLE `wa_region`
  ADD PRIMARY KEY (`country_iso3`,`code`);

--
-- Индексы таблицы `wa_transaction`
--
ALTER TABLE `wa_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plugin` (`plugin`),
  ADD KEY `app_id` (`app_id`),
  ADD KEY `merchant_id` (`merchant_id`),
  ADD KEY `transaction_native_id` (`native_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `wa_transaction_data`
--
ALTER TABLE `wa_transaction_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `value` (`value`);

--
-- Индексы таблицы `wa_user_groups`
--
ALTER TABLE `wa_user_groups`
  ADD PRIMARY KEY (`contact_id`,`group_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `wa_verification_channel`
--
ALTER TABLE `wa_verification_channel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address` (`address`);

--
-- Индексы таблицы `wa_verification_channel_assets`
--
ALTER TABLE `wa_verification_channel_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_address_name` (`channel_id`,`address`,`contact_id`,`name`),
  ADD KEY `name` (`name`),
  ADD KEY `expires` (`expires`);

--
-- Индексы таблицы `wa_verification_channel_params`
--
ALTER TABLE `wa_verification_channel_params`
  ADD PRIMARY KEY (`channel_id`,`name`);

--
-- Индексы таблицы `wa_widget`
--
ALTER TABLE `wa_widget`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wa_widget_params`
--
ALTER TABLE `wa_widget_params`
  ADD PRIMARY KEY (`widget_id`,`name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `shop_abtest`
--
ALTER TABLE `shop_abtest`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_abtest_variants`
--
ALTER TABLE `shop_abtest_variants`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_affiliate_transaction`
--
ALTER TABLE `shop_affiliate_transaction`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_api_courier`
--
ALTER TABLE `shop_api_courier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_cart_items`
--
ALTER TABLE `shop_cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `shop_checkout_flow`
--
ALTER TABLE `shop_checkout_flow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_coupon`
--
ALTER TABLE `shop_coupon`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_customers_filter`
--
ALTER TABLE `shop_customers_filter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `shop_expense`
--
ALTER TABLE `shop_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_feature`
--
ALTER TABLE `shop_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `shop_feature_values_color`
--
ALTER TABLE `shop_feature_values_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `shop_feature_values_dimension`
--
ALTER TABLE `shop_feature_values_dimension`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_feature_values_double`
--
ALTER TABLE `shop_feature_values_double`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_feature_values_range`
--
ALTER TABLE `shop_feature_values_range`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_feature_values_text`
--
ALTER TABLE `shop_feature_values_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_feature_values_varchar`
--
ALTER TABLE `shop_feature_values_varchar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_filter`
--
ALTER TABLE `shop_filter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_filter_rules`
--
ALTER TABLE `shop_filter_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_followup`
--
ALTER TABLE `shop_followup`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_importexport`
--
ALTER TABLE `shop_importexport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `shop_notification`
--
ALTER TABLE `shop_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_order_items`
--
ALTER TABLE `shop_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_order_log`
--
ALTER TABLE `shop_order_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_order_log_params`
--
ALTER TABLE `shop_order_log_params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_page`
--
ALTER TABLE `shop_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_plugin`
--
ALTER TABLE `shop_plugin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `shop_presentation`
--
ALTER TABLE `shop_presentation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_presentation_columns`
--
ALTER TABLE `shop_presentation_columns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `shop_product_code`
--
ALTER TABLE `shop_product_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_product_features`
--
ALTER TABLE `shop_product_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_product_images`
--
ALTER TABLE `shop_product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `shop_product_pages`
--
ALTER TABLE `shop_product_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_product_reviews`
--
ALTER TABLE `shop_product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_product_reviews_images`
--
ALTER TABLE `shop_product_reviews_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_product_services`
--
ALTER TABLE `shop_product_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_product_skus`
--
ALTER TABLE `shop_product_skus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `shop_product_stocks_log`
--
ALTER TABLE `shop_product_stocks_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_promo`
--
ALTER TABLE `shop_promo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `shop_promo_rules`
--
ALTER TABLE `shop_promo_rules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `shop_search_word`
--
ALTER TABLE `shop_search_word`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT для таблицы `shop_service`
--
ALTER TABLE `shop_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_service_variants`
--
ALTER TABLE `shop_service_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_set_group`
--
ALTER TABLE `shop_set_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_stock`
--
ALTER TABLE `shop_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_stock_rules`
--
ALTER TABLE `shop_stock_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_tag`
--
ALTER TABLE `shop_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `shop_tax`
--
ALTER TABLE `shop_tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `shop_transfer`
--
ALTER TABLE `shop_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shop_type`
--
ALTER TABLE `shop_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `shop_unit`
--
ALTER TABLE `shop_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `shop_virtualstock`
--
ALTER TABLE `shop_virtualstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `site_domain`
--
ALTER TABLE `site_domain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `team_calendar_external`
--
ALTER TABLE `team_calendar_external`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `team_event_external`
--
ALTER TABLE `team_event_external`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_announcement`
--
ALTER TABLE `wa_announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_cache`
--
ALTER TABLE `wa_cache`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_contact`
--
ALTER TABLE `wa_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `wa_contact_auths`
--
ALTER TABLE `wa_contact_auths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wa_contact_calendars`
--
ALTER TABLE `wa_contact_calendars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `wa_contact_category`
--
ALTER TABLE `wa_contact_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_contact_data`
--
ALTER TABLE `wa_contact_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_contact_data_text`
--
ALTER TABLE `wa_contact_data_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_contact_emails`
--
ALTER TABLE `wa_contact_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `wa_contact_events`
--
ALTER TABLE `wa_contact_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_contact_field_values`
--
ALTER TABLE `wa_contact_field_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_contact_files`
--
ALTER TABLE `wa_contact_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_dashboard`
--
ALTER TABLE `wa_dashboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_group`
--
ALTER TABLE `wa_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wa_log`
--
ALTER TABLE `wa_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT для таблицы `wa_login_log`
--
ALTER TABLE `wa_login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `wa_push_subscribers`
--
ALTER TABLE `wa_push_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_transaction`
--
ALTER TABLE `wa_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_transaction_data`
--
ALTER TABLE `wa_transaction_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_verification_channel`
--
ALTER TABLE `wa_verification_channel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `wa_verification_channel_assets`
--
ALTER TABLE `wa_verification_channel_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `wa_widget`
--
ALTER TABLE `wa_widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
