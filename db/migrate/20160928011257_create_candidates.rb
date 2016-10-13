class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.references :party, foreign_key: true
      t.references :riding, foreign_key: true

      t.timestamps
    end
  end
end
