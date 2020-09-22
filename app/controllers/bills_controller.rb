class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :update, :destroy]
  before_action :update_bill, only:[:index]

  # GET /bills
  def index
    render json: @bills, each_serializer: SimpleBillSerializer
  end

  # GET /bills/1
  def show
    render json: @bill, serializer: CompleteBillSerializer
  end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      render json: @bill, status: :created, location: @bill, serializer: CompleteBillSerializer
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      render json: @bill, serializer: CompleteBillSerializer
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_params
      params.require(:bill).permit(:amount, :bill_status, :table_id, :table_number)
    end

    def update_bill
      @bills = Bill.all
      @bills.each do |bill|
        bill.orders.each do |order|
          bill.amount += order.amount != nil ? order.amount : 0
        end
        bill.update(amount: bill.amount)
      end
    end
end
