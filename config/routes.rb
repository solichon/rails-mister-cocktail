Rails.application.routes.draw do

  get 'cocktails/index'

  get 'cocktails/show'

  get 'cocktails/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: :create
  end
  resources :doses, only: :destroy
end
