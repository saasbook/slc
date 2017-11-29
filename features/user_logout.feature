Feature: a user who has logged in wants to sign out of their account

  As a student
  So that I can leave the tutoring platform
  I want to log out
  
#152226905 (Pivotal Tracker ID)  
@log_out_tutor 
Scenario: log out of system as tutor
  When I am on the tutor sign in page
  And   The tutor "tutor2@example.com" with the password "tutor2" exists
  And   I fill in "Email" with "tutor2@example.com"
  And   I fill in "Password" with "tutor2"
  And   I press "Log in"
  Then  I should be on the tutee match page for User 5
  And I follow "Logout"
  Then I should be on the home page

#152226905 (Pivotal Tracker ID)  
@log_out_tutee
Scenario: log out of system as tutee
  When  I am on the tutee sign in page
  And   The tutee "tutee1@example.com" with the password "tutee1" exists
  And   I fill in "Email" with "tutee1@example.com"
  And   I fill in "Password" with "tutee1"
  And   I press "Log in"
  Then  I should be on the tutor match page for User 5
  And I follow "Logout"
  Then I should be on the home page

#152738729 (Pivotal Tracker ID)
@log_out_admin 
Scenario: log in to system as admin
  When  I am on the admin sign in page
  And   The admin "admin1@example.com" with the password "admin1" exists
  And   I fill in "Email" with "admin1@example.com"
  And   I fill in "Password" with "admin1"
  And   I press "Log in" 
  Then  I should be on the admin show page for 1
  And   I press "Logout"
  Then  I should be on the home page