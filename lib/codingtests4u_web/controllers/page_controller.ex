defmodule Codingtests4uWeb.PageController do
  use Codingtests4uWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
