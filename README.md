# SpringClientDashboard
Spring MVC web application for managing clients inventory.


## Description
The application allows users to list and manage client inventory (add new ones, update existing and delete, etc.).

In the Client Dashboard there are three types of users:

1. Employee - they can register themselves and view and search exisiting client list.
2. Manager - limited number of users who can add new clients and search for existing clients. 
3. Admin - person, who can add, edit and delete clients.

## Tools & Frameworks
The application is built using Spring MVC, Spring Security, Hibernate and Maven build tool.

#### Database & configuration

- MySQL
- Tomcat
- Git
- Maven

#### Backend technologies

- Java
- Spring MVC, Spring AOP, Spring Security
- Hibernate ORM
- Hibernate Validator

#### Frontend technologies

- HTML, CSS, JavaScript
- JSP, JSTL
- Bootstrap 4

## How to run it?
Prerequisites: Eclipse IDE, Tomcat, MySQL Community Edition

1. Clone this git repository
`$ git clone https://github.com/ParardhaKumar/SpringClientDashboard`

2. Open MySQL Workbench and type following SQL scripts:
``` mysql 
CREATE DATABASE  IF NOT EXISTS `web_customer_tracker`;
USE `web_customer_tracker`;

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `customer` WRITE;

INSERT INTO `customer` VALUES 
	(1,'Arya','Stark','arya@winterfell.com'),
	(2,'Cersei','Lannister','cersei@casterlyrock.com'),
	(3,'Jim','Moriarty','moriarty@rememberme.com');

UNLOCK TABLES;
```

``` mysql 
DROP DATABASE  IF EXISTS `spring_security_demo_bcrypt`;

CREATE DATABASE  IF NOT EXISTS `spring_security_demo_bcrypt`;
USE `spring_security_demo_bcrypt`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` 
VALUES 
('sachin','{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1),
('sweta','{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1),
('koyena','{bcrypt}$2a$04$eFytJDGtjbThXa80FyOOBuFdK2IwjyWefYkMpiBEFlpBwDH.5PM0K',1);

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authorities` 
VALUES 
('sachin','ROLE_EMPLOYEE'),
('sweta','ROLE_EMPLOYEE'),
('sweta','ROLE_MANAGER'),
('koyena','ROLE_EMPLOYEE'),
('koyena','ROLE_ADMIN');

```

3. Right click project name -> Run on server

4. The application will be avaialble under URL http://localhost:8080/dashboard

## Application Snapshots (Customer Journey)

#### Home Page

![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/HomePage.png)

#### Register New User
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/Register.png)

#### Successful Registration
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/Successful%20Registration.png)

#### Login with New Registered User
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/EmployeeLogin.png)

#### Client Dashboard for user with "Employee" access
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/EmployeeUser.png)

#### Search for Client
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/SearchJack.png)

#### Search result
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/FindJack.png)

#### Manager Login
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/ManagerLogin.png)

#### Client Dashboard for user with "Manager" access
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/ManagerListing.png)

#### Form Validation while adding new Client
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/FormValidation.png)

#### Adding a New Client
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/AddUser.png)

#### Client Successfully Added
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/UserAddded.png)

#### Changes reflected in SQL Workbench
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/Workbench.png)

#### Updating an Existing Client
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/ManagerUpdate.png)

#### CLient Successfully Updated
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/UserUpdate.png)

#### Admin Login
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/AdminLogin.png)

#### Client Dashboard for user with "Admin" access
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/AdminListing.png)

#### Client Successfully Deleted
![](https://github.com/ParardhaKumar/SpringClientDashboard/blob/master/img/DeletedClient.png)
