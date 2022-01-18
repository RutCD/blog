defmodule BlogProject.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias BlogProject.Social.Comment

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

  def add_comment(blog_id, comment_params) do
    comment_params
    |> Map.put("blog_id", blog_id)
    |> Comments.create_comment()
  end

end
