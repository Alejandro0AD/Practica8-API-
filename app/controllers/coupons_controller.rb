class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :update, :destroy]

  # GET /coupons
  def index
    @coupons = Coupon.all
    render json: @coupons
  end

  # GET /coupons/:id
  def show
    render json: @coupon
  end

  # POST /coupons
  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      render json: @coupon, status: :created
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coupons/:id
  def update
    if @coupon.update(coupon_params)
      render json: @coupon
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coupons/:id
  def destroy
    @coupon.destroy
    head :no_content
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  def coupon_params
    params.require(:coupon).permit(:number, :name, :discount, :validity)
  end
end
