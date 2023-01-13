defmodule PentoWeb.TagLive do
  use PentoWeb, :live_view

  alias Pento.Budget.Transaction
  alias Pento.Budget

  @impl true
  def mount(_params, _session, socket) do
    [ untagged_transaction ] = Budget.get_untagged_transaction()
    changeset = Budget.change_transaction(untagged_transaction)

    {:ok, 
      socket
      |> assign(:tags, Budget.unique_tags())
      |> assign(:transaction, untagged_transaction)
      |> assign(:changeset, changeset)
    }
  end
  
  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    [ untagged_transaction ] = Budget.get_untagged_transaction()
    socket
    |> assign(:transaction, untagged_transaction)
    |> assign(:changeset, Budget.change_transaction(untagged_transaction))
  end
  
  @impl true
  def handle_event("save", %{"transaction" => transaction_params}, socket) do
    Budget.update_transaction(socket.assigns.transaction, transaction_params)
    {:noreply, 
      socket 
      |> assign(:transaction, Budget.get_untagged_transaction())
      |> assign(:changeset, Budget.change_transaction(socket.assigns.transaction))
    }
  end
end
