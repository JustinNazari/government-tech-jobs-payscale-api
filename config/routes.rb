Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :private_sector_jobs
      resources :public_sector_jobs
      resources :locations
    end
end
