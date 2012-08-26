When /^I fill out the new message form with "(.*?)"$/ do |content|
  fill_in "subject", with: "Hey"
  fill_in "content", with: content
  click_button "Submit"
end

Then /^I should see the message "(.*?)"$/ do |content|
  within ".message-content" do
    page.should have_content(content)
  end
end