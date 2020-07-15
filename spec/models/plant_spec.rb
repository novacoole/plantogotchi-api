require 'rails_helper'

RSpec.describe Plant, type: :model do
  subject {build(:plant)}
  
  context 'validations' do
    it 'has a valid factory' do
      p attributes_for(:plant)
      expect(build(:plant)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:water_level) }
    it { expect(subject).to validate_presence_of(:food_level) }
    it { expect(subject).to validate_presence_of(:breed_id) }
    it { expect(subject).to validate_presence_of(:user_id) }
    it { expect(subject).to validate_presence_of(:alive) }
    it { expect(subject).to validate_presence_of(:growth_stage) }
    it { expect(subject).to validate_length_of(:name).is_at_least(3).on(:create) }
    # it { expect(subject).to validate_numericality_of(:water_level).is_equal_to(100) }
    # it { expect(subject).to validate_numericality_of(:food_level).is_equal_to(100) }
    # it { expect(subject).to validate_numericality_of(:growth_stage).is_equal_to(1) }

  end
end