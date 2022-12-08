defmodule MxgrnWeb.SessionController do
  use MxgrnWeb, :controller
  import Plug.BasicAuth

  plug :basic_auth, Application.compile_env(:mxgrn, :basic_auth)

  def create(conn, _params) do
    conn
    |> put_session(:authenticated, true)
    |> redirect(to: ~p"/")
  end

  # No "delete" action because BasicAuth doesn't support "signing out". Close the browser instead.
end
