defmodule Finixir.AggregationTest do
  use Finixir.DataCase

  alias Finixir.Aggregation

  describe "parties" do
    alias Finixir.Aggregation.Party

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def party_fixture(attrs \\ %{}) do
      {:ok, party} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Aggregation.create_party()

      party
    end

    test "list_parties/0 returns all parties" do
      party = party_fixture()
      assert Aggregation.list_parties() == [party]
    end

    test "get_party!/1 returns the party with given id" do
      party = party_fixture()
      assert Aggregation.get_party!(party.id) == party
    end

    test "create_party/1 with valid data creates a party" do
      assert {:ok, %Party{} = party} = Aggregation.create_party(@valid_attrs)
      assert party.name == "some name"
    end

    test "create_party/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Aggregation.create_party(@invalid_attrs)
    end

    test "update_party/2 with valid data updates the party" do
      party = party_fixture()
      assert {:ok, %Party{} = party} = Aggregation.update_party(party, @update_attrs)
      assert party.name == "some updated name"
    end

    test "update_party/2 with invalid data returns error changeset" do
      party = party_fixture()
      assert {:error, %Ecto.Changeset{}} = Aggregation.update_party(party, @invalid_attrs)
      assert party == Aggregation.get_party!(party.id)
    end

    test "delete_party/1 deletes the party" do
      party = party_fixture()
      assert {:ok, %Party{}} = Aggregation.delete_party(party)
      assert_raise Ecto.NoResultsError, fn -> Aggregation.get_party!(party.id) end
    end

    test "change_party/1 returns a party changeset" do
      party = party_fixture()
      assert %Ecto.Changeset{} = Aggregation.change_party(party)
    end
  end
end
