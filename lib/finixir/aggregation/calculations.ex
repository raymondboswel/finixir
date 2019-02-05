defmodule Finixir.Calculation do
  import Ecto.Query
  alias Finixir.Aggregation.Transaction
  alias Finixir.Aggregation.Tag
  alias Finixir.Aggregation.Party
  alias Finixir.Aggregation.PartyTag
  alias Finixir.Repo

  def total_transactions_per_party() do
    q =
      from txn in Transaction,
        join: p in Party,
        where: txn.party_id == p.id,
        group_by: p.name,
        select: {p.name, sum(txn.amount)}

    res = Repo.all(q)
  end

  def total_transactions_per_tag() do
    q =
      from t in Tag,
        join: pt in PartyTag,
        on: t.id == pt.tag_id,
        join: p in Party,
        on: p.id == pt.party_id,
        join: txn in Transaction,
        on: txn.party_id == p.id,
        group_by: t.tag,
        select: {t.tag, sum(txn.amount)}

    res = Repo.all(q)
  end
end
