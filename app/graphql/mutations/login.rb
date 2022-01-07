# frozen_string_literal: true

module Mutations
  class Login < BaseMutation
    include ApplicationHelper

    type String, null: false
    argument :name, String
    argument :password, String

    def resolve(name: nil, password: nil)
      user = User.find_by(name: name)&.authenticate(password)
      return '' unless user

      default_encryptor.encrypt_and_sign("user-id:#{user.id}")
    end
  end
end
