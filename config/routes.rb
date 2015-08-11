Rails.application.routes.draw do

  resources :wikis do 
    resources :collaborators, only: [:create, :destroy]
  end
  resources :charges, only: [:new, :create]
  resources :sessions 
  resources :users do
    member do 
      get :confirm_email
    end 
  end

  get 'about' => 'welcome#about'
  get 'downgrade' => 'users#downgrade'

  root to: 'welcome#index'
end
