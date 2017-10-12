require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow", username: "watcheronthewall")
    end

    it 'should be able to be created if valid' do
      expect(@user).to be_valid
    end

    it 'should have a default role of: student' do
      expect(@user.role).to eq('student')
    end

    describe 'validations' do
      it 'should not be valid without a first name' do
        @user.first_name = nil
        expect(@user).to_not be_valid
      end

      it 'should not be valid without a last name' do
        @user.last_name = nil
        expect(@user).to_not be_valid
      end

      it 'should not be valid without a username' do
        @user.username = nil
        expect(@user).to_not be_valid
      end

      it 'should ensure that all usernames are unique' do
		  duplicate_username_user = User.create(email: "test2@test.com", password: "password", password_confirmation: "password", first_name: "Joni", last_name: "Snowy", username: "watcheronthewall")
		  expect(duplicate_username_user).to_not be_valid
		end

		it 'should ensure that usernames do not allow special characters' do
		  @user.username = "*#*(@!"
		  expect(@user).to_not be_valid
		end
    end
  end
end