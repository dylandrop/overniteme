Given /^the following ([^"]*) exists*:$/ do |model, table|
  table.hashes.each do |hash|
    FactoryGirl.create(model.to_sym, hash)
  end
end

When /^I visit the matches page$/ do
  visit users_path
end

Then /^I should see the users:$/ do |table|
  table.hashes.each do |hash|
    page.should have_content(hash[:username])
  end
end

Then /^I should not see the users:$/ do |table|
  table.hashes.each do |hash|
    page.should_not have_content(hash[:username])
  end
end