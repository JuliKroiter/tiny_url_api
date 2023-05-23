Rails.application.routes.draw do
  resources :tiny_urls, only: [:create, :show] do
    member do
      get :stats
    end
  end
end
