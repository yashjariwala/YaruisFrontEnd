# E-Commerce Website 

This is an E-commerce project which is divided in two parts FrontEnd and BackEnd.

It has role based access mechanism I.E ROLE_USER and ROLE_ADMIN

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
- EcommerceFrontEnd <https://github.com/yashjariwala/YaruisFrontEnd>
- EcommerceBackEnd <https://github.com/yashjariwala/YaruisBackEnd>

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
	EcommerceFrontEnd
	EcommerceBackEnd

- For both the projects Run 
	Maven Clean	
	Maven Install
And Update both maven projects. 

- Set properties

- To set Roles and register users, in UserDAOImpl in save method 
	To register user as admin update the following line as follows:"user.setUserrole("ROLE_ADMIN")"
	To register user as a customer update the following line as follows:"user.setUserrole("ROLE_USER")"
	
- Run The project and run on server. 	

- Once registered as Admin then login, add category and supplier and then add product.

- Once added the products users are ready to shop.

### Important!- Once a product is added you need to refresh the images folder in the IDE for it to show images on the web-browser.

## Changelog as of 04-09-2017

-  Show or hide password on login and sign up page.

- Added My account Page to view account details!

- Updated dependencies 

- Made CSS changes making some visual refinements.  

- Added 404 page

- Added Title bar icons. 

- On the Sign up page added a check box which lets you have the same Billing address as Shipping address.

- Sign up page edited and made as Multi Step form page for a cleaner look.

- The recommended products on the single product page displays automatically without pressing a button.

- In the list of products page it is possible to sort by name or price.

- The recommended products does not show the same product in the list as to the product on the single product page.

## Known Problems 

- Trying to add edit options to the My Account page so details can be changed or removed..(Working on it and will be added to next commit)

- Bootstrap related design problems in header and some pages.(will be solved soon) 

## Project made by Yash Jariwala 

## Due to some laptop and Git hub account issues a new repository has been created!


	

