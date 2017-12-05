Then /^I should receive a file(?: "([^"]*)")?/ do |file|
    page.response_headers['Content-Disposition'].should =~ /#{file}/
end

When /^(?:|I )click the link to "([^"]*)"$/ do |link|
  first(:link, link).click
end


When /^All the open tutoring time slots are booked$/ do
  Tutor.find_by_id(1).time_availabilitys.clear
  Tutor.find_by_id(2).time_availabilitys.clear
  Tutor.find_by_id(3).time_availabilitys.clear
  Tutor.find_by_id(4).time_availabilitys.clear
  Tutor.find_by_id(1).save!
  Tutor.find_by_id(2).save!
  Tutor.find_by_id(3).save!
  Tutor.find_by_id(4).save!
end

When /^A tutor adds a new valid time availability$/ do
  ta = TimeAvailability.find_by_id(1)
  Tutor.find_by_id(1).time_availabilitys << ta
  Tutor.find_by_id(1).save!
end


