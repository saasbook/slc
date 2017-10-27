Feature: a user registers an account or logs in to their existing account
  
  As a student
  So that I can get a tutor or sign up to be a tutor
  I want to log in and register

Background: no accounts have been made

@log_in_before_account
Scenario: log in to system before making an account
  When I go to the tutee login page
  And  I fill in "Email" with "connorvotroubek@berkeley.edu"
  And  I fill in "Password" with "gobears"
  And  I press "Log in"
  Then  I should be on the tutee login page

@register_tutee
Scenario: register a new account as a tutee
  When  I am on the tutee registration page
  And   I fill in "Email" with "j.morey@berkeley.edu"
  And   I fill in "Password" with "gooobears"
  And   I fill in "Password confirmation" with "gooobears"
  And   I press "Sign up"
  Then  I should be on the home page

@register_tutor
Scenario: register a new account as a tutee
  When  I am on the tutor registration page
  And   I fill in "Email" with "connorvotroubek@berkeley.edu"
  And   I fill in "Password" with "gobears"
  And   I fill in "Password confirmation" with "gobears"
  And   I press "Sign up"
  Then  I should be on the home page
 
@log_in_tutee 
Scenario: log in to system as tutee
  Given I am on the tutee sign in page
  And   The tutee "tutee1@example.com" with the password "tutee1" exists
  And   I fill in "Email" with "tutee1@example.com"
  And   I fill in "Password" with "tutee1"
  And   I press "Log in"
  Then  I should be on the home page
  
@log_in_tutor 
Scenario: log in to system as tutor
  When  I am on the tutor sign in page
  And   The tutor "tutor2@example.com" with the password "tutor2" exists
  And   I fill in "Email" with "tutor2@example.com"
  And   I fill in "Password" with "tutor2"
  And   I press "Log in"
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

