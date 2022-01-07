# frozen_string_literal: true

module Types
  class CommentParentType < Types::BaseEnum
    value 'POST', value: 'Post'
    value 'COMMENT', value: 'Comment'
  end
end
