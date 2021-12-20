# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    type Types::UserType, null: false
    argument :name, String

    def resolve(name:)
      User.create! name: name
    end
  end
end
