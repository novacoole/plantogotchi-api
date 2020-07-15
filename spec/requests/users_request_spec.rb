require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users" do
    before(:example) do
        @first_user = create(:user)
        @last_user = create(:user)
        get '/users', headers: authenticated_header
        @json_response = JSON.parse(response.body)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  
    it 'JSON response contains the correct number of entries' do
      expect(@json_response['users'].count).to eq(3)
    end

    it 'JSON response body contains expected attributes' do
      expect(@json_response['users'][0]).to include({
        'id' => @first_user.id,
        'username' => @first_user.username,
        'email' => @first_user.email,
        'password_digest' => @first_user.password_digest,
        'bio' => @first_user.bio,
        'location' => @first_user.location,
        'admin' => @first_user.admin
      }) 
    end
  end

  describe 'POST #create' do
    context 'when the user is valid' do
      before(:example) do
        @user_params = attributes_for(:user)
        post '/sign-up', params: { user: @user_params }, headers: authenticated_header
      
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the user to the database' do
        expect(User.last.username).to eq(@user_params[:username])
      end
    end

    context 'when the user has invalid attributes' do
      before(:example) do
        @user_params = attributes_for(:user, :invalid)
        post '/sign-up', params: { user: @user_params }, headers: authenticated_header
        @json_response = JSON.parse(response.body)
      end
  
      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
  
      it 'returns the correct number of errors' do
        expect(@json_response['errors'].count).to eq(2)
      end
  
      it 'errors contains the correct message' do
        expect(@json_response['errors'][0]).to eq("Username can't be blank")
        expect(@json_response['errors'][1]).to eq("Username is too short (minimum is 3 characters)")
      end
    end
  end


  describe "GET /users/:id #show" do
    before(:example) do
      @user = create(:user)
      get "/users/#{@user.id}", headers: authenticated_header
      @json_response = JSON.parse(response.body)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'JSON response body contains expected attributes' do
      expect(@json_response).to include({
        'id' => @user.id,
        'username' => @user.username,
        'email' => @user.email,
        'password_digest' => @user.password_digest,
        'bio' => @user.bio,
        'location' => @user.location,
        'admin' => @user.admin
      }) 
    end
  end

  describe "PUT /users/:id #update" do
    before(:example) do
      @user = create(:user)
      @user_params = attributes_for(:user)
      put "/users/#{@user.id}", params: { user: @user_params }, headers: authenticated_header
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "updated user has correct attributes" do
      expect(User.find(@user.id).username).to eq(@user_params[:username])
    end

  end

  describe "DELETE /users/:id #destroy" do
    before(:example) do
      @user = create(:user)
      delete "/users/#{@user.id}", headers: authenticated_header
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "user is no longer in database" do
      expect(@user).to_not eq(nil)
    end

  end

end
