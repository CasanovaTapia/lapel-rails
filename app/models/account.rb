class Account < ActiveRecord::Base
	belongs_to :user
	belongs_to :client, :class_name => 'User'
end
