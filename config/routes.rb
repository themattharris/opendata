ActionController::Routing::Routes.draw do |map|
  map.root :controller => "pages"
  map.about 'about', :controller => 'pages', :action => 'about'

  map.tags 'tag', :controller => 'tags', :action => 'index'
  map.tag 'tag/:slug', :controller => 'tags', :action => 'index'
  map.categories 'category', :controller => 'categories', :action => 'index'
  map.category 'category/:slug', :controller => 'categories', :action => 'index'
  map.curators 'curator', :controller => 'curators', :action => 'index'
  map.curator 'curator/:id', :controller => 'curators', :action => 'index'

  map.data_source 'source/:id', :controller =>  'data_sources', :action => 'show'

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
