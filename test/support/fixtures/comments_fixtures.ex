defmodule BlogProject.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlogProject.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        name: "some name",
        text: "some text"
      })
      |> BlogProject.Comments.create_comment()

    comment
  end
end
