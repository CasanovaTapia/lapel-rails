class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  #
  # validates_presence_of :item, :order

  # before_save :finalize

  def price
    item.price
  end

  private

    def finalize
      self[:total] = quantity * item.price
    end
end
