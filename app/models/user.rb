class User < ActiveRecord::Base
  has_many :orders
  has_many :appointments
  has_many :accounts
  has_many :clients, :through => :accounts
  has_many :inverse_accounts, :class_name => "Account", :foreign_key => "client_id"
  has_many :liaisons, :through => :inverse_accounts, :source => :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  def client_orders
    self.clients.map(&:orders)
  end

  def client_appointments
    self.clients.map(&:appointments)
  end

  def liaison?
    role == 'liaison'
  end

  def client?
    role == 'client'
  end
end
