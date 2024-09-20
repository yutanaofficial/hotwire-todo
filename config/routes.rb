Rails.application.routes.draw do
  resources :todos do
    collection do
      delete 'destroy_all'
    end
    patch :change_status, on: :member
  end
  root "todos#index"
  
end
