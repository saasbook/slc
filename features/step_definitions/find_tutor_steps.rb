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
	tutor1 = Tutor.new
	tutor1.name = tutor_name
	tutor1.save!
	tutee1 = Tutee.new
	tutee1.tutor = tutor1
	tutee.save!
end

When /^I go to the "(.*)" page$/ do |page_name|
	visit path_to(page_name)
end

Then /^I should see "(.*)" as my tutor$/ do |tutor_name|
	if page.respond_to? :should
    	page.should have_content(tutor_name)
	else
		assert page.has_no_content?(tutor_name)
	end
end

Given /^I have been assigned "(.*)" as tutee$/ do |tutee_name|
	tutee2 = Tutee.new
	tutee2.last_name = tutee_name
	tutor2 = Tutor.new
	tutee2.tutor = tutor2
	tutee2.save!
	tutor2.save!
end

Then /^I should see "(.*)" in my list of tutees/ do |tutee_lastname|
	if page.respond_to? :should
    	page.should have_content(tutee_lastname)
	else
		assert page.has_no_content?(tutee_lastname)
	end
end

