class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET bills/1/orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET bills/1/orders/1
  def show
    render json: @order
  end

  # POST bills/1/orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: bill_orders_url(Bill.find(@order.bill_id))
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT bills/1/orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE bills/1/orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:quantity, :note, :order_status, :bill_id, :menu_item_id)
    end
end
