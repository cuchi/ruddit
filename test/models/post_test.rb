# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should create a post' do
    post = Post.new(title: 'Hello!', body: 'Hello indeed', user: users(:john))
    assert post.save
  end

  test "shouldn't create a post without a user" do
    post = Post.new(title: 'Hello!', body: 'Hello again')
    assert_not post.save
  end
end
