Rails.application.routes.draw do
  resources :reservations, only: %i[index create destroy]
  resources :mentor_topics
  resources :topics
  resources :mentors
  devise_for :users, 
    controllers: {
      registrations: :registrations,
      sessions: :sessions
    }
end
