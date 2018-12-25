defmodule FinixirWeb.Router do
  use FinixirWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FinixirWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", FinixirWeb do
    pipe_through :api

    resources "/parties", PartyController, except: [:new, :edit]
    resources "/transaction_types", TransactionTypeController, except: [:new, :edit]
    resources "/transactions", TransactionController, except: [:new, :edit]
    resources "/parties_tags", PartyTagController, except: [:new, :edit]
    resources "/transaction_sets", TransactionSetController, except: [:new, :edit]
  end
end
