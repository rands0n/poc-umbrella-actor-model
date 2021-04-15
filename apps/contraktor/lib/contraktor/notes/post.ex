defmodule Contraktor.Stories.Post do
  @moduledoc """
  The Post schema.
  """
  use Contraktor.Schema

  schema "posts" do
    field(:title, :string)
    field(:content, :string)

    timestamps()
  end
end
