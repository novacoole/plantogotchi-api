class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :update, :destroy]
  before_action :authenticate_user
  
  def index
    if current_user.admin?
      plants = Plant.all.includes(:breed).order("created_at DESC")
    else
      plants = current_user.plants.includes(:breed).order("created_at DESC")
    end
    render json: plants, :include => {:breed => {:only => :name}}, status: 200
  end

  def show
    render json: @plant, :include => {:breed => {:only => :name}}, status: 200
  end

  def create
    plant = Plant.new(plant_params)
    plant.user_id = current_user.id
    if plant.save
      render json: "plant created", status: :created
      Event.create(plant_id: plant.id, event_type: :born)
    else
      render json: { errors: plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if plant_params[:water_level]
      old_level = @plant.water_level 
      new_level = plant_params[:water_level].to_i
      event_type = :water
      amount = new_level - old_level
    elsif plant_params[:growth_stage]
      if plant_params[:growth_stage] == @plant.breed.max_growth
        event_type = :finished
      else 
        event_type = :growth
      end
      old_growth = @plant.growth_stage
      new_growth = plant_params[:growth_stage]
      amount = new_growth - old_growth
    elsif plant_params[:alive]
      event_type = :died
    end
    if @plant.update(plant_params)
      Event.create(plant_id: @plant.id, amount: amount, event_type: event_type)
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
