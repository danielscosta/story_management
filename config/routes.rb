Rails.application.routes.draw do
  root "sessions#new"

  get "sign_in" => "sessions#new"
  post "sign_in" => "sessions#create"
  delete "sign_out" => "sessions#destroy"

  get "stories" => "stories#index"
  post "stories" => "stories#save"
  get "stories/new" => "stories#new"
  get "stories/:id" => "stories#edit"
end
