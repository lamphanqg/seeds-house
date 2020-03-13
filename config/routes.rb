Rails.application.routes.draw do
  root "seeds#index"
  resources :seeds, except: :show
  resources :species
  resources :families
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
