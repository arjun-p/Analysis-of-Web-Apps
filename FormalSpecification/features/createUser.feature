Feature: Create New User and be able to login with that account

Background: The application has a login page and the user has not logged in
	Given "admin" sees the "Login" page
	Then "admin" should see the "Login" button

Scenario: The user fills the registration page
	Given user is on "Registration" page
	When user "fills" the registration page 
	Then user should see a "Default" page

Scenario: The user can log in
	Given user sees the "Login" page
	When "arjunp" logs in
	Then user should see the "ShoppingCart" page

