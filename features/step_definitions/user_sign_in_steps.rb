Given /^my account exists as a "(.*?)" who seeks "(.*?)"$/ do |gender, other_gender|
  FactoryGirl.create(:user, seeking: other_gender, gender: gender)
end

When /^I click the link "(.*?)"$/ do |link_name|
  click_link link_name
end

When /^I complete the sign in form$/ do
  fill_in "Email", with: "ads1234@columbia.edu"
  fill_in "Password", with: "asdf123"
  click_button "Sign in"
end