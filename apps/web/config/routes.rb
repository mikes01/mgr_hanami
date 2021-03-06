# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
resources :lines, only: [:index, :create, :update, :destroy]
resources :points, only: [:index, :create, :update, :destroy]
resources :polygons, only: [:index, :create, :update, :destroy]
get '/map', to: 'map#index'
root to: 'map#index'
