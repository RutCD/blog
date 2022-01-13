defmodule BlogProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BlogProject.Repo,
      # Start the Telemetry supervisor
      BlogProjectWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BlogProject.PubSub},
      # Start the Endpoint (http/https)
      BlogProjectWeb.Endpoint
      # Start a worker by calling: BlogProject.Worker.start_link(arg)
      # {BlogProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlogProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlogProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
