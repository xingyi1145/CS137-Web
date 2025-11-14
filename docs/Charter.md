# **Project Charter — Waterloo CS Assignment Hub**

## **1. Project Title**

**Waterloo CS Assignment Hub (WCAH)**

---

## **2. Project Overview**

The Waterloo CS Assignment Hub is a web platform designed to help students explore, solve, and share solutions to assignment-style programming problems from University of Waterloo CS courses. Inspired by platforms like LeetCode, this system enables students to practice coding, compare approaches, and learn collaboratively. Professors can publish courses, assignments, and questions, while students can submit solutions and engage with peers through likes and comments.

The platform aims to become a centralized, interactive repository for Waterloo-style programming questions, supporting learning, collaboration, and practice.

---

## **3. Project Goals & Objectives**

### **Primary Goals**

* Provide a clean and interactive website that hosts course-specific assignment questions.
* Allow students to log in, upload solutions, run testcases, and view peer approaches.
* Allow professors to create and manage courses, assignments, and questions.
* Encourage collaborative learning via solution ranking, likes, and comments.

### **Secondary Goals**

* Build an extensible backend that mirrors real platforms like LeetCode.
* Create a modern, scalable full-stack project suitable for portfolio use.
* Allow integration with future features (auto-grading, analytics dashboards, badges).

---

## **4. Scope**

### **In Scope**

* User authentication system (username + password).
* User roles: **Student** and **Professor**.
* Course system with enrollments.
* Assignments and question management.
* Uploading and storing code solutions.
* Likes, comments, ranking functionality for solutions.
* Testcase execution (basic sandbox or mock execution).
* Clean, intuitive UI for browsing problems and solutions.

### **Out of Scope (for now)**

* True code execution sandbox (e.g., Docker sandbox, security isolation).
* Integration with official Waterloo systems (LEARN, Marmoset, CS servers).
* Mobile application.
* AI-generated hints or solutions.

---

## **5. Stakeholders**

| Role                | Description                                                 |
| ------------------- | ----------------------------------------------------------- |
| **Student Users**   | Browse questions, upload solutions, engage with others.     |
| **Professor Users** | Create courses, assignments, and questions. Manage content. |
| **Developer (You)** | Builds and maintains the platform.                          |

---

## **6. System Overview / High-Level Features**

### **User Class**

Attributes:

* `username`
* `passwordHash`
* `identity` (student / professor)
* `enrolledCourses` (list of course IDs)

Functionality:

* Students: read problems, view solutions, upload code.
* Professors: all student features **+** create courses/assignments/questions.

---

### **Course**

Attributes:

* `courseId`
* `courseName`
* `assignments` (list of assignment IDs)

Features:

* Professors create and manage.
* Students enroll and access content.

---

### **Assignment**

Attributes:

* `assignmentName`
* `questions` (list of question IDs)

---

### **Question**

Attributes:

* `questionId`
* `description`
* `testcases` (input/output)
* `solutions` (list of solution IDs)

---

### **Solution**

Attributes:

* `code`
* `submitter` (User reference)
* `likes`
* `comments`
* `rank` (based on likes or judge metrics)
* `tests` (testcase results)

Features:

* Like and comment
* Ranking leaderboard

---

## **7. Technical Approach**

### **Frontend**

* React / Next.js
* Tailwind or Material UI
* Dynamic pages for courses, assignments, problems, and solution viewing

### **Backend**

* Node.js / Express OR Django / Python
* REST or GraphQL API
* Authentication (JWT)

### **Database**

* PostgreSQL or MongoDB
* ORM: Prisma / Mongoose / SQLAlchemy

### **Deployment**

* Vercel or Netlify (frontend)
* Render/Railway/Heroku (backend)
* Supabase or Planetscale (database)

Future infrastructure: Docker microservices, sandboxed code execution.

---

## **8. Risks & Constraints**

| Risk                                | Mitigation                                                     |
| ----------------------------------- | -------------------------------------------------------------- |
| Academic integrity concerns         | Host only *original* questions or publicly available problems. |
| Security of code execution          | Use mocked testcases first; expand to isolated sandbox later.  |
| Feature creep                       | Prioritize core features first.                                |
| User authentication vulnerabilities | Follow modern secure authentication practices.                 |

---

## **9. Timeline (High-Level)**

| Phase                                    | Duration  | Deliverables                        |
| ---------------------------------------- | --------- | ----------------------------------- |
| **1. Planning & Design**                 | 1–2 weeks | System design, schemas, UI mockups  |
| **2. Authentication + User Roles**       | 1–2 weeks | Login, signup, role-based behaviour |
| **3. Course/Assignment/Question System** | 2–3 weeks | CRUD + browse UI                    |
| **4. Solution Uploading + Viewing**      | 2–3 weeks | Code submission, likes/comments     |
| **5. Testcase Execution (Mock)**         | 1 week    | Basic evaluation & feedback flow    |
| **6. Deployment + Polishing**            | Ongoing   | Hosted version + documentation      |

---

## **10. Success Criteria**

* Users can sign up and log in securely.
* Professors can create courses and assignments.
* Students can browse questions and upload solutions.
* Solutions can be liked, commented, and ranked.
* The site is responsive, stable, and intuitive.
* The project demonstrates full-stack engineering skills suitable for co-op/job applications.