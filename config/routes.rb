Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  
  resources :reservations, only: %i[index create destroy]
  resources :topics, only: %i[index create destroy]
  resources :mentors, only: %i[index show create destroy] do
    resources :mentor_topics, path: "topics", only: %i[index create destroy]
  end
  get 'users/me'

  devise_for :users,
    controllers: {
      registrations: :registrations,
      sessions: :sessions,
    }

  root "mentors#index"
end
