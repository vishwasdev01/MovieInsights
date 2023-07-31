Rails.application.routes.draw do
  root "movies#index"
  get '/movies/search_by_actor', to: 'movies#search_by_actor'

  # resources: movies do 
  #   resources: reviews
  # end
end
