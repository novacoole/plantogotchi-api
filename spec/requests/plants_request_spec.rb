require 'rails_helper'

RSpec.describe "Plants", type: :request do

  describe "GET /index" do
    before(:example) do
      @first_plant = create(:plant)
      @last_plant = create(:plant)
      get '/plants'
      @json_response = JSON.parse(response.body)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  
    it 'JSON response contains the correct number of entries' do
      expect(@json_response['plants'].count).to eq(2)
    end

    it 'JSON response body contains expected attributes' do
      expect(@json_response['plants'][0]).to include({
        'id' => @first_plant.id,
        'name' => @first_plant.name,
        'water_level' => @first_plant.water_level,
        'food_level' => @first_plant.food_level,
        'breed_id' => @first_plant.breed_id,
        'user_id' => @first_plant.user_id,
        'alive' => @first_plant.alive,
        'growth_stage' => @first_plant.growth_stage,
      }) 
    end
  end

  describe 'POST #create' do
    context 'when the plant is valid' do
      before(:example) do
        @plant_params = FactoryBot.create(:plant).attributes.except('id', 'created_at', 'updated_at')
        post '/plants', params: { plant: @plant_params }
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the Plant to the database' do
        expect(Plant.last.name).to eq(@plant_params["name"])
      end
    end

    context 'when the plant has invalid attributes' do
      before(:example) do
        plant = FactoryBot.create(:plant).attributes.except('id', 'created_at', 'updated_at')
        plant[:name] = nil
        @plant_params = plant
        post '/plants', params: { plant: @plant_params }
        @json_response = JSON.parse(response.body)
      end
  
      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
  
      it 'returns the correct number of errors' do
        expect(@json_response['errors'].count).to eq(2)
      end
  
      it 'errors contains the correct message' do
        expect(@json_response['errors'][0]).to eq("Name can't be blank")
        expect(@json_response['errors'][1]).to eq("Name is too short (minimum is 3 characters)")
      end
    end
  end


  describe "GET /index/:id #show" do
    before(:example) do
      @plant = create(:plant)
      @plant_params = FactoryBot.create(:plant).attributes.except('id', 'created_at', 'updated_at')
      get "/plants/#{@plant.id}"
      @json_response = JSON.parse(response.body)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'JSON response body contains expected attributes' do
      expect(@json_response).to include({
        'id' => @plant.id,
        'name' => @plant.name,
        'water_level' => @plant.water_level,
        'food_level' => @plant.food_level,
        'breed_id' => @plant.breed_id,
        'user_id' => @plant.user_id,
        'alive' => @plant.alive,
        'growth_stage' => @plant.growth_stage,
      }) 
    end
  end

  describe "PUT /index/:id #update" do
    before(:example) do
      @plant = create(:plant)
      @plant_params = FactoryBot.create(:plant).attributes.except('id', 'created_at', 'updated_at')
      put "/plants/#{@plant.id}", params: { plant: @plant_params }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "updated plant has correct attributes" do
      expect(Plant.find(@plant.id).name).to eq(@plant_params["name"])
    end

  end

  describe "DELETE /index/:id #destroy" do
    before(:example) do
      @plant = create(:plant)
      delete "/plants/#{@plant.id}"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "plant is no longer in database" do
      expect(@plant).to_not eq(nil)
    end

  end

end
