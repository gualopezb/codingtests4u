defmodule Codingtests4uWeb.QuizController do
  use Codingtests4uWeb, :controller

  alias Codingtests4u.Questionnaires

  def create(conn, %{"category_id" => category_id}) do
    Questionnaires.Quizzes.create(category_id)
    render(conn, Codingtests4uWeb.PageView, "index.html")
  end
end
