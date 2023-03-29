defmodule AclExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AclExampleWeb.Telemetry,
      # Start the Ecto repository
      AclExample.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: AclExample.PubSub},
      # Start Finch
      {Finch, name: AclExample.Finch},
      # Start the Endpoint (http/https)
      AclExampleWeb.Endpoint
      # Start a worker by calling: AclExample.Worker.start_link(arg)
      # {AclExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AclExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AclExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
