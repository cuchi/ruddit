# frozen_string_literal: true

module Queries
  class Me < BaseQuery
    type Types::UserType, null: false

    def resolve
      check_authentication
      @context[:current_user]
    end
  end
end
