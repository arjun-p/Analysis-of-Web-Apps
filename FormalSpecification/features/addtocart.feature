Feature: User should be able to add items to cart

Background: The application has a login page and the user has not logged in
	Given "guest" sees the "Login" page
	Then "guest" should see the "Login" button

	Given "guest" is logged in as guest
	Then user should see the "ShoppingCart" page

Scenario: Once logged in, user should be able to add items to the cart. 
	Given user is on "Default" page
	When user clicks on book "1" 
	And  clicks "Add to Shopping Cart"
	Then user should see the "Web Database Development : Step by Step" in ShoppingCart page

Scenario: Once logged in, user should be able to add items to the cart. 
	Given user is on "Default" page
	When user clicks on book "2" 
	And  clicks "Add to Shopping Cart" 
	Then user should see the "Programming Perl (3rd Edition)" in ShoppingCart page

Scenario: Empty Cart
	Given user is on "ShoppingCart" page
	When user clicks on book "2" 
	And  clicks "Add to Shopping Cart" 
	Then user should see the "Programming Perl (3rd Edition)" in ShoppingCart page

