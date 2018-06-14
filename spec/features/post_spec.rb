require 'rails_helper'

describe 'post' do
  before do
    @topic = FactoryGirl.create(:topic_with_posts)
  end

  describe 'nested route' do
    before do
      visit topic_posts_path(topic_id: @topic)
    end

    it 'has an index page properly nested under a topic' do
      expect(page.status_code).to eq(200)
    end

    it 'renders multiple posts' do
      expect(@topic.posts.count).to eq(2)
    end

    it 'has the post title' do
      expect(page).to have_content('My Great Post')
    end

    it 'has the post description' do
      expect(page).to have_content('Amazing content')
    end

    it 'has the post user name' do
      expect(page).to have_content(@topic.posts.last.user.username)
    end

    it 'has post links that point to post show pages' do
      expect(page).to have_link(@topic.posts.last.title, href: topic_post_path(topic_id: @topic, id: @topic.posts.last))
    end
  end

  describe 'creation' do
    before do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit new_post_path
    end

    it 'should allow a post to be created from the form page and redirect to the show page' do
      fill_in 'post[title]', with: "Houston Astros"
      fill_in 'post[content]', with: "Are going all the way"
      find_field("post[topic_id]").find("option[value='#{@topic.id}']").click

      click_on "Save"

      expect(page).to have_css("h1", text: "Houston Astros")
    end

    it 'should automatically have a topic selected if clicked on new post from the topic page' do
      visit new_post_path(topic_id: @topic.id)

      fill_in 'post[title]', with: "Houston Astros"
      fill_in 'post[content]', with: "Are going all the way"

      click_on "Save"

      expect(page).to have_content("Sports")      
    end

    it 'should have a user associated with the post' do
      visit new_post_path

      fill_in 'post[title]', with: "Houston Astros"
      fill_in 'post[content]', with: "Are going all the way"
      find_field("post[topic_id]").find("option[value='#{@topic.id}']").click

      click_on "Save"

      expect(page).to have_content("Jon Snow")
    end 

    it 'only lets signed in users view the new form' do
      # Using the Warden logout method
      logout(:user)
      visit new_post_path
      # current_path method from Capybara
      expect(current_path).to eq(new_user_session_path)
    end

    

  end

  describe 'editing' do
    before do
      user = FactoryGirl.create(:user)
      @second_user = FactoryGirl.create(:second_user)
      login_as(user, :scope => :user)

      @post = Post.create(title: "starter title", content: "starter content", topic_id: @topic.id, user_id: user.id)

      visit edit_topic_post_path(topic_id: @topic.id, id: @post.id)
    end

    it 'allows a user to edit a post they created' do
      fill_in 'post[title]', with: "Baseball Stats"

      click_on "Save"

      expect(page).to have_content("Baseball Stats")
    end

    it 'does not allow a user to edit a post they did not create' do
      logout(:user)
      login_as(@second_user, :scope => :user)
      visit edit_topic_post_path(topic_id: @topic.id, id: @post.id)
      # expect current path to equal the post show page
      expect(current_path).to eq(topic_post_path(topic_id: @topic.id, id: @post.id))
    end

    it 'does not allow a user to access the edit page if they are not signed in' do
      logout(:user)
      visit edit_topic_post_path(topic_id: @topic.id, id: @post.id)

      expect(current_path).to eq(new_user_session_path)
    end


  end  
end