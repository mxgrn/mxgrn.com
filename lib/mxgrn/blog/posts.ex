defmodule Mxgrn.Blog.Posts do
  alias Mxgrn.Repo
  alias Mxgrn.Blog.Post
  import Ecto.Query

  def get!(id), do: Repo.get!(Post, id)

  def get_by_slug!(slug), do: Repo.get_by!(Post, %{slug: slug})

  def change(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  def create(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  List posts ordered by published_at desc, with published_at being in the past.
  """
  def list() do
    from(p in Post,
      where: p.published_at <= ^DateTime.utc_now(),
      order_by: [desc: p.published_at])
    |> Repo.all()
  end
end
