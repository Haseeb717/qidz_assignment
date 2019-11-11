Rails.application.routes.draw do
  root 'movies#index'
  get 'movie/:id' => 'movies#show',as: 'movie'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
