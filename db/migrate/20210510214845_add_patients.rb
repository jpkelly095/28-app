class AddPatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.belongs_to :state
      t.string :name
      t.string :email, unique: true
      t.date :birthdate

      t.timestamps
    end
  end
end
