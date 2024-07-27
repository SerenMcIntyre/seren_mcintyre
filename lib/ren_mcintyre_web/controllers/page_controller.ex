defmodule RenMcintyreWeb.PageController do
  use RenMcintyreWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def tools(conn, _params) do
    render(conn, :tools)
  end

  def blog(conn, _params) do
    render(conn, :blog)
  end
end
