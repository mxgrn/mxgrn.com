defmodule MxgrnWeb.Admin.PostController do
  use MxgrnWeb, :controller
  alias Mxgrn.Blog.Posts
  alias Mxgrn.Blog.Post

  def new(conn, _params) do
    changeset = Posts.change(%Post{})
    render(conn, changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Posts.create(post_params) do
      {:ok, _post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: ~p"/blog")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    post = Posts.get!(id)
    changeset = Posts.change(post)
    render(conn, post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Posts.get!(id)

    case Posts.update(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: ~p"/blog/#{post.slug}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, post: post, changeset: changeset)
    end
  end
end
