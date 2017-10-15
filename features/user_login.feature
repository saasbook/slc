Feature: a user registers an account or logs in to their existing account
  
  As a student
  So that I can get a tutor or sign up to be a tutor
  I want to log in and register

Background: no accounts have been made


Scenario: log in to system before making an account
  When I go to the login page
  And  I fill in "Username" with "connorvotroubek@berkeley.edu"
  And  I fill in "Password" with "gobears"
  And  I press "Login"
  Then I should see "No account for that email. Do you want to register an account?"
  And I should press "Register"

Scenario: register a new account as a tutor
  When  I am on the register account page
  And   I fill in "Username" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I fill in "Confirm Password" with "gobears"
  And   I select "Tutor" for "Role"
  And  I should press "Submit"
  Then  I should be on the home page

Scenario: register a new account as a tutee
  When  I am on the register account page
  And   I fill in "Username" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I fill in "Confirm Password" with "gobears"
  And   I select "Tutee" for "Role"
  And   I press "Submit"
  Then  I should be on the home page
  
Scenario: register a new account as an admin
  When  I am on the register account page
  And   I fill in "Username" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I fill in "Confirm Password" with "gobears"
  And   I select "Admin" for "Role"
  Then  I press "Submit"
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
  
Scenario: redirect to tutor form
  When I am on the home page
  And I select "Tutor Sign-Up"
  Then I should be redirected to the tutor form
  
Scenario: redirect to tutee form
  When I am on the home page
  And I select "Tutee Sign-Up"
  Then I should be redirected to the tutee form

Scenario: redirect to room availability page
  When I am on the home page
  And I select "Room Reservation"
  Then I should be redirected to the room reservation form
  
  