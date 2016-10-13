class AddCurrentRidingToRidingRelationships < ActiveRecord::Migration[5.0]
  def change
    add_reference :riding_relationships, :riding, foreign_key: true
  end
end
