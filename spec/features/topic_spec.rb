
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

    before do 
      visit topic_path(@topic)
    end

    it 'can be reached sucesfully' do
      expect(page.status_code).to eq(200)
    end

    it 'should display the topic title' do
      expect(page).to have_css('h1', text: 'Sports')
      # have_css matcher that not only looks for the content, 
      # but also ensure it is inside of an HTML <h1> header tag
    end

    it 'should have a url that matches the custom url slug' do
      expect(current_path).to have_content('sports')
    end    

  end
end