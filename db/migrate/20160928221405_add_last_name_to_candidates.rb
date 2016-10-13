class AddLastNameToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :last_name, :string
  end
end
