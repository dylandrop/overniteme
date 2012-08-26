Then /^I should be on the edit profile page$/ do
  current_path.should == edit_user_registration_path
end

When /^I fill out the edit profile form with the following info:$/ do |table|
  table.hashes.first.each do |key, value|
    fill_in key.titleize, with: value
  end
  fill_in "Current password", with: 'asdf123'
  click_button "Update"
end

When /^I visit my profile$/ do
  click_link "Profile"
end