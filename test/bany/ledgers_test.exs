defmodule Bany.LedgersTest do
  use Bany.DataCase

  alias Bany.Ledgers

  describe "transactions" do
    alias Bany.Ledgers.Transaction

    import Bany.LedgersFixtures

    @invalid_attrs %{date: nil, memo: nil, amount: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert Ledgers.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Ledgers.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{date: ~U[2024-01-14 22:01:00Z], memo: "some memo", amount: "120.5"}

      assert {:ok, %Transaction{} = transaction} = Ledgers.create_transaction(valid_attrs)
      assert transaction.date == ~U[2024-01-14 22:01:00Z]
      assert transaction.memo == "some memo"
      assert transaction.amount == Decimal.new("120.5")
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ledgers.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      update_attrs = %{date: ~U[2024-01-15 22:01:00Z], memo: "some updated memo", amount: "456.7"}

      assert {:ok, %Transaction{} = transaction} = Ledgers.update_transaction(transaction, update_attrs)
      assert transaction.date == ~U[2024-01-15 22:01:00Z]
      assert transaction.memo == "some updated memo"
      assert transaction.amount == Decimal.new("456.7")
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Ledgers.update_transaction(transaction, @invalid_attrs)
      assert transaction == Ledgers.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Ledgers.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Ledgers.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Ledgers.change_transaction(transaction)
    end
  end
end
