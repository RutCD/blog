defmodule BlogProject.ClassificationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlogProject.Classification` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        description: "some description",
        place: "some place",
        price: 120.5
      })
      |> BlogProject.Classification.create_category()

    category
  end
end
