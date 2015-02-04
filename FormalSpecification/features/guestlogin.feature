Feature: Guest user should not be able to access admin menu 

Background: The application has a login page and the user has not logged in
	Given "guest" sees the "Login" page
	Then "guest" should see the "Login" button

Scenario: Guest user logs in and then clicks on Administration.
	Given "guest" is logged in as guest
	When user clicks "AdminMenu"
	Then user should not see "Administration Menu" page

