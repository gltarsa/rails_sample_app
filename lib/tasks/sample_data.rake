namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    # make an admin user
    User.create!(name: "Role M. Odel",
                 email: "rm@rolemodel.com",
                 password: "secretpw",
                 password_confirmation: "secretpw",
                 admin: true)

    # put a known person in the list so we can see a genuine gravatar
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
    end # make some general-purpose users

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end # make some microposts
  end
end
