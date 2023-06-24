class Property < ApplicationRecord
  validates :propertyAddress, :propertyType, :numberOfBedrooms, :numberOfSittingRooms, :numberOfKitchens, :numberOfBathrooms, :numberOfToilets, :propertyOwner, :description, presence: true
  validates :numberOfBedrooms, :numberOfSittingRooms, :numberOfKitchens, :numberOfBathrooms, :numberOfToilets, numericality: true
#   validates :validFrom, :validTo, numericality:{ gre}
end
