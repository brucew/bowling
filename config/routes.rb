Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :game, only: [:index, :show, :new]

  root to: 'games#index'

  # Match any other path to a 404 in production
  match '*path', via: :all, to: proc {[404, {}, ['']]} if Rails.env.production?
  match '', via: :all, to: proc {[404, {}, ['']]} if Rails.env.production?
end
