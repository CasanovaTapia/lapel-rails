require 'faker'

# Create Users
5.times do
  user = User.new(
    name:      				Faker::Name.name,
    email:            Faker::Internet.email,
    password:         Faker::Lorem.characters(10),
		phone:            Faker::Number.number(9)
  )
  user.save!
end
users = User.all
