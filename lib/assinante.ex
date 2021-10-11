defmodule Assinante do
  defstruct nome: nil, numero: nil, cpf: nil

  def cadastrar(nome, numero, cpf) do
    [%__MODULE__{nome: nome, numero: numero, cpf: cpf}]
    |> :erlang.term_to_binary()
    |> write()
  end

  defp write(lista_assinantes) do
    File.write("assinantes.txt", lista_assinantes)
  end
end
