# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'comment creation under a post' do
    comment = Comment.new parent: posts(:learning_ror),
                          user: users(:carl),
                          body: 'Hi! I also want some tips'
    assert comment.save
  end

  test 'comment creation under a comment' do
    comment = Comment.new parent: comments(:learning_ror_reply),
                          user: users(:john),
                          body: 'Thanks!'
    assert comment.save
  end

  test 'comment creation under nothing' do
    comment = Comment.new user: users(:john), body: 'Hello?'
    assert_raise ActiveRecord::RecordInvalid do
      comment.save!
    end
  end
end
