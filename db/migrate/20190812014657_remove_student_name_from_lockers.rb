class RemoveStudentNameFromLockers < ActiveRecord::Migration
  def change
    remove_column :lockers, :student, :string
  end
  
  def change
    add_column :lockers, :student_first_name, :string
    add_column :lockers, :student_last_name, :string
  end
end
