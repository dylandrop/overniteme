Given /^the following "(.*?)" start conversations with me:$/ do |gender, table|
  user = User.last
  table.hashes.each do |hash|
    from = FactoryGirl.build(:user, hash)
    from.update_attributes(gender: gender.singularize)
    from.save
    FactoryGirl.create(:conversation, from: from, to: user)
  end
end

When /^I visit the conversations page$/ do
  click_link "Conversations"
end

Then /^I should see the conversation with "(.*?)"$/ do |username|
  page.should have_content("Conversation with #{username}")
end