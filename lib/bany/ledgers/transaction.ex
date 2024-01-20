defmodule Bany.Ledgers.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :date, :utc_datetime
    field :memo, :string
    field :amount, :decimal
    belongs_to :category, Bany.Budgets.Category

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:memo, :amount, :date])
    |> validate_required([:memo, :amount, :date])
  end
end
