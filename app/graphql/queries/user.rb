# frozen_string_literal: true

module Queries
  class User < BaseQuery
    type Types::UserType, null: false
    argument :name, String

    def resolve(name:)
      ::User.find_by! name: name
    end
  end
end
