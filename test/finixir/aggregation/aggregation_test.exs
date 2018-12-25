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

  describe "transaction_types" do
    alias Finixir.Aggregation.TransactionType

    @valid_attrs %{transaction_type: "some transaction_type"}
    @update_attrs %{transaction_type: "some updated transaction_type"}
    @invalid_attrs %{transaction_type: nil}

    def transaction_type_fixture(attrs \\ %{}) do
      {:ok, transaction_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Aggregation.create_transaction_type()

      transaction_type
    end

    test "list_transaction_types/0 returns all transaction_types" do
      transaction_type = transaction_type_fixture()
      assert Aggregation.list_transaction_types() == [transaction_type]
    end

    test "get_transaction_type!/1 returns the transaction_type with given id" do
      transaction_type = transaction_type_fixture()
      assert Aggregation.get_transaction_type!(transaction_type.id) == transaction_type
    end

    test "create_transaction_type/1 with valid data creates a transaction_type" do
      assert {:ok, %TransactionType{} = transaction_type} = Aggregation.create_transaction_type(@valid_attrs)
      assert transaction_type.transaction_type == "some transaction_type"
    end

    test "create_transaction_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Aggregation.create_transaction_type(@invalid_attrs)
    end

    test "update_transaction_type/2 with valid data updates the transaction_type" do
      transaction_type = transaction_type_fixture()
      assert {:ok, %TransactionType{} = transaction_type} = Aggregation.update_transaction_type(transaction_type, @update_attrs)
      assert transaction_type.transaction_type == "some updated transaction_type"
    end

    test "update_transaction_type/2 with invalid data returns error changeset" do
      transaction_type = transaction_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Aggregation.update_transaction_type(transaction_type, @invalid_attrs)
      assert transaction_type == Aggregation.get_transaction_type!(transaction_type.id)
    end

    test "delete_transaction_type/1 deletes the transaction_type" do
      transaction_type = transaction_type_fixture()
      assert {:ok, %TransactionType{}} = Aggregation.delete_transaction_type(transaction_type)
      assert_raise Ecto.NoResultsError, fn -> Aggregation.get_transaction_type!(transaction_type.id) end
    end

    test "change_transaction_type/1 returns a transaction_type changeset" do
      transaction_type = transaction_type_fixture()
      assert %Ecto.Changeset{} = Aggregation.change_transaction_type(transaction_type)
    end
  end

  describe "transactions" do
    alias Finixir.Aggregation.Transaction

    @valid_attrs %{amount: 120.5, transaction_date: ~D[2010-04-17]}
    @update_attrs %{amount: 456.7, transaction_date: ~D[2011-05-18]}
    @invalid_attrs %{amount: nil, transaction_date: nil}

    def transaction_fixture(attrs \\ %{}) do
      {:ok, transaction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Aggregation.create_transaction()

      transaction
    end

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert Aggregation.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Aggregation.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      assert {:ok, %Transaction{} = transaction} = Aggregation.create_transaction(@valid_attrs)
      assert transaction.amount == 120.5
      assert transaction.transaction_date == ~D[2010-04-17]
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Aggregation.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{} = transaction} = Aggregation.update_transaction(transaction, @update_attrs)
      assert transaction.amount == 456.7
      assert transaction.transaction_date == ~D[2011-05-18]
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Aggregation.update_transaction(transaction, @invalid_attrs)
      assert transaction == Aggregation.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Aggregation.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Aggregation.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Aggregation.change_transaction(transaction)
    end
  end

  describe "tags" do
    alias Finixir.Aggregation.Tag

    @valid_attrs %{tag: "some tag"}
    @update_attrs %{tag: "some updated tag"}
    @invalid_attrs %{tag: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Aggregation.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Aggregation.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Aggregation.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Aggregation.create_tag(@valid_attrs)
      assert tag.tag == "some tag"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Aggregation.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Aggregation.update_tag(tag, @update_attrs)
      assert tag.tag == "some updated tag"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Aggregation.update_tag(tag, @invalid_attrs)
      assert tag == Aggregation.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Aggregation.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Aggregation.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Aggregation.change_tag(tag)
    end
  end

  describe "parties_tags" do
    alias Finixir.Aggregation.PartyTag

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def party_tag_fixture(attrs \\ %{}) do
      {:ok, party_tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Aggregation.create_party_tag()

      party_tag
    end

    test "list_parties_tags/0 returns all parties_tags" do
      party_tag = party_tag_fixture()
      assert Aggregation.list_parties_tags() == [party_tag]
    end

    test "get_party_tag!/1 returns the party_tag with given id" do
      party_tag = party_tag_fixture()
      assert Aggregation.get_party_tag!(party_tag.id) == party_tag
    end

    test "create_party_tag/1 with valid data creates a party_tag" do
      assert {:ok, %PartyTag{} = party_tag} = Aggregation.create_party_tag(@valid_attrs)
    end

    test "create_party_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Aggregation.create_party_tag(@invalid_attrs)
    end

    test "update_party_tag/2 with valid data updates the party_tag" do
      party_tag = party_tag_fixture()
      assert {:ok, %PartyTag{} = party_tag} = Aggregation.update_party_tag(party_tag, @update_attrs)
    end

    test "update_party_tag/2 with invalid data returns error changeset" do
      party_tag = party_tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Aggregation.update_party_tag(party_tag, @invalid_attrs)
      assert party_tag == Aggregation.get_party_tag!(party_tag.id)
    end

    test "delete_party_tag/1 deletes the party_tag" do
      party_tag = party_tag_fixture()
      assert {:ok, %PartyTag{}} = Aggregation.delete_party_tag(party_tag)
      assert_raise Ecto.NoResultsError, fn -> Aggregation.get_party_tag!(party_tag.id) end
    end

    test "change_party_tag/1 returns a party_tag changeset" do
      party_tag = party_tag_fixture()
      assert %Ecto.Changeset{} = Aggregation.change_party_tag(party_tag)
    end
  end

  describe "transaction_sets" do
    alias Finixir.Aggregation.TransactionSet

    @valid_attrs %{end_date: ~D[2010-04-17], start_date: ~D[2010-04-17]}
    @update_attrs %{end_date: ~D[2011-05-18], start_date: ~D[2011-05-18]}
    @invalid_attrs %{end_date: nil, start_date: nil}

    def transaction_set_fixture(attrs \\ %{}) do
      {:ok, transaction_set} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Aggregation.create_transaction_set()

      transaction_set
    end

    test "list_transaction_sets/0 returns all transaction_sets" do
      transaction_set = transaction_set_fixture()
      assert Aggregation.list_transaction_sets() == [transaction_set]
    end

    test "get_transaction_set!/1 returns the transaction_set with given id" do
      transaction_set = transaction_set_fixture()
      assert Aggregation.get_transaction_set!(transaction_set.id) == transaction_set
    end

    test "create_transaction_set/1 with valid data creates a transaction_set" do
      assert {:ok, %TransactionSet{} = transaction_set} = Aggregation.create_transaction_set(@valid_attrs)
      assert transaction_set.end_date == ~D[2010-04-17]
      assert transaction_set.start_date == ~D[2010-04-17]
    end

    test "create_transaction_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Aggregation.create_transaction_set(@invalid_attrs)
    end

    test "update_transaction_set/2 with valid data updates the transaction_set" do
      transaction_set = transaction_set_fixture()
      assert {:ok, %TransactionSet{} = transaction_set} = Aggregation.update_transaction_set(transaction_set, @update_attrs)
      assert transaction_set.end_date == ~D[2011-05-18]
      assert transaction_set.start_date == ~D[2011-05-18]
    end

    test "update_transaction_set/2 with invalid data returns error changeset" do
      transaction_set = transaction_set_fixture()
      assert {:error, %Ecto.Changeset{}} = Aggregation.update_transaction_set(transaction_set, @invalid_attrs)
      assert transaction_set == Aggregation.get_transaction_set!(transaction_set.id)
    end

    test "delete_transaction_set/1 deletes the transaction_set" do
      transaction_set = transaction_set_fixture()
      assert {:ok, %TransactionSet{}} = Aggregation.delete_transaction_set(transaction_set)
      assert_raise Ecto.NoResultsError, fn -> Aggregation.get_transaction_set!(transaction_set.id) end
    end

    test "change_transaction_set/1 returns a transaction_set changeset" do
      transaction_set = transaction_set_fixture()
      assert %Ecto.Changeset{} = Aggregation.change_transaction_set(transaction_set)
    end
  end
end
