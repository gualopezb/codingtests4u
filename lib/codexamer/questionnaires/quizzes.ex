defmodule Codexamer.Questionnaires.Quizzes do
  alias Codexamer.Questionnaires.Repo.QuizRepo

  # Public API

  def create(category_id) do
    QuizRepo.create(category_id)
  end
end
