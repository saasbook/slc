Feature: tutees can find 
  
  As a tutee
  So that I can get a tutor
  I want to find a tutor

Background: tutors are in the system and a user would like to find one

#Lexie, User Story 2 
#151891035 (Pivotal Tracker ID)
@tutor_form_complete
Scenario: tutor fills in information
  When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with "5"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Submitted Form for User 1

#Lexie, User Story 2 
#151891035 (Pivotal Tracker ID)
@tutor_form_no_first_name
Scenario: tutor fills in information but lacks first name 
  When I go to Tutor Information Form for User 1
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with "5"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Information Form for User 1
  
#Lexie, User Story 2 
#151891035 (Pivotal Tracker ID)
@tutor_form_no_last_name
Scenario: tutor fills in information but lacks first name 
 When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with "5"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Information Form for User 1
  
#153029627 (Pivotal Tracker ID)  
@tutor_form_no_sid
Scenario: tutor fills in information but lacks sid
 When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with "5"
  And I fill in "tutor[bio]" with "Info"
  And I fill in "tutor[sid]" with ""
  And I press "Submit"
  Then I should be on Tutor Information Form for User 1

#153029627 (Pivotal Tracker ID)  
@tutor_form_no_year
Scenario: tutor fills in information but lacks year
 When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with ""
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with "5"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Information Form for User 1  
  
#153029627 (Pivotal Tracker ID)  
@tutor_form_no_phone
Scenario: tutor fills in information but lacks phone
 When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with ""
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with "5"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Information Form for User 1

#153029627 (Pivotal Tracker ID)  
@tutor_form_no_major
Scenario: tutor fills in information but lacks major
 When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[major]" with ""
  And I fill in "tutor[tutor_cohort]" with "5"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Information Form for User 1    

#153029627 (Pivotal Tracker ID)  
@tutor_form_no_tutor_cohort
Scenario: tutor fills in information but lacks tutor cohort
 When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with ""
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Information Form for User 1     

#153029627 (Pivotal Tracker ID)   
@tutor_form_bio
Scenario: tutor fills in information but lacks bio
 When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with "5"
  And I fill in "tutor[bio]" with ""
  And I press "Submit"
  Then I should be on Tutor Information Form for User 1       

#Currently failing
#153029627 (Pivotal Tracker ID)    
#For some reason requires that I make email an empty string and not just get rid of it
@tutor_form_no_email
Scenario: tutor fills in information but lacks email
  When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[email]" with ""
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with "5"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Information Form for User 1 
  
#Lexie, User Story 2 
#152226966 (Pivotal Tracker ID)
@tutor_form_routing
Scenario: routing is correct for tutor form
  When I go to Tutor Information Form for User 1
  And I fill in "tutor[first_name]" with "Jane"
  And I fill in "tutor[last_name]" with "Doe"
  And I fill in "tutor[email]" with "jdoe@berkeley.edu"
  And I fill in "tutor[sid]" with "1234"
  And I fill in "tutor[phone_number]" with "123-456-7890"
  And I fill in "tutor[year]" with "Sophomore"
  And I fill in "tutor[major]" with "Computer Science"
  And I fill in "tutor[tutor_cohort]" with "Computer Science"
  And I fill in "tutor[bio]" with "Info"
  And I press "Submit"
  Then I should be on Tutor Submitted Form for User 1
  And I follow "Back to Home"
  Then I should be on the home page  
  
#Lexie, User Story 1
#151891035 (Pivotal Tracker ID)
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
  And I press "Submit"
  Then I should be on Tutee Submitted Form for User 1

#Lexie, User Story 1 
#151891035 (Pivotal Tracker ID)
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
  And I press "Submit"
  Then I should be on Tutee Information Form for User 1
  
#Lexie, User Story 1  
#151891035 (Pivotal Tracker ID)
@tutee_form_no_last_name
Scenario: tutee fills in information but lacks last name 
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[email]" with "jdoe@berkeley.edu"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I press "Submit"
  Then I should be on Tutee Information Form for User 1

#153029627 (Pivotal Tracker ID)  
@tutee_form_no_sid
Scenario: tutee fills in information but lacks sid
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[email]" with "jdoe@berkeley.edu"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I press "Submit"
  Then I should be on Tutee Information Form for User 1  
  
#153029627 (Pivotal Tracker ID)  
@tutee_form_no_grade
Scenario: tutee fills in information but lacks grade
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[email]" with "jdoe@berkeley.edu"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I press "Submit"
  Then I should be on Tutee Information Form for User 1    
  
#153029627 (Pivotal Tracker ID)  
@tutee_form_no_email
Scenario: tutee fills in information but lacks email
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I press "Submit"
  Then I should be on Tutee Information Form for User 1  
  
#153029627 (Pivotal Tracker ID)  
@tutee_form_no_phone
Scenario: tutee fills in information but lacks phone number
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I press "Submit"
  Then I should be on Tutee Information Form for User 1    

#153029627 (Pivotal Tracker ID)  
@tutee_form_no_semesters
Scenario: tutee fills in information but lacks semester number
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[major]" with "Computer Science"
  And I press "Submit"
  Then I should be on Tutee Information Form for User 1    
  
#153029627 (Pivotal Tracker ID)  
@tutee_form_no_major
Scenario: tutee fills in information but lacks major
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[requested_class]" with "CS61A"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I press "Submit"
  Then I should be on Tutee Information Form for User 1

#153029627 (Pivotal Tracker ID)  
@tutee_form_no_requested_class
Scenario: tutee fills in information but lacks major
  When I go to Tutee Information Form for User 1
  And I fill in "tutee[first_name]" with "Jane"
  And I fill in "tutee[last_name]" with "Doe"
  And I fill in "tutee[phone_number]" with "123-456-7890"
  And I fill in "tutee[grade]" with "Sophomore"
  And I fill in "tutee[sid]" with "1234"
  And I fill in "tutee[semesters_at_cal]" with "4"
  And I fill in "tutee[major]" with "Computer Science"
  And I press "Submit"
  Then I should be on Tutee Information Form for User 1
  
#Lexie, User Story 1 
#151891035 (Pivotal Tracker ID)
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
  And I press "Submit"
  Then I should be on Tutee Submitted Form for User 1
  And I follow "Back to Home"
  Then I should be on the home page

#Lexie Iteration 3
#152832426 (Pivotal Tracker ID)  
@tutee_back_to_form  
Scenario: going from tutee match page back to info page
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
  And I press "Submit"
  Then I should be on Tutee Submitted Form for User 1
  And I follow "Update Form"
  Then I should be on Tutee Information Form for User 1
  
#Lexie Iteration 3
#152832426  
@tutor_back_to_form  
Scenario: going from tutor match page back to info page
  Given I am on Tutor Submitted Form for User 1
  And I follow "Update Form"
  Then I should be on Tutor Information Form for User 1  

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
#   | tutee4_firstname tutee4_lastname | tutee4@gmail.com | [Monday 9am] |

# Given following tutors are in the system: 
#   | tutor1_firstname tutor1_lastname | tutor1@gmail.com | [Monday 8am, Monday 9am] |
#   | tutor2_firstname tutor2_lastname | tutor2@gmail.com | [Monday 3pm, Monday 4pm] |
#   | tutor3_firstname tutor3_lastname | tutor3@gmail.com | [Monday 8am, Wednesday 1pm, Wednesday 2pm] |
#   | tutor4_firstname tutor4_lastname | tutor4@gmail.com | [Wednesday 1pm, Wednesday 2pm, Thursday 10am] |

#Dhruv, User Story 1
#151891277 (Pivotal Tracker ID)
@tutee_view_tutor
Scenario: tutee can view the tutor
  #There are 4 pre-existing tutees and tutors in the database
  Given  A new tutee has been assigned "tutor5_firstname" "tutor5_lastname" as tutor
  When   I am on the tutor match page for tutee 5
  Then   I should see "tutor5_firstname"
  And    I should see "tutor5_lastname"

#Dhruv, User Story 2
#151892797 (Pivotal Tracker ID)
@tutor_single_tutee_match
Scenario: tutee can match with correct tutor
  Given  Tutee 1 has been matched with its Tutor
  And    I am on the tutor match page for tutee 1
  Then   I should see "tutor1_firstname"
  And    I should see "tutor1_lastname"
  
#Dhruv, User Story 3 
#151892797 (Pivotal Tracker ID)
@tutor_time_availability_updated_after_match
Scenario: tutor with the least existing students is matched
  Given  Tutee 1 has been matched with its Tutor
  And    Tutee 2 has been matched with its Tutor
  When   I am on the tutor match page for tutee 2
  Then   I should see "tutor3_firstname"
  And    I should see "tutor3_lastname"

#Dhruv, User Story 3
#151892797 (Pivotal Tracker ID)
@tutee_not_matched_to_any_tutor
Scenario: tutor can have multiple tutees
  Given  Tutee 1 has been matched with its Tutor
  And    Tutee 2 has been matched with its Tutor
  And    Tutee 3 has been matched with its Tutor
  When   I am on the tutor match page for tutee 3
  Then   I should see "Your time availabilities do not match with any tutor. Please revise your preferences & try again."

#Dhruv, User Story 4
#151892797 (Pivotal Tracker ID)
@tutor_view_single_tutee
Scenario: tutor can view a single correctly matched tutee
  Given  Tutee 1 has been matched with its Tutor
  And    Tutee 2 has been matched with its Tutor
  And    Tutee 3 has been matched with its Tutor
  When   I am on the tutee match page for tutor 3
  Then   I should see "tutee2_firstname"
  And    I should see "tutee2_lastname"

#Dhruv, User Story 5
#151892797 (Pivotal Tracekr ID)
@tutor_view_multiple_tutees
Scenario: tutor can view mutiple correctly matched tutees
  Given  Tutee 1 has been matched with its Tutor
  And    Tutee 2 has been matched with its Tutor
  And    Tutee 3 has been matched with its Tutor
  And    Tutee 4 has been matched with its Tutor
  When   I am on the tutee match page for tutor 1
  Then   I should see "tutee1_firstname"
  And    I should see "tutee1_lastname"
  And    I should see "tutee4_firstname"
  And    I should see "tutee4_lastname"
