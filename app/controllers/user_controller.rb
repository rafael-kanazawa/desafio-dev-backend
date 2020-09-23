class UserController < ApplicationController
  before_action :authenticate_request!, only:[:index, :update, :delete]
  before_action :set_user, only: [:show, :update, :delete]

  #GET /user
  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user

  #POST /sign_in
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

  #PUT/PATCH /user/id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #DELETE /user/id
  def destroy
    @user.destroy
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:user_name, :password, :role, :email)
  end

end
