Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  resources :users do
    #/users/:id/confirm
    member do 
      get :confirm
    end 
  end

  root to: 'welcome#index'
end
