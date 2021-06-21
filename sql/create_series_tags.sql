CREATE TABLE `series_tags` (
  `tag_id` int NOT NULL,
  `series_id` int NOT NULL,
  KEY `id_idx` (`tag_id`),
  KEY `series_id_idx` (`series_id`),
  CONSTRAINT `series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
