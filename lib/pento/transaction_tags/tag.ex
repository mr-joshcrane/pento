defmodule Pento.TransactionTags.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :tag, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:tag])
    |> validate_required([:tag])
  end
end
