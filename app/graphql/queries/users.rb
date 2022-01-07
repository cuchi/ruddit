# frozen_string_literal: true

module Queries
  class Users < BaseQuery
    type [Types::UserType], null: false

    def resolve
      ::User.all.order(created_at: :desc)
    end
  end
end
