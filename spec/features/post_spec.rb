# spec/features/post_spec.rb

require 'rails_helper'

describe 'post' do
  before do
    @topic = Topic.create(title: "Sports")
  end

  describe 'nested route' do
    it 'has an index page properly nested under a topic' do
      visit topic_posts_path(topic_id: @topic)
      expect(page.status_code).to eq(200)
    end
  end
end