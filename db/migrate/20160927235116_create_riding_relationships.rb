class CreateRidingRelationships < ActiveRecord::Migration[5.0]
  def change

    create_table :riding_relationships do |t|
      t.integer :current_riding
      t.integer :hypothetical_riding
      t.timestamps
    end
  end
end
