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

# @admin_edit_match
# Scenario: admin edits a match between a tutor and a tutee
  

  


