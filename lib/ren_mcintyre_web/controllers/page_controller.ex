defmodule RenMcintyreWeb.PageController do
  use RenMcintyreWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def blog(conn, _params) do
    render(conn, :blog)
  end
end
