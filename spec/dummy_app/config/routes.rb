Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  resources :authors, only: [:index, :show]
  resources :posts do
    collection do
      get :sort
    end
    member do
      get :print
    end
  end
  get "view-set-page-title", to: "welcome#view_set_page_title", as: :view_set_page_title
  get "another-route", to: "welcome#another_route", as: :another_route

  root "welcome#index"
end
