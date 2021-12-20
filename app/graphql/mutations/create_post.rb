module Mutations
  class CreatePost < BaseMutation

    type Types::PostType, null: false
    argument :title, String
    argument :body, String

    def resolve(title:, body:)
      Post.create title: title, body: body
    end
  end
end