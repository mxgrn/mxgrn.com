defmodule MxgrnWeb.PostController do
  use MxgrnWeb, :controller

  alias Mxgrn.Blog.Posts

  def index(conn, _params) do
    posts = Posts.list()
    render(conn, posts: posts, current_menu_item: :blog)
  end

  def show(conn, %{"id" => slug}) do
    post = Posts.get_by_slug!(slug)
    render(conn, post: post, current_menu_item: :blog, page_title: post.title)
  end
end
