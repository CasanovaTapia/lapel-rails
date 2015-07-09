class User < ActiveRecord::Base
  has_many :orders
  has_many :accounts
  has_many :clients, :through => :accounts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
