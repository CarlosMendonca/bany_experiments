defmodule Bany.LedgersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bany.Ledgers` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        amount: "120.5",
        date: ~U[2024-01-14 22:01:00Z],
        memo: "some memo"
      })
      |> Bany.Ledgers.create_transaction()

    transaction
  end
end
