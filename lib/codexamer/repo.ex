defmodule Codexamer.Repo do
  use Ecto.Repo,
    otp_app: :codexamer,
    adapter: Ecto.Adapters.Postgres
end
