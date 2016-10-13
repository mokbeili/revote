class AddFrNameToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :fr_name, :string
  end
end
