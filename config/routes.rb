Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}

	devise_scope :user do
		post "/users/sessions/verify_otp" => "users/sessions#verify_otp"
	end

	post 'two_factor/disable', :to => 'two_factor#disable'
	get 'two_factor/activate', :to => 'two_factor#activate'
	get 'two_factor/deactivate', :to => 'two_factor#deactivate'
	root to: 'home#index'
	get 'remember_me/remember', :to => 'remember_me#remember'
	get 'remember_me/forget', :to => 'remember_me#forget'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
