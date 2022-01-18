defmodule BlogProjectWeb.CommentController do
  use BlogProjectWeb, :controller

  alias BlogProject.Comments.Comment
  alias BlogProject.Repo

  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  def create(conn, %{"blog" => blog_params}) do
    case Blogging.create_blog(blog_params) do
      {:ok, blog} ->
        conn
        |> put_flash(:info, "Blog created successfully.")
        |> redirect(to: Routes.blog_path(conn, :show, blog))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end


end
