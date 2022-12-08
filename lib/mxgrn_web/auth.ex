defmodule MxgrnWeb.Auth do
  use MxgrnWeb, :verified_routes

  import Plug.Conn
  import Phoenix.Controller

  @doc """
  Authenticated?
  """
  def editor?(%{assigns: %{current_user: current_user}}) when not is_nil(current_user) do
    true
  end

  def editor?(_), do: false

  @doc """
  Used for routes that require the user to be authenticated.
  """
  def require_authenticated_user(conn, _opts) do
    if conn.assigns[:current_user] do
      conn
    else
      conn
      |> put_flash(:error, "You must log in to access this page.")
      |> redirect(to: ~p"/login")
      |> halt()
    end
  end

  @doc """
  Authenticates the user by looking into the session.
  """
  def fetch_current_user(conn, _opts) do
    if get_session(conn, :authenticated) do
      assign(conn, :current_user, %{})
    else
      assign(conn, :current_user, nil)
    end
  end
end
