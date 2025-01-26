defmodule RenMcintyreWeb.PageController do
  alias RenMcintyre.Tools
  use RenMcintyreWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def tools(conn, _params) do
    skill_levels = Tools.all_skills()

    render(conn, :tools, skill_levels: skill_levels)
  end

  def blog(conn, _params) do
    render(conn, :blog, posts: RenMcIntyre.Blog.all_posts())
  end

  def blog_post(conn, %{"id" => id}) do
    render(conn, :blog_post, post: RenMcIntyre.Blog.get_post(id))
  end
end
