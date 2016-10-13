class AddPopulationToRidings < ActiveRecord::Migration[5.0]
  def change
    add_column :ridings, :population, :integer
  end
end
