CREATE DATABASE  IF NOT EXISTS `wireframe`;
USE `wireframe`;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `thoughts_tb`
--

DROP TABLE IF EXISTS `thoughts_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thoughts_tb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner` int NOT NULL,
  `content` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  CONSTRAINT `thoughts_tb_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `tb_user` (`id`),
  CONSTRAINT `thoughts_tb_ibfk_2` FOREIGN KEY (`owner`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2023-10-15  1:24:02
--
-- Table structure for table `likes_tb`
--

DROP TABLE IF EXISTS `likes_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_tb` (
  `thought_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`thought_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `likes_tb_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`),
  CONSTRAINT `likes_tb_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_tb_ibfk_4` FOREIGN KEY (`thought_id`) REFERENCES `thoughts_tb` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;