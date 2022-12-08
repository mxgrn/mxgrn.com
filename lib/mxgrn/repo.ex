defmodule Mxgrn.Repo do
  use Ecto.Repo,
    otp_app: :mxgrn,
    adapter: Ecto.Adapters.Postgres
end
