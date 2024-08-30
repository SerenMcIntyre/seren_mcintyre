defmodule RenMcintyreWeb.PageController do
  alias RenMcintyre.Tools
  use RenMcintyreWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def tools(conn, _params) do
    skill_levels = Tools.all_skills()

    IO.inspect(skill_levels)

    render(conn, :tools, skill_levels: skill_levels)
  end

  def blog(conn, _params) do
    render(conn, :blog)
  end
end
