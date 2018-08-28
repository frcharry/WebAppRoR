Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "courses#index" #La página raiz será Index del controlador courses
  resources :courses # Queremos crear rutas para las CRUD
  resources :courses do
    resources :materials
  end
end
