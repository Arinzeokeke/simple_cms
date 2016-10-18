Rails.application.routes.draw do
  #resources :demo
  root 'demo#index'
  get 'demo/index'
  get 'demo/hello'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
