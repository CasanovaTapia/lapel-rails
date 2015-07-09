class AddMeasurementsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :neck, :float
    add_column :users, :chest, :float
    add_column :users, :sleeve, :float
    add_column :users, :length, :float
    add_column :users, :waist, :float
    add_column :users, :inseam, :float
    add_column :users, :shoe, :float
    add_column :users, :suit, :float
    add_column :users, :shirt, :float
    add_column :users, :pant, :float
  end
end
