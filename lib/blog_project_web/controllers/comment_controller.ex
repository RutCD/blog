defmodule BlogProjectWeb.CommentController do
  use BlogProjectWeb, :controller


  alias BlogProject.Comments
  alias BlogProject.Blogging


  def create(conn, %{"comment" => comment_params}) do
    case Comments.create_comment(comment_params) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Blog created successfully.")
        |> redirect(to: Routes.blog_comment_path(conn, :show, comment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def add_comment(conn, %{"comment" => comment_params, "blog_id" => blog_id}) do
    blog =
      blog_id
      |> Blogging.get_blog!(preload: :comments)


    case Blogging.Blog.add_comment(blog_id, comment_params) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Added comment!")
        |> redirect(to: Routes.blog_path(conn, :show, blog))
      {:error, _error} ->
        conn
        |> put_flash(:error, "Oops! Couldn't add comment!")
        |> redirect(to: Routes.blog_path(conn, :show, blog))
      end
    end

end
