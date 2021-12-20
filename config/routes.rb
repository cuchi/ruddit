# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  post '/graphql', to: 'graphql#execute'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
end
