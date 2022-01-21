defmodule BlogProject.BloggingTest do
  use BlogProject.DataCase

  alias BlogProject.Blogging

  describe "blogs" do
    alias BlogProject.Blogging.Blog

    import BlogProject.BloggingFixtures

    @invalid_attrs %{content: nil, name: nil}

    test "list_blogs/0 returns all blogs" do
      blog = blog_fixture()
      assert Blogging.list_blogs() == [blog]
    end

    test "get_blog!/1 returns the blog with given id" do
      blog = blog_fixture()
      assert Blogging.get_blog!(blog.id) == blog
    end

    test "create_blog/1 with valid data creates a blog" do
      valid_attrs = %{content: "some content", name: "some name"}

      assert {:ok, %Blog{} = blog} = Blogging.create_blog(valid_attrs)
      assert blog.content == "some content"
      assert blog.name == "some name"
    end

    test "create_blog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogging.create_blog(@invalid_attrs)
    end

    test "update_blog/2 with valid data updates the blog" do
      blog = blog_fixture()
      update_attrs = %{content: "some updated content", name: "some updated name"}

      assert {:ok, %Blog{} = blog} = Blogging.update_blog(blog, update_attrs)
      assert blog.content == "some updated content"
      assert blog.name == "some updated name"
    end

    test "update_blog/2 with invalid data returns error changeset" do
      blog = blog_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogging.update_blog(blog, @invalid_attrs)
      assert blog == Blogging.get_blog!(blog.id)
    end

    test "delete_blog/1 deletes the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{}} = Blogging.delete_blog(blog)
      assert_raise Ecto.NoResultsError, fn -> Blogging.get_blog!(blog.id) end
    end

    test "change_blog/1 returns a blog changeset" do
      blog = blog_fixture()
      assert %Ecto.Changeset{} = Blogging.change_blog(blog)
    end
  end
end
