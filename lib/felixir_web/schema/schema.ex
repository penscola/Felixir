defmodule FelixirWeb.Schema do
  use Absinthe.Schema

  import_types(FelixirWeb.Schema.Types)

  alias FelixirWeb.Schema.Resolvers

  query do
    @desc "query"
    field :hello, :string do
      resolve(fn _, _, _ -> {:ok, "world"} end)
    end
  end

  mutation do
    field :register_user, :boolean do
      arg(:input, non_null(:registration_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end
  end
end