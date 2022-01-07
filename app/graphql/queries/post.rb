# frozen_string_literal: true

module Queries
  class Post < BaseQuery
    type Types::PostType, null: false
    argument :id, Integer

    def resolve(id:)
      ::Post.find id
    end
  end
end
