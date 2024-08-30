defmodule RenMcintyre.Repo.Migrations.UpdateSkillIcons do
  use Ecto.Migration

  def change do
    alter table("skills") do
      remove :icon_src
      add :icon_linework, :text
      add :icon_colour, :text
      add :icon_defs, :text
    end
  end
end
