defmodule MxgrnWeb.DarkMode do
  import Plug.Conn

  def init(default), do: default

  def call(%{params: %{"dark" => "true"}} = conn, _opts) do
    conn
    |> put_session(:dark, true)
  end

  def call(%{params: %{"dark" => "false"}} = conn, _opts) do
    conn
    |> put_session(:dark, false)
  end

  def call(conn, _opts) do
    conn
  end
end
