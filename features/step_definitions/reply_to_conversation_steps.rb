When /^I fill out the new message form with "(.*?)"$/ do |content|
  fill_in "Subject", with: "Hey"
  fill_in "Content", with: content
  click_button "Submit"
end

Then /^I should see the message "(.*?)"$/ do |content|
  page.should have_content(content)
end