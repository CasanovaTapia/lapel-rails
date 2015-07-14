class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :order_status
  has_many :order_items

  before_create :set_order_status
  validates_presence_of :delivery

  def subtotal
    order_items.sum("total")
  end

  def status
    order_status.name
  end

  private

    def set_order_status
      self.order_status_id = 1
    end
end
