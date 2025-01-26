defmodule RenMcIntyre.Blog do
  alias RenMcIntyre.Blog.Post

  use NimblePublisher,
    build: Post,
    from: Application.app_dir(:ren_mcintyre, "priv/blogs/*.md"),
    as: :posts,
    highlighters: [:makeup_ts]

  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  def all_posts, do: @posts
  def recent_posts(num \\ 5), do: Enum.take(@posts, num)

  defmodule NotFoundError, do: defexception([:message, plug_status: 404])

  def get_post(id) do
    Enum.find(all_posts(), &(&1.id == id)) ||
      raise NotFoundError, "post with id=#{id} not found"
  end
end
