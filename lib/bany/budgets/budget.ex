defmodule Bany.Budgets.Budget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "budgets" do
    field :name, :string
    many_to_many :categories, Bany.Budgets.Category, join_through: "budgets_categories"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(budget, attrs) do
    budget
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
