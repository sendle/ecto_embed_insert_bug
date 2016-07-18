defmodule EctoEmbedInsertBug.Repo.Migrations.CreateGrandChild do
  use Ecto.Migration

  def change do
    create table(:grand_children) do
      add :child_id, references(:children), null: false
      add :embed, :map

      timestamps()
    end

  end
end
