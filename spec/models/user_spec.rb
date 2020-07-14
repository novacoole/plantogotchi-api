require 'rails_helper'

RSpec.describe User, type: :model do
  subject {build(:user)}

  context 'validations' do
    it 'is valid with valid attribues' do
      expect(subject).to be_valid
    end

    it 'is not valid without a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a bio' do
      subject.bio = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a password with less than 8 characters' do
      subject.password.length = 7
      expect(subject).to_not be_valid
    end

  end
end

  