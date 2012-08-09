# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    subject "MyString"
    content "MyText"
    from_id 1
    to_id 1
    conversation_id 1
  end
end
