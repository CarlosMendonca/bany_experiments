defmodule Bany.Repo.Migrations.AddCategoryTransactionRelationship do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :category_id, references(:categories)
    end
  end
end
