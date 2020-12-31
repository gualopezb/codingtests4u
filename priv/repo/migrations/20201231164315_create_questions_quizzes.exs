defmodule Codexamer.Repo.Migrations.CreateQuestionsQuizzes do
  use Ecto.Migration

  def change do
    create table(:questions_quizzes) do
      add :score, :decimal

      add :question_id, references(:questions, on_delete: :delete_all), null: false
      add :quiz_id, references(:quizzes, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
