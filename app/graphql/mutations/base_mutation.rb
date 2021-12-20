# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Resolver
    def check_authentication
      raise GraphQL::ExecutionError, 'Unauthenticated' unless @context[:current_user].present?
    end
  end
end
