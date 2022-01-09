# frozen_string_literal: true

class GraphqlAuthenticationTest < ActionDispatch::IntegrationTest
  test 'login with the correct credentials' do
    post graphql_url, params: { query: 'mutation { login(name: "johndoe" password: "foo") }' }
    response = JSON.parse(@response.body)
    assert_nil response['errors']
    assert response['data']['login']
  end

  test 'login with the incorrect credentials' do
    post graphql_url, params: { query: 'mutation { login(name: "johndoe" password: "123") }' }
    response = JSON.parse(@response.body)
    assert_nil response['data']
    assert_equal 'Wrong credentials', response['errors'][0]['message']
  end
end
