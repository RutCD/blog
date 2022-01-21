defmodule BlogProject.ClassificationTest do
  use BlogProject.DataCase

  alias BlogProject.Classification

  describe "categories" do
    alias BlogProject.Classification.Category

    import BlogProject.ClassificationFixtures

    @invalid_attrs %{description: nil, place: nil, price: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Classification.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Classification.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{description: "some description", place: "some place", price: 120.5}

      assert {:ok, %Category{} = category} = Classification.create_category(valid_attrs)
      assert category.description == "some description"
      assert category.place == "some place"
      assert category.price == 120.5
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Classification.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{description: "some updated description", place: "some updated place", price: 456.7}

      assert {:ok, %Category{} = category} = Classification.update_category(category, update_attrs)
      assert category.description == "some updated description"
      assert category.place == "some updated place"
      assert category.price == 456.7
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Classification.update_category(category, @invalid_attrs)
      assert category == Classification.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Classification.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Classification.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Classification.change_category(category)
    end
  end
end
