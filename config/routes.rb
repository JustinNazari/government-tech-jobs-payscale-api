Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :salaries do
        resources :public do
          resources :general, except: [:new, :edit]
          resources :special, except: [:new, :edit]
        end

        resources :private do
          resources :categories, except: [:new, :edit] do
            resources :positions, except: [:new, :edit]
            resources :skills, except: [:new, :edit]
          end
        end
        resources :locations, except: [:new, :edit]
      end
    end
  end
end
