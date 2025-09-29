-- 1. Create Database
CREATE DATABASE task_manager;
USE task_manager;

-- 2. Create Tables

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tasks table (1:N relationship with users)
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    status ENUM('pending', 'in_progress', 'completed') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 3. Insert Users
INSERT INTO users (name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

-- 4. Insert Tasks
INSERT INTO tasks (user_id, title, description, status) VALUES
(1, 'Design Homepage', 'Create wireframe and design for homepage', 'in_progress'),
(1, 'Fix Login Bug', 'Resolve issue with login session', 'pending'),
(1, 'Write Documentation', 'Prepare documentation for project setup', 'completed'),

(2, 'Database Backup', 'Schedule daily backup for database', 'pending'),
(2, 'API Integration', 'Integrate third-party payment API', 'in_progress'),

(3, 'UI Testing', 'Perform testing for new UI changes', 'pending'),
(3, 'Bug Fixing', 'Fix CSS issues in dashboard', 'completed');
