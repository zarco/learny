LearnyApp::Application.routes.draw do

  namespace :admin do
    concern :paginatable do
      get '(page/:page)', :action => :index, :on => :collection, :as => ''
    end
  
  
    resources :zones
    resources :venues do
      resources :reservations
      resources :calendars      
    end
    resources :workshops, :concerns => :paginatable do
       collection do
         get :proposed
         get 'proposed/page/:page', :action => :proposed
       end
    end
  
  
  end

  resources :contacts

  devise_for :students, :controllers => { :registrations => "students/registrations" }
  devise_for :experts, :controllers => { :registrations => "experts/registrations" }
  devise_for :venues, :controllers => { :registrations => "venues/registrations" }  
  devise_for :administrators

  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end

  resources :experts, only: [:show]
  resources :students, only: [:index, :show]
  resources :venues
  resources :venue_pictures
  resources :calendars
  resources :reservations
  resources :workshops, :concerns => :paginatable
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
  get 'administrators/index'
  
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
    root to: 'administrators#index', as: :administrator_root
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
