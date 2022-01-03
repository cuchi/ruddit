# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Resolver
    def check_authentication
      raise GraphQL::ExecutionError, 'Unauthenticated' if @context[:current_user].blank?
    end
  end
end
