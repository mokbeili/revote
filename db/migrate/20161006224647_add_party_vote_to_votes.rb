class AddPartyVoteToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :mmp_party, :integer
    add_index :votes, :mmp_party
    end
end
