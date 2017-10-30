Rails.application.routes.draw do
  # default_url_options :host => "example.com"
  devise_for :users
  devise_scope :user do
    root 'devise/sessions#new'
  end
  resources :users
  resources :request_approvals
  post '/request_approvals/:id/approve', to: 'request_approvals#approve'
end
