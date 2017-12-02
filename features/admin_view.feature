Feature: admin view
  
  As an admin
  So that I can access all tutor-tutee matches
  I want to view the table with all the matches

Background: tutors and tutees are in the system and an admin would like to view the entire database and matches
  
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

# Pivotal Tracker ID: 152174166
@admin_view_existing_database
Scenario: admin can view the entire database of tutors and tutees
  Given  The admin "admin1@example.com" with the password "admin1" exists
  When   I am on the admin show page for 1
  Then   I should see "tutee1_firstname"
  And    I should see "tutee1_lastname"
  And    I should see "tutee2_firstname"
  And    I should see "tutee2_lastname"
  And    I should see "tutee3_firstname"
  And    I should see "tutee3_lastname"
  And    I should see "tutee4_firstname"
  And    I should see "tutee4_lastname"
  And    I should see "tutor1_firstname"
  And    I should see "tutor1_lastname"
  And    I should see "tutor2_firstname"
  And    I should see "tutor2_lastname"
  And    I should see "tutor3_firstname"
  And    I should see "tutor3_lastname"
  And    I should see "tutor4_firstname"
  And    I should see "tutor4_lastname"
  And    I should see "tutee1@gmail.com"
  And    I should see "tutor4@gmail.com"
  
# Pivotal Tracker ID: 152174166
@new_matches_update_admin_view
Scenario: tutor-tutee-match updates admin's view
  #There are 4 pre-existing tutees and tutors in the database
  Given  A new tutee has been assigned "tutor5_firstname" "tutor5_lastname" as tutor
  And    The admin "admin1@example.com" with the password "admin1" exists
  When   I am on the admin show page for 1
  Then   I should see "tutor5_firstname"
  And    I should see "tutor5_lastname"
  And    I should see "tutee5_firstname"
  And    I should see "tutee5_lastname"
  
Scenario: admin can edit a tutor
  Given  The admin "admin1@example.com" with the password "admin1" exists
  When   I am on the admin show page for 1
  Then   I should see "tutee1_firstname"
  And    I should see "tutee1_lastname"
  And    I click the link to "Edit"
  And    I click the link to "Assign"
  Then   I should see "tutor1_firstname tutor1_lastname"

Scenario: admin can delete a tutee
  Given  The admin "admin1@example.com" with the password "admin1" exists
  When   I am on the admin show page for 1
  Then   I should see "tutee1_firstname"
  And    I should see "tutee1_lastname"
  And    I click the link to "Delete Tutee"
  Then   I should not see "tutee1_firstname"
  And    I should not see "tutee1_lastname"

Scenario: admin can delete a tutor
  Given  The admin "admin1@example.com" with the password "admin1" exists
  When   I am on the admin show page for 1
  Then   I should see "tutor1_firstname"
  And    I should see "tutor1_lastname"
  And    I click the link to "Delete Tutor"
  Then   I should not see "tutor1_firstname"
  And    I should not see "tutor1_lastname"

Scenario: admin can delete all tutees
  Given  The admin "admin1@example.com" with the password "admin1" exists
  When   I am on the admin show page for 1
  And    I click the link to "Reset Tutees"
  Then   I should not see "tutee1_firstname"
  And    I should not see "tutee2_lastname"
  And    I should not see "tutee3_lastname"
  And    I should not see "tutee4_lastname"

Scenario: admin can delete all tutors
  Given  The admin "admin1@example.com" with the password "admin1" exists
  When   I am on the admin show page for 1
  And    I click the link to "Reset Tutors"
  Then   I should not see "tutor1_firstname"
  And    I should not see "tutor2_lastname"
  And    I should not see "tutor3_lastname"
  And    I should not see "tutor4_lastname"

Scenario: admin can download database as excel file
  Given  The admin "admin1@example.com" with the password "admin1" exists
  When   I am on the admin show page for 1
  And    I press "Download as .xlsx"
  Then   I should receive a file "Tutor/Tutee Database.xlsx"

# Dhruv Waitlist User Story 1
# Pivotal Tracker ID: 152822577
@admin_view_tutee_waitlist
Scenario: admin can view the tutee waitlist
  #There are 4 pre-existing tutees and tutors in the database
  Given  I am on the admin waitlist page for 1
  Then   I should see "Total Number of Students: 0"
  And    I should see "Tutee Waitlist"

# Dhruv Waitlist User Story 2
# Pivotal Tracker ID: 152822577
@add_to_tutee_waitlist
Scenario: admin can view changes in the tutee waitlist
  #There are 4 pre-existing tutees and tutors in the database
  Given  All the open tutoring time slots are booked
  And    I am on the tutor match page for tutee 1
  Then   I should see "We do not have any open tutoring slots. Your waitlist position is #1"
  When   I am on the admin waitlist page for 1
  Then   I should see "Total Number of Students: 1"
  And    I should see "tutee1_firstname"

# Dhruv Waitlist User Story 3
# Pivotal Tracker ID: 152822577
@remove_from_tutee_waitlist
Scenario: admin can view changes in the tutee waitlist
  #There are 4 pre-existing tutees and tutors in the database
  Given  All the open tutoring time slots are booked
  And    I am on the tutor match page for tutee 1
  Then   I should see "We do not have any open tutoring slots. Your waitlist position is #1"
  When   I am on the admin waitlist page for 1
  Then   I should see "Total Number of Students: 1"
  And    I should see "tutee1_firstname"
  When   A tutor adds a new valid time availability
  And    Tutee 1 has been matched with its Tutor
  When   I am on the admin waitlist page for 1
  Then   I should see "Total Number of Students: 0"