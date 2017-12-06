Given /^there are the following tutors in the system: (.*)/ do |tutors_list|
	#pending
	fail "Unimplemented"
end

When /^I select the following time availabilities: (.*)/ do |days, times|
	#pending
	fail "Unimplemented"
end

When /^I select "(.*)"$/ do |option|
	#pending
	fail "Unimplemented"
end

When /^I select "(.*)" for "(.*)"$/ do |value, box|
	#Pending
	fail "Unimplemented"
end

When /^I see a list of tutors$/ do
	#Pending
	fail "Unimplemented"
end


Then /^I should go to the "(.*)" page$/ do |page|
	# #pending
	# fail "Unimplemented"
	visit path_to(page_name)
end

Then /^I should see "(.*)" under "(.*)" $/ do |value, column|
	#Pending
	fail "Unimplemented"
end

Then /^I should see a confirmation message$/ do
	#Pending
	fail "Unimplemented"
end

Then /^I should see a message that I completed the form$/ do
	#Pending
	fail "Unimplemented"
end

Then /^I should see a list of tutors$/ do
	#Pending
	fail "Unimplemented"
end

Then /^I should see "(.*)" in available times$/ do |days|
	#Pending 
	fail "Unimplemented"
end

Given /^I have been assigned "(.*)" as tutor$/ do |tutor_name|
	#pending
	fail "Unimplemented"
end

When /^I go to the tutor match page$/ do
	#pending
	fail "Unimplemented"
end

Then /^I should see "(.*)" as my tutor$/ do |tutor_name|
	#Pending 
	fail "Unimplemented"
end

Given /^I have been assigned "(.*)" as tutee$/ do |tutee_name|
	#pending
	fail "Unimplemented"
end

When /^I go to the tutee match page$/ do
	#pending
	fail "Unimplemented"
end

Then /^I should see "(.*)" in (.*)/ do |tutee_lastname, tutee_list|
	#Pending 
	fail "Unimplemented"
end

