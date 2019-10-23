# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
100.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

3.times do |userid|
  20.times do |n|
    title = "タイトル-#{n+1}"
    details = "詳細-#{n+1}"
    user_id = userid + 1
    Task.create!( title: title,
                  details: details,
                  user_id: user_id)
  end
end

