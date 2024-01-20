defmodule Bany.BudgetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bany.Budgets` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Bany.Budgets.create_category()

    category
  end

  @doc """
  Generate a budget.
  """
  def budget_fixture(attrs \\ %{}) do
    {:ok, budget} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Bany.Budgets.create_budget()

    budget
  end
end
