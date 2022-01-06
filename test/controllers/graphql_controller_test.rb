# frozen_string_literal: true

class GraphqlControllerTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  POST_CREATION = <<-GRAPHQL
  mutation {
    createPost(title: "Just testing", body: "This is a body") {
      title
      body
    }
  }
  GRAPHQL

  test "shouldn't create a post when unauthenticated" do
    post graphql_url, params: { query: POST_CREATION }
    response = JSON.parse(@response.body)
    assert_nil response['data']
    assert_equal 'Unauthenticated', response['errors'][0]['message']
  end

  test 'should be able to create a post when authenticated' do
    token = default_encryptor.encrypt_and_sign("user-id:#{users(:john).id}")

    post graphql_url,
         params: { query: POST_CREATION },
         headers: { Authorization: "Bearer #{token}" }

    response = JSON.parse(@response.body)

    assert_nil response['errors']
    assert_equal 'Just testing', response['data']['createPost']['title']
    assert_equal 'This is a body', response['data']['createPost']['body']
  end
end
