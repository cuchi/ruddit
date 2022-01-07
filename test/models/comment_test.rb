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

  test 'comment creation with parent id and type' do
    comment = Comment.new parent_id: comments(:learning_ror_reply).id,
                          parent_type: 'Comment',
                          user: users(:john),
                          body: 'Thanks!'
    assert comment.save
  end

  test 'comment creation with parent id and invalid type' do
    comment = Comment.new parent_id: comments(:learning_ror_reply).id,
                          parent_type: 'SomethingElse',
                          user: users(:john),
                          body: 'Thanks!'
    assert_raise NameError do
      comment.save
    end
  end
end
