# frozen_string_literal: true

class Post < ApplicationRecord
  include Voteable

  belongs_to :user
  has_many :comments, as: :parent, dependent: :restrict_with_exception
end
