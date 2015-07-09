class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :delivery
      t.string :status
      t.string :notes

      t.timestamps
    end
  end
end
