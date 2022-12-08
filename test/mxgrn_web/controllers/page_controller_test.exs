defmodule MxgrnWeb.PageControllerTest do
  use MxgrnWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/pages/about")
    assert html_response(conn, 200) =~ "About"
  end
end
