class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :order_status
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  before_create :set_order_status
  validates_presence_of :delivery

  def subtotal
    amounts = []
    order_items.each do |order_item|
      amounts << order_item.price
    end
    return amounts.inject(:+)
  end

  def status
    order_status.name
  end

  private

    def set_order_status
      self.order_status_id = 1
    end
end
