class Vote < ApplicationRecord
  belongs_to :voter
  belongs_to :candidate
  belongs_to :riding
end
