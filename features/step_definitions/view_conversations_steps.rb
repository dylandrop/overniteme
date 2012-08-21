Given /^the following "(.*?)" start conversations with me:$/ do |gender, table|
  user = User.last
  table.hashes.each do |hash|
    from = FactoryGirl.create(:user, gender: gender.singularize)
    FactoryGirl.create(:conversation, from: from, to: user)
  end
end

When /^I visit the conversations page$/ do
  click_link "Conversations"
end

Then /^I should see the conversation with "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end