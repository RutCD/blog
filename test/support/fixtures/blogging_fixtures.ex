defmodule BlogProject.BloggingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlogProject.Blogging` context.
  """

  @doc """
  Generate a blog.
  """
  def blog_fixture(attrs \\ %{}) do
    {:ok, blog} =
      attrs
      |> Enum.into(%{
        content: "some content",
        name: "some name"
      })
      |> BlogProject.Blogging.create_blog()

    blog
  end
end
