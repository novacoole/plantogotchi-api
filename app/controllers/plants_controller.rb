class PlantsController < ApplicationController
  before_action :set_plant, only: %i[show update destroy]
  before_action :authenticate_user

  def index
    # Admin can see all plants.
    if current_user.admin?
      plants = Plant.eager_load(:breed,:user)
    else
      plants = current_user.plants.includes(:breed).order('created_at DESC')
    end
    render json: plants, include: { breed: { only: :name } }, status: :ok
  end

  def show
    render json: @plant, include: { breed: { only: :name } }, status: :ok
  end

  def create
    plant = Plant.new(plant_params)
    plant.user_id = current_user.id
    if plant.save
      render json: 'plant created', status: :created
      Event.create(plant_id: plant.id, event_type: :born)
    else
      render json: { errors: plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    # This action creates Events according to the type of change occuring to a plant.
    # This allows us to have a log of all plant actions
    # The intention is to implement a short history for the user.
    if plant_params[:water_level]
      event_type = :water
      amount = plant_params[:water_level].to_i - @plant.water_level
    elsif plant_params[:growth_stage]
      event_type = plant_params[:growth_stage].to_i == @plant.breed.max_growth ? :finished : :growth
      amount = plant_params[:growth_stage].to_i - @plant.growth_stage
    elsif plant_params[:alive]
      event_type = :died
      amount = 0
    end
    if @plant.update(plant_params)
      Event.create(plant_id: @plant.id, amount: amount, event_type: event_type)
      render json: 'plant updated', status: :ok
    else
      render json: { errors: @plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @plant.destroy
      render json: 'plant deleted', status: :ok
    else
      render json: { errors: @plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_plant
    # Rough authorization occurs here
    @plant = Plant.find(params[:id])
    unless @plant.user_id == current_user.id || current_user.admin?
      render json: 'Not authorized to interact with this plant', status: :unauthorized
    end
  end

  def plant_params
    params.require(:plant).permit(:name, :water_level, :food_level, :breed_id, :user_id, :alive, :growth_stage)
  end
end
