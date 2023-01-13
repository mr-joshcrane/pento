defmodule Pento.BudgetTest do
  use Pento.DataCase

  alias Pento.Budget

  describe "transactions" do
    alias Pento.Budget.Transaction

    import Pento.BudgetFixtures

    @invalid_attrs %{account_number: nil, balance: nil, bsb: nil, cheque_number: nil, credit: nil, debit: nil, narration: nil, transaction_date: nil, transaction_type: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert Budget.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Budget.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{account_number: "some account_number", balance: "some balance", bsb: "some bsb", cheque_number: "some cheque_number", credit: "some credit", debit: "some debit", narration: "some narration", transaction_date: "some transaction_date", transaction_type: "some transaction_type"}

      assert {:ok, %Transaction{} = transaction} = Budget.create_transaction(valid_attrs)
      assert transaction.account_number == "some account_number"
      assert transaction.balance == "some balance"
      assert transaction.bsb == "some bsb"
      assert transaction.cheque_number == "some cheque_number"
      assert transaction.credit == "some credit"
      assert transaction.debit == "some debit"
      assert transaction.narration == "some narration"
      assert transaction.transaction_date == "some transaction_date"
      assert transaction.transaction_type == "some transaction_type"
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budget.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      update_attrs = %{account_number: "some updated account_number", balance: "some updated balance", bsb: "some updated bsb", cheque_number: "some updated cheque_number", credit: "some updated credit", debit: "some updated debit", narration: "some updated narration", transaction_date: "some updated transaction_date", transaction_type: "some updated transaction_type"}

      assert {:ok, %Transaction{} = transaction} = Budget.update_transaction(transaction, update_attrs)
      assert transaction.account_number == "some updated account_number"
      assert transaction.balance == "some updated balance"
      assert transaction.bsb == "some updated bsb"
      assert transaction.cheque_number == "some updated cheque_number"
      assert transaction.credit == "some updated credit"
      assert transaction.debit == "some updated debit"
      assert transaction.narration == "some updated narration"
      assert transaction.transaction_date == "some updated transaction_date"
      assert transaction.transaction_type == "some updated transaction_type"
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Budget.update_transaction(transaction, @invalid_attrs)
      assert transaction == Budget.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Budget.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Budget.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Budget.change_transaction(transaction)
    end
  end
end
