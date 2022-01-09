# frozen_string_literal: true

class GraphqlAuthenticationTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  CURRENT_USER = 'query { me { name } }'

  test "shouldn't get the current user when unauthenticated" do
    post graphql_url, params: { query: CURRENT_USER }
    response = JSON.parse(@response.body)
    assert_nil response['data']
    assert_equal 'Unauthenticated', response['errors'][0]['message']
  end

  test 'should get the current user when authenticated' do
    token = default_encryptor.encrypt_and_sign("user-id:#{users(:john).id}")

    post graphql_url,
         params: { query: CURRENT_USER },
         headers: { Authorization: "Bearer #{token}" }

    response = JSON.parse(@response.body)

    assert_nil response['errors']
    assert_equal 'johndoe', response['data']['me']['name']
  end
end
