class ViolationsController < ApplicationController
  # GET /violations
  # GET /violations.json
  def index
    @violations = Violation.all

    render json: @violations
  end

  # GET /violations/1
  # GET /violations/1.json
  def show
    @violation = Violation.find(params[:id])

    render json: @violation
  end

  # POST /violations
  # POST /violations.json
#  def create
#    @violation = Violation.new(params[:violation])
#
#    if @violation.save
#      render json: @violation, status: :created, location: @violation
#    else
#      render json: @violation.errors, status: :unprocessable_entity
#    end
#  end
#
#  # PATCH/PUT /violations/1
#  # PATCH/PUT /violations/1.json
#  def update
#    @violation = Violation.find(params[:id])
#
#    if @violation.update(params[:violation])
#      head :no_content
#    else
#      render json: @violation.errors, status: :unprocessable_entity
#    end
#  end
#
#  # DELETE /violations/1
#  # DELETE /violations/1.json
#  def destroy
#    @violation = Violation.find(params[:id])
#    @violation.destroy
#
#    head :no_content
#  end

  ## Replaces attr_accessible
  private
  def app_params
    params.require(:code, :demerits, :description).permit(:code, :demerits, :description)
  end
end
