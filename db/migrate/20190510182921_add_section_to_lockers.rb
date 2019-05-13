class AddSectionToLockers < ActiveRecord::Migration
  def change
    add_column :lockers, :floor_section, :string
  end
end
