# frozen_string_literal: true

module Queries
  class Posts < BaseQuery
    type [Types::PostType], null: false
    argument :sort_by, Types::SortByType, required: false, default_value: :new

    def resolve(*)
      ::Post.all.order(created_at: :desc)
    end
  end
end
