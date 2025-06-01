"# Event_Management_System" 


This is a dynamic JSP-based web application running on Tomcat and using XAMPP's MySQL for data management. It features role-based access for **users** and **admins**, with full CRUD operations and session management.

---

## Features:

**Landing Page**  
- Two buttons: **Admin** and **User**.

**User Side**  
- Click **User** to access the main website.  
- Pages:  
  - **Home**  
  - **About Us**  
  - **Events**  
  - **Book Now**  
- **Book an Appointment** page lets users submit appointment requests.  
- Users can **login**, and sessions are managed throughout the site.

**Admin Side**  
- Admin can **login** or **signup**.  
- Upon login, admin can:  
  - **View all requests** (appointments submitted by users).  
  - **Accept or delete** any request.  
  - **View all accepted requests** and **delete events** as needed.  
  - **Manage admins** (add, edit, delete).  
  - **Add new events**.

**Session Management**  
- Sessions are maintained for both users and admins.  
- **Logout** option destroys the session.

---

## Tech Stack

- **Frontend**: JSP, HTML, CSS, JavaScript  
- **Backend**: JSP, Servlets, Java  
- **Server**: Apache Tomcat  
- **Database**: MySQL (managed via XAMPP)  
- **Version Control**: Git & GitHub

---

## Setup

1️⃣ Install and configure:  
- [Java JDK 17+](https://adoptopenjdk.net/)  
- [Apache Tomcat](https://tomcat.apache.org/)  
- [XAMPP](https://www.apachefriends.org/) for MySQL

2️⃣ Import the project into **Eclipse** (File → Import → Existing Projects).  
3️⃣ Update database credentials in your JSP/Servlet files (if needed).  
4️⃣ Start **Tomcat** and **MySQL** via XAMPP.  
5️⃣ Deploy the project on Tomcat and access it via `http://localhost:8080/<project-name>`.

---

## Project Workflow

1️⃣ **User** can browse the site and book appointments.  
2️⃣ **Admin** manages:  
- Appointments  
- Events  
- Other admins  
3️⃣ **Sessions** ensure secure user and admin activities.  
4️⃣ **Logout** safely ends the session.

---

## 🤝 Contributing

Pull requests and suggestions are welcome! Let’s make this project even better.

---

## License

This project is open-source and available for learning and educational purposes.

---
