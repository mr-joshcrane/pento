defmodule Pento.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :bsb, :string
      add :account_number, :string
      add :transaction_date, :string
      add :narration, :string
      add :cheque_number, :string
      add :debit, :string
      add :credit, :string
      add :balance, :string
      add :transaction_type, :string

      timestamps()
    end
  end
end
