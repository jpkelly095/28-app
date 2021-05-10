class AddPrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.belongs_to :patient
      t.belongs_to :product

      t.timestamps
    end
  end
end
