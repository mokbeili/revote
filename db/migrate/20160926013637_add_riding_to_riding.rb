class AddRidingToRiding < ActiveRecord::Migration[5.0]
  def change
    add_reference :ridings, :riding, foreign_key: true
  end
end
