class AddBooleansToOrders < ActiveRecord::Migration
  def up
    change_table :orders do |t|
      t.boolean :shirt, default: false
      t.boolean :suit, default: false
      t.boolean :outerwear, default: false
      t.boolean :pants, default: false
      t.boolean :basics, default: false
      t.boolean :footwear, default: false
      t.boolean :accessories, default: false
      t.boolean :underwear, default: false
    end
  end

  def down
    change_table :orders do |t|
      t.remove :shirt
      t.remove :suit
      t.remove :outerwear
      t.remove :pants
      t.remove :basics
      t.remove :footwear
      t.remove :accessories
      t.remove :underwear
    end
  end
end
