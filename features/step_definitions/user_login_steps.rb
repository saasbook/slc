# Given /^I go to the login page$/ do 
#   #Pending
#   fail "Unimplemented"
# end

Given /^I am on the register account page$/ do 
  #Pending
  fail "Unimplemented"
end


# ====================================================== #


And /^The tutee "(.*)" with the password "(.*)" exists/ do |username, pass|
  tutee = Tutee.new
  tutee.email = username
  tutee.password = pass
  tutee.save!
end

And /^The tutor "(.*)" with the password "(.*)" exists/ do |username, pass|
  tutor = Tutor.new
  tutor.email = username
  tutor.password = pass
  tutor.save!
end

Then /^I should see "(.*)"$/ do |message|
  #Pending
  fail "Unimplemented"
end

Then /^I should press "(.*)"$/ do |button|
  #Pending
  fail "Unimplemented"
end

Then /^I should be on the "(.*)" page$/ do |pagetype|
  #Pending
  fail "Unimplemented"
end

When /^I select "(.*)" for "(.*)"$/ do |field, role|
  #Pending
  fail "Unimplemented"
end

When /^I select "(.*)"$/ do |button|
  #Pending
  fail "Unimplemented"
end

Then /^I should be redirected to the "(.*)" form$/ do |form|
  #Pending
  fail "Unimplemented"
end

