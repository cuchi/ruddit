# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'successful user creation' do
    user = User.new name: 'john'
    user.save!
    assert user.name == 'john'
  end

  test 'user is not a moderator by default' do
    user = User.new name: 'john'
    user.save!
    assert user.moderator == false
  end

  test 'user name should have only simple ASCII characters' do
    user = User.new name: 'foo bar'
    assert_raise ActiveRecord::RecordInvalid do
      user.save!
    end
  end

  test 'user name should be unique' do
    User.create name: 'john'
    second_user = User.new name: 'john'
    assert_raise ActiveRecord::RecordNotUnique do
      second_user.save!
    end
  end
end
