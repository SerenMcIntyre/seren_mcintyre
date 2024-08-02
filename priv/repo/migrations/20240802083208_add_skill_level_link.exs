defmodule RenMcintyre.Repo.Migrations.AddSkillLevelLink do
  use Ecto.Migration

  def change do
    alter table("skills") do
      add :skill_level_id, references(:skill_level)
    end
  end
end
