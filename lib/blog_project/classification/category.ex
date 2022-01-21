defmodule BlogProject.Classification.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :description, :string
    field :place, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:place, :description, :price])
    |> validate_required([:place, :description, :price])
  end
end
