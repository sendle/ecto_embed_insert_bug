defmodule EctoEmbedInsertBug.GrandChildTest do
  use EctoEmbedInsertBug.ModelCase

  alias EctoEmbedInsertBug.GrandChild

  test "changeset with valid attributes" do
    changeset = GrandChild.changeset(%GrandChild{}, %{embed: %{something: "test"}, child: %{parent_id: 123}})

    # Here the embed in the changes is a Changeset
    assert %Ecto.Changeset{} = changeset.changes.embed
    {:error, changeset} = Repo.insert(changeset)

    # Here it's converted into a EctoEmbedInsertBug.GrandChild.Embed
    assert %Ecto.Changeset{} = changeset.changes.embed
  end
end
