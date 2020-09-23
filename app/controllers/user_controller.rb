class UserController < ApplicationController
  before_action :authenticate_request!, only:[:index, :update, :delete]

  #Authorization example
  def index
    render json: {'logged_in' => true}
  end

  #POST /user/sign_in
  def create
    @user = User.create(user_params)
    if @user.valid?
      if @table.save
        render json: @table, status: :created, location: @table, payload(user)
      else
        render json: @table.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "Invalid username or password"}
    end
  end


  private 

  def user_params
    params.permit(:user_name, :password, :role, :email)
  end

end
