defmodule BanyWeb.BudgetHTML do
  use BanyWeb, :html

  embed_templates "budget_html/*"

  @doc """
  Renders a budget form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def budget_form(assigns)
end
