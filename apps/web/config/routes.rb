# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/polygons', to: 'polygons#index'
get '/lines', to: 'lines#index'
get '/points', to: 'points#index'
get '/map', to: 'map#index'
root to: 'map#index'
