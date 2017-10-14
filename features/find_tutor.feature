Feature: tutees can find 
  
  As a tutee
  So that I can get a tutor
  I want to find a tutor

Background: tutors are in the system and a user would like to find one

  Given there are the following tutors in the system: 
    | Juno Morey | Computer Science | Senior | [CS61A, CS61B, CS61C] | Monday, Wednesday, Friday |
    | James Truitt | Mechanical Engineering | Senior | [MECHENG100, MECHENG150, EE16A] | Tuesday, Thursday |
    | Lexie Polevoi | Economics | Sophomore | [ECON100A, ECON1, ECON100B] | Monday, Wednesday, Thursday | 

Scenario: tutee finds tutor of class he wants help in
  When I go to the "Find Tutor" page
  And  I fill in "Class" with "CS61A"
  And  I fill in "Major" with "Computer Science"
  And  I select "Freshmen" for "Year"
  And  I press "Find Tutor"
  Then I should see a list of tutors

Scenario: tutee selects a tutor and sets a time 
  When  I see a list of tutors
  And   I select "Juno Morey"
  Then  I should see "Monday, Wednesday, Friday" in available times
  Then  I select "Monday" 
  And   I fill in "Confirm"
  And   I select "Tutor" for "Role"
  Then  I press "Register"
  Then  I should be on the home page

Scenario: student sees current tutor and time under reservations
  Given: I reserved "Juno Morey" on "Monday"
  And   I am on the home page
  And   I press "My Reservations"
  Then  I should see "Juno Morey" under "Tutors"
  And   I should see "Monday" under "Session Time"