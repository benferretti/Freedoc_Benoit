class RemoveSpecialityIdFromDoctors < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :Speciality_ID, :integer
  end
end
