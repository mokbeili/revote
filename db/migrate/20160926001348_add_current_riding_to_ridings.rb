class AddCurrentRidingToRidings < ActiveRecord::Migration[5.0]
  def change
    add_column :ridings, :current_riding, :integer
  end
end
