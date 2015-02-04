Feature: Delete items from the cart

Scenario: The user delete items from shopping cart
Given "admin" sees the "ShoppingCart" page
When "admin" click the xpath of "Details"
And "admin" click the "Delete" button
And "admin" visits the "ShoppingCart" page
And "admin" click the xpath of "Details"
And "admin" click the "Delete" button
Then "admin" should not see the "1001 Web Site Construction Tips and Tricks" content
And "admin" should not see the "Beginning Active Server Pages 3.0" content
