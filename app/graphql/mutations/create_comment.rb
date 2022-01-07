# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    type Types::CommentType, null: false
    argument :body, String
    argument :parent_id, Integer
    argument :parent_type, Types::CommentParentType

    def resolve(body:, parent_id:, parent_type:)
      check_authentication
      Comment.create! body: body,
                      parent_id: parent_id,
                      parent_type: parent_type,
                      user: @context[:current_user]
    end
  end
end
