# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/refresh', to: 'home#check_stations_cache'

  root 'home#index'
end
