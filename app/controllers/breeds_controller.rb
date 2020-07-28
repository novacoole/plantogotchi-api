class BreedsController < ApplicationController
  before_action :set_breed, only: %i[show update destroy]
  before_action :authenticate_user
  before_action :admin_check, except: %i[index]

  def index
    @breeds = Breed.all
    render json: @breeds, status: :ok
  end

  def show
    render json: @breed, status: :ok
  end

  def create
    breed = Breed.new(breed_params)
    if breed.save
      render json: 'breed created', status: :created
    else
      render json: { errors: breed.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @breed.update(breed_params)
      render json: 'breed updated', status: :ok
    else
      render json: { errors: @breed.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @breed.destroy
      render json: 'breed deleted', status: :ok
    else
      render json: { errors: @breed.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def admin_check
    render json: 'Not authorized to access breeds endpoint', status: :unauthorized if current_user.admin? == false
  end

  def set_breed
    @breed = Breed.find(params[:id])
  end

  def breed_params
    params.require(:breed).permit(:name, :description, :max_growth, :spritesheet)
  end
end
