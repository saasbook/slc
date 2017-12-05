Feature: Enter time availabilty in tutor/tutee info forms

As a tutee/tutor so that I can get matched properly
Add time time and day availabilities to my form 
and associated groups I'm in

# Pivotal Tracker ID: #152126618
@Group_checkboxes 
Scenario: Tutee tries to select applicable groups
  When I go to Tutee Information Form for User 1
  Then I should see the following checkboxes:
    | Disabled Students Program (DSP)               | 1  |
    | Educational Opportunity Program (EOP)         | 2  |
    | Summer Bridge Cohort 2017                     | 3  |
    | Fall Program for Freshman (FPF)               | 4  |
    | Transfer, Re-Entry, or Student Parent (TRSP)  | 5  |
    | UC Intercampus Exchange Program (UCIEP)       | 6  |
    | Berkeley International Study Program (BISP)   | 7  |


