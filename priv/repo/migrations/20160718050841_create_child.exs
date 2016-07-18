defmodule EctoEmbedInsertBug.Repo.Migrations.CreateChild do
  use Ecto.Migration

  def change do
    create table(:children) do
      add :parent_id, references(:parents), null: false
      add :embed, :map

      timestamps()
    end
  end
end
