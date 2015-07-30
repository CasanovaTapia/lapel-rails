class User < ActiveRecord::Base
  has_many :orders
  has_many :appointments
  has_many :accounts
  has_many :clients, :through => :accounts
  has_many :inverse_accounts, :class_name => "Account", :foreign_key => "client_id"
  has_many :liaisons, :through => :inverse_accounts, :source => :user
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  # RETURN A LIAISON'S CLIENTS' ORDERS
  def client_orders
    self.clients.map(&:orders)
  end

  # RETURN A LIAISON'S CLIENTS' APPOINTMENTS
  def client_appointments
    self.clients.map(&:appointments)
  end

  # RETURN A USER'S LIAISON
  def liaison
    inverse_accounts.last.user
  end

  # RETURN TRUE IF USER IS A LIAISON
  def liaison?
    role == 'liaison'
  end

  # RETURN TRUE IF USER IS A CLIENT
  def client?
    role == 'client'
  end

  # RETURNS A CLIENT'S DELIVERED ITEMS
  def wardrobe_items
    wardrobe = []
    orders.where(order_status: 4).each do |order|
      order.items.each do |item|
        wardrobe << item
      end
    end
    return wardrobe
  end

  # RETURNS A CLIENT'S SPEND
  def spend
    amounts = []
    orders.where(order_status_id: 4).each do |order|
      amounts << order.subtotal
    end
    return amounts.inject(:+)
  end
end
