class ChangeDataTypeForNumber < ActiveRecord::Migration
  def change
    change_column :lockers, :number, :integer
  end
end
