class Gps < ApplicationRecord

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :sent_at, presence: true
  validates :vehicle_identifier, presence: true
  	
end
