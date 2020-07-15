class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
    
  def index
    users = User.all
    render json: {users: users}, status: 200
  end

  def show
    render json: @user, status: 200
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: "user created" , status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update 
    if @user.update(plant_params)
      render json: "user updated", status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end 
  end
  
  def destroy 
    if @user.destroy
      render json: "user deleted", status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio, :location, :admin)
  end
  
end
