defmodule BlogProject.Blogging.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :content, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:name, :content])
    |> validate_required([:name, :content])
  end
end
