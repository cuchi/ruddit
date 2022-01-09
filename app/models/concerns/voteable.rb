# frozen_string_literal: true

module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable, dependent: :restrict_with_exception

    def vote_count
      votes.reduce(0) do |accumulator, vote|
        accumulator + (vote.upvote? ? 1 : -1)
      end
    end
  end
end
