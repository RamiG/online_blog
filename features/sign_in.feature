Feature: Sign in

Scenario: Successful signin
Given a user visits signin page
And user is registered
When user enters valid information 
Then user should see start page
And should see signout link
And should see settings link

Scenario: Unsuccessful signin
Given a user visits signin page
When user enters invalid information
Then user should see signin page
And should not have profile link