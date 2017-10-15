Feature: tutees can find 
  
  As a tutee
  So that I can get a tutor
  I want to find a tutor

Background: tutors are in the system and a user would like to find one

  Given there are the following tutors in the system: 
    | Juno Morey | Computer Science | Senior | [CS61A, CS61B, CS61C] | Monday, Wednesday, Friday |
    | James Truitt | Mechanical Engineering | Senior | [MECHENG100, MECHENG150, EE16A] | Tuesday, Thursday |
    | Lexie Polevoi | Economics | Sophomore | [ECON100A, ECON1, ECON100B] | Monday, Wednesday, Thursday | 

Scenario: tutor fills in form information
  When I go to the "Sign Up As A Tutor" page
  And I fill in "Name" with "John Doe"
  And I fill in "Tutor Cohort" with "1"
  And I fill in "Email" with "jdoe@berkeley.edu"
  And I fill in "SID" with "1234"
  And I fill in "Phone Number" with "123-456-7890"
  And I fill in "Class Standing" with "Junior"
  And I fill in "Major" with "Physics"
  And I select the following time availabilities:
    | Monday  | 1 |
    | Tuesday | 1 |
  And I press "Submit"
  Then I should see a confirmation message
  


Scenario: tutee finds tutor of class he wants help in
  When I go to the "Sign Up As A Tutee" page
  And I fill in "Name" with "Jane Doe
  And I fill in "Email" with "jdoe@berkeley.edu"
  And I fill in "SID" with "1234"
  And I fill in "Phone Number" with "123-456-7890"
  And I fill in "Course Requesting Help In" with "CS61A"
  And I select the following time availabilities:
    | Monday  | 1 |
  And I select "Yes" for "DSP Student"
  And I press "Submit"
  Then I should see a message that I completed the form
  And I should see a list of tutors

Scenario: tutee selects a tutor and sets a time 
  When  I see a list of tutors
  And   I select "Juno Morey"
  Then  I should see "Monday, Wednesday, Friday" in available times
  Then  I select "Monday" 
  And   I select "Confirm"
  Then  I should be on the home page

Scenario: student sees current tutor and time under reservations
  Given: I reserved "Juno Morey" on "Monday"
  And   I am on the home page
  And   I press "My Reservations"
  Then  I should see "Juno Morey" under "Tutors"
  And   I should see "Monday" under "Session Time"