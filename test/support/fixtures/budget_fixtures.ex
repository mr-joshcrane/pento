defmodule Pento.BudgetFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pento.Budget` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        account_number: "some account_number",
        balance: "some balance",
        bsb: "some bsb",
        cheque_number: "some cheque_number",
        credit: "some credit",
        debit: "some debit",
        narration: "some narration",
        transaction_date: "some transaction_date",
        transaction_type: "some transaction_type"
      })
      |> Pento.Budget.create_transaction()

    transaction
  end
end
