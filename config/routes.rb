Rails.application.routes.draw do

  resources :wikis
  resources :charges, only: [:new, :create]
  resources :sessions 
  resources :users do
    #/users/:id/confirm
    member do 
      get :confirm_email
    end 
  end

  get 'about' => 'welcome#about'
  get 'downgrade' => 'users#downgrade'

  root to: 'welcome#index'
end
