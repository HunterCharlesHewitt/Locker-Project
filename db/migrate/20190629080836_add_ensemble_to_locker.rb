class AddEnsembleToLocker < ActiveRecord::Migration
  def change
    add_column :lockers, :ensemble, :string
  end
end
