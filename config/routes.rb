Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:create]
  end

  # devise_for :users

  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
