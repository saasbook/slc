Given /^all of the "(.*)" checkboxes are unchecked $/ do |checkbox_type|
  #Pending
  fail "Unimplemented"
end

Given /^"(.*)" is checked$/ do |checkbox_type|
  #Pending
  fail "Unimplemented"
end
  
Given /^I go to the (.*) form as (.*)/ do |form, user|
  #Pending
  fail "Unimplemented"
end
  
Given /^I am signed in as a "(.*)"$/ do |role|
  #Pending
  fail "Unimplemented"
end

Given /^I go to the "(.*)" edit info page$/ do 
  #Pending
  fail "Unimplemented"
end

Then /^I should see the following checkboxes:$/ do |checkbox_table|
  checkbox_table.rows_hash.each do |title, id|
    if page.respond_to? :should
      page.should have_content(title)
    else
      assert page.has_content?(title)
    end
  end 
end