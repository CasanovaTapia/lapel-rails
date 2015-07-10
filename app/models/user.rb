class User < ActiveRecord::Base
  has_many :orders
  has_many :accounts
  has_many :clients, :through => :accounts
  has_many :appointments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
end
