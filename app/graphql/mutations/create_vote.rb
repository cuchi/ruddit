# frozen_string_literal: true

module Mutations
  class CreateVote < BaseMutation
    type Types::VoteType, null: false
    argument :upvote, Boolean
    argument :voteable_id, Integer
    argument :voteable_type, Types::CommentParentType

    def resolve(upvote:, voteable_id:, voteable_type:)
      check_authentication
      vote = Vote.where(
        voteable_id: voteable_id,
        voteable_type: voteable_type,
        user: @context[:current_user]
      ).first_or_initialize

      vote.upvote = upvote
      vote.save!
      vote
    end
  end
end
