-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-10-2018 a las 04:44:30
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_ostik`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_actualizar_pedido`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_pedido` (IN `cant` INT, IN `preciou` VARCHAR(15), IN `ptotal` VARCHAR(15), IN `uid` INT, IN `pid` INT)  NO SQL
UPDATE cart SET qty = cant,price=preciou,total_amt=ptotal 
	WHERE user_id = uid AND p_id= pid$$

DROP PROCEDURE IF EXISTS `sp_mostrar_carrito`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_carrito` (IN `pid` INT, IN `uid` INT)  NO SQL
SELECT * FROM cart WHERE p_id = pid  AND user_id = uid$$

DROP PROCEDURE IF EXISTS `sp_mostrar_categorias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_categorias` ()  NO SQL
SELECT * FROM categories$$

DROP PROCEDURE IF EXISTS `sp_mostrar_marcas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_marcas` ()  NO SQL
SELECT * FROM brands$$

DROP PROCEDURE IF EXISTS `sp_mostrar_prodcateg`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_prodcateg` (IN `pid` INT)  NO SQL
SELECT * FROM products WHERE product_cat = pid$$

DROP PROCEDURE IF EXISTS `sp_mostrar_prodmarca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_prodmarca` (IN `brdid` INT)  NO SQL
SELECT * FROM products WHERE product_brand = brdid$$

DROP PROCEDURE IF EXISTS `sp_mostrar_productos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_productos` ()  NO SQL
SELECT * FROM products$$

DROP PROCEDURE IF EXISTS `sp_mostrar_prod_user`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_prod_user` (IN `proid` INT, IN `uid` INT)  NO SQL
SELECT * FROM cart WHERE p_id = proid AND user_id = uid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int(100) NOT NULL AUTO_INCREMENT,
  `brand_title` text NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'MICRONICS'),
(4, 'GENIUS'),
(5, 'KINGSTON'),
(6, 'ASUS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) NOT NULL,
  `product_title` varchar(200) NOT NULL,
  `product_image` varchar(200) NOT NULL,
  `qty` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `total_amt` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `product_title`, `product_image`, `qty`, `price`, `total_amt`) VALUES
(11, 1, '0', 10, 'Monitor LED AOC E970SWN 19\"', 'aoc19.jpg', 2, 300, 600),
(12, 2, '0', 10, 'Monitor HP VH22 de 21,5\r\n', 'hp19.png', 1, 350, 350),
(15, 1, '0', 11, 'Monitor LED AOC E970SWN 19\"', 'aoc19.jpg', 1, 300, 300),
(16, 1, '0', 12, 'Monitor LED AOC E970SWN 19\"', 'aoc19.jpg', 3, 300, 900);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(100) NOT NULL AUTO_INCREMENT,
  `cat_title` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'MONITORES\r\n'),
(2, 'PROCESADORES'),
(3, 'PLACAS'),
(4, 'CASEs'),
(5, 'PERIFERICOS'),
(6, 'LAPTOPS'),
(7, 'MEMORIAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Monitor LED AOC E970SWN 19\"', 300, 'Monitor LED AOC E970SWN 19\"', 'aoc19.jpg', 'samsung mobile electronics'),
(2, 1, 3, 'Monitor HP VH22 de 21,5\r\n', 350, 'Monitor HP VH22 de 21,5 pulgadas\r\n(V9E67A6)', 'hp19.png', 'mobile iphone apple'),
(3, 1, 3, 'Monitor BenQ 24\"', 500, 'Monitor BenQ 24\" ZOWIE XL2430 144Hz - Full HD - 1ms - HDMI - VGA - DVI - DP', 'benq24.jpg', 'apple ipad tablet'),
(4, 1, 3, 'Monitor LG 18,5\"', 442, 'Monitor LG LED 19M38A-B VGA de 18,5\"', 'lg19.jpg', 'lg monitor'),
(5, 1, 2, 'Monitor Samsung LED 18,5\"', 590, 'Monitor Samsung LED 19D300H HDMI - VGA de 18,5\"', 'samled18.jpg', 'led monitor samsung'),
(6, 1, 1, 'Monitor LED LG 29\"', 1321, 'Monitor LED LG 29\" 29UM58-P IPS UltraWide® Full HD - HDMI - 21:9', 'lg29.jpg', 'led lg monitor'),
(7, 1, 1, 'LED Samsung Curvo 24\"', 831, 'Monitor LED Samsung Curvo 24\" LC24F390 con AMD FreeSync', 'sgledc24.jpg', 'samsung led 24 curvo'),
(8, 1, 4, 'Samsung Syncmaster 23.6\" LED', 400, 'Samsung Syncmaster S24B150BL - Monitor de 23.6\" (1920 x 1080 LED)', 'monitor.jpg', 'samsung led 23'),
(9, 1, 3, 'Monitor BenQ 22\" Eye-care', 556, 'Monitor LED BenQ 22\" GW2270H Full HD - HDMI - VGA con tecnología Eye-care', 'benq22ec.jpg', 'benq eye care 22 led');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_info`
--

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE IF NOT EXISTS `user_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`) VALUES
(2, 'Rizwan', 'Khan', 'rizwankhan.august16@gmail.com', '25f9e794323b453885f5181f1b624d0b', '9832268432', 'Hutton Road'),
(3, 'Rizwan', 'Khan', 'salmankhan@gmail.com', '25f9e794323b453885f5181f1b624d0b', '8389080182', 'Hutton Road'),
(4, 'Juan', 'Mathas', 'ricardocorazondeleon2018@gmail.com', '107f0be83ce4115a829215412c22ebcc', '9286444682', 'AV PANAMERICANA'),
(6, 'jean', 'palomino', '74079623@gmail.com', '25f9e794323b453885f5181f1b624d0b', '987654321', ''),
(7, 'max', 'artur', '123456@gmail.com', '25f9e794323b453885f5181f1b624d0b', '978654321', ''),
(8, 'jean', 'paul', 'jppr123@hotmail.com', '25f9e794323b453885f5181f1b624d0b', '123456789', ''),
(9, 'asdasd', 'asdsadas', '123jp@gmail.com', '4c8dceb0de04c7ed68ed45d3b9001c62', '123456783', ''),
(10, 'pool', 'palomino', 'jeanpool_p1@hotmail.com', '4c8dceb0de04c7ed68ed45d3b9001c62', '111111111', 'huancayo'),
(12, 'Jean Paul', 'Palomino Ricapa', 'poolpalomino1@gmail.com', 'e9a71fbc1f46bebddc4411bc15a63d9f', '972900062', 'Jr. Tarma Mz.3 Lt.9');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
