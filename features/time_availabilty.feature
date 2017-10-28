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


