class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :propertyAddress
      t.string :propertyType
      t.integer :numberOfBedrooms
      t.integer :numberOfSittingRooms
      t.integer :numberOfKitchens
      t.integer :numberOfBathrooms
      t.integer :numberOfToilets
      t.string :propertyOwner
      t.string :description
      t.date :validFrom
      t.date :validTo

      t.timestamps
    end
  end
end
