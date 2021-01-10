defmodule Codingtests4u.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :raw_answer, :string

      add :question_quiz_id, references(:questions_quizzes, on_delete: :delete_all), null: false
      add :question_option_id, references(:questions_options, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
