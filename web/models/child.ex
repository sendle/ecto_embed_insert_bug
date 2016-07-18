defmodule EctoEmbedInsertBug.Child do
  use EctoEmbedInsertBug.Web, :model

  defmodule Embed do
    use EctoEmbedInsertBug.Web, :model

    embedded_schema do
      field :something, :string
    end

    def changeset(data, params) do
      data
      |> cast(params, [:something])
    end
  end

  schema "children" do
    belongs_to :parent, EctoEmbedInsertBug.Parent
    embeds_one :embed, EctoEmbedInsertBug.Child.Embed

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:parent_id])
    |> cast_embed(:embed)
    |> assoc_constraint(:parent)
  end
end
