Rails.application.routes.draw do
  get 'bienvenidos/hello'
  devise_for :users
  root to: "posts#index"
  resources :posts
  resources :pages
  resources :bienvenidos
  # If you have a dedicated config/environments/staging.rb
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.staging?

  # If you use RAILS_ENV=production in staging environments, you'll need another
  # way to disable it in "real production"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" unless ENV["PRODUCTION_FOR_REAL"]
end
