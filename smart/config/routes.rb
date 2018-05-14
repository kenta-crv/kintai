Rails.application.routes.draw do

  devise_for :users

  
  root to: "home#index"
  resources :home
  root 'home#index'

    #就業規則情報
  resources :rules
  root 'rules#index'
  
    #会社基本情報・助成金作成情報
  resources :managements
  root 'managements#index'

    #各従業員情報・雇用契約書情報
  resources :workers
  root 'workers#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
