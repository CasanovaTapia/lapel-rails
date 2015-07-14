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

# Create Order Status
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "Requested"
OrderStatus.create! id: 2, name: "Processed"
OrderStatus.create! id: 3, name: "Reviewed"
OrderStatus.create! id: 4, name: "Delivered"


# Create Items
Item.delete_all
10.times do
  item = Item.create(
    name:      				Faker::Name.name,
    price:            rand(5.5...500.5),
    cost:             rand(5.5...500.5),
    brand:            Faker::Commerce.product_name,
    category:         Faker::Commerce.department
)
end
items = Item.all
