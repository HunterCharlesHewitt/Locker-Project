class CreateLockers < ActiveRecord::Migration
  def change
    create_table :lockers do |t|
      t.string :number
      t.string :size
      t.string :student
      t.string :UIN
      t.string :instrument

      t.timestamps null: false
    end
  end
end
