Rails.application.routes.draw do

  root 'questions#index'

  # concern :votable do
  #   resources :votes, only: [:create, :new, :destroy, :update]
  # end
  # resources :questions, concerns: :votable

  # resources :answers, concerns: :votable
  # resources :answer_comments, concerns: :votable
  # resources :question_comments, concerns: :votable

  resources :questions, :answer_comments, :question_comments, :answers


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'index' => 'questions#index'

  get 'votes/show', to: 'votes#show'
  post 'votes/create', to: 'votes#create'

  get 'questions/:id/upvote', to: 'questions#upvote', as: 'question_up'
  get 'questions/:id/downvote', to: 'questions#downvote', as: 'question_down'

  get 'answers/:id/upvote', to: 'answers#upvote', as: 'answer_up'
  get 'answers/:id/downvote', to: 'answers#downvote', as: 'answer_down'

  get 'answer_comments/:id/upvote', to: 'comments#upvote', as: 'answer_comment_up'
  get 'answer_comments/:id/downvote', to: 'comments#downvote', as: 'answer_comment_down'

  get 'question_comments/:id/upvote', to: 'comments#upvote', as: 'question_comment_up'
  get 'question_comments/:id/downvote', to: 'comments#downvote', as: 'question_comment_down'


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
