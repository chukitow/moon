Moon::Engine.routes.draw do
  namespace :admin do
    resources :products,   except: [:show] do
      resources :images,   except: [:show]
      resources :variants, except: [:show]
    end

    resources :option_types, except: [:show]
  end

  resources :products, only: [:index, :show]
end
