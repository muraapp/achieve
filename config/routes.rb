Rails.application.routes.draw do


  resources :tasks
  

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

  resources :users, only: [:index] do
    resources :tasks
    resources :submit_requests , shallow: true do
      get 'approve'
      get 'unapprove'
      get 'reject'
      collection do
        get 'inbox'
      end
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end
end
