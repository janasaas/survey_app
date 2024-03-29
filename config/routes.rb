SurveyApp::Application.routes.draw do
  api_version(:module => "V2", :path => {:value => "v2"}, :defaults => {:format => "json"}) do
  end
  api_version(:module => "V1", :path => {:value => "v1"}, :defaults => {:format => "json"}) do
    get 'surveys/:id/questions' => 'surveys#questions'
    get 'surveys/list' => 'surveys#list'
    post 'surveys/:id/answers' => 'surveys#answers'
  end
  devise_for :users
  root :to => 'home#user'
  match '/dash',    to: 'home#dash',    via: 'get'
  match '/start',    to: 'home#start',    via: 'get'
  resources :mcq4s, only: [:create]
  resources :ynqs, only: [:create]
  match '/questions/new',    to: 'questions#new',    via: 'get'
  match '/questions/show',    to: 'questions#show',    via: 'get'
  resources :surveys, only: [:new, :create]
  post 'questions/answers' => 'questions#answers'
  #match '/mcq4s/show', to:'mcq4s#show', via:'get'
 
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
