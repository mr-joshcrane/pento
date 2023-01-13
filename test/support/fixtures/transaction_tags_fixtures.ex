defmodule Pento.TransactionTagsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pento.TransactionTags` context.
  """

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        tag: []
      })
      |> Pento.TransactionTags.create_tag()

    tag
  end
end
