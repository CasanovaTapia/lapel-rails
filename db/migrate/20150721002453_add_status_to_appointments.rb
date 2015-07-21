class AddStatusToAppointments < ActiveRecord::Migration
  def up
    change_table :appointments do |t|
      t.remove :status
      t.references :appointment_status, index: true, default: 1
    end
  end

  def down
    change_table :appointments do |t|
      t.string :status
      t.remove_references :appointment_status
    end
  end
end
