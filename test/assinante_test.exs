defmodule AssinanteTest do
  use ExUnit.Case
  doctest Assinante

  setup do
    File.write("pre.txt", :erlang.term_to_binary([]))
    File.write("pos.txt", :erlang.term_to_binary([]))

    on_exit(fn ->
      File.rm("pre.txt")
      File.rm("pos.txt")
    end)
  end

  describe "teste responsaveis para cadastro de assinantes" do
    test "deve retorna estrutura de assinantes" do
      assert %Assinante{nome: "teste", numero: "teste", cpf: "123", plano: "plano"}.nome ==
               "teste"
    end

    test "criar uma conta prepago" do
      Assinante.cadastrar("Gustavo", "123", "123") ==
        {:ok, "Assinante Gustavo Cadastrado com sucesso!"}
    end

    test "deve retorna erro dizendop que assinante ja esta cadastrado" do
      Assinante.cadastrar("Gustavo", "123", "123") ==
        {:error, "Assinante com este número já está cadastrado"}
    end
  end

  describe "testes responsaveis por busca de assinantes" do
    test "buscar pospago" do
      Assinante.cadastrar("Gustavo", "123", "123", :pospago)

      assert Assinante.buscar_assinante("123", :pospago).nome == "Gustavo"
    end

    test "buscar prepago" do
      Assinante.cadastrar("Joao", "123", "123")

      assert Assinante.buscar_assinante("123", :prepago).nome == "Joao"
    end
  end
end
