Feature: a user registers an account or logs in to their existing account
  
  As a student
  So that I can get a tutor or sign up to be a tutor
  I want to log in and select my tutor 

Background: no accounts have been made


Scenario: log in to system before making an account
  When I go to the login page
  And  I fill in "Username" with "connorvotroubek@berkeley.edu"
  And  I fill in "Password" with "gobears"
  And  I press "Login"
  Then I should see "No account for that email. Do you want to register an account?"

Scenario: register a new account as a tutor
  When  I go to the login page
  And   I press "Register account"
  And   I fill in "Username" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I fill in "Confirm Password" with "gobears"
  And   I select "Tutor" for "Role"
  Then  I press "Register"
  Then  I should be on the home page

Scenario: register a new account as a tutee
  When  I go to the login page
  And   I press "Register account"
  And   I fill in "Username" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I fill in "Confirm Password" with "gobears"
  And   I select "Tutee" for "Role"
  Then  I press "Register"
  Then  I should be on the home page
  
Scenario: register a new account as a tutee
  When  I go to the login page
  And   I press "Register account"
  And   I fill in "Username" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I fill in "Confirm Password" with "gobears"
  And   I select "Admin" for "Role"
  Then  I press "Register"
  Then  I should be on the home page
 
Scenario: log in to system as tutee
  When  I go to the login page
  And   I fill in "Username" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I press "Login"
  Then  I should be on the home page
 
 Scenario: log in to system as tutor
  When  I go to the login page
  And   I fill in "Username" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I press "Login"
  Then  I should be on the home page
  
Scenario: log in to system as admin
  When  I go to the login page
  And   I fill in "Username" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I press "Login"
  Then  I should be on the home page
  
  