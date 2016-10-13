class Candidate < ApplicationRecord
  belongs_to :party
  belongs_to :riding

  scope :candidates_MMP, -> (riding){ where(riding_id: riding)}

  def full_name_party
    "#{name} #{last_name} - #{party.abbreviation}"
  end

  def get_color
    party.color
  end

  def full_name
    "#{name} #{last_name}"
  end
end
