defmodule RenMcintyre.Repo.Migrations.UpdateSkillDescriptions do
  use Ecto.Migration

  def change do
    alter table("skills") do
      modify :description, :text
    end
  end
end
