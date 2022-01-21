defmodule BlogProject.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :place, :string
      add :description, :string
      add :price, :float

      timestamps()
    end
  end
end
