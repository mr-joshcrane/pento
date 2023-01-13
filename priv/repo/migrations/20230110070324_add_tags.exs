defmodule Pento.Repo.Migrations.AddTags do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :tags, {:array, :string}
    end
  end
end
