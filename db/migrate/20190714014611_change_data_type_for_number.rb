class ChangeDataTypeForNumber < ActiveRecord::Migration
  def change
    change_column :lockers, :number, 'integer USING CAST(number AS integer)'
  end
end
