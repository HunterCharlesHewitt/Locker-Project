class ChangeDataTypeForNumber < ActiveRecord::Migration
  def change
    change_column :lockers, :number, 'integer USING CAST(column_name AS integer)'
  end
end
