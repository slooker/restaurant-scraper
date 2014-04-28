class InspectionsController < ApplicationController
  # GET /inspections
  # GET /inspections.json
  def index
    @inspections = Inspection.first

    render json: @inspections
  end

  # GET /inspections/1
  # GET /inspections/1.json
  def show
    @inspection = Inspection.find(params[:id])

    render json: @inspection
  end

  def violations
    inspection = Inspection.find(params[:id])
    render json: inspection.violations
  end

  # POST /inspections
  # POST /inspections.json
#  def create
#    @inspection = Inspection.new(params[:inspection])
#
#    if @inspection.save
#      render json: @inspection, status: :created, location: @inspection
#    else
#      render json: @inspection.errors, status: :unprocessable_entity
#    end
#  end
#
#  # PATCH/PUT /inspections/1
#  # PATCH/PUT /inspections/1.json
#  def update
#    @inspection = Inspection.find(params[:id])
#
#    if @inspection.update(params[:inspection])
#      head :no_content
#    else
#      render json: @inspection.errors, status: :unprocessable_entity
#    end
#  end
#
#  # DELETE /inspections/1
#  # DELETE /inspections/1.json
#  def destroy
#    @inspection = Inspection.find(params[:id])
#    @inspection.destroy
#
#    head :no_content
#  end

  ## Replaces attr_accessible
  private
  def app_params
    params.require(:inspection_id, :permit_number, :date, :demerits, :grade, :inspection_type, :permit_status)
      .permit(:inspection_id, :permit_number, :date, :demerits, :grade, :inspection_type, :permit_status)
  end

end
