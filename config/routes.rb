LearnyApp::Application.routes.draw do

  get 'workshops/all', as: 'all_workshops'

  namespace :admin do
    concern :paginatable do
      get '(page/:page)', :action => :index, :on => :collection, :as => ''
    end
  
    resources :zones
    resources :reservations, only: [:edit, :destroy, :update, :show]
    resources :venues, :concerns => :paginatable do
      resources :reservations, :concerns => :paginatable, only: [:index, :show]
      resources :calendars, :concerns => :paginatable      
    end
    resources :workshops, :concerns => :paginatable do
       collection do
         get 'proposed(/page/:page)', :action => :proposed, :as => :proposed
         get 'scheduled(/page/:page)', :action => :scheduled, :as => :scheduled
         get 'scheduled/past(/page/:page)', :action => :scheduled_past, :as => :scheduled_past
         get 'given(/page/:page)', :action => :given, :as => :given
       end
       
       member do
         patch 'state'
       end
       
       resources :reservations, only: [:new, :create]
    end

    get '/' => 'administrators#index'
  
  end

  resources :contacts

  devise_for :students, :controllers => { :registrations => "students/registrations" }
  devise_for :experts, :controllers => { :registrations => "experts/registrations" }
  devise_for :venues, :controllers => { :registrations => "venues/registrations" }  
  devise_for :administrators

  get "/auth/:provider/callback" => "sessions#create"

  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end

  concern :replicable do
    get '(:id)', :action => :new, :on=> :new, :as => ''
  end

  resources :experts, only: [:show]
  resources :students, only: [:index, :show]
  resources :venues
  resources :venue_pictures
  resources :calendars
  resources :reservations
  resources :workshops, :concerns => [:paginatable, :replicable] do
    resources :student_surveys, only: [:new, :create]
  end
  resources :student_surveys, only: [:show]
  resources :enrollments, :concerns => :paginatable
  resources :guests, only: [:create]
  
  
  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'
  get '/faq'      => 'high_voltage/pages#show', id: 'faq'

  get '/home', to: redirect('/')
  get 'students/index'
  get 'experts/index'
  get 'venues/index'
  
  authenticated :venue do
    root to: 'venues#index', as: :venue_root
  end

  authenticated :expert do
    root to: 'experts#index', as: :expert_root
  end

  authenticated :student do
    root to: 'students#index', as: :student_root
  end
  
  authenticated :administrator do
    root to: 'admin/administrators#index', as: :administrator_root
  end
  
  unauthenticated do
    root :to => 'high_voltage/pages#show', id: 'home'
  end

end

#  devise_for :students
# root 'welcome#index'	
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
# end
