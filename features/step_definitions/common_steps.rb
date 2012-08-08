Then /^I should be signed in$/ do
  page.should have_selector("a", href: "/logout")
end

When /^I go to the home page$/ do
  visit root_path
end

Then /^I should see "([^"]*)"$/ do |text|
  page.all('*', :text => text).should be_present
end

When /^I select "(.*?)" from "(.*?)"$/ do |option, dropdown|
  page.select(option, :from => dropdown)
end

Given /^I am signed in as a "(.*?)" who seeks "(.*?)"$/ do |gender, other_gender|
  steps %Q{
    Given my account exists as a "#{gender}" who seeks "#{other_gender}"
    When I go to the home page
    When I click the link "Login"
    And I complete the sign in form
  }
end