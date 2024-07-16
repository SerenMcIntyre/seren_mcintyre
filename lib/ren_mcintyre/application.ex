defmodule RenMcintyre.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RenMcintyreWeb.Telemetry,
      RenMcintyre.Repo,
      {DNSCluster, query: Application.get_env(:ren_mcintyre, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RenMcintyre.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RenMcintyre.Finch},
      # Start a worker by calling: RenMcintyre.Worker.start_link(arg)
      # {RenMcintyre.Worker, arg},
      # Start to serve requests, typically the last entry
      RenMcintyreWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RenMcintyre.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RenMcintyreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
