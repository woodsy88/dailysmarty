require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'creation' do
   
    before do
      @admin = FactoryGirl.create(:admin_user)
    end
   
    it 'can be created' do
      expect(@admin).to be_valid
    end
    
  end
end