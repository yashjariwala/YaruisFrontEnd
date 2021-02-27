# E-Commerce Website 

This is an E-commerce project which is divided in two parts FrontEnd and BackEnd.

It has role based access mechanism i.e ROLE_USER and ROLE_ADMIN

ROLE_USER is the user login and can do the basic shopping part 

Whereas 

ROLE_ADMIN is the Admin and can do the CRUD (adding , updating and deleting) of Categories,Supplier and Products.

Tables are auto created. If tables not created change the "update" keyword to "create" once the tables are created change it to update again. 

It is secured using Spring Security which suffices all the need of security of a modern website.

Admin is not allowed to shop. For shopping purpose an user account must be added.

Mail is also sent once an user is registered.


## Prerequisites
- JDK 1.8
- Any web server supporting servlets (used: Apache Tomcat Server)
- Apache Maven 
- H2 database 
- Modern Web Browser (Used: Chrome)

## GitHub Links 
- EcommerceFrontEnd <https://github.com/yashjariwala/YarishFrontEnd>
- EcommerceBackEnd <https://github.com/yashjariwala/YarishBackEnd>

## Technologies used 
- Spring framework
- Hibernate ORM tool
- Angular JS
- Bootstrap 
- HTML 
- CSS 

## Properties-front end 
- In Deployment assembly add Maven Dependencies.
- In Java Build Path point it to the JDK on the system.
- In Java Compiler set it to JDK 1.8.
- In project facets set java to 1.8 and in Runtime tab select your server.
 	

## Properties-Back end 
- In Java Build Path point it to the JDK on the system.
- In Java Compiler set it to JDK 1.8.
- In project facets set java to 1.8.

## Configuration

- Import both the projects
	YarishFrontEnd
	yarishBackEnd

- For both the projects Run 
	Maven Clean	
	Maven Install
And Update both maven projects. 

- Set properties

- Properties--> web deployment assembly-->add java build path entries --> Maven

- To set Roles and register users, in UserDAOImpl in save method 
	To register user as admin update the following line as follows:"user.setUserrole("ROLE_ADMIN")"
	To register user as a customer update the following line as follows:"user.setUserrole("ROLE_USER")"
	
- Run The project and run on server. 	

- Once registered as Admin then login, add category and supplier and then add product.

- Before adding a product check paths in productaddcontroller.java for images of products and refresh the images folder after adding products otherwise the image wont load.  

- Once added the products users are ready to shop.

- Change the url of image in Email.java so that header image goes while sending the mail.


### Important!- Once a product is added you need to refresh the images folder in the IDE for it to show images on the web-browser.

## Changelog as of 27-02-2021

-Under the hood improvements.

-Got the project working with the new h2 version.

## Upcoming Ideas! (Not surely coming!)

- Change carousel images to be added to admin login.

- Password and confirm password boxes coming soon with stronger password implementation.

- Showing of all orders in the Admin account and showing my orders after login of individual accounts.

- Redesign of the table on the products page showing all projects. 


## Project made by Yash Jariwala 

## Due to some laptop and Git hub account issues a new repository has been created!


	

