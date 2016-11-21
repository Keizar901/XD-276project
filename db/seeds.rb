# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.create!(fname: 'Admin', lname: 'Admin', email: 'example@admin.org', password: 'adminadmin', password_confirmation: 'adminadmin')


User.create!(fname:  "Admin",
                   lname:"Admin",
             email: "admin@sample.org",
             password:              "adminadmin",
             password_confirmation: "adminadmin",
             admin: true)

User.create!(fname:  "User1",
                   lname:"Example User",
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