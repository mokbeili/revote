class AddPostalCodeToRidingRelationships < ActiveRecord::Migration[5.0]
  def change
    add_column :riding_relationships, :postal_code_prefix, :string
  end
end
