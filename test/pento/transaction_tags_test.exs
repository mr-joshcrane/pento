defmodule Pento.TransactionTagsTest do
  use Pento.DataCase

  alias Pento.TransactionTags

  describe "tags" do
    alias Pento.TransactionTags.Tag

    import Pento.TransactionTagsFixtures

    @invalid_attrs %{tag: nil}

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert TransactionTags.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert TransactionTags.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      valid_attrs = %{tag: []}

      assert {:ok, %Tag{} = tag} = TransactionTags.create_tag(valid_attrs)
      assert tag.tag == []
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TransactionTags.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      update_attrs = %{tag: []}

      assert {:ok, %Tag{} = tag} = TransactionTags.update_tag(tag, update_attrs)
      assert tag.tag == []
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = TransactionTags.update_tag(tag, @invalid_attrs)
      assert tag == TransactionTags.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = TransactionTags.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> TransactionTags.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = TransactionTags.change_tag(tag)
    end
  end
end
