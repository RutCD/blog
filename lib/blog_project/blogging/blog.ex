defmodule BlogProject.Blogging.Blog do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlogProject.Comments.Comment
  alias BlogProject.Comments

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

  def add_comment(blog_id, comment_params) do
    comment_params
    |> Map.put("blog_id", blog_id)
    |> Comments.create_comment()
  end
end
