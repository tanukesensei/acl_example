defmodule AclExample.Repo do
  use Ecto.Repo,
    otp_app: :acl_example,
    adapter: Ecto.Adapters.Postgres
end
