Rails.application.routes.draw do
  resources :usuarios
    root 'welcome#index'
    get 'contacto/contact'
    get 'admin/login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
