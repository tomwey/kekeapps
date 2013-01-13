Kekeapps::Application.routes.draw do

  namespace :cpanel do resources :news end

  namespace :api do
    namespace :v1 do
      resources :app_infos, :only => :index, :format => :json
      resources :news_blasts, :only => :index, :format => :json
      # match '/apple_id/:bundle_id' => 'news_blasts#index', via: :get
      resources :feedbacks, :only => :create
    end
  end
  
  devise_for :users, :path => "account", :path_names => { :sign_in => 'login', 
                                                          :sign_out => 'logout'
                                                        },
                                         :controllers => {
                                           :sessions => "sessions",
                                           :registrations => "registrations"
                                         }
  
  root :to => redirect('/account/login')
  
  get '/info/apple_id' => 'app_infos#apple_id'
  
  namespace :cpanel do
    root :to => 'home#index'
    resources :app_infos
    
    resources :api_keys, :only => [:create, :update]
    
    match 'api_keys/latest' => 'api_keys#show', as: :latest_api_key, via: :get
    get 'update_access_token' => 'api_keys#update_access_token', as: :update_access_token
    
    resources :news_blasts
    resources :feedbacks, :only => [:index, :show]
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
