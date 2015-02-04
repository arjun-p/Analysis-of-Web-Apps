Feature: A search for a term returns a correct result. 

Scenario: Search for a term and check if the result returned is correct
	Given user is on "Default" page
	When user searches for a  "Web Databa" book present in the database
	Then user should see the "Web Database Development : Step by Step" book details
	And item returned is "1"

