
FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "SomePerson #{n}" }
    sequence(:email) { |n| "someperson_#{n}@example.com"}
    password "secretpw"
    password_confirmation "secretpw"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    User
  end
end
