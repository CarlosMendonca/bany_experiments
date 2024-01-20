defmodule BanyWeb.BudgetControllerTest do
  use BanyWeb.ConnCase

  import Bany.BudgetsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all budgets", %{conn: conn} do
      conn = get(conn, ~p"/budgets")
      assert html_response(conn, 200) =~ "Listing Budgets"
    end
  end

  describe "new budget" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/budgets/new")
      assert html_response(conn, 200) =~ "New Budget"
    end
  end

  describe "create budget" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/budgets", budget: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/budgets/#{id}"

      conn = get(conn, ~p"/budgets/#{id}")
      assert html_response(conn, 200) =~ "Budget #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/budgets", budget: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Budget"
    end
  end

  describe "edit budget" do
    setup [:create_budget]

    test "renders form for editing chosen budget", %{conn: conn, budget: budget} do
      conn = get(conn, ~p"/budgets/#{budget}/edit")
      assert html_response(conn, 200) =~ "Edit Budget"
    end
  end

  describe "update budget" do
    setup [:create_budget]

    test "redirects when data is valid", %{conn: conn, budget: budget} do
      conn = put(conn, ~p"/budgets/#{budget}", budget: @update_attrs)
      assert redirected_to(conn) == ~p"/budgets/#{budget}"

      conn = get(conn, ~p"/budgets/#{budget}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, budget: budget} do
      conn = put(conn, ~p"/budgets/#{budget}", budget: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Budget"
    end
  end

  describe "delete budget" do
    setup [:create_budget]

    test "deletes chosen budget", %{conn: conn, budget: budget} do
      conn = delete(conn, ~p"/budgets/#{budget}")
      assert redirected_to(conn) == ~p"/budgets"

      assert_error_sent 404, fn ->
        get(conn, ~p"/budgets/#{budget}")
      end
    end
  end

  defp create_budget(_) do
    budget = budget_fixture()
    %{budget: budget}
  end
end
