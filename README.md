# 🚗 Automobile Management System

![Python](https://img.shields.io/badge/Python-3.11-blue)
![Flask](https://img.shields.io/badge/Flask-Web%20Framework-green)
![MySQL](https://img.shields.io/badge/MySQL-Database-orange)
![License](https://img.shields.io/badge/License-MIT-blue)

## 📌 Overview

The Automobile Management System is a full-stack web application developed using Flask and MySQL that allows users to manage automobile records efficiently.

The application supports complete CRUD (Create, Read, Update and Delete) operations, vehicle search functionality, and secure database connectivity using environment variables.
---
## ✨ Features
- Add new automobile records
- Update existing vehicles
- Delete records
- Search vehicles by make
- Responsive user interface
- MySQL database integration
- Secure credential management using .env
---
## 🛠 Tech Stack
Frontend
- HTML
- CSS

Backend
- Python
- Flask

Database
- MySQL

Libraries
- mysql-connector-python
- python-dotenv

---
## 📂 Project Structure

```text
Automobile-Management-System
│
├── database
├── static
├── templates
├── app.py
├── db.py
├── requirements.txt
├── README.md
└── .gitignore
```

---

## 🚀 Installation

Clone the repository

```bash
git clone https://github.com/ShivamBaheti/Automobile-Management-System.git
```

Install dependencies

```bash
pip install -r requirements.txt
```

Create a `.env` file

```text
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=YOUR_PASSWORD
DB_NAME=automobile_db
```

Import the SQL files

```
database/schema.sql
database/sample_data.sql
```

Run

```bash
python app.py
```
## 👨‍💻 Author

**Shivam Baheti**

LinkedIn:
https://www.linkedin.com/in/shivam-baheti-630a26325

GitHub:
https://github.com/ShivamBaheti
