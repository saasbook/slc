Given /^I have not reserved a room$/ do 
  #Pending
  fail "Unimplemented"
end

Given /^I am on the "(.*)" page$/ do |page|
  #Pending
  fail "Unimplemented"
end

Then /^I should be able to reserve a room for "(.*)" and "(.*)"$/ do |time, day|
  #Pending
  fail "Unimplemented"
end

Then /^I should see an appropriate message$/ do
  #Pending
  fail "Unimplemented"
end

When /^I see all rooms and times are reserved$/ do
  #Pending
  fail "Unimplemented"
end

Then /^I should not be able to reserve a room$/ do
  #Pending
  fail "Unimplemented"
end

Then /^I should be able to view my current reservation$/ do
  #Pending
  fail "Unimplemented"
end

############ Tutor-Tutee-Match Tests ############

Given /^A new tutee has been assigned "(.*)" "(.*)" as tutor$/ do |tutor_firstname, tutor_lastname|
	tutor5 = Tutor.new
	tutor5.first_name = tutor_firstname
	tutor5.last_name = tutor_lastname
	tutor5.email = "tutor5@gmail.com"
  tutor5.password = "tutor5"
  tutor5.password_confirmation = "tutor5"
	tutor5.save!
	
	ta = TimeAvailability.create(:day => "Friday", :start_time => 11)
	my_study_session = StudySession.create(:tutor_id => 5, :tutee_id => 5, :time_availability_id => ta.id)
  my_study_session.time_availabilitys << ta
  
	tutee5 = Tutee.new
	tutee5.first_name = "tutee5_firstname"
	tutee5.last_name = "tutee5_lastname"
	tutee5.email = "tutee5@gmail.com"
  tutee5.password = "tutee5"
  tutee5.password_confirmation = "tutee5"
	tutee5.tutor = tutor5
	tutee5.save!
end

Given /^Tutee (.*) has been matched with its Tutor$/ do |tutee_id|
  Tutee.find_by_id(tutee_id).assign_tutor_and_session
end

Given /^The SID (.*) is in the database$/ do |sid|
  Tuteesid.create(:SID => sid)
end


# When /^I go to the "(.*)" page$/ do |page_name|
# 	visit path_to(page_name)
# end

# When /^I am on the tutor match page for tutee "(.*)"$/ do |tutee_id|
# 	visit path_to(page_name)
# end


# Then /^I should see "(.*)" as my tutor$/ do |tutor_name|
# 	if page.respond_to? :should
#     	page.should have_content(tutor_name)
# 	else
# 		assert page.has_no_content?(tutor_name)
# 	end
# end

# Given /^I have been assigned "(.*)" as tutee$/ do |tutee_name|
# 	tutee2 = Tutee.new
# 	tutee2.last_name = tutee_name
# 	tutor2 = Tutor.new
# 	tutee2.tutor = tutor2
# 	tutee2.save!
# 	tutor2.save!
# end

# Then /^I should see "(.*)" as my tutee/ do |tutee_lastname|
# 	if page.respond_to? :should
#     	page.should have_content(tutee_lastname)
# 	else
# 		assert page.has_no_content?(tutee_lastname)
# 	end
# end

# Then /^I should see "(.*)" as my tutor/ do |tutor_lastname|
# 	if page.respond_to? :should
#     	page.should have_content(tutor_lastname)
# 	else
# 		assert page.has_no_content?(tutor_lastname)
# 	end
# end