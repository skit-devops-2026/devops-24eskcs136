CREATE DATABASE IF NOT EXISTS `organizr`;
USE `organizr`;

CREATE TABLE IF NOT EXISTS `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `full_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `task` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `Title` VARCHAR(255) NOT NULL,
  `Description` TEXT NOT NULL,
  `Date` DATE NOT NULL,
  `user_id` INT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `Name` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Message` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed initial test user and tasks
INSERT IGNORE INTO `users` (`id`, `full_name`, `email`, `password`) VALUES
(1, 'DevOps Student', 'student@skit.ac.in', 'student123');

INSERT IGNORE INTO `task` (`id`, `Title`, `Description`, `Date`, `user_id`) VALUES
(1, 'Complete DevOps MT1', 'Setup Git, CI pipeline, and Jenkinsfile', CURDATE(), 1),
(2, 'Complete DevOps MT2', 'Containerize with Docker, deploy, monitor with Prometheus, and setup Kubernetes', CURDATE(), 1);
