class OrdersController < ApplicationController
  before_action :set_and_update_order, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

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
    @order.order_status = 0
    @order.amount = @order.quantity * @order.menu_item.price

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
    # Sets a order object and Updates the amount atribute before update, delete and show actions
    def set_and_update_order
      @order = Order.find(params[:id])
      @order.amount = @order.quantity * @order.menu_item.price
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      if current_user.role == "clerk"
        params.require(:order).permit(:quantity, :note, :bill_id, :menu_item_id)
      if current_user.role == "cooker"
        params.require(:order).permit(:order_status)
      else
        params.require(:order).permit(:quantity, :note, :bill_id, :menu_item_id, :order_status)
      end
    end
end
