class Voter < ApplicationRecord
  has_many :votes

  geocoded_by :address
  after_validation :geocode

  def address
    "#{street} #{street_name}, #{city}, #{province}"
  end
end
