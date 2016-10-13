class RemoveCurrentRidingFromRelationships < ActiveRecord::Migration[5.0]
  def change
    remove_column :riding_relationships, :current_riding, :integer
  end
end
