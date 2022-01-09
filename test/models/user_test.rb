# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'successful user creation' do
    user = User.new(name: 'john', password: 'foo')
    user.save!
    assert_equal 'john', user.name
  end

  test 'user is not a moderator by default' do
    user = User.new(name: 'john', password: 'foo')
    user.save!
    assert_not user.moderator?
  end

  test 'user name should have only simple ASCII characters' do
    user = User.new(name: 'foo bar', password: 'foo')
    assert_raise ActiveRecord::RecordInvalid do
      user.save!
    end
  end

  test 'user name should be unique' do
    User.create name: 'john', password: 'foo'
    second_user = User.new(name: 'john', password: 'foo')
    assert_raise ActiveRecord::RecordNotUnique do
      second_user.save!
    end
  end
end
