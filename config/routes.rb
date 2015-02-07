Rails.application.routes.draw do
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

  scope '/api' do
    scope '/v1' do
      #resources :users, :accountplans, :accounts, :vouchers
      #resources :businessyears, path: '/years'
      resources :organisations, path: '/org' do
        resources :accountplans do
          resources :accounts
	end
	resources :businessyears, path: '/years' do
          resources :vouchers
        end
      end
    end
  end

#      scope '/vouchers' do
#        #get '/' => 'vouchers#index'
#        scope '/:year' do
#          get '/' => 'vouchers#index'
#	  post '/' => 'vouchers#create'
#	  scope '/:id' do
#            get '/' => 'vouchers#show'
#	    put '/' => 'vouchers#update'
#          end
#        end
#      end
#      scope '/accountplans' do
#        get '/' => 'accountplans#index'
#        post '/' => 'accountplans#create'
#        scope '/:id' do
#          get '/' => 'accountplans#show'
#	  put '/' => 'accountplans#update'
#	  scope '/:account' do
#            get '/' => 'accounts#show'
#	    put '/' => 'accounts#update'
#          end
#        end
#      end
#      scope '/businessyears' do
#        get '/' => 'businessyears#index'
#        post '/' => 'businessyears#create'
#        scope '/:id' do
#          get '/' => 'businessyears#show'
#          put '/' => 'businessyears#update'
#        end
#      end
#      scope '/users' do
#        get '/' => 'users#index'
#        post '/' => 'users#create'
#        scope '/:id' do
#          get '/' => 'users#create'
#          put '/' => 'users#update'
#        end
#      end
#
#    end
#  end

end
