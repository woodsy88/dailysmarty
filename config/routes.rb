Rails.application.routes.draw do

  resources :topics, except: [:show] do
    scope module: :topics do
      resources :posts, except: [:new, :create]
    end
  end

# posts new action nested in topics       #new_post_path
  get 'posts/new', to: 'topics/posts#new', as: 'new_post' 
 # posts create action nested in topics        #create_post_path
  post 'posts', to: 'topics/posts#create', as: 'create_post' 

  devise_for :users, controllers: {registrations: 'registrations'}

  root to: 'static#home'
end
