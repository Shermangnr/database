/*
 Navicat Premium Data Transfer

 Source Server         : DB local
 Source Server Type    : MariaDB
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : spa

 Target Server Type    : MariaDB
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 03/12/2024 12:23:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de la tabla',
  `marca_producto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Marca del producto que se esta ofreciendo',
  `nombre_producto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Nombre del producto que se esta ofreciendo',
  `imagen_producto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Imagenes del producto',
  `descripcion_producto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Descripción del producto',
  `precio_producto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Precio del producto',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 'Live Fraiche', 'Aceite de ricino orgánico', 'aceite_ricino.webp', 'Aceite de ricino orgánico para la cara (2 onzas) + tubo de rímel relleno gratis, suero de crecimiento de pestañas de cejas 100% puro USDA, prensado en frío, sin hexano.', '70.300');
INSERT INTO `productos` VALUES (2, 'Medicube', 'Crema de Colágeno Collagen Jelly Cream', 'crema.webp', 'Medicube ofrece soluciones para pieles sensibles y propensas al acné gracias a sus diferentes líneas de productos dirigidas a tratar problemas de la piel como la sequedad, la piel apagada y los poros.', '48.500');
INSERT INTO `productos` VALUES (3, 'AERY JO', ' Loose Translucent Face Powder', 'base.webp', 'Fundada en 1990, AERY JO combina conocimiento y experiencia profesional para ofrecer accesorios y artículos de maquillaje, diseñados y creados en sus exclusivos centros de investigación con certificación CGMP.', '25.000');
INSERT INTO `productos` VALUES (4, 'MIzon', 'Lápiz labial mate aterciopelado', 'labial.webp', 'Creada por investigadores de las principales empresas de cosméticos de Corea,Mizones conocida por sus productos para el cuidado de la piel a base de mucina de caracol, entre los más vendidos de la marca.', '52.000');
INSERT INTO `productos` VALUES (5, 'APLB', 'Protector Solar Glutathione Niacinamide Sunscreen', 'protector.webp', 'Manteniendo el lema \"dos es mejor que uno\", la marca de belleza coreana APLB (A más B) ofrece cuidado de la piel, cuidado del cabello, cuidado del cuerpo y maquillaje formulados con ingredientes de origen natural para ofrecer varios beneficios sin causar ', '36.500');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla',
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Nombre del usuario',
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Correo del usuario',
  `contrasena` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Contraseña del usuario',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Token de sesión unica',
  `creado_por` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Usuario que crea el registro',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación del registro',
  `actualizado_por` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Usuario que actualiza el registro',
  `fecha_actualizacion` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha de actualización del registro',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
