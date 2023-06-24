class PropertiesController < ApplicationController
  def findAllProperties
    render json: { status: 200, message: "Properties retrieved successfully", data: Property.all }
  end

  #     if params[:propertyAddress] && params[:propertyType] && params[:numberOfBathrooms]
  #       property = Property.where(propertyAddress: params[:propertyAddress], propertyType: params[:propertyType], numberOfBathrooms: params[:numberOfBathrooms])
  #     else
  #       property = Property.all
  #     end
  #     render json: property
  #   end

  def search
    @property = Property.search(params[:propertyOwner], params[:numberOfBathrooms])
    # propertyOwner = "%#{params[:propertyOwner]}%"
    # numberOfBathrooms = "%#{params[:numberOfBathrooms]}%"
    # numberOfBedrooms = "%#{params[:numberOfBedrooms]}%"
    # numberOfKitchens = "%#{params[:numberOfKitchens]}%"
    # numberOfSittingRooms = "%#{params[:numberOfSittingRooms]}%"
    # numberOfToilets = "%#{params[:numberOfToilets]}%"
    # propertyAddress = "%#{params[:propertyAddress]}%"

    puts @property
    # # puts propertyOwner
    # a = Property.where(
    #   "propertyOwner LIKE ? OR numberOfBathrooms LIKE ? OR numberOfBedrooms LIKE ? OR numberOfKitchens LIKE ? OR numberOfSittingRooms LIKE ? OR numberOfToilets LIKE ? OR propertyAddress LIKE ? ",
    #    propertyOwner, numberOfBathrooms, numberOfBedrooms, numberOfKitchens, numberOfSittingRooms, numberOfToilets, propertyAddress)

    render json: params
  end

  def findPropertiesById
    begin
      property = Property.find(params[:id])
    rescue => exception
      render json: { status: 404, message: "Property not found" }, status: 404
    else
      render json: { status: 200, message: "Property retrieved successfully", data: property }
    end
  end

  def findPropertiesByParams
    @property = Property.where(
      propertyOwner: params[:propertyOwner],
      numberOfBathrooms: params[:numberOfBathrooms],
      numberOfBedrooms: params[:numberOfBedrooms],
      numberOfKitchens: params[:numberOfKitchens],
      numberOfSittingRooms: params[:numberOfSittingRooms],
      numberOfToilets: params[:numberOfToilets],
      propertyAddress: params[:propertyAddress],
    )

    render json: @property
  end

  def createProperty
    property = Property.create!(property_params)
    render json: { status: 201, message: "Property created successfully", data: property }, status: 201
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { status: 400, message: invalid.record.errors.full_messages }, status: 400
  end

  def updatePropertyById
    begin
      property = Property.find(params[:id])
    rescue => exception
      render json: { status: 404, message: "Property not found" }, status: 404
    else
      property.update!(property_params)
      render json: { status: 200, message: "Property updated successfully", data: property }
    end
  end

  private

  def property_params
    params.require(:property).permit(:propertyAddress, :propertyType, :numberOfBathrooms, :numberOfBedrooms, :numberOfSittingRooms, :numberOfToilets, :numberOfKitchens, :propertyOwner, :description, :validFrom, :validTo)
  end
end
