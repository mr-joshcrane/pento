defmodule Pento.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :tag, {:array, :string}

      timestamps()
    end
  end
end
