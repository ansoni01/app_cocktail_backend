-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2020 a las 00:45:58
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_project`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cervezas`
--

CREATE TABLE `cervezas` (
  `id_cer` int(11) NOT NULL,
  `cer_nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `cer_img` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `grado_alcohol` float NOT NULL,
  `cer_tipo` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cer_pais` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cervezas`
--

INSERT INTO `cervezas` (`id_cer`, `cer_nombre`, `cer_img`, `grado_alcohol`, `cer_tipo`, `cer_pais`) VALUES
(1, 'Pilsener', '/upload/cervezas/pilsener.png', 4.2, NULL, 'Ecuador'),
(2, 'Corona Extra', '/upload/cervezas/corona-extra.png', 4.5, NULL, 'México'),
(3, 'Aguila Original', '/upload/cervezas/aguila.png', 4, NULL, 'Colombia'),
(4, 'Stella Artois', '/upload/cervezas/stella-artois.png', 5, NULL, 'Bélgica'),
(5, 'Quilmes', '/upload/cervezas/quilmesclasica.png', 4.8, NULL, 'Argentina'),
(6, 'Budweiser', '/upload/cervezas/budweiser.png', 5, NULL, 'Estados Unidos'),
(7, 'Heineken', '/upload/cervezas/heineken.png', 5, NULL, 'Países Bajos'),
(8, 'Brahma', '/upload/cervezas/brahma.png', 4.8, NULL, 'Brasil'),
(9, 'Club Premium', '/upload/cervezas/clubverde.png', 4.4, NULL, 'Ecuador'),
(10, 'Estrella Galicia', '/upload/cervezas/estrella-galicia.png', 5.5, NULL, 'España'),
(11, 'Tsingtao', '/upload/cervezas/tsingtao.png', 4.7, NULL, 'China'),
(12, 'Cristal', '/upload/cervezas/cristal.png', 5, NULL, 'Perú'),
(13, 'Modelo Especial', '/upload/cervezas/modelo.png', 4.5, NULL, 'México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocteles`
--

CREATE TABLE `cocteles` (
  `id_coctel` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingredientes` text COLLATE utf8_spanish_ci NOT NULL,
  `preparacion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cocteles`
--

INSERT INTO `cocteles` (`id_coctel`, `id_user`, `nombre`, `imagen`, `ingredientes`, `preparacion`) VALUES
(1, 1, 'Veracruz Blue\r\n', '/upload/cocteles/veracruz-blue-cocktail.jpg', '1 1/2 oz (45 ml) Vodka\r\n1 oz (30 ml) Curacao Azul\r\n8 oz (240 ml) Bebida Isotónica Azul\r\nSoda de lima-limón', 'En la coctelera con hielos añadimos todos los ingredientes *excepto la soda de lima-limón*, agitamos y servimos en un vaso alto con hielos, terminamos de rellenar con la soda de lima-limón y decoramos con regaliz azul.'),
(2, 2, 'Cosmopolitan', '/upload/cocteles/coctel-cosmopolitan.jpg', 'Hielo picado.\r\n50 ml de Vodka.\r\n15 ml de Cointreau, Gran Marnier, triple sec o licor de naranja.\r\nMedio chupito de zumo de arándanos, grosellas o sirope del mismo sabor.\r\n10 ml de zumo de limón o de lima.\r\nCáscara de naranja o rodaja de lima para decorar.', '1. Prepara la copa de tu cóctel Cosmopolitan decorando el borde con azúcar.\r\n2. En una coctelera ponemos todos los ingredientes: el hielo picado, el vodka, el Cointreau y el zumo de arándanos y de limón. Agitamos con alegría durante al menos 20 segundos.\r\n3. Colamos el cóctel en nuestra copa. Para servir el coctel Cosmopolitan se suelen usar vasos de Martini. A tope de glamour Suele servirse sin hielo.\r\n4. Para decorar ponemos una cáscara de naranja o limón pelada en espiral. O una rodaja fresca de naranja, limón o lima. ¡A disfrutar! Tu cóctel cosmopolitan ya está listo para brindar.'),
(3, 5, 'Sangre y arena', '/upload/cocteles/sangreyarena.jpg', 'Ingredientes para 4 cócteles\r\n* 177 ml de whisky escocés (Cutty Sark, Ballentines, J&B, etcétera)\r\n* 120 ml de zumo de  naranja roja o sanguina\r\n* 60 ml de licor de cerezas Maraschino\r\n90 ml  vermut negro o rojo (el dulce como Martini)\r\n* 29 ml de Gran Marnier\r\n* 4 rodajas de naranja para adornar.', '1. Se añaden todos los ingredientes en la coctelera y se agitan. Se ponen en el congelador en recipientes como los de cubitos de hielo entre 8-24 horas.\r\n2. A la hora de servir picamos 3 tazas de hielo hasta dejarlo fino y lo repartimos en las cuatro copas. \r\n3. Añadimos en la picadora/batidora 60 ml de zumo de naranja roja y el cóctel en los cubitos de hielo que teníamos. Trituramos hasta que quede también escarchado. \r\n4. Servimos mezclando con el hielo picado.'),
(4, 2, 'Huracán', '/upload/cocteles/huracan.jpg', '1. 60 ml de ron blanco\r\n2. 88 ml de ron dorado\r\n3. 180 ml de zumo de maracuyá o fruta de la pasión\r\n4. 180 ml de zumo de naranja\r\n5. Granadina, dos cucharadas\r\n6. Naranja dos rodajas\r\n7. 2 cerezas al marrasquino', '1. Medimos con una taza medidora de líquidos El ron añejo y lo vertemos en la coctelera, luego el ron blanco\r\n2. Añadimos el zumo de maracuyá\r\n3. Vertimos el zumo de naranja en el vaso medidor y lo añadimos a la coctelera\r\n4. Agitamos y ponemos hielo picado en cada copa\r\n5. Añadimos una cucharada de granadina en cada copa\r\n6. Servir y adornar con una rodaja de naranja y cerezas al marrasquino.'),
(5, 5, 'Cóctel Pantanoso', '/upload/cocteles/358306-pantanoso.jpg', '1 1/2 Tazas de ginebra, fría\n1 1/2 Tazas de limonada, fría\n2 Tazas de gaseosa ginger ale, fría\nUnas gotas de colorante de comida verde\n10 cucharadas de crema batida\n30 gomitas de gusanos', '1 En una jarra, mezcla ginebra, limonada y gaseosa ginger ale.\n2 Agrega unas gotas de colorante de comida verde hasta lograr el tono que quieras. Mezcla bien.\n3 Coloca 1 cucharada de crema batida en el medio de cada vaso, y con cuidado sirve la mezcla de ginebra y gaseosa sobre la crema.\n4 Decora con 3 gomitas de gusanos en cada vaso.'),
(6, 6, 'Crimson Twilight', '/upload/cocteles/877199-crimson.jpg', '* 45 ml de vodka.\n* 15 ml de vermouth rojo.\n* 6-5 hojas de albahaca.\n* 10 ml de jarabe de granadina.\n* 1 cereza marrasquino.\n* Ralladura de naranja.', '1. Frota ligera y suavemente (entre tus manos) las hojas de albahaca y colócalas en un vaso mezclador. \n2. Añade el jarabe de granadina, el vermouth rojo y el vodka. Agita bien hasta que todos los ingredientes se hayan mezclado y verter en una copa cóctel tipo Martini. \n3. Decorar el trago con una cereza marrasquino y la ralladura de cáscara de naranja.'),
(7, 1, 'Bull', '/upload/cocteles/507134-bull.jpg', '1. 45 ml de Ron blanco\n2. 30 ml de jugo de limón\n3. 30 ml de jarabe natural\n4. Hielo\n5. Cerveza oscura', '1. En un vaso largo o una copa fantasía colocaremos el Ron, Jugo de Limón y el jarabe natural. \n2. Con una cuchara mezclamos y después llenaremos nuestro vaso con hielo. \n3. Para finalizar rellenaremos a tope con la cerveza oscura. Se puede decorar al gusto, aunque su separación de color hace que se vea irresistible.'),
(8, 1, 'Paloma', '/upload/cocteles/243060-paloma.jpg', '1 Vaso pequeño de Tequila blanco\n1 Chorro de zumo de limón\n1 Vaso de refresco (puede ser sustituido por zumo) de naranja o pomelo\n1 Pizca de sal', '1. En un vaso highball escarchado con sal añadimos tres cubos de hielo y vaciamos el tequila junto con el zumo de limón. La proporción son dos partes de tequila para media parte de limón. \n2. Añade al vaso el refresco de naranja o pomelo, según preferencias, y mezcla suavemente. \n3. Decora con una rodaja de limón y listo.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comen` int(11) NOT NULL,
  `id_coctel` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `detalle` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comen`, `id_coctel`, `id_user`, `detalle`, `estado`) VALUES
(1, 3, 6, 'Es genial este cóctel la naranja le da un toque delicioso ', 'A'),
(2, 2, 1, 'Muy buen cóctel', 'A'),
(3, 3, 1, 'Excelente acabo de seguir tu receta y me gusto el sabor', 'A'),
(4, 2, 4, 'Tiene un buen sabor', 'A'),
(5, 2, 3, 'Excelente, me gustó mucho', 'A'),
(6, 4, 3, 'Muy bonito los ingredientes para adornar', 'A'),
(7, 2, 5, 'Es un cóctel super especial me encanta', 'A'),
(8, 4, 5, 'Buena explicación, lo intentaré hacer', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`) VALUES
(1, 'Ninguno'),
(2, 'Camarero'),
(3, 'Barman'),
(4, 'Bartender'),
(5, 'Mixólogo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitios`
--

CREATE TABLE `sitios` (
  `id_sitio` int(11) NOT NULL,
  `nombre_sitio` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `telefeno` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ubicacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `sitio_img` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sitios`
--

INSERT INTO `sitios` (`id_sitio`, `nombre_sitio`, `telefeno`, `ubicacion`, `latitud`, `longitud`, `sitio_img`) VALUES
(1, 'Bar Karaoke EL EXCLUSIVO', '+593985163320', 'Barrio El Paraíso, José Luis Tamayo, Salinas', -2.2384183, -80.9291161, '/upload/bar_exclusivo.jpg'),
(2, 'Bar Discoteca \"El Regreso\"', '+593996905579', 'Calle 13, Salinas', -2.2313595, -80.9325417, '/upload/el-regreso.jpg'),
(3, 'RockaBar', '+593989410939', 'Salinas', -2.2059757, -80.974687, '/upload/rockabar.jpg'),
(4, 'Bar- discoteca Weekend', '+593994906262', 'Angel Simon Yagual y, Manglaralto, Santa Elena', -2.2424754, -80.8604315, '/upload/weekend.jpg'),
(5, 'Lounge Bar BOOGALOO', '+593994018140', 'Calle 2, La Libertad', -2.2283177, -80.9119244, '/upload/boogaloo.jpg'),
(6, 'Licorería Al Paso', '+593984001624', 'Salinas', -2.2348976, -80.9341425, '/upload/alpaso.jpg'),
(7, 'Discoteca Karaoke BLUE SKYY', NULL, 'Santa Elena', -2.2341288, -80.9021789, '/upload/blueskyy.jpg'),
(8, 'Punto de Encuentro', '', 'Santa Elena', -2.2319972, -80.8609957, '/upload/punto_encuentro.jpg'),
(9, 'Kalinka', '', 'Salinas', -2.2218172, -80.9607242, '/upload/kalinda.jpg'),
(10, 'Mini Market & Licoreria', '0985671856', 'Salinas', -2.2452388, -80.9427273, '/upload/minilicor.jpg'),
(11, 'Licorera Antojitos D\'Lulú', '+593996816323', 'EC24 La Libertad, 170407', -2.2311439, -80.9126696, '/upload/lulu.jpg'),
(35, 'Prueba1', '123456', 'Salinas', -2.2434929, -80.9318224, '/upload/493171-45879.jpg'),
(36, 'Prueba6', '123456789', 'Salinas', -2.2434929, -80.9318224, '/upload/800446-albanil.jpg'),
(37, 'uikyujtyhrtgerv', '987654', '564fd', -2.2434929, -80.9318224, '/upload/683763-crimson.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitios_usuarios`
--

CREATE TABLE `sitios_usuarios` (
  `id_situ` int(11) NOT NULL,
  `id_sitio` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sitios_usuarios`
--

INSERT INTO `sitios_usuarios` (`id_situ`, `id_sitio`, `id_user`, `estado`) VALUES
(1, 1, 1, 'A'),
(4, 35, 1, 'A'),
(5, 36, 1, 'A'),
(6, 37, 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clave` text COLLATE utf8_spanish_ci NOT NULL,
  `img_user` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_naci` date DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `nombre`, `clave`, `img_user`, `fecha_naci`, `id_rol`, `direccion`, `telefono`) VALUES
(1, 'mario19', '$2y$10$IUuTIUHa8W4CPVIJew52YegA3C9pLLY1MtFsKm4bqEQw9Iy54zT0i', '/upload/user/user-avatar.png', '1998-01-19', 1, 'Ecuador', '0991752035'),
(2, 'rosita1', '$2y$10$dkm7imhnWgEtOXteMFYNG.XlRZDOo8upeCW./6OkLEzdUNQnVWvTi', '/upload/user/user-avatar-woman.png', '1998-11-06', 3, '', '0987512845'),
(3, 'willvg', '$2y$10$6uJb5YKhG3F/mt9AK/JEx.wH1pCwvAJhywolea0AVoc3n3gbfpZne', '/upload/user/avatar2-user.png', '1995-06-08', 3, 'Santa Elena', '0947812475'),
(4, 'Juan25', '$2y$10$maSfIZv4L22tfOcAbsC4dO/HLrdGlUNACpvAtEmjggZgCjCRKouaG', '/upload/user/default-chico.png', '1998-10-08', 2, 'La Libertad', ''),
(5, 'Cindy21', '$2y$10$E4d6wLdvL1rVQPcXmoNL.OBlMKqiatdkc.ojIIGojA6iC2j2f.8u2', '/upload/user/avatar-chica2.png', '1996-04-21', 3, 'Salinas', '0987430481'),
(6, 'Anita02', '$2y$10$vSYODku.pfToMi8TciFakOOR.YpaIp.iOuRid.A3US9AVm3JzGOei', '/upload/user/default-chica.png', '1995-10-22', 4, 'Guayaquil', ''),
(7, 'Jorge012', '$2y$10$Zw7UqHZS.H9T1HQDoA96Fu6eydMEXgyBsyrEoJHvAtRBeS62XCXBW', '/upload/user/default-chico.png', '1997-09-07', 1, 'Salinas', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion_sitios`
--

CREATE TABLE `valoracion_sitios` (
  `id_val` int(11) NOT NULL,
  `id_sitio` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `puntos` int(11) NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `valoracion_sitios`
--

INSERT INTO `valoracion_sitios` (`id_val`, `id_sitio`, `id_user`, `puntos`, `estado`) VALUES
(1, 2, 1, 5, 'A'),
(2, 2, 2, 4, 'A'),
(3, 1, 2, 4, 'A'),
(4, 1, 1, 5, 'A'),
(5, 6, 1, 4, 'A'),
(6, 3, 2, 4, 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cervezas`
--
ALTER TABLE `cervezas`
  ADD PRIMARY KEY (`id_cer`);

--
-- Indices de la tabla `cocteles`
--
ALTER TABLE `cocteles`
  ADD PRIMARY KEY (`id_coctel`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comen`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `rel_comentario_coctel` (`id_coctel`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `sitios`
--
ALTER TABLE `sitios`
  ADD PRIMARY KEY (`id_sitio`);

--
-- Indices de la tabla `sitios_usuarios`
--
ALTER TABLE `sitios_usuarios`
  ADD PRIMARY KEY (`id_situ`),
  ADD KEY `id_sitio` (`id_sitio`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `rol` (`id_rol`);

--
-- Indices de la tabla `valoracion_sitios`
--
ALTER TABLE `valoracion_sitios`
  ADD PRIMARY KEY (`id_val`),
  ADD KEY `id_sitio` (`id_sitio`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cervezas`
--
ALTER TABLE `cervezas`
  MODIFY `id_cer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cocteles`
--
ALTER TABLE `cocteles`
  MODIFY `id_coctel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sitios`
--
ALTER TABLE `sitios`
  MODIFY `id_sitio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `sitios_usuarios`
--
ALTER TABLE `sitios_usuarios`
  MODIFY `id_situ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `valoracion_sitios`
--
ALTER TABLE `valoracion_sitios`
  MODIFY `id_val` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cocteles`
--
ALTER TABLE `cocteles`
  ADD CONSTRAINT `user_coctel` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `rel_comentario_coctel` FOREIGN KEY (`id_coctel`) REFERENCES `cocteles` (`id_coctel`),
  ADD CONSTRAINT `rel_comentario_usuario` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`);

--
-- Filtros para la tabla `sitios_usuarios`
--
ALTER TABLE `sitios_usuarios`
  ADD CONSTRAINT `rel_sitio_usuarios` FOREIGN KEY (`id_sitio`) REFERENCES `sitios` (`id_sitio`),
  ADD CONSTRAINT `rel_user_sitio` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `valoracion_sitios`
--
ALTER TABLE `valoracion_sitios`
  ADD CONSTRAINT `valoracion_sitios_ibfk_1` FOREIGN KEY (`id_sitio`) REFERENCES `sitios` (`id_sitio`),
  ADD CONSTRAINT `valoracion_sitios_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
