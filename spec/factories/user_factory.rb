# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "sample@sample.com"
    password "MyString"
    password_digest "$2a$10$ooTXKPLTy.NcfvZiIlpAaekJwpBs79XX6tY3RaL/jPXRTgE4xBbp2"
  end
end
