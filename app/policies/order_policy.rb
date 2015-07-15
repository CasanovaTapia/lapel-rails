class OrderPolicy < ApplicationPolicy
	def index?
		record.exists?
	end
end
