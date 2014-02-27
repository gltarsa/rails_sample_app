FactoryGirl.define do
  factory :user do
    name     "Whoami Martin"
    email    "whoami@whereami.com"
    password "totallylost"
    password_confirmation "totallylost"
  end
end
