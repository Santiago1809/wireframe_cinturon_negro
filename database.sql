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
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'Santiago ','Aristizabal','aristizabalsantiago482@gmail.com','scrypt:32768:8:1$LLUZBSUtpfkBo42k$96f46f76d10cd3a055700b91b55e26aed753722f448be136b63acde5f01c3a55b2e60366a66d75c010d21deca40b856f63e5b8c6a4eaaf66e171546a174ce547'),(2,'Carlos Mario','Aristizabal','carlosmario201@gmail.com','scrypt:32768:8:1$3AU5j2GeHxt8hFVo$464953a1519d2a16e75f7cf68910333ccc7fe7bfbe5add83b86c624853047c95588924acc89b1dd22f581b9f5b76dff315ac0ef1daf9060fe4bfcb92ca52c56e');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `thoughts_tb`
--

LOCK TABLES `thoughts_tb` WRITE;
/*!40000 ALTER TABLE `thoughts_tb` DISABLE KEYS */;
INSERT INTO `thoughts_tb` VALUES (6,1,'Prueba de post'),(8,1,'Nuevo post');
/*!40000 ALTER TABLE `thoughts_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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