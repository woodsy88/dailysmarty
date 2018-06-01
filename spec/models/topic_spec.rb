# spec/models/topic_spec.rb

require 'rails_helper'

RSpec.describe Topic, type: :model do
  before do
    @topic = Topic.create(title: "Sports")
  end

	describe 'validations' do
	    it 'cannot be created without a title' do
	      @topic.title = nil
	      expect(@topic).to_not be_valid
	    end

	  #  it 'cannot be created without a slug' do
	  #     @topic.slug = nil
	  #    expect(@topic).to_not be_valid
	  #  end
	  # end


  
	describe 'callbacks' do
	  it 'automatically sets the slug value even with a nil value submitted' do
	    expect(@topic.slug).to_not eq(nil)
	  end
	end
end