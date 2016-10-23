class AddRidingCodeToVoters < ActiveRecord::Migration[5.0]
  def change
    add_column :voters, :riding_code, :integer
  end
end
