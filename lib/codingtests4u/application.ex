defmodule Codingtests4u.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Codingtests4u.Repo,
      # Start the Telemetry supervisor
      Codingtests4uWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Codingtests4u.PubSub},
      # Start the Endpoint (http/https)
      Codingtests4uWeb.Endpoint
      # Start a worker by calling: Codingtests4u.Worker.start_link(arg)
      # {Codingtests4u.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Codingtests4u.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Codingtests4uWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
