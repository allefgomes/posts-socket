defmodule Posts.Repo do
  use Ecto.Repo,
    otp_app: :posts,
    adapter: Ecto.Adapters.Postgres
end
