# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  def votes
    # TODO: Support votes for posts.
    0
  end
end
