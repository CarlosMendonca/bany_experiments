defmodule Bany.Budgets.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    has_many :transactions, Bany.Ledgers.Transaction
    many_to_many :budgets, Bany.Budgets.Budget, join_through: "budgets_categories"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
