defmodule BlogProject.Blogging.Blog do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlogProject.Comments.Comment


  schema "blogs" do
    field :content, :string
    field :name, :string
    has_many :comments, Comment
    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:name, :content])
    |> validate_required([:name, :content])
  end

end
