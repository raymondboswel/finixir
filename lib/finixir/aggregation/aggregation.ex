defmodule Finixir.Aggregation do
  @moduledoc """
  The Aggregation context.
  """

  import Ecto.Query, warn: false
  alias Finixir.Repo

  alias Finixir.Aggregation.Party

  @doc """
  Returns the list of parties.

  ## Examples

      iex> list_parties()
      [%Party{}, ...]

  """
  def list_parties do
    Repo.all(Party)
  end

  @doc """
  Gets a single party.

  Raises `Ecto.NoResultsError` if the Party does not exist.

  ## Examples

      iex> get_party!(123)
      %Party{}

      iex> get_party!(456)
      ** (Ecto.NoResultsError)

  """
  def get_party!(id), do: Repo.get!(Party, id)

  @doc """
  Creates a party.

  ## Examples

      iex> create_party(%{field: value})
      {:ok, %Party{}}

      iex> create_party(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_party(attrs \\ %{}) do
    %Party{}
    |> Party.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a party.

  ## Examples

      iex> update_party(party, %{field: new_value})
      {:ok, %Party{}}

      iex> update_party(party, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_party(%Party{} = party, attrs) do
    party
    |> Party.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Party.

  ## Examples

      iex> delete_party(party)
      {:ok, %Party{}}

      iex> delete_party(party)
      {:error, %Ecto.Changeset{}}

  """
  def delete_party(%Party{} = party) do
    Repo.delete(party)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking party changes.

  ## Examples

      iex> change_party(party)
      %Ecto.Changeset{source: %Party{}}

  """
  def change_party(%Party{} = party) do
    Party.changeset(party, %{})
  end

  alias Finixir.Aggregation.TransactionType

  @doc """
  Returns the list of transaction_types.

  ## Examples

      iex> list_transaction_types()
      [%TransactionType{}, ...]

  """
  def list_transaction_types do
    Repo.all(TransactionType)
  end

  @doc """
  Gets a single transaction_type.

  Raises `Ecto.NoResultsError` if the Transaction type does not exist.

  ## Examples

      iex> get_transaction_type!(123)
      %TransactionType{}

      iex> get_transaction_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transaction_type!(id), do: Repo.get!(TransactionType, id)

  @doc """
  Creates a transaction_type.

  ## Examples

      iex> create_transaction_type(%{field: value})
      {:ok, %TransactionType{}}

      iex> create_transaction_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transaction_type(attrs \\ %{}) do
    %TransactionType{}
    |> TransactionType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transaction_type.

  ## Examples

      iex> update_transaction_type(transaction_type, %{field: new_value})
      {:ok, %TransactionType{}}

      iex> update_transaction_type(transaction_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transaction_type(%TransactionType{} = transaction_type, attrs) do
    transaction_type
    |> TransactionType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TransactionType.

  ## Examples

      iex> delete_transaction_type(transaction_type)
      {:ok, %TransactionType{}}

      iex> delete_transaction_type(transaction_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transaction_type(%TransactionType{} = transaction_type) do
    Repo.delete(transaction_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transaction_type changes.

  ## Examples

      iex> change_transaction_type(transaction_type)
      %Ecto.Changeset{source: %TransactionType{}}

  """
  def change_transaction_type(%TransactionType{} = transaction_type) do
    TransactionType.changeset(transaction_type, %{})
  end

  alias Finixir.Aggregation.Transaction

  @doc """
  Returns the list of transactions.

  ## Examples

      iex> list_transactions()
      [%Transaction{}, ...]

  """
  def list_transactions do
    Repo.all(Transaction)
  end

  @doc """
  Gets a single transaction.

  Raises `Ecto.NoResultsError` if the Transaction does not exist.

  ## Examples

      iex> get_transaction!(123)
      %Transaction{}

      iex> get_transaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_transaction!(id), do: Repo.get!(Transaction, id)

  @doc """
  Creates a transaction.

  ## Examples

      iex> create_transaction(%{field: value})
      {:ok, %Transaction{}}

      iex> create_transaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_transaction(attrs \\ %{}) do
    %Transaction{}
    |> Transaction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a transaction.

  ## Examples

      iex> update_transaction(transaction, %{field: new_value})
      {:ok, %Transaction{}}

      iex> update_transaction(transaction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_transaction(%Transaction{} = transaction, attrs) do
    transaction
    |> Transaction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Transaction.

  ## Examples

      iex> delete_transaction(transaction)
      {:ok, %Transaction{}}

      iex> delete_transaction(transaction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_transaction(%Transaction{} = transaction) do
    Repo.delete(transaction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking transaction changes.

  ## Examples

      iex> change_transaction(transaction)
      %Ecto.Changeset{source: %Transaction{}}

  """
  def change_transaction(%Transaction{} = transaction) do
    Transaction.changeset(transaction, %{})
  end

  alias Finixir.Aggregation.Tag

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{source: %Tag{}}

  """
  def change_tag(%Tag{} = tag) do
    Tag.changeset(tag, %{})
  end

  alias Finixir.Aggregation.PartyTag

  @doc """
  Returns the list of parties_tags.

  ## Examples

      iex> list_parties_tags()
      [%PartyTag{}, ...]

  """
  def list_parties_tags do
    Repo.all(PartyTag)
  end

  @doc """
  Gets a single party_tag.

  Raises `Ecto.NoResultsError` if the Party tag does not exist.

  ## Examples

      iex> get_party_tag!(123)
      %PartyTag{}

      iex> get_party_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_party_tag!(id), do: Repo.get!(PartyTag, id)

  @doc """
  Creates a party_tag.

  ## Examples

      iex> create_party_tag(%{field: value})
      {:ok, %PartyTag{}}

      iex> create_party_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_party_tag(attrs \\ %{}) do
    %PartyTag{}
    |> PartyTag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a party_tag.

  ## Examples

      iex> update_party_tag(party_tag, %{field: new_value})
      {:ok, %PartyTag{}}

      iex> update_party_tag(party_tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_party_tag(%PartyTag{} = party_tag, attrs) do
    party_tag
    |> PartyTag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PartyTag.

  ## Examples

      iex> delete_party_tag(party_tag)
      {:ok, %PartyTag{}}

      iex> delete_party_tag(party_tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_party_tag(%PartyTag{} = party_tag) do
    Repo.delete(party_tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking party_tag changes.

  ## Examples

      iex> change_party_tag(party_tag)
      %Ecto.Changeset{source: %PartyTag{}}

  """
  def change_party_tag(%PartyTag{} = party_tag) do
    PartyTag.changeset(party_tag, %{})
  end
end
