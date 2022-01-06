# frozen_string_literal: true

module ApplicationHelper
  def default_encryptor
    ActiveSupport::MessageEncryptor.new(
      Rails.application.credentials.secret_key_base.byteslice(0..31)
    )
  end
end
