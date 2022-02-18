# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:create]
  resources :groups do
    put '/add_user', to: 'groups#add_to_group'
    put '/remove_user', to: 'groups#remove_from_group'
  end
  get '/my_groups', to: 'groups#owned_groups'
end
