module Types
  class MutationType < Types::BaseObject
    field :create_post, resolver: Mutations::CreatePost
  end
end
