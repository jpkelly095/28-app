class AddDoctorToPatient < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :doctor_name, :string
    add_column :patients, :doctor_token, :string
  end
end
