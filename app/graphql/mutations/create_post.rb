# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    type Types::PostType, null: false
    argument :title, String
    argument :body, String

    def resolve(title:, body:)
      check_authentication
      Post.create! title: title, body: body, user: @context[:current_user]
    end
  end
end
