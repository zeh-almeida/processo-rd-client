Rails.application.routes.draw do
  resources :visitors, only: [:new, :create]

  resources :pages, only: [:index]
  get "about"   => "pages#about",   as: :about
  get "contact" => "pages#contact", as: :contact
  get "pricing" => "pages#pricing", as: :pricing

  root 'pages#index'
end
