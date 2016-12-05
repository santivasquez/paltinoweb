Rails.application.routes.draw do
  resources :usuarios
    root 'welcome#index'
    get 'contacto/contact'
    get 'admin/login'
    get 'admin/inicio'
    get 'welcome/catalogo'
    get 'welcome/diseno'
    get 'welcome/planta'
    get 'welcome/lavanderia'
    get 'welcome/corte'
    get 'welcome/terminacion'
    post 'autenticar/' => 'admin#autenticar', as: 'login'
    delete 'cerrar_sesion/' => 'admin#cerrar_sesion', as: 'cerrar_sesion'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
