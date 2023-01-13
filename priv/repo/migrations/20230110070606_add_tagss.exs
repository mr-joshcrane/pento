defmodule Pento.Repo.Migrations.AddTagss do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :tags, {:array, :string}
    end
  end
end
