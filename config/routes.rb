Releasable::Engine.routes.draw do
  resources :releases, only: [:index, :new, :create, :edit, :update, :destroy]
end
