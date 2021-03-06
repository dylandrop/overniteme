FactoryGirl.define do

  sequence :email do |n|
    "asd01#{n}@columbia.edu"
  end
  
  factory :user do
    username 'my_username'
    email { generate(:email) }
    gender 'Male'
    seeking 'Women'
    description 'This is a test'
    password 'asdf123'
    password_confirmation 'asdf123'
    confirmed_at Time.now
    profile_picture File.new(File.join(::Rails.root.to_s, "/public", "rails-icon.jpg"), 'rb')
  end
end
