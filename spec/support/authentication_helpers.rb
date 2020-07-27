module AuthenticationHelpers
    def authenticated_header
        user = create(:user)

        token = Knock::AuthToken.new(payload: {sub: user.id}).token

        { 'Authorization': "Bearer #{token}" }
    end

    def authenticated_header_specific(id)
        token = Knock::AuthToken.new(payload: {sub: id}).token

        { 'Authorization': "Bearer #{token}" }
    end
end

RSpec.configure do |config|
    config.include AuthenticationHelpers, type: :request
end
