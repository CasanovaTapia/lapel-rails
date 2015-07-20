class AddCategoryToItems < ActiveRecord::Migration
  def up
    change_table :items do |t|
      t.remove :category
      t.references :item_category, index: true, default: 1
    end
  end

  def down
    change_table :items do |t|
      t.string :category
      t.remove_references :item_category
    end
  end
end
