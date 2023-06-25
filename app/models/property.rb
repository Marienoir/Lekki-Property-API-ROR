class Property < ApplicationRecord
  validates :property_address, :property_type, :number_of_bathrooms, :number_of_bedrooms, :number_of_sitting_rooms, :number_of_toilets, :number_of_kitchens, :property_owner, :description, :valid_from, presence: true
  validates :number_of_bathrooms, :number_of_bedrooms, :number_of_sitting_rooms, :number_of_toilets, :number_of_kitchens, numericality: true

  scope :filter_by_owner, ->(owner) { where(property_owner: owner) if owner.present? }
  scope :filter_by_address, ->(address) { where(property_address: address) }
end
