defmodule Codexamer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Codexamer.Repo,
      # Start the Telemetry supervisor
      CodexamerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Codexamer.PubSub},
      # Start the Endpoint (http/https)
      CodexamerWeb.Endpoint
      # Start a worker by calling: Codexamer.Worker.start_link(arg)
      # {Codexamer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Codexamer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CodexamerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
