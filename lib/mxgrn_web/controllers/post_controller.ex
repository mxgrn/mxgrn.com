defmodule MxgrnWeb.PostController do
  use MxgrnWeb, :controller

  alias Mxgrn.Blog.Posts

  def index(conn, _params) do
    posts = Posts.list()
    render(conn, posts: posts)
  end

  def show(conn, %{"id" => slug}) do
    post = Posts.get_by_slug!(slug)
    render(conn, post: post)
  end
end
