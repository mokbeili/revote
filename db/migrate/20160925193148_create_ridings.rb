class CreateRidings < ActiveRecord::Migration[5.0]
  def change
    create_table :ridings do |t|
      t.string :name
      t.string :province
      t.string :electoral_system

      t.timestamps
    end
  end
end
