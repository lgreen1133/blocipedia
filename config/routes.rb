Rails.application.routes.draw do

  resources :wikis
  resources :sessions 
  resources :users do
    #/users/:id/confirm
    member do 
      get :confirm_email
    end 
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
