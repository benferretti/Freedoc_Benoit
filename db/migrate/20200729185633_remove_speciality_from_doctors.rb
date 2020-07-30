class RemoveSpecialityFromDoctors < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :speciality, :integer
  end
end
