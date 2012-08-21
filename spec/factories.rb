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
    group false
  end
end
