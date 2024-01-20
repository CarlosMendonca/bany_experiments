defmodule Bany.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :memo, :string
      add :amount, :decimal
      add :date, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
