class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :update, :destroy]
  before_action :authenticate_user
  
  def index
    if current_user.admin?
      plants = Plant.all
    else
      plants = current_user.plants.includes(:breed)
    end
    render json: {plants: plants}, :include => {:breed => {:only => :name}}, status: 200
  end

  def show
    render json: @plant, status: 200
  end

  def create
    plant = Plant.new(plant_params)
    plant.user_id = current_user.id
    if plant.save
      render json: "plant created", status: :created
    else
      render json: { errors: plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update 
    if @plant.update(plant_params)
      render json: "plant updated", status: 200
    else
      render json: { errors: @plant.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  def destroy 
    if @plant.destroy
      render json: "plant deleted", status: 200
    else
      render json: { errors: @plant.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :water_level, :food_level, :breed_id, :user_id, :alive, :growth_stage)
  end
end
