100.times do |n|
    name  = Faker::Name.name
    email = Faker::Internet.email
    title = Faker::Lorem.sentence
    content = Faker::Lorem.sentence
    user_id = Faker::Number.between(1, 100)
    password = "password"
    User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)
    Blog.create!(user_id: user_id,
                 title: title,
                 content: content)
end

