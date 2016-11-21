# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.create!(fname: 'Admin', lname: 'Admin', email: 'example@admin.org', password: 'adminadmin', password_confirmation: 'adminadmin')

99.times do |n|
  fname  = Faker::Name.fname
  lname  = Faker::Name.lname
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(fname:  fname,
               lname:  lname,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end



<<<<<<< HEAD
User.create!(fname:  "Example User19",
			 lname:"Example User",
             email: "sample19@sample.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
=======
User.create!(fname:  "Admin",
			 lname:"Admin",
             email: "admin@sample.org",
             password:              "adminadmin",
             password_confirmation: "adminadmin",
             admin: true)
>>>>>>> update_profile

User.create!(fname:  "User1",
			 lname:"Example User",
<<<<<<< HEAD
             email: "sample12@sample.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)
User.create!(fname:  "Example User13",
			 lname:"Example User",
             email: "sample13@sample.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)
User.create!(fname:  "Example User14",
			 lname:"Example User",
             email: "sample14@sample.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)
=======
             email: "ex1@sample.org",
             password:              "user1user1",
             password_confirmation: "user1user1")
User.create!(fname:  "User2",
			 lname:"Example User",
             email: "ex2@sample.org",
             password:              "user2user2",
             password_confirmation: "user2user2")
User.create!(fname:  "User3",
			 lname:"Example User",
             email: "ex3@sample.org",
             password:              "user3user3",
             password_confirmation: "user3user3")
>>>>>>> update_profile
