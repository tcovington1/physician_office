Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'physicians#index'

  resources :patients
  
  resources :physicians do
    resources :appointments
    # physicians can now see all the appointments, full crud actions with appointments
  end
  # can SEE appointments, but cannot CRUD 
end
