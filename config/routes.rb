Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "page#index";

  # Article routes
  post "/page/create", to: "page#create";

  get "page/read", to: "page#read";

  put "page/update", to: "page#update";

  delete "page/delete", to: "page#delete";

  get "page/search", to: "page#findByID";

  get "page/category", to: "page#category";

  get "page/dateRange", to: "page#dateRange";

  get "page/author", to: "page#author";

  get "page/partialAuthor", to: "page#partialAuthor";


  #user Login Authentaction
  resources :users
  post "login", to: "authentication#login"

  post "user/create", to: "users#create"
end
