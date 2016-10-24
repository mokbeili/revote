Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :voters, only: [:new, :create, :edit, :update]

  resources :votes, only: [:new, :create] do
    post :av_vote, on: :collection
  end

  get '/goodbye', to: 'welcome#goodbye', as: 'goodbye'
  get '/redo', to: 'votes#redo', as: 'redo'

  root 'welcome#index'
end
