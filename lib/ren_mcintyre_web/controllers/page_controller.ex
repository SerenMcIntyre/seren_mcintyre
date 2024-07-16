defmodule RenMcintyreWeb.PageController do
  use RenMcintyreWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def blog(conn, _params) do
    render(conn, :blog)
  end
end
