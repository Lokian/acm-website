ActionController::Routing::Routes.draw do |map|
  
  map.resource :account, :controller => "users"
  map.resources :users
  map.resources :password_resets

  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
