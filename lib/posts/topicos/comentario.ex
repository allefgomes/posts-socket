defmodule Posts.Topicos.Comentario do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:conteudo]}
  schema "comentarios" do
    field :conteudo, :string
    belongs_to :topico, Posts.Topicos.Topico

    timestamps()
  end

  @doc false
  def changeset(comentario, attrs) do
    comentario
    |> cast(attrs, [:conteudo])
    |> validate_required([:conteudo])
  end
end
