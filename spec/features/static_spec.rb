require 'rails_helper'

describe 'homepage' do
  before do
    @topic = FactoryGirl.create(:topic)
    FactoryGirl.create(:second_topic)
    FactoryGirl.create(:post)
    FactoryGirl.create(:second_post)
    visit root_path
  end

  describe 'navigate' do
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end
  end

  describe 'content' do
    it 'has a list of topics' do
      expect(page).to have_content("Sports")
      expect(page).to have_content("Coding")
    end

    it 'shows the most recent posts' do
      expect(page).to have_content("My Great Post")
      expect(page).to have_content("Another Guide")
    end
  end

  describe 'links' do
    it 'has topics that link to their pages' do
      expect(page).to have_link(@topic.title, href: topic_path(@topic))
    end
  end

  describe 'header' do
    
    it 'has a header that displays the users name' do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit root_path

      expect(page).to have_content("Jon Snow")
    end

    it 'displays a welcome message to guest users' do
      expect(page).to have_content("Guest")
    end
    
  end

end