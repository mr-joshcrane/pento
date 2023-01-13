defmodule Pento.Budget.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :account_number, :string
    field :balance, :string
    field :bsb, :string
    field :cheque_number, :string
    field :credit, :string
    field :debit, :string
    field :narration, :string
    field :transaction_date, :string
    field :transaction_type, :string
    field :tagss, {:array, :string}
    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:tagss])
  end
end
