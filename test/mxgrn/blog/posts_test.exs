defmodule Mxgrn.Blog.PostsTest do
  use Mxgrn.DataCase

  import Mxgrn.Factory
  alias Mxgrn.Blog.Posts

  describe "list/0" do
    test "only returns posts that are published in the past" do
      post_1 = insert(:post, published_at: DateTime.utc_now())
      post_2 = insert(:post, published_at: DateTime.utc_now() |> DateTime.add(-1, :day))
      insert(:post, published_at: DateTime.utc_now() |> DateTime.add(1, :day))

      assert [post_1, post_2] == Posts.list()
    end
  end
end
