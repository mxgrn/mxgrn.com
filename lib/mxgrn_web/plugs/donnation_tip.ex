defmodule MxgrnWeb.DonnationTip do
  import Plug.Conn

  def init(default), do: default

  def call(%{params: %{"donnation_tip_hidden" => "true"}} = conn, _opts) do
    conn
    |> put_session(:donnation_tip_hidden, true)
  end

  def call(%{params: %{"donnation_tip_hidden" => "false"}} = conn, _opts) do
    conn
    |> put_session(:donnation_tip_hidden, false)
  end

  def call(conn, _opts) do
    conn
  end
end
