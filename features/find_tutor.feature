Feature: tutees can find 
  
  As a tutee
  So that I can get a tutor
  I want to find a tutor

Background: tutors are in the system and a user would like to find one

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
  And I fill in "tutor[tutor_cohort]" with "Computer Science"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Submitted Form for User 1

#Lexie, User Story 2 
@tutor_form_no_first_name
Scenario: tutor fills in information but lacks first name 
  When I go to Tutor Information Form for User 1
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[tutor_cohort]" with "Computer Science"
  And I fill in "tutor[bio]" with "Info"
  Then I should not see "Thank you for submitting a tutee form request!"
  
#Lexie, User Story 2 
@tutor_form_no_last_name
Scenario: tutor fills in information but lacks first name 
 When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[tutor_cohort]" with "Computer Science"
  And I fill in "tutor[bio]" with "Info"
  Then I should not see "Thank you for submitting a tutee form request!"
  
#Lexie, User Story 2 
@tutor_form_routing
Scenario: routing is correct for tutor form
  When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[tutor_cohort]" with "Computer Science"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Submitted Form for User 1
  And I follow "Back to Home"
  Then I should be on the home page  
  
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
Scenario: routing is correct for tutee form
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
  

# Given following tutees are in the system: 
#   | tutee1_firstname tutee1_lastname | tutee1@gmail.com | [Monday 8am, Monday 3pm] |
#   | tutee2_firstname tutee2_lastname | tutee2@gmail.com | [Monday 8am] |
#   | tutee3_firstname tutee3_lastname | tutee3@gmail.com | [Monday 8am] |
#   | tutee4_firstname tutee4_lastname | tutee4@gmail.com | [Monday 9am, Monday 3pm, Wednesday 2pm] |

# Given following tutors are in the system: 
#   | tutor1_firstname tutor1_lastname | tutor1@gmail.com | [Monday 8am, Monday 9am] |
#   | tutor2_firstname tutor2_lastname | tutor2@gmail.com | [Monday 3pm, Monday 4pm] |
#   | tutor3_firstname tutor3_lastname | tutor3@gmail.com | [Monday 8am, Wednesday 1pm, Wednesday 2pm] |
#   | tutor4_firstname tutor4_lastname | tutor4@gmail.com | [Wednesday 1pm, Wednesday 2pm, Thursday 10am] |

#Dhruv, User Story 1
@tutee_view_tutor
Scenario: tutee can view the tutor
  #There are 4 pre-existing tutees and tutors in the database
  Given  I have been assigned "tutor5_firstname" "tutor5_lastname" as tutor
  When   I am on the tutor match page for tutee 5
  Then   I should see "tutor5_firstname"
  And    I should see "tutor5_lastname"

#Dhruv, User Story 2
@tutor_single_tutee_match
Scenario: tutee can match with correct tutor
  Given  Tutee 1 has been matched with its Tutor
  And    I am on the tutor match page for tutee 1
  Then   I should see "tutor1_firstname"
  And    I should see "tutor1_lastname"
  
#Dhruv, User Story 3 
@tutor_teaching_load
Scenario: tutor with the least existing students is matched
  Given  Tutee 1 has been matched with its Tutor
  And    Tutee 2 has been matched with its Tutor
  When   I am on the tutor match page for tutee 2
  Then   I should see "tutor3_firstname"
  And    I should see "tutor3_lastname"

#Dhruv, User Story 3
@tutor_accept_multiple_tutees
Scenario: tutor can have multiple tutees
  Given  Tutee 1 has been matched with its Tutor
  And    Tutee 2 has been matched with its Tutor
  And    Tutee 3 has been matched with its Tutor
  When   I am on the tutor match page for tutee 3
  Then   I should see "tutor1_firstname"
  And    I should see "tutor1_lastname"
  
#Dhruv, User Story 4
@tutor_view_single_tutee
Scenario: tutor can view a single correctly matched tutee
  Given  Tutee 1 has been matched with its Tutor
  And    Tutee 2 has been matched with its Tutor
  And    Tutee 3 has been matched with its Tutor
  When   I am on the tutee match page for tutor 3
  Then   I should see "tutee2_firstname"
  And    I should see "tutee2_lastname"

#Dhruv, User Story 5
@tutor_view_multiple_tutees
Scenario: tutor can view mutiple correctly matched tutees
  Given  Tutee 1 has been matched with its Tutor
  And    Tutee 2 has been matched with its Tutor
  And    Tutee 3 has been matched with its Tutor
  When   I am on the tutee match page for tutor 1
  Then   I should see "tutee1_firstname"
  And    I should see "tutee1_lastname"
  And    I should see "tutee1_firstname"
  And    I should see "tutee3_lastname"
