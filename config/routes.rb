Rails.application.routes.draw do
  root 'sub_tasks#index'

  resources :sprints do
    member do
      get 'set_as_current'
    end  
  end
  resources :time_tables do
    collection do
      get "weekdays"
      get "weekends"
    end
  end  
  resources :punches
  resources :sub_tasks do
    collection do
      get 'sync_default_for_today'
    end
  end  
  resources :tasks
end
