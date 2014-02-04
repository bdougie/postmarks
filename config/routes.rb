Postmarks::Application.routes.draw do
  get 'signup' => 'users#new' 
  get 'login' => 'sessions#new' 
  get 'logout' => 'sessions#destroy'

  get 'about' => 'welcome#about'

  resources :users


  get 'tags/:tag', to: 'bookmarks#index', as: :tag
  resources :bookmarks, only: [:index, :create, :show, :update, :destroy, :edit]

  root :to => 'welcome#index' 

  

   

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

end
