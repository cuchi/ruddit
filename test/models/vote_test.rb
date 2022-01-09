# frozen_string_literal: true

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'vote creation to a post' do
    vote = Vote.new user: users(:smith),
                    voteable: posts(:controversial_post),
                    upvote: false
    assert vote.save
  end

  test 'vote creation to an already voted post' do
    vote = Vote.new user: users(:john), voteable: posts(:controversial_post)
    assert_raise ActiveRecord::RecordNotUnique do
      vote.save!
    end
  end

  test 'vote creation to a comment' do
    vote = Vote.new user: users(:john), voteable: comments(:learning_ror_reply)
    assert vote.save
  end
end
