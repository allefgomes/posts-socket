defmodule Posts.Repo.Migrations.Comentarios do
  use Ecto.Migration

  def change do
    create table(:comentarios) do
      add :conteudo, :string
      add :topico_id, references(:topicos)

      timestamps()
    end
  end
end
