defmodule RenMcintyre.SkillLevel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skill_level" do
    field :description, :string

    has_many :skills, RenMcintyre.SkillLevel

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(skill_level, attrs) do
    skill_level
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
