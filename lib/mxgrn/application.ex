defmodule Mxgrn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MxgrnWeb.Telemetry,
      # Start the Ecto repository
      Mxgrn.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mxgrn.PubSub},
      # Start Finch
      {Finch, name: Mxgrn.Finch},
      # Start the Endpoint (http/https)
      MxgrnWeb.Endpoint
      # Start a worker by calling: Mxgrn.Worker.start_link(arg)
      # {Mxgrn.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mxgrn.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MxgrnWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
