Railsbridge::Application.routes.draw do
  get "replies/create"
  root 'home#index'
  get 'post/new', as: :new_post
  post '/posts', to: 'post#create'
  get '/posts/user/', to: 'post#index', as: :user_posts
  # get '/posts', to: 'post#index'
  get '/post/:id', to: 'post#show', as: :show_post
  get 'posts/all', to: 'post#all', as: :show_all_posts
  post 'posts/:post_id/replies', to: 'replies#create', as: :post_replies
  get 'posts/:post_id/replies', to: "post#show"
  delete 'post/:post_id/replies/:id', to: 'replies#destroy', as: :delete_reply
  get 'posts/:id/edit', to: 'post#edit', as: :edit_post
  patch 'posts/:id', to: 'post#update', as: :post
  delete '/post/:id', to: 'post#destroy', as: :delete_post
  # resources :posts, only: {:index, :show, :new}
  get '/posts/:post_id/vote_up', to: 'votes#vote_up', as: :vote_up_post
  get '/posts/:post_id/vote_down', to: 'votes#vote_down', as: :vote_down_post
  devise_for :users

  # devise_for :users, path: 'auth', path_names: {sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification'}
  

  devise_scope :user do
    get 'users/logout', to: 'devise/sessions#destroy', as: :user_logout

  end
  
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
end
