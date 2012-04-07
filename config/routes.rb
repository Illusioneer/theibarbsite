Theibarb::Application.routes.draw do
  get "index/show"

  get "index/new"

  get "index/edit"

  get "index/create"

  get "index/update"

  get "index/destroy"

  resources :articles do
    resources :comments 
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
  # match ':controller(/:action(/:id(.:format)))'
  
  root :to => 'articles#index'

  resources :users do
    resources :authorizations
  end
  
  resources :admin

  class GeoRestricter
    def self.matches?(request)      
      geo = GeoIP.new('/usr/local/bin/GeoIP.dat')
      geo.country(request.ip).country_name == "United States"
    end
  end    
  
  constraints GeoRestricter do
    match "/hello" => proc { |env| [200, {}, ["Hello Rack!"]] }
    match "/art/:id" => redirect("/articles/%{id}")
  end
  #, :only => [ :show, :edit, :update ]

  ArticlUrl = "/#{Article.all.first.name}/:id"
  FarticleUrl = "articles#show"

  match ArticlUrl => FarticleUrl
  NameMatch = Article.first.name

  match '/auth/:provider/callback' => 'sessions#create'

  match '/signin' => 'sessions#new', :as => :signin

  match '/signout' => 'sessions#destroy', :as => :signout

  match '/auth/failure' => 'sessions#failure'
  
end
