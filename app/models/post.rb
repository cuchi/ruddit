# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :parent, dependent: :restrict_with_exception

  def votes
    # TODO: Support votes for posts.
    0
  end
end
