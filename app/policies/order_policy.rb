class OrderPolicy < ApplicationPolicy
	def index?
		record.user == user || user.liaison?
	end
end
