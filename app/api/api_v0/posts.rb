module ApiV0
  class Posts < Grape::API
    before { authenticate! }

    desc "Get all your posts"
    get "/posts" do
      posts = current_user.posts

      present posts, with: ApiV0::Entities::Post
    end

    desc "Create new post"
    params do
      requires :title, type: String
      requires :context, type: String
    end
    post "/posts" do
      post = current_user.posts.new(permitted_params)
      if post.save
        present post, with: ApiV0::Entities::Post
      else
        raise StandardError, $!
      end
    end

  end
end
