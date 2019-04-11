Rails.application.routes.draw do
  resources :comments
  devise_for :users

  resources :links do
    resources :comments
    member do
      put "like", to: 'links#upvote'
      put "dislike", to: 'links#downvote'
    end
  end

  root 'links#index'
end
