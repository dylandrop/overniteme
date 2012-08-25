Then /^I visit the signup page$/ do
  click_link "Login"
  click_link "Sign up"
end

When /^I fill in the common form information$/ do
  fill_in "Email", with: "aa2213@columbia.edu"
  fill_in "Username", with: "asdffdsa"
  fill_in "Description", with: "HOLY"
  fill_in "Password", with: "asd123"
  fill_in "Password confirmation", with: "asd123"
  path = File.join(::Rails.root, "public/404.html")
  attach_file("Profile picture", path)
end
