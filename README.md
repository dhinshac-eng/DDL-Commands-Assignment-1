# Assignment 1 – SQL DDL Commands (Employee Database)

A MySQL script demonstrating the core **Data Definition Language (DDL)** commands: `CREATE`, `ALTER`, `RENAME`, `TRUNCATE` and `DROP`, using a simple employee-management schema.

## Repository Contents

| File | Description |
|------|-------------|
| `Assignment 1-DDL Commands.sql` | Complete SQL script with all DDL operations |
| `README.md` | Project documentation |

## Database Schema

The `employee` database contains three related tables.

### Departments
| Column | Type | Constraints |
|--------|------|-------------|
| `department_id` | INT | PRIMARY KEY |
| `department_name` | VARCHAR(100) | NOT NULL, UNIQUE |

### Location
| Column | Type | Constraints |
|--------|------|-------------|
| `location_id` | INT | PRIMARY KEY, AUTO_INCREMENT |
| `location_name` | VARCHAR(30) | NOT NULL, UNIQUE |

### Employees
| Column | Type | Constraints |
|--------|------|-------------|
| `employee_id` | INT | PRIMARY KEY |
| `employee_name` | VARCHAR(50) | NOT NULL |
| `gender` | ENUM('M','F') | – |
| `age` | INT | CHECK (age >= 18) |
| `hire_date` | DATE | DEFAULT current date |
| `designation` | VARCHAR(100) | – |
| `department_id` | INT | FOREIGN KEY → Departments(department_id) |
| `location_id` | INT | FOREIGN KEY → Location(location_id) |
| `salary` | DECIMAL(10,2) | – |

### Relationships

```
Departments (1) ──────< Employees >────── (1) Location
```

Each employee belongs to one department and one location; a department or location can have many employees.

## DDL Commands Covered

| Command | Example in this script |
|---------|------------------------|
| `CREATE DATABASE` | `create database employee;` |
| `CREATE TABLE` | Departments, Location, Employees |
| `ALTER TABLE ... ADD COLUMN` | Adds `email VARCHAR(50)` to Employees |
| `ALTER TABLE ... MODIFY COLUMN` | Changes `designation` to `VARCHAR(150)` |
| `ALTER TABLE ... DROP COLUMN` | Removes `age` from Employees |
| `ALTER TABLE ... RENAME COLUMN` | Renames `hire_date` to `date_of_joining` |
| `RENAME TABLE` | `Departments` → `Departments_info`, `Location` → `Locations` |
| `TRUNCATE TABLE` | Removes all rows from Employees |
| `DROP TABLE` | Deletes the Employees table |
| `DROP DATABASE` | Deletes the `employee` database |
| `CREATE DATABASE IF NOT EXISTS` | Safely recreates the database |

## Script Flow

1. **Initial creation** – creates the `employee` database and the three base tables with foreign keys.
2. **Alterations** – adds, modifies, drops and renames columns on `Employees`.
3. **Renaming tables** – renames `Departments` and `Location`.
4. **Cleanup** – truncates and drops the `Employees` table, then drops the whole database.
5. **Final recreation** – rebuilds the schema with stronger constraints:
   - `UNIQUE` on department and location names
   - `AUTO_INCREMENT` on `location_id`
   - `CHECK (age >= 18)` on `age`
   - `DEFAULT (current_date)` on `hire_date`

## Requirements

- **MySQL 8.0.16 or later** (required for enforced `CHECK` constraints, `RENAME COLUMN` and expression defaults such as `DEFAULT (current_date)`)
- MySQL Workbench, the MySQL command-line client, or any compatible SQL client

## How to Run

**Command line**
```bash
mysql -u <your_username> -p < "Assignment 1-DDL Commands.sql"
```

**MySQL Workbench**
1. Open the `.sql` file via *File → Open SQL Script*.
2. Click the lightning-bolt icon to execute.

> **Note:** The script intentionally runs `DROP TABLE` and `DROP DATABASE` midway to demonstrate those commands, then recreates everything at the end. Run it on a test environment and not on a database containing data you want to keep. Running it statement by statement is recommended to observe each command's effect.

## Key Concepts Demonstrated

- Primary and foreign key constraints (referential integrity)
- `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT` and `AUTO_INCREMENT` constraints
- Schema modification without data loss (`ALTER`)
- Difference between `TRUNCATE` (removes rows, keeps structure) and `DROP` (removes the structure itself)

## Author

**Dhinsha C**
