defmodule Mxgrn.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :summary, :string
    field :published_at, :utc_datetime
    field :slug, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :slug, :body, :published_at, :summary])
    |> validate_required([:title, :slug, :body, :published_at, :summary])
    |> unique_constraint(:slug)
    |> unique_constraint(:title)
  end
end
