# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    type Types::UserType, null: false
    argument :name, String
    argument :password, String

    def resolve(name: nil, password: nil)
      User.create!(name: name, password: password)
    end
  end
end
