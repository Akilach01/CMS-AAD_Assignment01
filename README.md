# Complaint Management System (CMS)

A web-based internal system for handling employee and administrative complaints. Built with Jakarta EE, JSP, Servlets, HTML, CSS, and MySQL, following the MVC architecture. This prototype facilitates secure complaint submission, management, and resolution workflows.

---

## 📌 Project Overview

The **Complaint Management System (CMS)** allows:
- **Employees** to register, log in, submit, view, edit, or delete their complaints.
- **Admins** to view all complaints, update statuses, add remarks, and delete complaints.

**Key Features:**
- Role-based access control (Admin / Employee)
- Synchronous form-based complaint submission
- Session-based login authentication
- CRUD operations on complaints
- JDBC with connection pooling (Apache Commons DBCP)

---

## ⚙️ Setup & Configuration Guide

### 1. 📦 Prerequisites
- Java 11 or above
- Apache Tomcat 9 or 10
- IntelliJ IDEA (or any IDE)
- Maven
- MySQL Server

---
### 2. 🧩 Project Setup

#### Clone the project:
```bash
git clone https://github.com/YourUsername/CMS-Project.git

3. 🚀 Run the Project
Configure Tomcat in IntelliJ (Run → Edit Configurations → + → Tomcat Server)
Add cms-project:war exploded as artifact
Run the server and open:

bash
http://localhost:8080/cms/

💻 Technologies Used
Layer	Technology
View	JSP, HTML5, CSS3, JavaScript
Controller	Jakarta EE (Servlets)
Model	JavaBeans, DAO Pattern
Database	MySQL
Others	Apache Commons DBCP, JDBC
Deployment	Apache Tomcat 9
Build Tool	Maven

📁 Structured Source Code Layout
cms-project/
├── src/
│   └── main/
│       ├── java/
│       │   ├── controller/      → All Servlets (Login, Register, Complaint)
│       │   ├── dto/             → Database access layer (DB operations)
│       │   ├── model/           → JavaBeans (User, Complaint classes)
│       │   └── util/            → DBConnectionPool, etc.
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml      → Servlet mapping
│           ├── css/             → Stylesheets
│           ├── js/              → Form validation scripts
│           └── *.jsp            → Views (login.jsp, dashboard.jsp, etc.)
├── pom.xml                      → Maven configuration
└── README.md

👤 Author
Akila Chamara 🎓 Undergraduate – Software Engineering


