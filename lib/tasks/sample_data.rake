namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
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

  # make some general-purpose users
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "secretpw"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end # end make users

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end # end make_microposts

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[1..49]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end # end make_relationships
