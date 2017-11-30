Then /^I should receive a file(?: "([^"]*)")?/ do |file|
    page.response_headers['Content-Disposition'].should =~ /#{file}/
end

When /^(?:|I )click the link to "([^"]*)"$/ do |link|
  first(:link, link).click
end

