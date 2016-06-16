Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :private_sector_jobs, except: [:new, :edit]
      resources :public_sector_special_pay_jobs, except: [:new, :edit]
      resources :public_sector_jobs, except: [:new, :edit]
      resources :locations, except: [:new, :edit]
      resources :skills, except: [:new, :edit]
      resources :sections, except: [:new, :edit]
    end
  end
end
