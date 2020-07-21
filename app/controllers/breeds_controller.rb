class BreedsController < ApplicationController
    before_action :set_breed, only: [:show, :update, :destroy]
    before_action :authenticate_user
      
    def index
      breeds = Breed.with_attached_spritesheet.all
      # new_breeds = breeds.map do |breed|
      #   breed["spritesheet"] = url_for(breed.spritesheet)
      # # end
      # newbreed = BreedSerializer.new(breeds)
      render json: {breeds: breeds}, status: 200
      # render json: new_breeds.to_json
    end
  
    def show
      render json: @breed, status: 200
    end
    
    def create
      breed = Breed.new(breed_params)
      if breed.save
        render json: "breed created" , status: :created
      else
        render json: { errors: breed.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
    def update 
      if @breed.update(breed_params)
        render json: "breed updated", status: 200
      else
        render json: { errors: @breed.errors.full_messages }, status: :unprocessable_entity
      end 
    end
    
    def destroy 
      if @breed.destroy
        render json: "breed deleted", status: 200
      else
        render json: { errors: @breed.errors.full_messages }, status: :unprocessable_entity
      end 
    end
  
    private
  
    def set_breed
      @breed = Breed.find(params[:id])
    end
  
    def breed_params
      params.require(:breed).permit(:name, :description, :max_growth, :spritesheet)
    end
    
  end
  