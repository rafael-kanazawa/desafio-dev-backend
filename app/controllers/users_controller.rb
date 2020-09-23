class UsersController < ApplicationController
  before_action :authenticate_request!, only:[:index, :show, :update, :delete]
  before_action :set_user, only: [:show, :update, :delete]

  #GET /users
  def index
    @users = User.all
    render json: @users
  end

  #GET /users/id
  def show
    render json: @user
  end

  #POST /sign_in
  def create
    @user = User.create(user_params)
    if @user.valid?
      if @user.save
        render json: payload(@user)
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: @user.errors
      #{error: "Invalid username or password"}
    end
  end

  #PUT/PATCH /users/id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #DELETE /users/id
  def destroy
    if @user
      @user.destroy
    end
  end

  private 

    def set_user
      @user = User.find(params[:id])
      puts @user
    end

    def user_params
      params.permit(:user_name, :password, :role, :email)
    end

end
