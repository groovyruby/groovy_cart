GroovyCart::Application.routes.draw do

  devise_for :admins

  resources :surveys, :except=>[:edit, :update, :destroy]

  get 'account', :as=>:my_account, :controller=>"account", :action=>"index"
  get 'account/order_history', :as=>:order_history
  get 'account/order_details/:id', :as=>:order_details, :to=>"account#order_details"

  devise_for :customers

  get "payment_gateway/success"

  get "payment_gateway/failure"

  resource :order, :except=>[:destroy] do
    member do
      post 'confirm'
      get 'confirmed'

    end
  end

  resources :pages, :only=>[:show]

  resources :banners

  resource :cart do
    member do
      post 'add_product_to'
      get 'create_order'
    end
  end

  resources :brands, :only=>[:index, :show]
  
  resources :products, :only=>[:index, :show]
  
  resources :categories, :only=>[:index, :show]

  get "home/index"

 
  namespace :admin do
    resources :admins
    resources :banner_types
    resources :banner_placements
    resources :banners
    resources :brands
    resources :categories
    resources :option_groups
    resources :orders do
      member do
        get :change_state
      end
    end
    resources :pages
    resources :payment_gateways
    resources :product_types
    resources :products do
      collection do
        post :create_photo
      end
    end
    resource :setting
    resources :shipping_methods
    resources :survey_models do
      resources :surveys, :only=>[:show, :index, :destroy]
      member do
        get 'statistics'
      end
    end
    root :to=>"dashboard#index"
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))', :controller => /gateways\/[^\/]+/
end
