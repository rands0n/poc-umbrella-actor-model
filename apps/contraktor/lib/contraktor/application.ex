defmodule Contraktor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @post_actor [
    Contraktor.Stories.Post.Registry.child_spec(),
    Contraktor.Stories.Post.DynamicSupervisor
  ]

  def start(_type, _args) do
    children = [
      Contraktor.Repo,
      {Phoenix.PubSub, name: Contraktor.PubSub}
    ] ++ @post_actor

    Supervisor.start_link(children, strategy: :one_for_one, name: Contraktor.Supervisor)
  end
end
