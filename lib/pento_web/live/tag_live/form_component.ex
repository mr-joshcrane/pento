defmodule PentoWeb.TagLive.FormComponent do
  use PentoWeb, :live_component

  alias Pento.TransactionTags

  @impl true
  def update(%{tag: tag} = assigns, socket) do
    changeset = TransactionTags.change_tag(tag)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"tag" => tag_params}, socket) do
    changeset =
      socket.assigns.tag
      |> TransactionTags.change_tag(tag_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"tag" => tag_params}, socket) do
    save_tag(socket, socket.assigns.action, tag_params)
  end

  defp save_tag(socket, :edit, tag_params) do
    case TransactionTags.update_tag(socket.assigns.tag, tag_params) do
      {:ok, _tag} ->
        {:noreply,
         socket
         |> put_flash(:info, "Tag updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_tag(socket, :new, tag_params) do
    case TransactionTags.create_tag(tag_params) do
      {:ok, _tag} ->
        {:noreply,
         socket
         |> put_flash(:info, "Tag created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
