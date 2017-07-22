Rails.application.routes.draw do
  default_url_options :host => "example.com"
  devise_for :users
  devise_scope :user do
    root "devise/sessions#new"
  end


  resources :users
end
