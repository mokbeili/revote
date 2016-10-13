class CreateVoters < ActiveRecord::Migration[5.0]
  def change
    create_table :voters do |t|
      t.float :longitude
      t.float :latitude
      t.string :email
      t.integer :unit
      t.integer :street
      t.string :street_name
      t.string :city
      t.string :province
      t.string :postal_code

      t.timestamps
    end
  end
end
