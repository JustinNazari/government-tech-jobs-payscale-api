Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :salaries, only: [:index] do
        namespace :public do
          resources :general, only: [:index] # belongs to all
          resources :special, only: [:index] # belongs to all
        end
        namespace :private do
          resources :categories, only: [:index] do # belongs to all
            resources :positions, only: [:index]
            resources :skills, only: [:index]
          end
        end
      end
      resources :locations, only: [:index] do
      #   resources :all_salaries, only: [:index]
      # end
    end
  end
end
