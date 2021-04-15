defmodule Contraktor.Stories.Post.Actor do
  @moduledoc """
  This module defines the process of Post.
  """
  use GenServer, restart: :transient

  alias Contraktor.Stories.Post

  defmodule State do
    @moduledoc false

    @enforce_keys [:post]

    defstruct [:post]

    @type t :: %__MODULE__{
      post: %Contraktor.Stories.Post{}
    }
  end

  def start_link(%Post{id: post_id} = post) do
    GenServer.start_link(__MODULE__, post,
      name: {:via, Registry, {Contraktor.Stories.Post.Registry, post_id}}
    )
  end

  @impl true
  def init(post) do
    {:ok, %State{post: post}}
  end

  @spec get_post(pid()) :: any()
  def get_post(pid), do: GenServer.call(pid, :get_post)

  @impl true
  def handle_call(:get_post, _from , %State{} = state) do
    {:reply, state.post, state}
  end
end
