defmodule Posts.TopicosTest do
  use Posts.DataCase

  alias Posts.Topicos

  describe "topicos" do
    alias Posts.Topicos.Topico

    @valid_attrs %{nome: "some nome"}
    @update_attrs %{nome: "some updated nome"}
    @invalid_attrs %{nome: nil}

    def topico_fixture(attrs \\ %{}) do
      {:ok, topico} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Topicos.create_topico()

      topico
    end

    test "list_topicos/0 returns all topicos" do
      topico = topico_fixture()
      assert Topicos.list_topicos() == [topico]
    end

    test "get_topico!/1 returns the topico with given id" do
      topico = topico_fixture()
      assert Topicos.get_topico!(topico.id) == topico
    end

    test "create_topico/1 with valid data creates a topico" do
      assert {:ok, %Topico{} = topico} = Topicos.create_topico(@valid_attrs)
      assert topico.nome == "some nome"
    end

    test "create_topico/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Topicos.create_topico(@invalid_attrs)
    end

    test "update_topico/2 with valid data updates the topico" do
      topico = topico_fixture()
      assert {:ok, %Topico{} = topico} = Topicos.update_topico(topico, @update_attrs)
      assert topico.nome == "some updated nome"
    end

    test "update_topico/2 with invalid data returns error changeset" do
      topico = topico_fixture()
      assert {:error, %Ecto.Changeset{}} = Topicos.update_topico(topico, @invalid_attrs)
      assert topico == Topicos.get_topico!(topico.id)
    end

    test "delete_topico/1 deletes the topico" do
      topico = topico_fixture()
      assert {:ok, %Topico{}} = Topicos.delete_topico(topico)
      assert_raise Ecto.NoResultsError, fn -> Topicos.get_topico!(topico.id) end
    end

    test "change_topico/1 returns a topico changeset" do
      topico = topico_fixture()
      assert %Ecto.Changeset{} = Topicos.change_topico(topico)
    end
  end
end
