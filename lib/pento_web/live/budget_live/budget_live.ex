defmodule PentoWeb.BudgetLive do
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}

  def mount(_params, _session, socket) do
    {
      :ok, 
      socket
        |> assign(:transactions, Pento.Budget.list_transactions())
        |> assign(:unique_tags, Pento.Budget.unique_tags())
        |> assign(:subtotal_by_tag, Pento.Budget.subtotal_by_tag())
    }
   end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Transactions")
    |> assign(:transactions, Pento.Budget.list_transactions())
  end

end

