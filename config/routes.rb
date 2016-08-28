Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :blogs do
    resources :comments
    
    collection do
      post :confirm
    end
  end

  post 'blogs/new' => 'blogs#new'

  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end

  post 'contacts/new' => 'contacts#new'

  root 'top#index'
end
