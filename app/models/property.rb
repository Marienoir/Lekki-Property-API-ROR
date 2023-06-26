class Property < ApplicationRecord
  validates :property_address, :property_type, :number_of_bathrooms, :number_of_bedrooms, :number_of_sitting_rooms, :number_of_toilets, :number_of_kitchens, :property_owner, :description, :valid_from, presence: true
  validates :number_of_bathrooms, :number_of_bedrooms, :number_of_sitting_rooms, :number_of_toilets, :number_of_kitchens, numericality: true

  scope :filter_by_owner, ->(owner) { where(property_owner: owner) if owner.present? }
  scope :filter_by_type, ->(type) { where(property_type: type) if type.present? }
  scope :filter_by_address, ->(address) { where(property_address: address) if address.present? }
  scope :filter_by_bedrooms, ->(bedroom) { where(number_of_bedrooms: bedroom) if bedroom.present? }
  scope :filter_by_kitchen, ->(kitchen) { where(number_of_kitchens: kitchen) if kitchen.present? }
  scope :filter_by_toilets, ->(toilet) { where(number_of_toilets: toilet) if toilet.present? }
  scope :filter_by_sitting_rooms, ->(sittingroom) { where(number_of_sitting_rooms: sittingroom) if sittingroom.present? }
  scope :filter_by_bathrooms, ->(bathroom) { where(number_of_bathrooms: bathroom) if bathroom.present? }
end
