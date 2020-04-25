defmodule Posts.Topicos do
  @moduledoc """
  The Topicos context.
  """

  import Ecto.Query, warn: false
  alias Posts.Repo

  alias Posts.Topicos.Topico

  @doc """
  Returns the list of topicos.

  ## Examples

      iex> list_topicos()
      [%Topico{}, ...]

  """
  def list_topicos do
    Repo.all(Topico)
  end

  @doc """
  Gets a single topico.

  Raises `Ecto.NoResultsError` if the Topico does not exist.

  ## Examples

      iex> get_topico!(123)
      %Topico{}

      iex> get_topico!(456)
      ** (Ecto.NoResultsError)

  """
  def get_topico!(id), do: Repo.get!(Topico, id)

  @doc """
  Creates a topico.

  ## Examples

      iex> create_topico(%{field: value})
      {:ok, %Topico{}}

      iex> create_topico(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_topico(attrs \\ %{}) do
    %Topico{}
    |> Topico.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a topico.

  ## Examples

      iex> update_topico(topico, %{field: new_value})
      {:ok, %Topico{}}

      iex> update_topico(topico, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_topico(%Topico{} = topico, attrs) do
    topico
    |> Topico.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a topico.

  ## Examples

      iex> delete_topico(topico)
      {:ok, %Topico{}}

      iex> delete_topico(topico)
      {:error, %Ecto.Changeset{}}

  """
  def delete_topico(%Topico{} = topico) do
    Repo.delete(topico)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking topico changes.

  ## Examples

      iex> change_topico(topico)
      %Ecto.Changeset{source: %Topico{}}

  """
  def change_topico(%Topico{} = topico) do
    Topico.changeset(topico, %{})
  end
end
