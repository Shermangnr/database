/*
 Navicat Premium Data Transfer

 Source Server         : DB local
 Source Server Type    : MariaDB
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : prisma

 Target Server Type    : MariaDB
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 03/12/2024 12:18:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cargos
-- ----------------------------
DROP TABLE IF EXISTS `cargos`;
CREATE TABLE `cargos`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cargos
-- ----------------------------
INSERT INTO `cargos` VALUES (1, 'Administrador');
INSERT INTO `cargos` VALUES (2, 'Operario');
INSERT INTO `cargos` VALUES (3, 'Diseñador');
INSERT INTO `cargos` VALUES (4, 'Contador');

-- ----------------------------
-- Table structure for configuraciones
-- ----------------------------
DROP TABLE IF EXISTS `configuraciones`;
CREATE TABLE `configuraciones`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_padre` int(11) UNSIGNED NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `valor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of configuraciones
-- ----------------------------
INSERT INTO `configuraciones` VALUES (1, NULL, 'Tipo de facturas', NULL);
INSERT INTO `configuraciones` VALUES (2, 1, 'Venta', NULL);
INSERT INTO `configuraciones` VALUES (3, 1, 'Compra', NULL);

-- ----------------------------
-- Table structure for facturas
-- ----------------------------
DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `factura` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_emision` date NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_tipo_factura` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Referencia la tabla de configuraciones con el id padre 1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of facturas
-- ----------------------------

-- ----------------------------
-- Table structure for materiales
-- ----------------------------
DROP TABLE IF EXISTS `materiales`;
CREATE TABLE `materiales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_material` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_creacion` date NULL DEFAULT NULL,
  `tamano` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `precio_unitario` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usu_creador` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usu_modificador` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of materiales
-- ----------------------------
INSERT INTO `materiales` VALUES (2, 'Puntillas', 'Puntillas en acero inoxidable de color gris mate.', 23, 'PA523', '2024-07-31', '5x8\"', '0.00', 'Monchito', NULL);
INSERT INTO `materiales` VALUES (3, 'Martillo de carpintero con mango de fibra', 'Martillo de uso general con cabeza de acero forjado y mango ergonómico de fibra de vidrio para mayor resistencia y comodidad durante su uso.', 1, 'MCF-24680', '2024-07-31', '16 oz (453 g)', '$25.000,00', 'Monchito', 'Doña Florinda');
INSERT INTO `materiales` VALUES (4, 'Tornillo autorroscante galvanizado', 'Tornillo autorroscante de cabeza hexagonal, ideal para fijación en materiales metálicos. Fabricado en acero galvanizado para resistencia a la corrosión.', 100, 'TRG-12345', '2024-08-08', '3/16\" x 2\" (4.8mm x 50mm)', '$350,00', NULL, 'Doña Florinda');
INSERT INTO `materiales` VALUES (5, 'Cinta adhesiva doble faz', 'Cinta adhesiva de doble cara, ideal para fijaciones temporales o permanentes en superficies lisas. Resistente y fácil de cortar, con fuerte adherencia.', 1, 'CAD-67890', '2024-08-08', '1\" x 33m (25mm x 33m)', '$12.000,00', 'Doña Florinda', NULL);

-- ----------------------------
-- Table structure for tipo_identificacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_identificacion`;
CREATE TABLE `tipo_identificacion`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_identificacion
-- ----------------------------
INSERT INTO `tipo_identificacion` VALUES (1, 'Cédula ciudadanía');
INSERT INTO `tipo_identificacion` VALUES (2, 'Cédula extranjería');
INSERT INTO `tipo_identificacion` VALUES (3, 'Pasaporte');
INSERT INTO `tipo_identificacion` VALUES (4, 'Tarjeta identidad');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del empleado',
  `nombre_empleado` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Nombre del empleado',
  `apellido_empleado` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Apellido del empleado',
  `id_tipo_identificacion` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Tipo de identificacion del empleado',
  `numero_identificacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Numero de identificacion del empleado',
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Correo electronico del empleado',
  `id_cargo` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Cargo para el que se registra el empleado',
  `nombre_usuario` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Nombre de usuario para que el empleado ingrese',
  `contrasena` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Contraseña del usuario para que el empleado ingrese',
  `foto_perfil` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Foto de perfil del empleado',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_usuarios_tipo_identificacion`(`id_tipo_identificacion`) USING BTREE,
  INDEX `id_cargo`(`id_cargo`) USING BTREE,
  CONSTRAINT `fk_usuarios_tipo_identificacion` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'Prueba', 'Prueba', 1, '123456789', 'prueba@prueba.com', 1, 'Prueba', '$2y$10$7GzfcOvpvBValTfP45uRfeimwLiMbNDJMPsFtpYoMKjGHqOPjj.YK', NULL);
INSERT INTO `usuarios` VALUES (3, 'Luis Carlos', 'Torres Amador', 3, 'PE1234PO098', 'luis.torres@prueba.com', 2, 'luis_operario', 'a597c8ac8511810a0bb21e41edac2cc92a4bccb38a43dfce88b69f6a0f0a0111', NULL);
INSERT INTO `usuarios` VALUES (5, 'Diana Carolina', 'Bermudez Buitrago', 3, '1026259133', 'bb@gmail.com', 4, 'diana', '$2y$10$z7n9aMIiGjRpjaeUrC5oVeRyrwADSZR7aijOETheMqaaNNcb9niX.', NULL);
INSERT INTO `usuarios` VALUES (6, 'Milena', 'Sierra', 1, '10000000', 'correo@gmail.com', 1, 'MilenaS', '$2y$10$.XQU5vFA9USHVHv03uBQWuHlQNjAlNz3svSmLWLlfxyQH0EnUW.iG', NULL);
INSERT INTO `usuarios` VALUES (11, 'Julian5', 'Sierra', 4, '95090406060', 'carlos@prueba.com', 1, 'Julian1', '$2y$10$IgSgIIRujB8sRMrV/yKR7OnqlEI6iu3VX7gbe18qTs0kre31S9hwy', NULL);
INSERT INTO `usuarios` VALUES (13, 'German', 'Bermudez Buitrago', 1, '1014269444', 'german@prueba.com', 1, 'GermanB', '$2y$10$A0FtejSJXdDtePn3BWwcs.YTAZxzUfbtB3LafSnzHqgspWEu8xmdG', NULL);
INSERT INTO `usuarios` VALUES (14, 'Ramon', 'Valdez', 1, '1234567893', 'enrique@segoviano.com', 1, 'Monchito', 'a597c8ac8511810a0bb21e41edac2cc92a4bccb38a43dfce88b69f6a0f0a0111', 'monchito.webp');
INSERT INTO `usuarios` VALUES (15, 'Florinda ', 'Meza', 1, '1014269444', 'florinda@meza.com', 1, 'Doña Florinda', 'a597c8ac8511810a0bb21e41edac2cc92a4bccb38a43dfce88b69f6a0f0a0111', 'florinda.webp');
INSERT INTO `usuarios` VALUES (19, 'Ruben', 'Aguirre', 1, '1010233444', 'ruben@aguirre.com', 1, 'Jirafales', 'a597c8ac8511810a0bb21e41edac2cc92a4bccb38a43dfce88b69f6a0f0a0111', 'jirafales.webp');
INSERT INTO `usuarios` VALUES (20, 'Roberto', 'Gomez Bolaños', 1, '1014269444', 'roberto@gomez.com', 3, 'Chavito', 'a597c8ac8511810a0bb21e41edac2cc92a4bccb38a43dfce88b69f6a0f0a0111', 'chavo.webp');
INSERT INTO `usuarios` VALUES (21, 'Edgar', 'Vivar', 1, 'PE1234PO098', 'edgar@vivar.com', 1, 'Sr Barriga', 'a597c8ac8511810a0bb21e41edac2cc92a4bccb38a43dfce88b69f6a0f0a0111', 'srbarriga.webp');
INSERT INTO `usuarios` VALUES (22, 'Carlos', 'Villagran', 2, '1026259133', 'carlos@villagran.com', 3, 'Kiko', 'a597c8ac8511810a0bb21e41edac2cc92a4bccb38a43dfce88b69f6a0f0a0111', 'kiko.webp');
INSERT INTO `usuarios` VALUES (23, 'Florinda ', 'Meza', 2, '1026259133', 'lapopis@correo.com', 2, 'La popis', 'a597c8ac8511810a0bb21e41edac2cc92a4bccb38a43dfce88b69f6a0f0a0111', 'popis.webp');

SET FOREIGN_KEY_CHECKS = 1;
