defmodule EctoEmbedInsertBug.PageController do
  use EctoEmbedInsertBug.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
