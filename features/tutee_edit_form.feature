Feature: Enter time availabilty in tutor/tutee info forms

As a tutee/tutor so that I can get matched properly
Add time time and day availabilities to my form 
and associated groups I'm in

Scenario: Tutee tries to submit form without entering time availability
	Given I am signed in as a tutee
	And I go to the tutee edit info page
	And all of the time_availability checkboxes are unchecked
	And I press submit
	Then I should see "Please select a time availaility"
	And I should be on the edit info page

Scenario: Tutor tries to submit form without entering time availability
	Given I am signed in as a tutor
	And I go to the tutor edit info page
	And all of the time_availability checkboxes are unchecked
	And I press submit
	Then I should "Please select a time availaility"
	And I should be on the edit info page

Scenario: Tutee tries to select one time availability
	Given I am signed in as a tutee
	And I go to the tutee edit info page
	And all the time_availability checkboxes are unchecked
	And I check "Monday 12pm"
	Then the Monday 12pm checkbox should be checked
	And I press submit
	Then I should be on the tutee show page

Scenario: Tutee tries to unselect one time availability
	Given I am signed in as a tutee
	And I go to the tutee edit info page
	And "Monday 12pm" is checked
	And I check "Monday 12pm"
	Then the Monday 12pm checkbox should be unchecked
 

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


