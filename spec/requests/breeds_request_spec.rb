require 'rails_helper'

RSpec.describe "breeds", type: :request do

  describe "GET /breeds" do
    before(:example) do
        @first_breed = create(:breed)
        @last_breed = create(:breed)
        get '/breeds', headers: authenticated_header
        @json_response = JSON.parse(response.body)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  
    it 'JSON response contains the correct number of entries' do
      expect(@json_response.count).to eq(2)
    end

    it 'JSON response body contains expected attributes' do
      expect(@json_response[0]).to include({
        'name' => @first_breed.name,
        'description' => @first_breed.description,
        'max_growth' => @first_breed.max_growth,
      }) 
    end
  end

  describe 'POST #create' do
    context 'when the breed is valid' do
      before(:example) do
        @breed_params = attributes_for(:breed)
        post '/breeds', params: { breed: @breed_params }, headers: authenticated_header
      
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the breed to the database' do
        expect(Breed.last.name).to eq(@breed_params[:name])
      end
    end

    context 'when the breed has invalid attributes' do
      before(:example) do
        @breed_params = attributes_for(:breed, :invalid)
        post '/breeds', params: { breed: @breed_params }, headers: authenticated_header
        @json_response = JSON.parse(response.body)
      end
  
      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
  
      it 'returns the correct number of errors' do
        expect(@json_response['errors'].count).to eq(3)
      end
  
      it 'errors contains the correct message' do
        expect(@json_response['errors'][0]).to eq("Name can't be blank")
        expect(@json_response['errors'][1]).to eq("Description can't be blank")
        expect(@json_response['errors'][2]).to eq("Description is too short (minimum is 20 characters)")
      end
    end
  end


  describe "GET /breeds/:id #show" do
    before(:example) do
      @breed = create(:breed)
      get "/breeds/#{@breed.id}", headers: authenticated_header
      @json_response = JSON.parse(response.body)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'JSON response body contains expected attributes' do
      expect(@json_response).to include({
        'name' => @breed.name,
        'description' => @breed.description,
        'max_growth' => @breed.max_growth,
      }) 
    end
  end

  describe "PUT /breeds/:id #update" do
    before(:example) do
      @breed = create(:breed)
      @breed_params = attributes_for(:breed)
      put "/breeds/#{@breed.id}", params: { breed: @breed_params }, headers: authenticated_header
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "updated breed has correct attributes" do
      expect(Breed.find(@breed.id).name).to eq(@breed_params[:name])
    end

  end

  describe "DELETE /breeds/:id #destroy" do
    before(:example) do
      @breed = create(:breed)
      delete "/breeds/#{@breed.id}", headers: authenticated_header
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "breed is no longer in database" do
      expect(@breed).to_not eq(nil)
    end

  end

end
