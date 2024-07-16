defmodule RenMcintyre.Repo do
  use Ecto.Repo,
    otp_app: :ren_mcintyre,
    adapter: Ecto.Adapters.Postgres
end
