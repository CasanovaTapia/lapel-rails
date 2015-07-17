require 'faker'


# Create Order Status
OrderStatus.delete_all
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

# Create Orders
Order.delete_all
order = client.orders.create(
  delivery: "Athletic Club",
  notes: "Please call 20 minutes before the appointment."
)

# Create OrderItems
OrderItem.delete_all
10.times do
  order_item = OrderItem.create(
    order_id: order.id,
    item_id: items.sample.id
  )
end
