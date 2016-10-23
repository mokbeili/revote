class Voter < ApplicationRecord
  has_many :votes

  validates_presence_of :longitude, { message: 'We were not able to find your address' }

  validates :street, presence: true
  validates :street_name, presence: true
  validates :city, presence: true
  validates :province, presence: true

  geocoded_by :address

   before_validation :geocode
   before_validation :get_riding

  def address
    "#{street} #{street_name}, #{city}, #{province}"
  end

  def get_riding
    data = JSON.parse(HTTP.get(URI("http://represent.opennorth.ca/boundaries/?contains=#{self.latitude},#{self.longitude}")))["objects"]

    for i in 0...data.length do
      if data[i]['boundary_set_name'] == 'Federal electoral district'
        self.riding_code = data[i]['external_id']
      end
    end
  end
end
