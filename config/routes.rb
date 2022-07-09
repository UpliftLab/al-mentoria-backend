Rails.application.routes.draw do
  resources :reservations, only: %i[index create destroy]
  resources :mentor_topics
  resources :topics, only: %i[index create destroy]
  resources :mentors, only: %i[index show create destroy] do
    resources :mentor_topics, path: 'topics', only: %i[index create destroy]
  end
  devise_for :users,
    controllers: {
      registrations: :registrations,
      sessions: :sessions
    }

  root 'mentors#index'
end
