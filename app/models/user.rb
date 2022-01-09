# frozen_string_literal: true

class User < ApplicationRecord
  include ActiveModel::SecurePassword

  has_many :posts, dependent: :restrict_with_exception
  has_many :comments, dependent: :restrict_with_exception
  has_many :votes, dependent: :restrict_with_exception

  validate :name_should_have_simple_ascii_chars

  has_secure_password

  def name_should_have_simple_ascii_chars
    return unless name.scan(/\w*/).length != 2

    errors.add(:name, 'The name should have simple ASCII chars without spaces ([a-z|A-Z|0-9])')
  end

  def karma
    (posts + comments).reduce(0) do |accumulator, record|
      accumulator + record.vote_count
    end
  end
end
