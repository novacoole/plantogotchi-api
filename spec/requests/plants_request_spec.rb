require 'rails_helper'

RSpec.describe "Plants", type: :request do

  describe "GET /plants" do
    before(:example) do
      @user = create(:user)
      @first_plant = create(:plant, user_id: @user.id)
      @last_plant = create(:plant, user_id: @user.id)
      get '/plants', headers: authenticated_header_specific(@user.id)
      @json_response = JSON.parse(response.body)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  
    it 'JSON response contains the correct number of entries' do
      expect(@json_response.count).to eq(2)
    end

    it 'JSON response body contains expected attributes' do
      expect(@json_response[1]).to include({
        'id' => @first_plant.id,
        'name' => @first_plant.name,
        'water_level' => @first_plant.water_level,
        'food_level' => @first_plant.food_level,
        'user_id' => @first_plant.user_id,
        'alive' => @first_plant.alive,
        'growth_stage' => @first_plant.growth_stage,
      }) 
    end
  end

  describe 'POST #create' do
    context 'when the plant is valid' do
      before(:example) do
        @plant_params = attributes_for(:plant)
        @plant_params[:breed_id] = create(:breed).id
        post '/plants', params: { plant: @plant_params }, headers: authenticated_header
      
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the Plant to the database' do
        expect(Plant.last.name).to eq(@plant_params[:name])
      end
    end

    context 'when the plant has invalid attributes' do
      before(:example) do
        @plant_params = attributes_for(:plant, :invalid)
        @plant_params[:breed_id] = create(:breed).id
        post '/plants', params: { plant: @plant_params }, headers: authenticated_header
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


  describe "GET /plants/:id #show" do
    before(:example) do
      @user = create(:user)
      @plant = create(:plant, user_id: @user.id)
      get "/plants/#{@plant.id}", headers: authenticated_header_specific(@user.id)
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

  describe "GET /plants/:id #show with unauthorized user logged in" do
    before(:example) do
      @user = create(:user)
      @second_user = create(:user)
      @plant = create(:plant, user_id: @user.id)
      get "/plants/#{@plant.id}", headers: authenticated_header_specific(@second_user.id)
    end

    it "returns http unauthorized" do
      expect(response).to have_http_status(:unauthorized)
    end

  end

  describe "PUT /plants/:id #update water_level" do
    before(:example) do
      @user = create(:user)
      @plant = create(:plant, user_id: @user.id)
      @plant_params = attributes_for(:plant, :update_water)
      put "/plants/#{@plant.id}", params: {plant: @plant_params}, headers: authenticated_header_specific(@user.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "updated plant has correct attributes" do
      expect(Plant.find(@plant.id).name).to eq(@plant_params[:name])
      expect(Plant.find(@plant.id).water_level).to eq(60)
    end

    it "creates correct event for each update type" do
      expect(@plant.events.last.event_type).to eq('water')
    end

  end

  describe "PUT /plants/:id #update growth_stage" do
    before(:example) do
      @user = create(:user)
      @plant = create(:plant, user_id: @user.id)
      @plant_params = { growth_stage: 2 }
      put "/plants/#{@plant.id}", params: {plant: @plant_params}, headers: authenticated_header_specific(@user.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "updated plant has correct attributes" do
      expect(Plant.find(@plant.id).growth_stage).to eq(2)
    end

    it "creates correct event for each update type" do
      expect(@plant.events.last.event_type).to eq('growth')
    end
  end

  describe "PUT /plants/:id #update finished" do
    before(:example) do
      @user = create(:user)
      @plant = create(:plant, user_id: @user.id)
      @plant_params = @plant_params = { growth_stage: 25 }
      put "/plants/#{@plant.id}", params: {plant: @plant_params}, headers: authenticated_header_specific(@user.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "updated plant has correct attributes" do
      expect(Plant.find(@plant.id).growth_stage).to eq(25)
    end

    it "creates correct event for each update type" do
      expect(@plant.events.last.event_type).to eq('finished')
    end

  end

  describe "PUT /plants/:id #update died" do
    before(:example) do
      @user = create(:user)
      @plant = create(:plant, user_id: @user.id)
      @plant_params = @plant_params = { alive: false }
      put "/plants/#{@plant.id}", params: {plant: @plant_params} ,headers: authenticated_header_specific(@user.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "updated plant has correct attributes" do
      expect(Plant.find(@plant.id).alive).to eq(false)
    end

    it "creates correct event for each update type" do
      expect(@plant.events.last.event_type).to eq('died')
    end

  end

  describe "DELETE /plants/:id #destroy" do
    before(:example) do
      @user = create(:user)
      @plant = create(:plant, user_id: @user.id)
      delete "/plants/#{@plant.id}", headers: authenticated_header_specific(@user.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "plant is no longer in database" do
      expect(@plant).to_not eq(nil)
    end



  end

end
