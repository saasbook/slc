Feature: tutees can find 
  
  As a tutee
  So that I can get a tutor
  I want to find a tutor

Background: tutors are in the system and a user would like to find one

  # Given there are the following tutors in the system: 
  #   | Juno Morey | Computer Science | Senior | [CS61A, CS61B, CS61C] | Monday, Wednesday, Friday |
  #   | James Truitt | Mechanical Engineering | Senior | [MECHENG100, MECHENG150, EE16A] | Tuesday, Thursday |
  #   | Lexie Polevoi | Economics | Sophomore | [ECON100A, ECON1, ECON100B] | Monday, Wednesday, Thursday | 

#Lexie, User Story 2 
@tutor_form_complete
Scenario: tutor fills in information
  When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  #And I fill in "tutor[requested_class]" with "CS61A"
  #And I fill in "tutor[semesters_at_cal]" with "4"
  And I fill in "tutor[tutor_cohort]" with "Computer Science"
  And I fill in "tutor[bio]" with "Yes"
  And I press "Submit"
  Then I should be on Tutor Submitted Form for User 1
  
#Lexie, User Story 1
@tutee_form_complete
Scenario: tutee fills in information
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[email]" with "jdoe@berkeley.edu"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I fill in "tutee[in_dsp]" with "Yes"
  And I press "Submit"
  Then I should be on Tutee Submitted Form for User 1

#Lexie, User Story 1  
@tutee_form_no_first_name
Scenario: tutee fills in information but lacks first name 
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[email]" with "jdoe@berkeley.edu"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I fill in "tutee[in_dsp]" with "Yes"
  Then I should not see "Thank you for submitting a tutor form request!"
  
#Lexie, User Story 1  
@tutee_form_no_last_name
Scenario: tutee fills in information but lacks first name 
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[email]" with "jdoe@berkeley.edu"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I fill in "tutee[in_dsp]" with "Yes"
  Then I should not see "Thank you for submitting a tutor form request!"
  
#Lexie, User Story 1 
@tutee_form_routing
Scenario: routing is correct
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[email]" with "jdoe@berkeley.edu"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I fill in "tutee[in_dsp]" with "Yes"
  And I press "Submit"
  Then I should be on Tutee Submitted Form for User 1
  And I follow "Back to Home"
  Then I should be on the home page

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