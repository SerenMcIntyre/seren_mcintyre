defmodule RenMcintyre.Tools.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :name, :string
    field :description, :string
    field :icon_linework, :string
    field :icon_colour, :string
    field :icon_defs, :string

    belongs_to :skill_level, RenMcintyre.Tools.SkillLevel

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :icon_linework, :icon_colour, :icon_defs, :description])
    |> validate_required([:name, :icon_linework, :icon_colour, :icon_defs, :description])
  end
end
