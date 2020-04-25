defmodule PostsWeb.TopicoController do
  use PostsWeb, :controller

  alias Posts.Topicos
  alias Posts.Topicos.Topico

  def index(conn, _params) do
    topicos = Topicos.list_topicos()
    render(conn, "index.html", topicos: topicos)
  end

  def new(conn, _params) do
    changeset = Topicos.change_topico(%Topico{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topico" => topico_params}) do
    case Topicos.create_topico(topico_params) do
      {:ok, topico} ->
        conn
        |> put_flash(:info, "Topico created successfully.")
        |> redirect(to: Routes.topico_path(conn, :show, topico))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    topico = Topicos.get_topico!(id)
    render(conn, "show.html", topico: topico)
  end

  def edit(conn, %{"id" => id}) do
    topico = Topicos.get_topico!(id)
    changeset = Topicos.change_topico(topico)
    render(conn, "edit.html", topico: topico, changeset: changeset)
  end

  def update(conn, %{"id" => id, "topico" => topico_params}) do
    topico = Topicos.get_topico!(id)

    case Topicos.update_topico(topico, topico_params) do
      {:ok, topico} ->
        conn
        |> put_flash(:info, "Topico updated successfully.")
        |> redirect(to: Routes.topico_path(conn, :show, topico))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", topico: topico, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    topico = Topicos.get_topico!(id)
    {:ok, _topico} = Topicos.delete_topico(topico)

    conn
    |> put_flash(:info, "Topico deleted successfully.")
    |> redirect(to: Routes.topico_path(conn, :index))
  end
end
