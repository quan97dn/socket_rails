Rails.application.routes.draw do
  root "auctions#index"
  resources :auctions
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
