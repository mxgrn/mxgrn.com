defmodule Mxgrn.Factory do
  @moduledoc """
  ExMachina-driven factories
  """

  use ExMachina.Ecto, repo: Mxgrn.Repo

  alias Mxgrn.Blog.Post

  def post_factory() do
    %Post{
      slug: sequence(:slug, &"slug-#{&1}"),
      summary: "Some summary",
      body: "Some body"
    }
  end
end
