class Api::V1::DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
    render json: @devices
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    render json: @device, status: :ok
  end

  # GET /devices/1/edit
  def edit
    device = Device.find(params[:id])
    if device.update(device_params)
      render json: device, status: :ok
    else
      render json: { errors: device.errors }, status: :unprocessable_entity
    end
  end

  # POST /devices
  # POST /devices.json
  def create
    device = Device.new(device_params)
      if device.save
        render json: device, status: :created
      else
        render json: {errors: device.errors}, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    device = Device.find(params[:id])
    if device.update(device_params)
      render json: device, status: :ok
    else
      render json: { errors: device.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    head 204
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:deviceId, :message)
    end
end
