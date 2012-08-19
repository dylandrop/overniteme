When /^I send "(.*?)" a message$/ do |arg1|
  fill_in "Subject", with: "Hey"
  fill_in "Content", with: "What's up"
  click_button "Send"
end

Then /^"(.*?)" should have received my message$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the conversation between me and "(.*?)"$/ do |recipient|
  page.should have_content("To: #{recipient}")
end