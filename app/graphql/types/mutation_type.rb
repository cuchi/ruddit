# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, resolver: Mutations::CreateUser
    field :login, resolver: Mutations::Login

    field :create_post, resolver: Mutations::CreatePost
    field :create_comment, resolver: Mutations::CreateComment
  end
end
