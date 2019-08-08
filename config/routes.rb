Rails.application.routes.draw do

  # mount ActionCable.server => '/cable'

  root 'home#index'
  get 'chat' => 'rooms#show'

  get 'home/index'
  get '/all' => 'home#all'
  get '/mungwa' => 'home#mungwa'
  get '/major' => 'home#major'
  get '/estimate/:id' => 'home#estimate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
