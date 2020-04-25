defmodule Posts.Repo.Migrations.CreateTopicos do
  use Ecto.Migration

  def change do
    create table(:topicos) do
      add :nome, :string

      timestamps()
    end
  end
end
