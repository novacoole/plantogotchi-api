require 'rails_helper'

RSpec.describe Event, type: :model do
  subject {build(:event)}
  
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:event)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:event_type) }
    it { expect(subject).to validate_presence_of(:amount) }

    context 'associations' do
      it { expect(subject).to belong_to(:plant) }
    end

  end
end
