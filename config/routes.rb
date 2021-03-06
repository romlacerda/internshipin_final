Rails.application.routes.draw do
  resources :submissions
  resources :submissions
  resources :universidades
  resources :projects do
    get "projetos" => "projects#index"
    member do
      get :close
    end
  end
  resources :topics do
    member do
      get :close
    end
  end 
  resources :subcategories

  resources :categories
  resources :answers
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_scope :user do
    root :to => "devise/sessions#new"
       get "login", to: "devise/sessions#new"
       get "logout", to: "devise/sessions#destroy"
       get "dashboard/perfil/alterar/:id" => "users/registrations#edit", as: "perfil_edit"
       post "perfil/updateAvatar" => "users/registrations#updateAvatar", :as => "updateAvatar"
       get "dashboard/perfil/:id" => "users#show", :as => :perfil_show

  end
  get "dashboard/perfil" => "users#show"
  get "dashboard" => "dashboard#index", :as => :dashboard
  get "dashboard/topico/:id" => "dashboard#topic", :as => :show_topic_dashboard
  get "dashboard/topico/editar/:id" => "dashboard#editTopic", :as => :edit_topic_dashboard
  get "dashboard/answerBoxShow" => "dashboard#answer_box_show"
  get "dashboard/projeto/novo" => "dashboard#newProject", :as => :new_project_dashboard 
  get "dashboard/projetos" => "dashboard#projects", :as => :projects_dashboard
  get "dashboard/projetos/:id" => "dashboard#project", :as => :show_project_dashboard
  get "dashboard/projetos/editar/:id" => "dashboard#editProject", :as => :edit_project_dashboard
    post "subcategories/getByCategoryId"
    post "registrations/getDadosCadastro"


  #perfil put "perfil" => "devise/registrations#edit"
end
