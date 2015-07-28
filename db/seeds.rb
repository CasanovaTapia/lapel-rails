require 'faker'

# Create Order Status
OrderStatus.destroy_all
OrderStatus.create! id: 1, name: "requested"
OrderStatus.create! id: 2, name: "processed"
OrderStatus.create! id: 3, name: "reviewed"
OrderStatus.create! id: 4, name: "delivered"
order_statuses = OrderStatus.all

# Create Appointment Status
AppointmentStatus.destroy_all
AppointmentStatus.create! id: 1, name: "requested"
AppointmentStatus.create! id: 2, name: "processed"
AppointmentStatus.create! id: 3, name: "reviewed"
AppointmentStatus.create! id: 4, name: "delivered"
appointment_statuses = AppointmentStatus.all

# Create Item Category
ItemCategory.destroy_all
ItemCategory.create! id: 1, name: "shirt"
ItemCategory.create! id: 2, name: "suit"
ItemCategory.create! id: 3, name: "outerwear"
ItemCategory.create! id: 4, name: "pants"
ItemCategory.create! id: 5, name: "basics"
ItemCategory.create! id: 6, name: "footwear"
ItemCategory.create! id: 7, name: "accessories"
item_categories = ItemCategory.all

# Create Users
User.destroy_all
liaison = User.create(
  name: 'Taylor Haddix',
  email: 'liaison@lapel.co',
  password: 'lapel-admin',
  phone: '323-323-3233',
  role: 'liaison'
)
client1 = User.create(
  name: 'Gavin Georgiadis',
  email: 'gavin@georgiadis.com',
  password: 'lapel-admin',
  phone: '323-323-3233',
  role: 'client',
  neck: 15,
  chest: 38,
  length: 32,
  sleeve: 25,
  waist: 30,
  inseam: 32,
  shoe: 10,
  suit: 38,
  pant: 30
)
client2 = User.create(
  name: 'Will Carron',
  email: 'will@carron.com',
  password: 'lapel-admin',
  phone: '323-323-3233',
  role: 'client',
  neck: 15,
  chest: 38,
  length: 32,
  sleeve: 25,
  waist: 30,
  inseam: 32,
  shoe: 10,
  suit: 38,
  pant: 30
)
client3 = User.create(
  name: 'Egor',
  email: 'egor@lapel.co',
  password: 'lapel-admin',
  phone: '323-323-3233',
  role: 'client'
)

# Create Account
Account.destroy_all
liaison.accounts.create(client_id: client1.id)
liaison.accounts.create(client_id: client2.id)
liaison.accounts.create(client_id: client3.id)

# Create Items
Item.destroy_all
30.times do
  item = Item.create(
    name:      				        Faker::Commerce.product_name,
    price:                    rand(5.5...500.5),
    cost:                     rand(5.5...500.5),
    brand:                    Faker::Company.name,
    item_category:            item_categories.sample,
    desc:                     Faker::Commerce.product_name
)
end
items = Item.all

# Create Orders
Order.destroy_all
order1 = client1.orders.create(
  delivery: "Athletic Club",
  notes: "Please call 20 minutes before the appointment."
)
order2 = client2.orders.create(
  delivery: "Office",
  notes: "Please leave the package at the front desk."
)
order3 = client3.orders.create(
  delivery: "Home",
  notes: "Please leave the package with the doorman."
)
order4 = client1.orders.create(
  delivery: "Home",
  notes: "Please leave the package with the doorman.",
  order_status_id:4
)
order5 = client1.orders.create(
  delivery: "Home",
  notes: "Please leave the package with the doorman.",
  order_status_id:4
)

# Create Appointments
Appointment.destroy_all
client1.appointments.create(
  datetime:              DateTime.now,
  location:              "Home",
  role:                  "Styling",
  notes:                 "I would like this to be a quick meeting",
  appointment_status:    AppointmentStatus.last
)
client2.appointments.create(
  datetime:              DateTime.now,
  location:              "Office",
  role:                  "Styling",
  notes:                 "Please bring only shirts"
)
client2.appointments.create(
  datetime:              DateTime.now,
  location:              "Home",
  role:                  "Styling"
)
client3.appointments.create(
  datetime:              DateTime.now,
  location:              "Home",
  role:                  "Styling",
  notes:                 "I would also like to review my current wardrobe"
)
client1.appointments.create(
  datetime:              DateTime.now,
  location:              "Athletic Club",
  role:                  "Styling",
  notes:                 "I would like to see a suiting expert"
)


# Create OrderItems
OrderItem.destroy_all
10.times do
  order_item = OrderItem.create(
    order: order1,
    item: items.sample
  )
end
3.times do
  order_item = OrderItem.create(
    order: order2,
    item: items.sample
  )
end
5.times do
  order_item = OrderItem.create(
    order: order3,
    item: items.sample
  )
end
5.times do
  order_item = OrderItem.create(
    order: order4,
    item: items.sample
  )
end
3.times do
  order_item = OrderItem.create(
    order: order5,
    item: items.sample
  )
end
