Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}

	devise_scope :user do
		post "/users/sessions/verify_otp" => "users/sessions#verify_otp"
	end

	post 'switch/disable', :to => 'switch#disable'
	get 'switch/activate', :to => 'switch#activate'
	get 'switch/deactivate', :to => 'switch#deactivate'
	root to: 'home#index'
	get 'remember/activate', :to => 'remember#activate'
	get 'remember/deactivate', :to => 'remember#deactivate'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
