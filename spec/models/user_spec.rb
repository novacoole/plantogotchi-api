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

    it 'is not valid without a password' do
      subject.password = nil
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

    it 'is not valid with a username with less than 3 characters' do
      subject.username = 'us'
      expect(subject).to_not be_valid
    end

    it 'is not valid with a password with less than 8 characters' do
      subject.password = 'invalid'
      expect(subject).to_not be_valid
    end

    it 'is not valid with an email without @ symbol' do
      subject.email = 'emailatemail.com'
      expect(subject).to_not be_valid
    end


    it 'is not valid with an email without .com' do
      subject.email = 'emailatemailcom'
      expect(subject).to_not be_valid
    end

  end
end

  