defmodule Posts.Topicos.Topico do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topicos" do
    field :nome, :string
    has_many :comentarios, Posts.Topicos.Comentario

    timestamps()
  end

  @doc false
  def changeset(topico, attrs) do
    topico
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
  end
end
