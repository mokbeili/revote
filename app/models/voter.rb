class Voter < ApplicationRecord
  has_many :votes

  validates_presence_of :longitude, { message: 'We were not able to find your address' }

  validates :street, presence: true
  validates :street_name, presence: true
  validates :city, presence: true
  validates :province, presence: true

  geocoded_by :address

  before_validation :geocode

  def address
    "#{street} #{street_name}, #{city}, #{province}"
  end
end
