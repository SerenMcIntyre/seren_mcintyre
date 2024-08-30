defmodule RenMcintyre.Repo.Migrations.AddSkillLevelName do
  use Ecto.Migration

  def change do
    alter table("skill_level") do
      add :name, :string
    end
  end
end
