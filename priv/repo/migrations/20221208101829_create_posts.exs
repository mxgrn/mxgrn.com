defmodule Mxgrn.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :slug, :string
      add :body, :text
      add :summary, :text
      add :published_at, :utc_datetime

      timestamps()
    end

    create unique_index(:posts, :slug)
    create unique_index(:posts, :title)
  end
end
