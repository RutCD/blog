defmodule BlogProjectWeb.CommentController do
  use BlogProjectWeb, :controller

  alias BlogProject.Blogging
  alias BlogProject.Social

  def add_comment(conn, %{"comment" => comment_params, "blog_id" => blog_id}) do
    blog =
      blog_id
      |> Blogging.get_blog!(preload: :comments)

      params =
        comment_params
        |> Map.put("blog_id", blog_id)

    case Social.create_comment(params) do
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
