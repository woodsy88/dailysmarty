FactoryGirl.define do
  factory :post do
    title 'My Great Post'
    content 'Amazing content'
    topic
    user
  end

  factory :second_post, class: 'Post' do
    title 'Another Guide'
    content 'Killer post'
    topic
    user
  end
end