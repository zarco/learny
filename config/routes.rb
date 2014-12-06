LearnyApp::Application.routes.draw do
  
  get 'administrators/index'

  resources :enrollments

  get 'students/index'
  resources :calendars
  resources :reservations

  get 'venues/index'

  resources :workshops
  devise_for :students
  devise_for :experts
  devise_for :venues, :controllers => { :registrations => "venues/registrations" }
  devise_for :administrators
  
  
  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'

  get '/home', to: redirect('/')

  get 'experts/index'


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
