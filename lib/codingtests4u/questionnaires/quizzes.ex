defmodule Codingtests4u.Questionnaires.Quizzes do
  alias Codingtests4u.Questionnaires.Repo.QuizRepo

  # Public API

  def create(category_id) do
    QuizRepo.create(category_id)
  end
end
