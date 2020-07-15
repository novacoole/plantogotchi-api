require 'rails_helper'

RSpec.describe Breed, type: :model do
  subject {build(:breed)}

  context 'validations' do
    it 'has a valid factory' do
      expect(build(:breed)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
    it { expect(subject).to validate_presence_of(:max_growth) }
    it { expect(subject).to validate_length_of(:description).is_at_least(20).on(:create) }
    it { expect(subject).to validate_numericality_of(:max_growth).is_greater_than(10) }

  end
end
