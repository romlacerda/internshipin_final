Rails.application.routes.draw do
  resources :projects do
  	get "projetos" => "projects#index"
  end
  resources :topics do
  	member do
  		get :close
  	end
  end	
  resources :subcategories
  resources :categories
  resources :answers
  	devise_for :users
	devise_scope :user do
		root :to => "devise/sessions#new"
		   get "login", to: "devise/sessions#new"
		   get "logout", to: "devise/sessions#destroy"
		   get "perfil/alterar" => "devise/registrations#edit", as: "perfil_edit_path"

	end
	get "dashboard/perfil" => "users#show"
	get "dashboard" => "dashboard#index", :as => :dashboard
	get "dashboard/topico/:id" => "dashboard#topic", :as => :show_topic_dashboard

	#perfil put "perfil" => "devise/registrations#edit"
end
