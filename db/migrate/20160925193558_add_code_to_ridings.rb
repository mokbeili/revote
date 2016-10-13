class AddCodeToRidings < ActiveRecord::Migration[5.0]
  def change
    add_column :ridings, :code, :integer
  end
end
