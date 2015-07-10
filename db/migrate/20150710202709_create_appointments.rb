class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :datetime
      t.string :location
      t.string :status
      t.string :role
      t.string :notes
      t.references :user, index: true

      t.timestamps
    end
  end
end
