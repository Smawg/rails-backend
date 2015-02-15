Rails.application.routes.draw do
  match '*path', to: 'base_api#handle_options_request', via: :options

  root 'about#index'

  scope '/api' do
    scope '/v1' do
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
end
