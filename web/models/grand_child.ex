defmodule EctoEmbedInsertBug.GrandChild do
  use EctoEmbedInsertBug.Web, :model

  defmodule Embed do
    use EctoEmbedInsertBug.Web, :model

    embedded_schema do
      field :something, :string
    end

    def changeset(data, params) do
      data
      |> cast(params, [:something])
      |> validate_required([:something])
    end
  end

  schema "grand_children" do
    belongs_to :child, EctoEmbedInsertBug.Child
    embeds_one :embed, EctoEmbedInsertBug.GrandChild.Embed

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:child_id])
    |> cast_embed(:embed, required: true)
    |> cast_assoc(:child)
    |> assoc_constraint(:child)
  end
end
