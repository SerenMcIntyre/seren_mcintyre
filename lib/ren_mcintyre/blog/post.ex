defmodule RenMcIntyre.Blog.Post do
  @enforce_keys [:id, :title, :author, :body, :description, :date]
  defstruct [:id, :title, :author, :body, :description, :date]

  def build(filename, attrs, body) do
    [post_name] = filename |> Path.rootname() |> Path.split() |> Enum.take(-1)
    [year, month, day, id] = String.split(post_name, "-", parts: 4)
    date = Date.from_iso8601!("#{year}-#{month}-#{day}")
    struct!(__MODULE__, [id: id, date: date, body: body] ++ Map.to_list(attrs))
  end
end
