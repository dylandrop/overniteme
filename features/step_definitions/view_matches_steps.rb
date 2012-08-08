Given /^the following ([^"]*) exists*:$/ do |model, table|
  table.hashes.each do |hash|
    FactoryGirl.create(model.to_sym, hash)
  end
end

Then /^I should see the first (\d+) "(.*?)" seeking "(.*?)"$/ do |number, gender, other_gender|
  pending # express the regexp above with the code you wish you had
end