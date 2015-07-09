class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.float :cost
      t.string :brand
      t.string :desc
      t.string :category
      t.references :order, index: true

      t.timestamps
    end
  end
end
