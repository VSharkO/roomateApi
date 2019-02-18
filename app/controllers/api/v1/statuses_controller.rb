class Api::V1::StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all
    render json: @statuses
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    status = Status.find(params[:id])
    if status.update(status_params)
      render json: status, status: :ok
    else
      render json: { errors: status.errors }, status: :unprocessable_entity
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:isActive)
    end
end
