defmodule PostsWeb.TopicoControllerTest do
  use PostsWeb.ConnCase

  alias Posts.Topicos

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  def fixture(:topico) do
    {:ok, topico} = Topicos.create_topico(@create_attrs)
    topico
  end

  describe "index" do
    test "lists all topicos", %{conn: conn} do
      conn = get(conn, Routes.topico_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Topicos"
    end
  end

  describe "new topico" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.topico_path(conn, :new))
      assert html_response(conn, 200) =~ "New Topico"
    end
  end

  describe "create topico" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.topico_path(conn, :create), topico: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.topico_path(conn, :show, id)

      conn = get(conn, Routes.topico_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Topico"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.topico_path(conn, :create), topico: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Topico"
    end
  end

  describe "edit topico" do
    setup [:create_topico]

    test "renders form for editing chosen topico", %{conn: conn, topico: topico} do
      conn = get(conn, Routes.topico_path(conn, :edit, topico))
      assert html_response(conn, 200) =~ "Edit Topico"
    end
  end

  describe "update topico" do
    setup [:create_topico]

    test "redirects when data is valid", %{conn: conn, topico: topico} do
      conn = put(conn, Routes.topico_path(conn, :update, topico), topico: @update_attrs)
      assert redirected_to(conn) == Routes.topico_path(conn, :show, topico)

      conn = get(conn, Routes.topico_path(conn, :show, topico))
      assert html_response(conn, 200) =~ "some updated nome"
    end

    test "renders errors when data is invalid", %{conn: conn, topico: topico} do
      conn = put(conn, Routes.topico_path(conn, :update, topico), topico: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Topico"
    end
  end

  describe "delete topico" do
    setup [:create_topico]

    test "deletes chosen topico", %{conn: conn, topico: topico} do
      conn = delete(conn, Routes.topico_path(conn, :delete, topico))
      assert redirected_to(conn) == Routes.topico_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.topico_path(conn, :show, topico))
      end
    end
  end

  defp create_topico(_) do
    topico = fixture(:topico)
    {:ok, topico: topico}
  end
end
