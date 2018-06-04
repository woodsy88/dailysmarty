Rails.application.routes.draw do

  resources :topics do
    scope module: :topics do
      resources :posts
    end
  end

  devise_for :users, controllers: {registrations: 'registrations'}

  root to: 'static#home'
end
