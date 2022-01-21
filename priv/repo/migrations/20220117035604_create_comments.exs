defmodule BlogProject.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :name, :string
      add :text, :text
      add :blog_id, references(:blogs, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:blog_id])
  end
end
