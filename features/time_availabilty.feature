Feature: Enter time availabilty in tutor/tutee info forms

As a tutee/tutor so that I can get matched properly
Add time time and day availabilities to my form 
and associated groups I'm in

Scenario: Tutee tries to submit form without entering time availability
	Given I am signed in as a tutee
	And I am on the "edit info" page
	And all of the time_availability checkboxes are unchecked
	And I press submit
	Then I should "Please select a time availaility"
	And I should be on the "edit info" page

Scenario: Tutor tries to submit form without entering time availability
	Given I am signed in as a tutor
	And I am on the "edit info" page
	And all of the time_availability checkboxes are unchecked
	And I press submit
	Then I should "Please select a time availaility"
	And I should be on the "edit info" page

