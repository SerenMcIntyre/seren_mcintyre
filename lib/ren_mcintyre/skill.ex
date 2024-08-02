defmodule RenMcintyre.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :name, :string
    field :description, :string
    field :icon_src, :string

    belongs_to :skill_level, RenMcintyre.SkillLevel

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :icon_src, :description])
    |> validate_required([:name, :icon_src, :description])
  end
end
