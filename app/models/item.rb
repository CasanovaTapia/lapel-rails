class Item < ActiveRecord::Base
  belongs_to :item_category
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  def cat
    item_category.name
  end
end
