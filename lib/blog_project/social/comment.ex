defmodule BlogProject.Social.Comment do
  use Ecto.Schema
  import Ecto.Changeset



  schema "comments" do
    field :name, :string
    field :text, :string
    field :blog_id, :id


    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :text, :blog_id])
    |> validate_required([:name, :text, :blog_id])
  end


end
