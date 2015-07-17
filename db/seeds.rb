require 'faker'

# Create Order Status
OrderStatus.destroy_all
OrderStatus.create! id: 1, name: "Requested"
OrderStatus.create! id: 2, name: "Processed"
OrderStatus.create! id: 3, name: "Reviewed"
OrderStatus.create! id: 4, name: "Delivered"

# Create Users
User.destroy_all
liaison = User.create(
  name: 'Liaison User',
  email: 'liaison@lapel.co',
  password: 'lapel-admin',
  phone: '323-323-3233',
  role: 'liaison'
)
client = User.create(
  name: 'Client User',
  email: 'client@lapel.co',
  password: 'lapel-admin',
  phone: '323-323-3233',
  role: 'client'
)

# Create Account
Account.destroy_all
account = liaison.accounts.create(client_id: client.id)

# Create Items
Item.destroy_all
10.times do
  item = Item.create(
    name:      				Faker::Commerce.product_name,
    price:            rand(5.5...500.5),
    cost:             rand(5.5...500.5),
    brand:            Faker::Company.name,
    category:         Faker::Commerce.department,
    desc:             Faker::Hacker.say_something_smart
)
end
items = Item.all

# Create Orders
Order.destroy_all
order = client.orders.create(
  delivery: "Athletic Club",
  notes: "Please call 20 minutes before the appointment."
)

# Create OrderItems
OrderItem.destroy_all
10.times do
  order_item = OrderItem.create(
    order_id: order.id,
    item_id: items.sample.id
  )
end
