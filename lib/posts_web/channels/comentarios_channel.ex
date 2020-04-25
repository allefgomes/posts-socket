defmodule PostsWeb.ComentariosChannel do
  use PostsWeb, :channel
  alias Posts.Topicos.Comentario, as: C

  def join("comentarios:" <> topico_id, _params, socket) do
    topico = String.to_integer(topico_id) |> Posts.Topicos.get_topico!() |> Posts.Repo.preload(:comentarios)

    {:ok, %{comentarios: topico.comentarios}, assign(socket, :topico, topico)}
  end

  def handle_in(_nome, %{"conteudo" => conteudo}, socket) do
    changeset =
      socket.assigns.topico
      |> Ecto.build_assoc(:comentarios)
      |> C.changeset(%{conteudo: conteudo})

    case Posts.Repo.insert(changeset) do
      {:ok, comentario} ->
        broadcast!(socket, "comentarios:#{socket.assigns.topico.id}:new", %{comentario: comentario})
        {:reply, :ok, socket}

      {:error, _} ->
        {:error, {:reply, %{errors: changeset}}, socket}
    end
  end
end
