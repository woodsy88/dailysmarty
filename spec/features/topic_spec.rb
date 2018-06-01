
require 'rails_helper'

describe 'navigate' do
  before do
    @topic = Topic.create(title: "Sports")
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit topics_path
      expect(page.status_code).to eq(200)
    end

    it 'renders the list of topics' do
      Topic.create(title: "Coding")
      visit topics_path
      expect(page).to have_content(/Sports|Coding/)
    end

    it 'each topic links to its show page' do
      visit topics_path
      expect(page).to have_link(@topic.title, href: topic_path(@topic))
    end
  end

  describe 'show' do

    it 'can be reached sucesfully' do
      visit topic_path(@topic)
      expect(page.status_code).to eq(200)
    end

  end
end