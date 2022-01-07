# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :me, resolver: Queries::Me
    field :users, resolver: Queries::Users
    field :user, resolver: Queries::User
    field :posts, resolver: Queries::Posts
    field :post, resolver: Queries::Post
  end
end
