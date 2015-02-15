Rails.application.routes.draw do
  match '*path', to: 'base_api#handle_options_request', via: :options

  root 'about#index'

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
