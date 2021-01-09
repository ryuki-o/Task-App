# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
User.create!( name: "第一号",
              email: "funmon0722@gmail.com",
              password: "password",
              password_confirmation: "password")
              

User.create!( name: "オオタケヤマ",
              email: "one-d0722@email.com",
              password: "b1301129",
              password_confirmation: "b1301129")
              
100.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
              
              
