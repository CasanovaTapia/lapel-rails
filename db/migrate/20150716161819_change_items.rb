class ChangeItems < ActiveRecord::Migration
  def up
    change_column :items, :price, :decimal, {precision: 8, scale: 2}
    change_column :items, :cost, :decimal, {precision: 8, scale: 2}
  end

  def down
    change_column :items, :price, :integer
    change_column :items, :cost, :integer
  end
end
