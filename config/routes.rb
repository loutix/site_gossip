Rails.application.routes.draw do
 
  
	get '/team', to: 'static_pages#team', as: 'team'

	get '/contact', to: 'static_pages#contact', as: 'contact'

	resources :gossips

	resources :users

	resources :cities

	resources :sessions
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
