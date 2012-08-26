When /^I send "(.*?)" a message$/ do |arg1|
  fill_in "subject", with: "Hey"
  fill_in "content", with: "What's up"
  click_button "Send"
end

Then /^"(.*?)" should have received my message$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the conversation between me and "(.*?)"$/ do |recipient|
  within "#user_to" do
    page.should have_content("#{recipient}")
  end
end