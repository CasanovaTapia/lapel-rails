class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :email, uniqueness: {case_sensitive: false}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
   validates :name, :password, :email, presence: true
   validates :password, length: {minimum: 8}, format: { with: /\d/ }
   attr_accessor :email, :password, :password_confirmation, :role, :name, :phone, :address
end
