class PropertiesController < ApplicationController
  def find_all
    @properties = Property.all
    puts "=============>: #{property_params}"
    # @properties = @properties.filter_by_owner(params[:property_owner])
    # @properties = @properties.filter_by_address(params[:property_address]) if params[:property_address].present?
    # @properties = Property.scoped
    # @properties = @properties.filter_by_owner(params[:propertyOwner]) unless params[:propertyOwner].blank?
    # @properties = @properties.filter_by_address(params[:propertyAddress]) unless params[:propertyAddress].blank?
    # if params[:property_owner]
    #   @properties = Property.all.filter_by_owner(params[:property_owner])
    # else
    #   @properties = Property.all
    # end
    render json: { status: 200, message: "Properties retrieved successfully", data: @properties }
  end

  def find_by_id
    begin
      property = Property.find(params[:id])
    rescue => exception
      render json: { status: 404, message: "Property not found" }, status: 404
    else
      render json: { status: 200, message: "Property retrieved successfully", data: property }
    end
  end

  def create
    property = Property.create!(property_params)
    render json: { status: 201, message: "Property created successfully", data: property }, status: 201
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { status: 400, message: invalid.record.errors.full_messages }, status: 400
  end

  def update
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
    params.require(:property).permit(:property_address, :property_type, :number_of_bathrooms, :number_of_bedrooms, :number_of_sitting_rooms, :number_of_toilets, :number_of_kitchens, :property_owner, :description, :valid_from, :valid_to)
  end
end
