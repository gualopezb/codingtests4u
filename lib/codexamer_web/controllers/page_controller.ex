defmodule CodexamerWeb.PageController do
  use CodexamerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
