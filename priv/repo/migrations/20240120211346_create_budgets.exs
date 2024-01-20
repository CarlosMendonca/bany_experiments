defmodule Bany.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
