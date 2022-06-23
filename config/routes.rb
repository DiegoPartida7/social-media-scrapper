Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'accounts#index'
  resources :accounts, path: 'cuentas', path_names: { new: 'nueva', edit: 'editar', update: 'actualizar', create: 'crear' } do
    get "actualizar" ,to: 'accounts#run_scrapper', as: :run_scrapper, on: :collection

  end
end
