class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  #
  # validates_presence_of :item, :order

  # before_save :finalize

  def set_item
    self[:item] = Item.find(item_id)
  end

  private

    def finalize
      self[:total] = quantity * item.price
    end
end
