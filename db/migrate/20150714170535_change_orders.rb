class ChangeOrders < ActiveRecord::Migration
  def up
    change_table :orders do |t|
      t.remove :status
      t.references :order_status, index: true
    end
  end

  def down
    change_table :orders do |t|
      t.string :status
      t.remove_references :order_status
    end
  end
end
