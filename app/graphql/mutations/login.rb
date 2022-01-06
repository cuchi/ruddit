# frozen_string_literal: true

module Mutations
  class Login < BaseMutation
    type String, null: false
    argument :name, String
    argument :password, String

    def resolve(name: nil, password: nil)
      user = User.find_by(name: name)&.authenticate(password)
      return '' unless user

      crypt = ActiveSupport::MessageEncryptor.new(
        Rails.application.credentials.secret_key_base.byteslice(0..31)
      )

      crypt.encrypt_and_sign("user-id:#{user.id}")
    end
  end
end
