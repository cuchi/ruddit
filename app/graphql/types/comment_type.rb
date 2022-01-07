# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user_id, Integer, null: false
    field :parent_type, CommentParentType, null: false
    field :parent_id, Integer, null: false

    field :comments, [CommentType], null: false
    field :user, UserType, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
