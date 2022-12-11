defmodule MxgrnWeb.SessionController do
  use MxgrnWeb, :controller

  plug :basic_auth

  def create(conn, _params) do
    conn
    |> put_session(:authenticated, true)
    |> redirect(to: ~p"/")
  end

  # No "delete" action because BasicAuth doesn't support "signing out". Close the browser instead.
  defp basic_auth(conn, _opts) do
    Plug.BasicAuth.basic_auth(conn, Application.get_env(:mxgrn, :basic_auth))
  end
end
