class BillsController < ApplicationController
  before_action :set_and_update_bill, only: [:show, :update, :destroy]
  before_action :update_bills, only:[:index]

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
    @bill.amount = 0
    @bill.bill_status = 0

    if @bill.save
      render json: @bill, status: :created, location: @bill, serializer: SimpleBillSerializer
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
    # Sets and Updates the amount atribute of a single bill before show, update and delete actions
    def set_and_update_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bill_params
      params.require(:bill).permit(:table_id, :table_number)
    end

    #Sets and Updates the amount atribute in all bills. Called before index action
    def update_bills
      @bills = Bill.all
      @bills.each do |bill|
        bill.orders.each do |order|
          bill.amount += order.amount != nil ? order.amount : 0
        end
        bill.update(amount: bill.amount)
      end
    end
end
