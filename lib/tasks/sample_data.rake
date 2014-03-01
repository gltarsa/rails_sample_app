namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Role M. Odel",
                 email: "rm@rolemodel.com",
                 password: "secretpw",
                 password_confirmation: "secretpw",
                 admin: true)
    User.create!(name: "Greg Tarsa",
                 email: "gltarsa@gmail.com",
                 password: "secretpw",
                 password_confirmation: "secretpw")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "secretpw"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
