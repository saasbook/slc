Rails.application.routes.draw do
 
  devise_for :admins, controllers: { registrations: "registrations" }
  devise_for :tutees, controllers: { registrations: "registrations" }
  devise_for :tutors, controllers: { registrations: "registrations" }
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  
  resources :tutors
  resources :tutees
  resources :admins
  get '/tutees/:id/tutor_match', to: 'tutees#tutor_match', as: 'tutor_match'
  get '/tutors/:id/tutee_match', to: 'tutors#tutee_match', as: 'tutee_match'
  get '/login', to: 'pages#login'
  get '/admins/tutees/:id/edit_match', to: 'admins#edit_match', as: 'edit_match'
  get '/admins/1/tutees/:tutee/tutors/:tutor/assign', to: 'admins#assign', as: 'assign'
  get '/admins/1/tutors/:id/delete_tutor', to: 'admins#delete_tutor', as: 'delete_tutor'
  get '/admins/1/tutees/:id/delete_tutee', to: 'admins#delete_tutee', as: 'delete_tutee'
  get '/admins/1/destroy_tutors', to: 'admins#destroy_tutors', as: 'destroy_tutors'
  get '/admins/1/destroy_tutees', to: 'admins#destroy_tutees', as: 'destroy_tutees'
  get '/admins/1/export_tutors', to: 'admins#export_tutors', as: 'export_tutors'
  get '/admins/1/tutee_sid', to: 'admins#tutee_sid', as: 'tutee_sid'
  get '/admins/1/tutee_sid_submit', to: 'admins#tutee_sid_submit', as: 'tutee_sid_submit'
  get '/admins/1/tutor_sid', to: 'admins#tutor_sid', as: 'tutor_sid'
  get '/admins/1/tutor_sid_submit', to: 'admins#tutor_sid_submit', as: 'tutor_sid_submit'



  root to: 'pages#home'
  
  
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
