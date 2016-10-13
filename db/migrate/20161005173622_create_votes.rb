class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :voter, foreign_key: true
      t.references :candidate, foreign_key: true
      t.references :riding, foreign_key: true
      t.integer :rank

      t.timestamps
    end
  end
end
