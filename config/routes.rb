Rails.application.routes.draw do

  devise_for :users, path: "user", path_names: {
    sign_in:      'login',
    sign_out:     'logout',
    password:     'secret',
    confirmation: 'verification',
    unlock:       'unblock',
    registration: 'register',
    sign_up:      'registration'
  }

  namespace :website do
    get 'index'
  end

  get    'apartment/new'        => 'apartment#new',    as: :apartment_new
  get    'apartment/list'       => 'apartment#list',   as: :apartment_list
  post   'apartment/create'     => 'apartment#create', as: :apartment_create
  get    'apartment/:id'        => 'apartment#show',   as: :apartment_show
  get    'apartment/edit/:id'   => 'apartment#edit',   as: :apartment_edit
  put    'apartment/update/:id' => 'apartment#update', as: :apartment_update
  delete 'apartment/delete/:id' => 'apartment#delete', as: :apartment_delete

  get 'profile' => 'user#index', as: :profile

  root 'website#index'
  # get 'sentence/index'

  # post 'sentence/create'

  # post 'sentence/add_comment'
  # get 'sentence/new'
  # get 'sentence/:tag' => 'sentence#index', as: :sentence

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
end
