defmodule MxgrnWeb.PageController do
  use MxgrnWeb, :controller
  alias Mxgrn.Pages

  def show(conn, %{"id" => page_id}) do
    page = String.to_atom(page_id)

    if page in Pages.list() do
      render(conn, page,
        current_menu_item: page,
        page_title: page_id
      )
    else
      render(conn, :not_found)
    end
  end

  def root(conn, _params) do
    redirect(conn, to: ~p"/pages/about")
  end
end
