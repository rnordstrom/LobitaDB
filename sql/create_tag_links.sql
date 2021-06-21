CREATE TABLE `tag_links` (
  `tag_id` int NOT NULL,
  `link_id` int NOT NULL,
  KEY `tag_id_idx` (`tag_id`),
  KEY `link_id_idx` (`link_id`),
  CONSTRAINT `link_id_FK` FOREIGN KEY (`link_id`) REFERENCES `links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_id_FK` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
