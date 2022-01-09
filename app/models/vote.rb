# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  def downvote?
    !upvote?
  end
end
