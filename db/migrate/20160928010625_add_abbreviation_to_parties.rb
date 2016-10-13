class AddAbbreviationToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :abbreviation, :string
  end
end
