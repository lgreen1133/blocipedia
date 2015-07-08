Rails.application.routes.draw do
  resources :users do
    #/users/:id/confirm
    member do 
      get :confirm
    end 
  end
end
