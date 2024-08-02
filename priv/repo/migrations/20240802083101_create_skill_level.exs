defmodule RenMcintyre.Repo.Migrations.CreateSkillLevel do
  use Ecto.Migration

  def change do
    create table(:skill_level) do
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
