defmodule CodexamerWeb.QuizController do
  use CodexamerWeb, :controller

  alias Codexamer.Questionnaires

  def create(conn, %{"category_id" => category_id}) do
    Questionnaires.Quizzes.create(category_id)
    render(conn, CodexamerWeb.PageView, "index.html")
  end
end
