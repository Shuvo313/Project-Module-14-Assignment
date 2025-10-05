# Project-Module-14-Assignment

## Project Overview

This project creates a simple **Task Manager** database using SQL. It contains two tables:

- **users** → Stores user details
- **tasks** → Stores tasks assigned to users

**1:N relationship** is established between `users` and `tasks` (one user can have many tasks).

## Queries Implemented

<!--  Select all tasks: -->

```sql
SELECT * FROM tasks;


<!--  Update a task’s status: -->

UPDATE tasks SET status = 'completed' WHERE id = 2;


<!-- Delete a task: -->

DELETE FROM tasks WHERE id = 6;


<!-- Show tasks with Sorting & Pagination: -->

SELECT * FROM tasks ORDER BY created_at DESC LIMIT 5;


<!-- Aggregator Functions (task count per user): -->

SELECT u.name, COUNT(t.id) AS total_tasks
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id
GROUP BY u.id;

<!-- Inner Join: -->

SELECT u.name, t.title, t.status
FROM users u
INNER JOIN tasks t ON u.id = t.user_id;

<!-- Left Join: -->

SELECT u.name, t.title, t.status
FROM users u
LEFT JOIN tasks t ON u.id = t.user_id;

<!-- Right Join: -->

SELECT u.name, t.title, t.status
FROM users u
RIGHT JOIN tasks t ON u.id = t.user_id;
```

## Database Details

- **Database Name:** `task_manager`
- **Tables:**
  - `users (id, name, email, created_at)`
  - `tasks (id, user_id, title, description, status, created_at)`

## Relationships

- `users.id` → `tasks.user_id`
- One user can have multiple tasks.

## Sample Data

- **Users:** 3 (Alice, Bob, Charlie)
- **Tasks:** Multiple tasks for each user with different statuses.
