Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :public_sector_special_pay_jobs, only: [:index, :show]
      resources :public_sector_jobs, only: [:index, :show]
      resources :combined_public_salaries, only: [:index, :show]
      resources :locations, only: [:index, :show]
      resources :sections, only: [:index, :show] do
        resources :private_sector_jobs, only: [:index, :show]
        resources :skills, only: [:index, :show]
      end
    end
  end
end
