defmodule Contraktor.Stories.Post.DynamicSupervisor do
  @moduledoc false
  use DynamicSupervisor

  alias Contraktor.Stories.Post

  def start_link(opts) do
    DynamicSupervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def add_actor_to_supervisor(%Post{} = post) do
    child_spec = %{
      id: Contraktor.Stories.Post.Actor,
      start: {Contraktor.Stories.Post.Actor, :start_link, [post]},
      restart: :transient
    }

    case DynamicSupervisor.start_child(__MODULE__, child_spec) do
      {:error, {:already_started, pid}} -> {:ok, pid}
      {:ok, pid} -> {:ok, pid}
    end
  end
end
