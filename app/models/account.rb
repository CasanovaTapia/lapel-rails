class Account < ActiveRecord::Base
	belongs_to :user
	belongs_to :client, :class_name => 'User'

	validates :client_id, uniqueness: true
end
