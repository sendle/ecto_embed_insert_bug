defmodule EctoEmbedInsertBug.Parent do
  use EctoEmbedInsertBug.Web, :model

  schema "parents" do

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
