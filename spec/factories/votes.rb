# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    value 1
    user nil
    bookmark nil
  end
end
