defmodule Bany.Repo.Migrations.AddBudgetCategoryRelationship do
  use Ecto.Migration

  def change do
    create table(:budgets_categories) do
      add :budget_id, references(:budgets)
      add :category_id, references(:categories)
    end

    create unique_index(:budgets_categories, [:budget_id, :category_id])
  end
end
