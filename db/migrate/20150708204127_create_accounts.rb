class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end
  end
end
