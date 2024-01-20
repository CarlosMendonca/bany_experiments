defmodule BanyWeb.TransactionController do
  use BanyWeb, :controller

  alias Bany.Ledgers
  alias Bany.Ledgers.Transaction

  def index(conn, _params) do
    transactions = Ledgers.list_transactions()
    render(conn, :index, transactions: transactions)
  end

  def new(conn, _params) do
    changeset = Ledgers.change_transaction(%Transaction{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"transaction" => transaction_params}) do
    case Ledgers.create_transaction(transaction_params) do
      {:ok, transaction} ->
        conn
        |> put_flash(:info, "Transaction created successfully.")
        |> redirect(to: ~p"/transactions/#{transaction}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    transaction = Ledgers.get_transaction!(id)
    render(conn, :show, transaction: transaction)
  end

  def edit(conn, %{"id" => id}) do
    transaction = Ledgers.get_transaction!(id)
    changeset = Ledgers.change_transaction(transaction)
    render(conn, :edit, transaction: transaction, changeset: changeset)
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    transaction = Ledgers.get_transaction!(id)

    case Ledgers.update_transaction(transaction, transaction_params) do
      {:ok, transaction} ->
        conn
        |> put_flash(:info, "Transaction updated successfully.")
        |> redirect(to: ~p"/transactions/#{transaction}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, transaction: transaction, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Ledgers.get_transaction!(id)
    {:ok, _transaction} = Ledgers.delete_transaction(transaction)

    conn
    |> put_flash(:info, "Transaction deleted successfully.")
    |> redirect(to: ~p"/transactions")
  end
end
