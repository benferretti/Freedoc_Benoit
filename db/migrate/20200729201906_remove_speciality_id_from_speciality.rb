class RemoveSpecialityIdFromSpeciality < ActiveRecord::Migration[5.2]
  def change
    remove_column :specialities, :Speciality_ID, :integer
  end
end
