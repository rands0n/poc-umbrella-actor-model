defmodule Contraktor.Stories.Post.Registry do
  @moduledoc false

  def child_spec do
    Registry.child_spec(
      keys: :unique,
      name: __MODULE__,
      partitions: System.schedulers_online()
    )
  end

  @spec get_actor(String.t()) :: {:ok, pid() | :error, nil}
  def get_actor(post_id) do
    case Registry.lookup(__MODULE__, post_id) do
      [{pid, _}] ->
        {:ok, pid}

      [] ->
        {:error, :nil}
    end
  end
end
