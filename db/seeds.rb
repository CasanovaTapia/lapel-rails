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
  email: 'liaison@lapel.co',
  password: 'lapel-test',
  name: 'Taylor Haddix',
  address: '727 W 7th Street, Los Angeles, CA 90017',
  phone: '323-123-4567',
  role: 'liaison'
)
client1 = User.create(
  name: 'Gavin Georgiadis',
  email: 'client@lapel.co',
  password: 'lapel-test',
  phone: '323-323-3233',
  address: '727 W 7th Street, Los Angeles, CA 90017',
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
  password: 'lapel-test',
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

# Create Items
Item.destroy_all
Item.create(
  name:      				        "Linen Casual Shirt",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Vince",
  item_category_id:         1,
  desc:                     "White heather",
)
Item.create(
  name:      				        "Tuxedo Shirt",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Hugo Boss",
  item_category_id:         1,
  desc:                     "Slim collar"
)
Item.create(
  name:      				        "Two Button Suit",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Simon",
  item_category_id:         2,
  desc:                     "Linen/Cotton blend"
)
Item.create(
  name:      				        "Tuxedo",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Saint Laurent",
  item_category_id:         2,
  desc:                     "Slim fit"
)
Item.create(
  name:      				        "Rain jacket",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Barbour",
  item_category_id:         3,
  desc:                     "Waxed olive"
)
Item.create(
  name:      				        "Trench",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Burberry",
  item_category_id:         3,
  desc:                     "Mid-length classic check"
)
Item.create(
  name:      				        "Boardwalk Straight",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Asbury Park",
  item_category_id:         4,
  desc:                     "Dark wash"
)
Item.create(
  name:      				        "Petit Standard",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "APC",
  item_category_id:         4,
  desc:                     "Raw"
)
Item.create(
  name:      				        "Chino",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Ted Baker",
  item_category_id:         4,
  desc:                     "Slim fit, mustard"
)
Item.create(
  name:      				        "Perfect V Neck",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Alternative Apparel",
  item_category_id:         5,
  desc:                     "Organic pima cotton"
)
Item.create(
  name:      				        "Pattern Socks",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Happy Socks",
  item_category_id:         5,
  desc:                     "Polka dot"
)
Item.create(
  name:      				        "Boxer Briefs",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Calvin Klein",
  item_category_id:         5,
  desc:                     "Cotton"
)
Item.create(
  name:      				        "Driving Mocassin",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "TODs",
  item_category_id:         6,
  desc:                     "Suede"
)
Item.create(
  name:      				        "High Top Sneakers",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Louboutin",
  item_category_id:         6,
  desc:                     "Limited Edition"
)
Item.create(
  name:      				        "Cap Toe",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "To Boot",
  item_category_id:         6,
  desc:                     "Black calf leather"
)
Item.create(
  name:      				        "Silk Bow Tie",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Yves Saint Laurent",
  item_category_id:         7,
  desc:                     "Slim"
)
Item.create(
  name:      				        "Lemtosh",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Moscot",
  item_category_id:         7,
  desc:                     "Clear frame, G12 lens"
)
Item.create(
  name:      				        "Cufflinks",
  price:                    rand(5.5...500.5),
  cost:                     rand(5.5...500.5),
  brand:                    "Paul Smith",
  item_category_id:         7,
  desc:                     "Pearl and platinum"
)
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
