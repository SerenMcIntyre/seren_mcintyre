defmodule RenMcintyre.Tools do
  alias RenMcintyre.Tools.SkillLevel
  alias RenMcintyre.Repo

  @doc """
    List all skill levels with their respective skills
  """
  def all_skills() do
    SkillLevel
    |> Repo.all()
    |> Repo.preload(:skills)
  end
end
