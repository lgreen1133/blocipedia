Rails.application.routes.draw do

  resources :sessions 
  resources :users do
    #/users/:id/confirm
    member do 
      get :confirm_email
    end 
  end

  get 'welcome/index'
  get 'welcome/about'
  # get 'about' => 'welcome#about'
  # get 'index' => 'welcome#index'

  root to: 'welcome#index'
end
